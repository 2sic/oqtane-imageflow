using Oqtane.Models;
using Oqtane.Modules;

namespace ToSic.Imageflow.Oqt
{
    public class ModuleInfo : IModule
    {
        public ModuleDefinition ModuleDefinition => new ModuleDefinition
        {
            Name = "Imageflow",
            Description = "Imageflow.NET Server image processing and optimizing middleware",
            Version = "1.12.1",
            ServerManagerType = "ToSic.Imageflow.Oqt.Manager.ImageflowManager, ToSic.Imageflow.Oqt.Server.Oqtane",
            ReleaseVersions = "1.12.1"
        };
    }
}
