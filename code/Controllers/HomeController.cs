using code.Models;
using DataAccess;
using System;
using System.Collections.Generic;
using System.Data.Entity.SqlServer;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace code.Controllers
{
    public class HomeController : Controller
    {
        private spa_dbEntities db = new spa_dbEntities();

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult SearchPanelHome()
        {
            SearchModel objSerchModel = new SearchModel();
            //objSerchModel.cityLst = new SelectList(db.citys.Where(x => x.isActive).Select(x => new SelectListItem() { Text = x.name, Value = SqlFunctions.StringConvert((double)x.id).Trim() }).ToList(), "Value", "Text");
            objSerchModel.CategoryLst = new SelectList(db.CategeogySubCategories.Where(x => x.isActive && (x.parentId == null || x.parentId == 0) && x.name.Trim().ToLower() != "na").Select(x => new SelectListItem { Text = x.name, Value = SqlFunctions.StringConvert((double)x.id).Trim() }).ToList(), "Value", "Text");
            List<SelectListItem> selectLstItm = db.price_range.Where(x => x.isActive).Select(x => new SelectListItem() { Text = x.price_range_name, Value = SqlFunctions.StringConvert((double)x.id).Trim() }).ToList();
            //selectLstItm.Insert(0, new SelectListItem() { Text = "Price", Value = "" });
            objSerchModel.PriceLst = new SelectList(selectLstItm, "Value", "Text");
            objSerchModel.nearbyZip = new NearbyZipCode() { zip_codes = new List<string>() };
            return PartialView("SearchPanel", objSerchModel);
        }

        public JsonResult GetSubCategoryDrDw(long cat_id)
        {
            List<SelectListItem> SubCatlst = getSubCatForCat(cat_id);
            return Json(new SelectList(SubCatlst, "Value", "Text"), JsonRequestBehavior.AllowGet);
        }

        public List<SelectListItem> getSubCatForCat(long cat_id)
        {
            List<SelectListItem> SubCatlst = db.CategeogySubCategories.Where(x => x.isActive && x.parentId == cat_id && x.name.Trim().ToLower() != "na").Select(x => new SelectListItem { Text = x.name, Value = SqlFunctions.StringConvert((double)x.id).Trim() }).ToList();
            return SubCatlst;
        }

        public ActionResult SearchPanelPages(SearchModel model)
        {
            SearchModel objSerchModel = model; //new SearchModel();
            List<SelectListItem> SubCatlst = new List<SelectListItem>();
            //objSerchModel.cityLst = new SelectList(db.citys.Where(x => x.isActive).Select(x => new SelectListItem() { Text = x.name, Value = SqlFunctions.StringConvert((double)x.id).Trim() }).ToList(), "Value", "Text");
            objSerchModel.CategoryLst = new SelectList(db.CategeogySubCategories.Where(x => x.isActive && (x.parentId == null || x.parentId == 0) && x.name.Trim().ToLower() != "na").Select(x => new SelectListItem { Text = x.name, Value = SqlFunctions.StringConvert((double)x.id).Trim() }).ToList(), "Value", "Text");
            objSerchModel.SubCategoryLst = new SelectList(SubCatlst);
            if (model.SelectedCateId != 0)
            {
                SubCatlst = getSubCatForCat(model.SelectedCateId);
                objSerchModel.SubCategoryLst = new SelectList(SubCatlst, "Value", "Text", model.SelectedCateId);
            }
            List<SelectListItem> selectLstItm = db.price_range.Where(x => x.isActive).Select(x => new SelectListItem() { Text = x.price_range_name, Value = SqlFunctions.StringConvert((double)x.id).Trim() }).ToList();
            //selectLstItm.Insert(0, new SelectListItem() { Text = "Price", Value = "" });
            objSerchModel.PriceLst = new SelectList(selectLstItm, "Value", "Text");
            if (objSerchModel.nearbyZip == null)
            {
                objSerchModel.nearbyZip = new NearbyZipCode() { zip_codes = new List<string>() };
            }
            return PartialView("SearchPanelInner", objSerchModel);
        }

        public ActionResult GetSearch(SearchModel objModel)
        {
            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}