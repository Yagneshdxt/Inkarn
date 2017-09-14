using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Net;
using System.Web.Mvc;
using DataAccess;
using System.Data.Entity.SqlServer;
using System.Linq.Dynamic;

namespace code.Areas.Admin.Controllers
{
    public class CatSubCatController : Controller
    {
        private spa_dbEntities db = new spa_dbEntities();

        // GET: Admin/CatSubCat
        public ActionResult Index()
        {
            //await db.CategeogySubCategories.Where(x => x.parentId == null || x.parentId == 0).ToListAsync()
            return View();
        }

        public JsonResult GetCategoryLst(DataTableAjaxPostModel model)
        {
            // action inside a standard controller
            int filteredResultsCount;
            int totalResultsCount;

            db.Configuration.ProxyCreationEnabled = false;
            List<CategeogySubCategory> lst = db.CategeogySubCategories.Where(x => x.parentId == null || x.parentId == 0).ToList();

            var GetList = GetDataList(lst, model, out filteredResultsCount, out totalResultsCount);

            return Json(new
            {
                data = GetList,
                draw = model.draw,
                recordsTotal = totalResultsCount,
                recordsFiltered = filteredResultsCount,
            }, JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetSubCategoryLst(DataTableAjaxPostModel model)
        {
            // action inside a standard controller
            int filteredResultsCount;
            int totalResultsCount;

            db.Configuration.ProxyCreationEnabled = false;
            var subCat = from p in db.CategeogySubCategories
                         join pm in db.CategeogySubCategories on p.id equals pm.parentId
                         select new catSubcatLst { id = pm.id, name = pm.name, subheading = pm.subheading, description = pm.description, created_at = pm.created_at, updated_at = pm.updated_at, isActive = pm.isActive, parentId = pm.parentId, parentName = p.name };
            var subCatLst = subCat.ToList();

            var GetList = GetSubCatDataList(subCatLst, model, out filteredResultsCount, out totalResultsCount);

            return Json(new
            {
                data = GetList,
                draw = model.draw,
                recordsTotal = totalResultsCount,
                recordsFiltered = filteredResultsCount,
            }, JsonRequestBehavior.AllowGet);
        }


        public object GetDataList(List<CategeogySubCategory> lst, DataTableAjaxPostModel model, out int filteredResultsCount, out int totalResultsCount)
        {
            string searchBy = (model.search != null) ? model.search.value : null;
            var take = model.length;
            var skip = model.start;
            var sortBy = "name";
            string sortDir = "ASC";

            totalResultsCount = lst.Count();

            if (model.order != null)
            {
                // in this example we just default sort on the 1st column
                sortBy = model.columns[model.order[0].column].data;
                sortDir = model.order[0].dir.ToLower() == "asc" ? "ASC" : "DESC";
            }
            if (!String.IsNullOrEmpty(searchBy))
            {
                lst = lst.Where(x => x.name.ToLower().Contains(searchBy.ToLower())).ToList();
            }
            /*if (String.IsNullOrEmpty(searchBy))
            {
                // if we have an empty search then just order the results by Id ascending
                sortBy = "id";
                sortDir = true;
            }*/



            filteredResultsCount = lst.Count();
            lst = lst.OrderBy(sortBy + " " + sortDir).ToList();
            //lst = lst.OrderBy(sortBy, (sortDir ? SortDirection.Ascending : SortDirection.Descending)).ToList();
            lst = lst.Skip(skip).Take(take).ToList();

            var lstCityformate = lst.Select(x => new
            {
                x.id,
                x.name,
                isActive = x.isActive ? "Active" : "Inactive",
                x.subheading,
                x.description,
                created_at = x.created_at.ToString("MMM,dd,yyy"),
                updated_at = x.updated_at.ToString("MMM,dd,yyy")
            });

            if (lst == null)
            {
                // empty collection...
                return new List<CategeogySubCategory>();
            }
            return lstCityformate;

        }

        public ActionResult SubCategory()
        {
            //string querysql = "";
            //db.Database.Log = (s) => { querysql += " \r\n " + s; };

            ////db.Database.Log = (s) => { querysql += " \r\n " + s; };
            //ViewBag.sqlQuery = querysql;
            return View("Index_SubCat");
        }

        public object GetSubCatDataList(List<catSubcatLst> lst, DataTableAjaxPostModel model, out int filteredResultsCount, out int totalResultsCount)
        {
            string searchBy = (model.search != null) ? model.search.value : null;
            var take = model.length;
            var skip = model.start;
            var sortBy = "name";
            string sortDir = "ASC";

            totalResultsCount = lst.Count();

            if (model.order != null)
            {
                // in this example we just default sort on the 1st column
                sortBy = model.columns[model.order[0].column].data;
                sortDir = model.order[0].dir.ToLower() == "asc" ? "ASC" : "DESC";
            }
            if (!String.IsNullOrEmpty(searchBy))
            {
                lst = lst.Where(x => x.name.ToLower().Contains(searchBy.ToLower())).ToList();
            }
            /*if (String.IsNullOrEmpty(searchBy))
            {
                // if we have an empty search then just order the results by Id ascending
                sortBy = "id";
                sortDir = true;
            }*/

            filteredResultsCount = lst.Count();
            //lst = lst.OrderBy(sortBy + " " + sortDir).ToList();
            //lst = lst.OrderBy(sortBy, (sortDir ? SortDirection.Ascending : SortDirection.Descending)).ToList();
            lst = lst.Skip(skip).Take(take).ToList();

            var lstCityformate = lst.Select(x => new
            {
                x.id,
                x.name,
                x.parentName,
                isActive = x.isActive ? "Active" : "Inactive",
                x.subheading,
                x.description,
                created_at = x.created_at.ToString("MMM,dd,yyy"),
                updated_at = x.updated_at.ToString("MMM,dd,yyy")
            });

            if (lst == null)
            {
                // empty collection...
                return new List<catSubcatLst>();
            }
            lstCityformate = lstCityformate.OrderBy(sortBy + " " + sortDir).ToList();
            return lstCityformate;
        }


        // GET: Admin/CatSubCat/Details/5
        public async Task<ActionResult> Details(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CategeogySubCategory categeogySubCategory = await db.CategeogySubCategories.FindAsync(id);
            if (categeogySubCategory == null)
            {
                return HttpNotFound();
            }
            return View(categeogySubCategory);
        }

        // GET: Admin/CatSubCat/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/CatSubCat/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create([Bind(Include = "id,parentId,name,subheading,description,isActive")] CategeogySubCategory categeogySubCategory, string Cat_SubCat)
        {
            if (ModelState.IsValid)
            {
                categeogySubCategory.created_at = DateTime.Now;
                categeogySubCategory.updated_at = DateTime.Now;
                db.CategeogySubCategories.Add(categeogySubCategory);
                await db.SaveChangesAsync();
                if (String.IsNullOrEmpty(Cat_SubCat))
                    return RedirectToAction("Index");
                return RedirectToAction("SubCategory");
            }
            if (String.IsNullOrEmpty(Cat_SubCat))
                return View(categeogySubCategory);
            return View("Create_SubCat", categeogySubCategory);
        }

        // GET: Admin/CatSubCat/Create
        public ActionResult CreateSubcategory()
        {
            SelectList CategoryLst = new SelectList(db.CategeogySubCategories.Where(x => x.parentId == null).Select(a => new SelectListItem { Text = a.name, Value = SqlFunctions.StringConvert((double)a.id).Trim() }).ToList(), "Value", "Text", null);
            ViewBag.CategoryList = CategoryLst;
            return View("Create_SubCat");
        }

        // GET: Admin/CatSubCat/Edit/5
        public async Task<ActionResult> Edit(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CategeogySubCategory categeogySubCategory = await db.CategeogySubCategories.FindAsync(id);
            if (categeogySubCategory == null)
            {
                return HttpNotFound();
            }
            return View(categeogySubCategory);
        }

        // GET: Admin/CatSubCat/Edit/5
        public async Task<ActionResult> Edit_SubCat(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CategeogySubCategory categeogySubCategory = await db.CategeogySubCategories.FindAsync(id);
            if (categeogySubCategory == null)
            {
                return HttpNotFound();
            }
            SelectList CategoryLst = new SelectList(db.CategeogySubCategories.Where(x => x.parentId == null).Select(a => new SelectListItem { Text = a.name, Value = SqlFunctions.StringConvert((double)a.id).Trim() }).ToList(), "Value", "Text");
            ViewBag.CategoryList = CategoryLst;
            return View("Edit_SubCat", categeogySubCategory);
        }

        // POST: Admin/CatSubCat/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit([Bind(Include = "id,parentId,name,subheading,description,isActive,created_at")] CategeogySubCategory categeogySubCategory, string Cat_SubCat)
        {
            if (ModelState.IsValid)
            {
                categeogySubCategory.updated_at = DateTime.Now;
                db.Entry(categeogySubCategory).State = EntityState.Modified;
                await db.SaveChangesAsync();
                if (String.IsNullOrEmpty(Cat_SubCat))
                    return RedirectToAction("Index");
                return RedirectToAction("SubCategory");
            }
            return View(categeogySubCategory);
        }

        // GET: Admin/CatSubCat/Delete/5
        public async Task<ActionResult> Delete(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CategeogySubCategory categeogySubCategory = await db.CategeogySubCategories.FindAsync(id);
            if (categeogySubCategory == null)
            {
                return HttpNotFound();
            }
            ViewBag.ParentName = "";
            if (categeogySubCategory.parentId != null && categeogySubCategory.parentId != 0)
                ViewBag.ParentName = db.CategeogySubCategories.Find(categeogySubCategory.parentId).name;
            return View(categeogySubCategory);
        }

        // POST: Admin/CatSubCat/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(long id)
        {
            bool chekIfSub = false;
            CategeogySubCategory categeogySubCategory = await db.CategeogySubCategories.FindAsync(id);
            if (categeogySubCategory.parentId != null && categeogySubCategory.parentId != 0)
            {
                chekIfSub = true;
            }
            //Remove spa mapping to selected category.
            db.spa_prices.RemoveRange(db.spa_prices.Where(x => x.CategeogySubCategory.id == categeogySubCategory.id));
            //Remove spa mapping that are mapped to child category.
            List<long> childCat = db.CategeogySubCategories.Where(x => x.parentId == categeogySubCategory.id).Select(x=>x.id).ToList();
            db.spa_prices.RemoveRange(db.spa_prices.Where(x => childCat.Contains(x.cat_id)));
            //Remove child category
            db.CategeogySubCategories.RemoveRange(db.CategeogySubCategories.Where(x => x.parentId == categeogySubCategory.id));
            //Remove category
            db.CategeogySubCategories.Remove(categeogySubCategory);
            await db.SaveChangesAsync();
            if (chekIfSub)
                return RedirectToAction("SubCategory");
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
