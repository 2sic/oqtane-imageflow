using System.Collections.Generic;
using System.Linq;
using System.Text.Json;
using Oqtane.Modules;
using Oqtane.Models;
using Oqtane.Infrastructure;
using Oqtane.Repository;

namespace ToSic.Imageflow.Oqt.Manager
{
    public class ImageflowManager : IInstallable, IPortable
    {
        public ImageflowManager()
        {

        }

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
