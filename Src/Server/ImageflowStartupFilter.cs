using System;
using Imageflow.Fluent;
using Imageflow.Server;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.DependencyInjection;

namespace ToSic.Imageflow.Oqt.Server
{
    internal class ImageflowStartupFilter : IStartupFilter
    {
        public Action<IApplicationBuilder> Configure(Action<IApplicationBuilder> next)
        {
            return app =>
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
                next(app);
            };
        }
    }
}
