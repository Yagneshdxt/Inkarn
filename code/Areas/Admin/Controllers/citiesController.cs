using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Net;
using System.Web;
using System.Web.Mvc;
using DataAccess;

namespace code.Areas.Admin.Controllers
{
    public class citiesController : Controller
    {
        private spa_dbEntities db = new spa_dbEntities();

        // GET: Admin/cities
        public ActionResult Index()
        {
            //await db.citys.ToListAsync()
            return View();
        }

        public JsonResult GetCitiLst()
        {
            db.Configuration.ProxyCreationEnabled = false;
            List<city> lstCity = db.citys.ToList();
            var lstCityformate = lstCity.Select(x => new
            {
                x.id,
                x.name,
                isActive = x.isActive ? "Active" : "Inactive",
                x.zipcode,
                x.description,
                created_at = x.created_at.ToString("MMM,dd,yyy"),
                updated_at = x.updated_at.ToString("MMM,dd,yyy")
            });
            return Json(new { data = lstCityformate }, JsonRequestBehavior.AllowGet);
            /*
            http://www.dotnetawesome.com/2015/11/jquery-datatable-server-side-pagination-sorting.html
            var draw = Request.Form.GetValues("draw").FirstOrDefault();
            var start = Request.Form.GetValues("start").FirstOrDefault();
            var length = Request.Form.GetValues("length").FirstOrDefault();
            //Find Order Column
            var sortColumn = Request.Form.GetValues("columns[" + Request.Form.GetValues("order[0][column]").FirstOrDefault() + "][name]").FirstOrDefault();
            var sortColumnDir = Request.Form.GetValues("order[0][dir]").FirstOrDefault();
 
 
            int pageSize = length != null? Convert.ToInt32(length) : 0;
            int skip = start != null ? Convert.ToInt32(start) : 0;
            int recordsTotal = 0;
             */
        }

        // GET: Admin/cities/Details/5
        public async Task<ActionResult> Details(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            city city = await db.citys.FindAsync(id);
            if (city == null)
            {
                return HttpNotFound();
            }
            return View(city);
        }

        // GET: Admin/cities/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/cities/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create([Bind(Include = "id,name,zipcode,description,isActive")] city city)
        {
            if (ModelState.IsValid)
            {
                city.created_at = DateTime.Now;
                city.updated_at = DateTime.Now;
                db.citys.Add(city);
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }

            return View(city);
        }

        // GET: Admin/cities/Edit/5
        public async Task<ActionResult> Edit(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            city city = await db.citys.FindAsync(id);
            if (city == null)
            {
                return HttpNotFound();
            }
            return View(city);
        }

        // POST: Admin/cities/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit([Bind(Include = "id,name,zipcode,description,isActive,created_at")] city city)
        {
            if (ModelState.IsValid)
            {
                city.updated_at = DateTime.Now;
                db.Entry(city).State = EntityState.Modified;
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            return View(city);
        }

        // GET: Admin/cities/Delete/5
        public async Task<ActionResult> Delete(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            city city = await db.citys.FindAsync(id);
            if (city == null)
            {
                return HttpNotFound();
            }
            return View(city);
        }

        // POST: Admin/cities/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(long id)
        {
            city city = await db.citys.FindAsync(id);
            db.citys.Remove(city);
            await db.spa_basic_info.Where(x => x.cityId == city.id).ForEachAsync((e)=>{ e.cityId = null; });
            await db.SaveChangesAsync();
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
