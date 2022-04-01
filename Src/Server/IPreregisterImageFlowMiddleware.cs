using Microsoft.AspNetCore.Builder;

namespace ToSic.Imageflow.Oqt.Server
{
    // IPreregisterImageFlowMiddleware implementation enables dynamic registration of
    // ImageflowRewriteMiddleware to be executed in request pipeline exactly before
    // main imageflow middleware because it need to rewrite query string params before
    // imageflow middleware take a care of them.
    //
    // PreregisterImageFlowMiddleware and ImageflowRewriteMiddleware are implemented in
    // 2sxc oqtane module.
    public interface IPreregisterImageFlowMiddleware
    {
        void Register(IApplicationBuilder app);
    }
}