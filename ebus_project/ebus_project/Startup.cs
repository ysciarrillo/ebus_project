using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(ebus_project.Startup))]
namespace ebus_project
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
