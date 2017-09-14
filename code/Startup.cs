using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(code.Startup))]
namespace code
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
