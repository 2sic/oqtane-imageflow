using Oqtane.Infrastructure;
using Oqtane.Models;
using Oqtane.Modules;

namespace ToSic.Imageflow.Oqt.Manager
{
    public class ImageflowManager : IInstallable, IPortable
    {
        public bool Install(Tenant tenant, string version)
        {
            return true;
        }

        public bool Uninstall(Tenant tenant)
        {
            return true;
        }

        public string ExportModule(Module module)
        {
            string content = "";
            return content;
        }

        public void ImportModule(Module module, string content, string version)
        {

        }
    }
}
