using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(HospitalSite.Startup))]
namespace HospitalSite
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
