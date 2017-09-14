using System.Web.Mvc;

namespace code.Areas.Admin
{
    public class AdminAreaRegistration : AreaRegistration 
    {
        public override string AreaName 
        {
            get 
            {
                return "Admin";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context) 
        {
            context.MapRoute(
                "Admin_default",
                "Admin/{controller}/{action}/{id}",
                new { action = "Index", id = UrlParameter.Optional },namespaces: new[] { "code.Areas.Admin.Controllers" }
            );

            context.MapRoute(
                name: "AdminHome",
                url: "Admin",
                defaults: new { controller = "AdminHome", action = "Index", id = UrlParameter.Optional },
                namespaces: new[] { "code.Areas.Admin.Controllers" }
            );
        }
    }
}