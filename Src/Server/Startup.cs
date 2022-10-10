using Imageflow.Fluent;
using Imageflow.Server;
using Imageflow.Server.HybridCache;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.DependencyInjection;
using Oqtane.Infrastructure;
using System;

namespace ToSic.Imageflow.Oqt.Server
{
    class Startup : IServerStartup
    {
        public void ConfigureServices(IServiceCollection services)
        {
            // You can add a hybrid cache (in-memory persisted database for tracking filenames, but files used for bytes)
            // But remember to call ImageflowMiddlewareOptions.SetAllowCaching(true) for it to take effect
            // If you're deploying to azure, provide a disk cache folder *not* inside ContentRootPath
            // to prevent the app from recycling whenever folders are created.
            services.AddImageflowHybridCache(
                new HybridCacheOptions("App_Data/imageflow_hybrid_cache")
                {
                    // How long after a file is created before it can be deleted
                    MinAgeToDelete = TimeSpan.FromSeconds(10),
                    // How much RAM to use for the write queue before switching to synchronous writes
                    QueueSizeLimitInBytes = 100 * 1000 * 1000,
                    // The maximum size of the cache (1GB)
                    CacheSizeLimitInBytes = 1024 * 1024 * 1024,
                });
        }

        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            // Optional registration of ImageflowRewriteMiddleware (eg from 2sxc oqtane module).
            // IPreregisterImageFlowMiddleware implementation enables dynamic registration of
            // ImageflowRewriteMiddleware to be executed in request pipeline exactly before
            // main imageflow middleware because it need to rewrite query string params before
            // imageflow middleware take a care of them.
            foreach (var middleware in app.ApplicationServices.GetServices<IPreregisterImageFlowMiddleware>())
                middleware.Register(app);

            // main imageflow middleware
            app.UseImageflow(new ImageflowMiddlewareOptions()
                .SetMapWebRoot(true)
                .SetMyOpenSourceProjectUrl("https://github.com/2sic/oqtane-imageflow")
                // Allow localhost to access the diagnostics page via /imageflow.debug
                .SetDiagnosticsPageAccess(AccessDiagnosticsFrom.LocalHost)
                // Allow HybridCache or other registered IStreamCache to run
                .SetAllowCaching(true)
                // Cache publicly (including on shared proxies and CDNs) for 30 days
                .SetDefaultCacheControlString("public, max-age=2592000")
                // It's a good idea to limit image sizes for security. Requests causing these to be exceeded will fail
                // The last argument to FrameSizeLimit() is the maximum number of megapixels
                .SetJobSecurityOptions(new SecurityOptions()
                    .SetMaxDecodeSize(new FrameSizeLimit(8000, 8000, 40))
                    .SetMaxFrameSize(new FrameSizeLimit(8000, 8000, 40))
                    .SetMaxEncodeSize(new FrameSizeLimit(8000, 8000, 20)))
            );
        }

        public void ConfigureMvc(IMvcBuilder mvcBuilder)
        {
            //throw new NotImplementedException();
        }
    }
}
