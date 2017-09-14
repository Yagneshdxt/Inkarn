using DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using System.Data.Entity;
using System.Data.Entity.SqlServer;
using System.IO;
using Elmah;
using System.Net;
using System.Linq.Dynamic;

namespace code.Areas.Admin.Controllers
{
    public class spaController : Controller
    {
        private spa_dbEntities db = new spa_dbEntities();

        // GET: Admin/spa
        public async Task<ActionResult> Index()
        {
            return View(await db.spa_basic_info.ToListAsync());
        }

        // GET: Admin/spa/Details/5
        public ActionResult Details(int id)
        {
            if (!db.spa_basic_info.Any(x => x.id == id))
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            spa_VM objSpaVm = getSpaVMFromSpaBasicInfo(id);
            ViewBag.citylst = getCityList();
            return View(objSpaVm);
        }

        public JsonResult GetSpaList(DataTableAjaxPostModel model)
        {
            // action inside a standard controller
            int filteredResultsCount;
            int totalResultsCount;

            var subCatLst = db.spa_basic_info.ToList();

            var GetList = GetDatatableLst(subCatLst, model, out filteredResultsCount, out totalResultsCount);

            return Json(new
            {
                data = GetList,
                draw = model.draw,
                recordsTotal = totalResultsCount,
                recordsFiltered = filteredResultsCount,
            }, JsonRequestBehavior.AllowGet);
        }

        public object GetDatatableLst(List<spa_basic_info> lst, DataTableAjaxPostModel model, out int filteredResultsCount, out int totalResultsCount)
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

            filteredResultsCount = lst.Count();
            lst = lst.Skip(skip).Take(take).ToList();

            var lstCityformate = lst.Select(x => new
            {
                x.id,
                x.name,
                cityName = x.city != null ? x.city.name : "",
                isActive = x.is_active ? "Active" : "Inactive",
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

        // GET: Admin/spa/Create
        public ActionResult Create()
        {
            spa_VM objSpaVm = new spa_VM();
            objSpaVm.categoryLst = getCatSubCatList();
            objSpaVm.timings = getSpatimeLst();
            ViewBag.citylst = getCityList();
            return View(objSpaVm);
        }

        // POST: Admin/spa/Create
        [HttpPost]
        public ActionResult Create(spa_VM model)
        {
            try
            {
                DateTime nowDt = DateTime.Now;
                //Spa basic info.
                spa_basic_info objBasicInfo = new spa_basic_info()
                {
                    name = model.basic_info.name,
                    cityId = model.basic_info.cityId,
                    address = model.basic_info.address,
                    zipcode = model.basic_info.zipcode,
                    info_about = model.basic_info.info_about,
                    is_active = model.basic_info.is_active,
                    contact_name = model.basic_info.contact_name,
                    contact_email = model.basic_info.contact_email,
                    contact_no = model.basic_info.contact_no,
                    created_at = nowDt,
                    updated_at = nowDt
                };

                //Spa Prices
                foreach (var item in model.Selectedprices)
                {
                    if (item.isChecked)
                    {
                        if (String.IsNullOrEmpty(item.prices))
                        {
                            objBasicInfo.spa_prices.Add(new spa_prices { cat_id = item.Id, created_at = nowDt, updated_at = nowDt });
                        }
                        if (!String.IsNullOrEmpty(item.prices))
                        {
                            objBasicInfo.spa_prices.Add(new spa_prices { cat_id = item.Id, price = Convert.ToDecimal(item.prices), created_at = nowDt, updated_at = nowDt });
                        }
                    }
                }

                //Spa timings.
                foreach (var item in model.timings)
                {
                    objBasicInfo.spa_time.Add(new spa_time { week_day = item.week_day, frm_to_times = item.frm_to_times, created_at = nowDt, updated_at = nowDt });
                }

                //SPA Images
                for (int i = 0; i < Request.Files.Count; i++)
                {
                    var file = Request.Files[i];

                    if (file != null && file.ContentLength > 0)
                    {
                        var fileName = Path.GetFileNameWithoutExtension(file.FileName);
                        var Extension = Path.GetExtension(file.FileName);
                        while (System.IO.File.Exists(Server.MapPath("~/UploadImages/") + fileName + Extension))
                        {
                            fileName = fileName + "_" + DateTime.Now.Ticks.ToString();
                        }
                        var path = Path.Combine(Server.MapPath("~/UploadImages/"), fileName + Extension);
                        file.SaveAs(path);
                        objBasicInfo.spa_images.Add(new spa_images() { image_url = "~/UploadImages/" + fileName + Extension, created_at = nowDt, updated_at = nowDt });
                    }
                }
                db.spa_basic_info.Add(objBasicInfo);
                db.SaveChanges();

                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                ErrorSignal.FromCurrentContext().Raise(ex);
                spa_VM objSpaVm = new spa_VM();
                objSpaVm.categoryLst = getCatSubCatList();
                objSpaVm.timings = getSpatimeLst();
                ViewBag.citylst = getCityList();
                return View(objSpaVm);
            }
        }

        [HttpPost]
        public ActionResult GetSubCategory(List<long> cat_id, int spa_id)
        {
            spa_VM objSpaVm = new spa_VM();
            string querysql = "";
            db.Database.Log = (s) => { querysql += " \r\n " + s; };
            //objSpaVm.Selectedprices = db.CategeogySubCategories.Where(x => cat_id.Contains(x.parentId ?? 0) && x.isActive).Select(x => new Intcheckboxmodel { Id = x.id, isChecked = false, name = x.name }).ToList();
            objSpaVm.Selectedprices = getSpaPriceLst(cat_id, spa_id);
            //ViewBag.sqlQuery = querysql;
            return PartialView("subcatePrice", objSpaVm);
        }


        public FileResult Download(String p, String d)
        {
            return File(Server.MapPath(p), System.Net.Mime.MediaTypeNames.Application.Octet, d + Path.GetExtension(Server.MapPath(p)));
        }


        [HttpPost]
        public JsonResult DeleteFile(string id)
        {
            if (String.IsNullOrEmpty(id))
            {
                Response.StatusCode = (int)HttpStatusCode.BadRequest;
                return Json(new { Result = "Error", Message = "Bad request File Id missing" });
            }
            try
            {
                spa_images fileDetail = db.spa_images.Find(Convert.ToInt64(id));
                if (fileDetail == null)
                {
                    Response.StatusCode = (int)HttpStatusCode.NotFound;
                    return Json(new { Result = "Error", Message = "File Not found" });
                }

                //Remove from database
                db.spa_images.Remove(fileDetail);
                db.SaveChanges();

                //Delete file from the file system
                var path = Server.MapPath(fileDetail.image_url);
                if (System.IO.File.Exists(path))
                {
                    System.IO.File.Delete(path);
                }
                return Json(new { Result = "OK" });
            }
            catch (Exception ex)
            {
                return Json(new { Result = "ERROR", Message = ex.Message });
            }
        }

        // GET: Admin/spa/Edit/5
        public ActionResult Edit(long id)
        {
            if (!db.spa_basic_info.Any(x => x.id == id))
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            spa_VM objSpaVm = getSpaVMFromSpaBasicInfo(id);
            ViewBag.citylst = getCityList();
            return View(objSpaVm);
        }

        // POST: Admin/spa/Edit/5
        [HttpPost]
        public ActionResult Edit(spa_VM model)
        {
            try
            {

                spa_basic_info objBasicInfo = db.spa_basic_info.Include(x => x.spa_images).Include(x => x.spa_prices.Select(a => a.CategeogySubCategory)).Include(x => x.spa_time).Where(x => x.id == model.basic_info.id).FirstOrDefault();

                if (objBasicInfo == null)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }

                DateTime nowDt = DateTime.Now;
                //Spa basic info.

                objBasicInfo.name = model.basic_info.name;
                objBasicInfo.cityId = model.basic_info.cityId;
                objBasicInfo.address = model.basic_info.address;
                objBasicInfo.zipcode = model.basic_info.zipcode;
                objBasicInfo.info_about = model.basic_info.info_about;
                objBasicInfo.is_active = model.basic_info.is_active;
                objBasicInfo.contact_name = model.basic_info.contact_name;
                objBasicInfo.contact_email = model.basic_info.contact_email;
                objBasicInfo.contact_no = model.basic_info.contact_no;
                objBasicInfo.updated_at = nowDt;


                //Spa Prices
                Intcheckboxmodel chkModel;
                //Update spa prices and select all deleted prices.
                List<spa_prices> lstSpaPrices = new List<spa_prices>();
                objBasicInfo.spa_prices.ToList().ForEach(x =>
                {
                    //This will update existing prices
                    chkModel = model.Selectedprices.Where(e => e.Id == x.cat_id && e.isChecked).SingleOrDefault();
                    if (chkModel != null)
                    {
                        if (String.IsNullOrEmpty(chkModel.prices))
                        {
                            x.price = null;
                        }
                        else
                        {
                            x.price = Convert.ToDecimal(chkModel.prices);
                        }
                    }
                    else
                    {
                        lstSpaPrices.Add(x);
                        db.Entry(x).State = EntityState.Deleted;
                    }
                });
                //Remove spa prices.
                /*if (lstSpaPrices.Count > 0)
                {
                    lstSpaPrices.ForEach(x => objBasicInfo.spa_prices.Remove(x));
                    db.spa_prices.RemoveRange(lstSpaPrices);
                    db.Entry(objBasicInfo.spa_prices.Where(x => x.id == 2)).State = EntityState.Deleted;
                }*/
                //Add spa prices
                foreach (var item in model.Selectedprices)
                {//This for loop addes newly added sub category prices.
                    if (item.isChecked && !objBasicInfo.spa_prices.Any(x => x.cat_id == item.Id))
                    {
                        if (String.IsNullOrEmpty(item.prices))
                        {
                            objBasicInfo.spa_prices.Add(new spa_prices { cat_id = item.Id, created_at = nowDt, updated_at = nowDt });
                        }
                        if (!String.IsNullOrEmpty(item.prices))
                        {
                            objBasicInfo.spa_prices.Add(new spa_prices { cat_id = item.Id, price = Convert.ToDecimal(item.prices), created_at = nowDt, updated_at = nowDt });
                        }
                    }
                }

                //Clean up deleted category from spa prices
                List<long> Dd_catId = db.CategeogySubCategories.Where(x => x.isActive).Select(x => x.id).ToList();
                List<spa_prices> deletedCatId = objBasicInfo.spa_prices.Where(x => !Dd_catId.Contains(x.cat_id)).ToList();
                if (deletedCatId.Count > 0)
                {
                    db.spa_prices.RemoveRange(deletedCatId);
                }

                //Spa timings.
                //objBasicInfo.spa_time.Join(model.timings, x => x.week_day, j => j.week_day, (x, j) => { x.frm_to_times = j.frm_to_times; return x; });
                objBasicInfo.spa_time.ToList().ForEach(x => x.frm_to_times = model.timings.Where(a => a.week_day == x.week_day).SingleOrDefault().frm_to_times);

                //SPA Images
                for (int i = 0; i < Request.Files.Count; i++)
                {
                    var file = Request.Files[i];

                    if (file != null && file.ContentLength > 0)
                    {
                        var fileName = Path.GetFileNameWithoutExtension(file.FileName);
                        var Extension = Path.GetExtension(file.FileName);
                        while (System.IO.File.Exists(Server.MapPath("~/UploadImages/") + fileName + Extension))
                        {
                            fileName = fileName + "_" + DateTime.Now.Ticks.ToString();
                        }
                        var path = Path.Combine(Server.MapPath("~/UploadImages/"), fileName + Extension);
                        file.SaveAs(path);
                        objBasicInfo.spa_images.Add(new spa_images() { image_url = "~/UploadImages/" + fileName + Extension, created_at = nowDt, updated_at = nowDt });
                    }
                }
                string querysql = "";
                db.Database.Log = (s) => { querysql += " \r\n " + s; };
                db.Entry(objBasicInfo).State = EntityState.Modified;
                db.SaveChanges();
                ViewBag.sqlQuery = querysql;

                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                ErrorSignal.FromCurrentContext().Raise(ex);
                spa_VM objSpaVm = getSpaVMFromSpaBasicInfo(model.basic_info.id);
                ViewBag.citylst = getCityList();
                return View(objSpaVm);
            }
        }

        // GET: Admin/spa/Delete/5
        public async Task<ActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            spa_basic_info spaBasicInfo = await db.spa_basic_info.FindAsync(id);
            if (spaBasicInfo == null)
            {
                return HttpNotFound();
            }
            return View(spaBasicInfo);
        }

        // POST: Admin/spa/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Delete(int id)
        {
            try
            {
                // TODO: Add delete logic here
                List<spa_images> spaImg = db.spa_images.Where(x => x.spa_id == id).ToList();
                foreach (var item in spaImg)
                {
                    try
                    {
                        if (System.IO.File.Exists(item.image_url))
                        {
                            System.IO.File.Delete(item.image_url);
                        }
                    }
                    catch (Exception)
                    {

                    }
                }
                db.spa_images.RemoveRange(spaImg);
                db.spa_time.RemoveRange(db.spa_time.Where(x => x.spa_id == id));
                db.spa_prices.RemoveRange(db.spa_prices.Where(x => x.spa_id == id));
                db.spa_basic_info.RemoveRange(db.spa_basic_info.Where(x => x.id == id));
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        #region Functions

        private spa_VM getSpaVMFromSpaBasicInfo(long spaId)
        {
            spa_VM objSpaVm = new spa_VM();
            objSpaVm.categoryLst = getCatSubCatList();
            objSpaVm.timings = getSpatimeLst();
            db.Configuration.LazyLoadingEnabled = false;
            spa_basic_info objBasicInfo = db.spa_basic_info.Include(x => x.spa_images).Include(x => x.spa_prices.Select(a => a.CategeogySubCategory)).Include(x => x.spa_time).Where(x => x.id == spaId).FirstOrDefault();//.Include("spa_images").Include("spa_prices");
            objSpaVm.categoryLst.Where(x => objBasicInfo.spa_prices.Any(e => e.CategeogySubCategory.parentId == x.Id)).ToList().ForEach(item => item.isChecked = true);
            objSpaVm.timings.ForEach(x => x.frm_to_times = objBasicInfo.spa_time.First(a => a.week_day == x.week_day).frm_to_times);
            if (objBasicInfo != null)
            {
                objSpaVm.basic_info = objBasicInfo;
                objSpaVm.images = objBasicInfo.spa_images.ToList();
                //objSpaVm.Selectedprices = objBasicInfo.spa_prices.ToList().Select(x => new Intcheckboxmodel { Id = x.cat_id, name = x.CategeogySubCategory.name, isChecked = true, prices = x.price }).ToList();
                objSpaVm.Selectedprices = getSpaPriceLst(objSpaVm.categoryLst.Where(x => x.isChecked).Select(x => x.Id).ToList(), spaId);
            }
            return objSpaVm;
        }

        public List<Intcheckboxmodel> getCatSubCatList()
        {
            var categoryLst = db.CategeogySubCategories.Where(x => x.isActive && (x.parentId == null || x.parentId == 0)).Select(x => new Intcheckboxmodel { Id = x.id, isChecked = false, name = x.name }).ToList();
            return categoryLst;
        }

        public SelectList getCityList()
        {
            var cityLst = new SelectList(db.citys.Where(x => x.isActive).Select(x => new SelectListItem() { Text = x.name, Value = SqlFunctions.StringConvert((double)x.id).Trim() }).ToList(), "Value", "Text");
            return cityLst;
        }

        public List<spa_time> getSpatimeLst()
        {
            var Spatimings = new List<spa_time>();
            foreach (DayOfWeek day in Enum.GetValues(typeof(DayOfWeek)))
            {
                Spatimings.Add(new spa_time { week_day = Enum.GetName(typeof(DayOfWeek), day) });
            }
            return Spatimings;
        }

        public List<Intcheckboxmodel> getSpaPriceLst(List<long> cat_id, long spa_id)
        {

            var spaPriceList = db.spa_prices.Include(x => x.CategeogySubCategory).Where(x => x.spa_id == spa_id);
            var selectedPriceLst = from a in db.CategeogySubCategories
                                   join b in spaPriceList on a.id equals b.CategeogySubCategory.id into bjoin
                                   from bj in bjoin.DefaultIfEmpty()
                                   where cat_id.Contains(a.parentId ?? 0) && a.isActive
                                   select new Intcheckboxmodel
                                   {
                                       Id = a.id,
                                       isChecked = bj.cat_id == a.id,
                                       name = a.name,
                                       prices = bj.price == null ? "" : SqlFunctions.StringConvert(bj.price).Trim()
                                   };
            return selectedPriceLst.ToList();
        }

        #endregion
    }
}
