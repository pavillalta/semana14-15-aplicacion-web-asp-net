using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(semana14_15_aplicacion_web_asp_net.Startup))]
namespace semana14_15_aplicacion_web_asp_net
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
