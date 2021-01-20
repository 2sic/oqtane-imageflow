using Oqtane.Models;
using Oqtane.Modules;

namespace ToSic.ImageFlow.Oqt
{
    public class ModuleInfo : IModule
    {
        public ModuleDefinition ModuleDefinition => new ModuleDefinition
        {
            Name = "ImageFlow",
            Description = "Image processing and optimizing middleware with querystring API for Oqtane.",
            Version = "1.0.0",
            ServerManagerType = "ToSic.ImageFlow.Oqt.Manager.ImageFlowManager, ToSic.ImageFlow.Oqt.Server.Oqtane",
            ReleaseVersions = "1.0.0",
            Dependencies = "ToSic.ImageFlow.Oqt.Shared.Oqtane",
            Runtimes = "Server",
            Categories = "Admin",
        };
    }
}
