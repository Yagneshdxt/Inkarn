using System.Web;
using System.Web.Optimization;

namespace code
{
    public class BundleConfig
    {
        // For more information on bundling, visit http://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                        "~/Scripts/jquery-{version}.js"));

            bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include(
                        "~/Scripts/jquery.validate*"));

            // Use the development version of Modernizr to develop with and learn from. Then, when you're
            // ready for production, use the build tool at http://modernizr.com to pick only the tests you need.
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                        "~/Scripts/modernizr-*"));



            bundles.Add(new ScriptBundle("~/TheamOneJs").Include(
                        "~/js/jquery.min.js",
                        "~/js/bootstrap.min.js",
                        "~/js/common.js",
                        "~/js/bootstrap-select.js",
                        "~/js/owl.carousel.min.js"
                        ));

            bundles.Add(new ScriptBundle("~/bundles/bootstrap").Include(
                      "~/Scripts/bootstrap.js",
                      "~/Scripts/respond.js"));

            bundles.Add(new StyleBundle("~/Content/css").Include(
                      "~/Content/bootstrap.css",
                      "~/Content/site.css"));
            
            //Datatables
            bundles.Add(new StyleBundle("~/Content/datatable").Include(
                      "~/Content/datatables.min.css"));
            bundles.Add(new ScriptBundle("~/bundles/datatable").Include(
            "~/js/datatables.min.js"));
            //Datatables

            bundles.Add(new StyleBundle("~/Content/TheamOnecss").Include(
                                  "~/Content/fonts.css",
                                  "~/Content/font-awesome.min.css",
                                  "~/Content/bootstrap.min.css",
                                  "~/Content/owl.carousel.min.css",
                                  "~/Content/owl.theme.default.min.css",
                                  "~/Content/common.css",
                                  "~/Content/bootstrap.dropdown.css",
                                  "~/Content/general.css"
                                  ));
        }
    }
}
