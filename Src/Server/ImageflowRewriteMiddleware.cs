using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Http;
using System;
using System.Linq;
using System.Threading.Tasks;
using ToSic.Sxc.Services;
using ToSic.Sxc.Web.Url;

namespace ToSic.Imageflow.Oqtane.Server
{
    public static class ImageflowRewriteMiddlewareExtensions
    {
        public static IApplicationBuilder UseImageflowRewrite(this IApplicationBuilder builder)
        {
            return builder.UseMiddleware<ImageflowRewriteMiddleware>();
        }
    }
    
    public  class ImageflowRewriteMiddleware
    {
        private readonly RequestDelegate _next;
        private readonly IImageflowRewriteService _rewriteService;

        public ImageflowRewriteMiddleware(RequestDelegate next, IImageflowRewriteService rewriteService)
        {
            _next = next;
            _rewriteService = rewriteService;
        }


        public async Task Invoke(HttpContext context)
        {
            if (!ShouldHandleRequest(context) || !context.Request.QueryString.HasValue)
            {
                await _next.Invoke(context);
                return;
            }
            Console.WriteLine("ImageflowRewriteMiddleware");

            Console.WriteLine($"ImageflowRewriteMiddleware.Before:{context.Request.QueryString.Value}");

            var qs = UrlHelpers.ParseQueryString(context.Request.QueryString.Value);
            var queryString = "?" + _rewriteService.QueryStringRewrite(qs).NvcToString();
            context.Request.QueryString = new QueryString(queryString);
            
            Console.WriteLine($"ImageflowRewriteMiddleware.After:{context.Request.QueryString.Value}");
            
            // Call the next delegate/middleware in the pipeline.
            await _next(context);
        }

        private static bool ShouldHandleRequest(HttpContext context)
        {
            // If the path is empty or null we don't handle it
            var pathValue = context.Request.Path;
            if (pathValue == null || !pathValue.HasValue)
                return false;
            
            var path = pathValue.Value;
            if (path == null)
                return false;

            // We handle image request extensions
            return IsImagePath(path);
        }

        private static readonly string[] Suffixes = new string[] {
            ".png",
            ".jpg",
            ".jpeg",
            ".jfif",
            ".jif",
            ".jfi",
            ".jpe",
            ".gif",
            ".webp"
        };

        private static bool IsImagePath(string path)
        {
            return Suffixes.Any(suffix => path.EndsWith(suffix, StringComparison.OrdinalIgnoreCase));
        }
    }
}
