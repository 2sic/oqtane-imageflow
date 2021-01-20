using Oqtane.Models;
using Oqtane.Modules;

namespace ToSic.Oqt.ImageFlow
{
    public class ModuleInfo : IModule
    {
        public ModuleDefinition ModuleDefinition => new ModuleDefinition
        {
            Name = "ImageFlow",
            Description = "Image processing and optimizing middleware with querystring API for Oqtane.",
            Version = "1.0.0",
            ServerManagerType = "ToSic.Oqt.ImageFlow.Manager.ImageFlowManager, ToSic.Oqt.ImageFlow.Server.Oqtane",
            ReleaseVersions = "1.0.0",
            Dependencies = "ToSic.Oqt.ImageFlow.Shared.Oqtane",
            Runtimes = "Server",
            Categories = "Admin",
        };
    }
}
