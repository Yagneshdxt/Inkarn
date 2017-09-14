using code.Models;
using DataAccess;
using System;
using System.Collections.Generic;
using System.Data.Entity.SqlServer;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Mvc;
using PagedList;
using System.Net.Http;
using System.Net;
using System.IO;
using Newtonsoft.Json;
using System.Configuration;
using System.Threading;
using System.Net.Mail;

namespace code.Controllers
{
    public class SearchController : Controller
    {
        private spa_dbEntities db = new spa_dbEntities();
        // GET: Search
        public ActionResult Index(SearchModel objModel, int? page)
        {
            int pageSize = 10;
            int pageNumber = (page ?? 1);
            SearchReasult_VM objSearchResult = new SearchReasult_VM();
            objSearchResult.SearchParam = objModel;
            objSearchResult.SpaListWithPrice = new PagedList<spaInfoResult_vm>(null, pageNumber, pageSize); //new PagedList.IPagedList<spaInfoResult_vm>();

            StringBuilder errmsg = new StringBuilder();
            //if (objModel.SelectedcityId == 0)
            //{
            //    errmsg.Append("<li class=\"list-group-item-warning\" > Please select City </li>");
            //}
            if (String.IsNullOrEmpty(objModel.zipCode))
            {
                errmsg.AppendLine("<li class=\"list-group-item-warning\" >Please enter Zip Code </li>");
            }
            //if (objModel.SelectedCateId == 0)
            //{
            //    errmsg.AppendLine("<li class=\"list-group-item-warning\" >Please select Category </li>");
            //}
            //if (objModel.SelectedSubCatId == 0)
            //{
            //    errmsg.AppendLine("<li class=\"list-group-item-warning\" > Please select Sub Category </li>");
            //}
            if (errmsg.Length > 0)
            {
                errmsg.Insert(0, "<li class=\"list-group-item-warning\"> No Records found.  </li>");
                ViewBag.ErrMsg = errmsg.ToString();
                return View(objSearchResult);
            }


            //https://www.zipcodeapi.com/rest/J6doIgxwb8T6GuJmtSpuwlHfwgwby2ch8pGRFenQmhX2LHpezOI6aplGGSSfU4x3/radius.json/58009/50/miles?minimal

            if (!String.IsNullOrEmpty(objModel.searchSubmit) && objModel.searchSubmit == "searchSubmit")
            {
                //Reset pagination
                pageNumber = 1;
                WebClient client = new WebClient();
                client.Headers.Add("user-agent", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.2; .NET CLR 1.0.3705;)");
                Stream data = Stream.Null;
                try
                {
                    //data = client.OpenRead("https://www.zipcodeapi.com/rest/"+ Convert.ToString(ConfigurationManager.AppSettings["zipApiKey"]) +"/radius.json/" + objModel.zipCode + "/50/miles?minimal");
                }
                catch (WebException ex)
                {
                    Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                    /*using (var readererr = new StreamReader(ex.Response.GetResponseStream()))
                    {
                       string responseText = readererr.ReadToEnd();
                    }*/
                }
                StreamReader reader = new StreamReader(data);
                string ZipApiResponse = reader.ReadToEnd();
                ZipApiResponse = "{\"zip_codes\":[\"48145\",\"48140\",\"48161\",\"48162\",\"48131\",\"48166\",\"49229\",\"48110\",\"48159\",\"48179\",\"48117\",\"48173\",\"49236\",\"48160\",\"48134\",\"48191\",\"48164\",\"48183\",\"48190\",\"48138\",\"48176\",\"48158\",\"48115\",\"48193\",\"48111\",\"48197\",\"48112\",\"48195\",\"48192\",\"48242\",\"48108\",\"48180\",\"48174\",\"48146\",\"48229\",\"48101\",\"48103\",\"48104\",\"48106\",\"48107\",\"48113\",\"48218\",\"48184\",\"48198\",\"48125\",\"48217\",\"48122\",\"48188\",\"48109\",\"48186\",\"48141\",\"48124\",\"48209\",\"48120\",\"48121\",\"48123\",\"48118\",\"48136\",\"48128\",\"48233\",\"48135\",\"48187\",\"48126\",\"48216\",\"48105\",\"48243\",\"48226\",\"48185\",\"48127\",\"48210\",\"48201\",\"48208\",\"48207\",\"48228\",\"48130\",\"48214\",\"48204\",\"48170\",\"48150\",\"48202\",\"48215\",\"48206\",\"48239\",\"48222\",\"48231\",\"48232\",\"48244\",\"48255\",\"48260\",\"48264\",\"48265\",\"48266\",\"48267\",\"48268\",\"48269\",\"48272\",\"48275\",\"48277\",\"48278\",\"48279\",\"48288\",\"48211\",\"48230\",\"48227\",\"48151\",\"48153\",\"48223\",\"48238\",\"48154\",\"48213\",\"48175\",\"48168\",\"48212\",\"48224\",\"48189\",\"48203\",\"48240\",\"48152\",\"48219\",\"48236\",\"48221\",\"48235\",\"48234\",\"48167\",\"48205\",\"48225\",\"48178\",\"48139\",\"48220\",\"48033\",\"48143\",\"48332\",\"48333\",\"48169\",\"48030\",\"48075\",\"48335\",\"48336\",\"48375\",\"48080\",\"48237\",\"48021\",\"48089\",\"48091\",\"48376\",\"48037\",\"48086\",\"48069\",\"48137\",\"48374\",\"48015\",\"48070\",\"48090\",\"48067\",\"48081\",\"48397\",\"48034\",\"48076\",\"48072\",\"48068\",\"48165\",\"48331\",\"48334\",\"48377\",\"48116\",\"48071\",\"48066\",\"48092\",\"48088\",\"48093\",\"48073\",\"48025\",\"48393\",\"48082\",\"48391\",\"48017\",\"48026\",\"48322\",\"48012\",\"48301\",\"48009\",\"48390\",\"48035\",\"48083\",\"48312\",\"48381\",\"48325\",\"48084\",\"48310\",\"48303\",\"48323\",\"48114\",\"48843\",\"48007\",\"48099\",\"48311\",\"48028\",\"48380\",\"48302\",\"48045\",\"48304\",\"48046\",\"48382\",\"48324\",\"48036\",\"48043\",\"48098\",\"48844\",\"48313\",\"48085\",\"48038\",\"48387\",\"48320\",\"48314\",\"48318\",\"48341\",\"48863\",\"48892\",\"48327\",\"48001\",\"48343\",\"48342\",\"48317\",\"48328\",\"48353\",\"48044\",\"48356\",\"48383\",\"48309\",\"48357\",\"48307\",\"48386\",\"48836\",\"48321\",\"48315\",\"48340\",\"48047\",\"48330\",\"48308\",\"48855\",\"48042\",\"48329\",\"48326\",\"48004\",\"48316\",\"48039\",\"48051\",\"48023\",\"48346\",\"48359\",\"48306\",\"48347\",\"48094\",\"48350\",\"48048\",\"48360\",\"48430\",\"48096\",\"48064\",\"48816\",\"48348\",\"48054\",\"48363\",\"48095\",\"48361\",\"48362\",\"48050\",\"48442\",\"48418\",\"48451\",\"48366\",\"48367\",\"48371\",\"48370\",\"48065\",\"48462\",\"48005\",\"48062\",\"48079\",\"48063\",\"48414\",\"48436\",\"48429\",\"48040\",\"48438\",\"48439\",\"48480\",\"48003\",\"48411\",\"48002\",\"48473\",\"48041\",\"48455\",\"48428\",\"48476\",\"48027\",\"48074\",\"48440\",\"48507\",\"48529\",\"48554\",\"48553\",\"48060\",\"48551\",\"48519\",\"48449\",\"48503\",\"48532\",\"48502\",\"48501\",\"48531\",\"48550\",\"48552\",\"48555\",\"48556\",\"48557\",\"48559\",\"48022\",\"48509\",\"48014\",\"48423\",\"48049\",\"48446\",\"48504\",\"48444\",\"48506\",\"48505\",\"48412\",\"48433\",\"48006\",\"48437\",\"48097\",\"48458\",\"48421\",\"48463\",\"48461\",\"48454\",\"48416\",\"48464\",\"48435\"]}";
                //ZipApiResponse = "{\"error_code\":400,\"error_msg\":\"Invalid request.\"}";
                //ZipApiResponse = String.Empty;
                //If Api call did not returned any output.
                if (String.IsNullOrEmpty(ZipApiResponse))
                {
                    ZipApiResponse = "{\"zip_codes\":[\"" + objModel.zipCode + "\"]}";
                }
                NearbyZipCode NearbyZipCodesObj = JsonConvert.DeserializeObject<NearbyZipCode>(ZipApiResponse);
                //If Api call returned Error message.
                if (NearbyZipCodesObj.zip_codes.Count <= 0)
                {
                    NearbyZipCodesObj.zip_codes = new List<string>() { objModel.zipCode };
                }
                objModel.nearbyZip = NearbyZipCodesObj;
            }

            var filterdLst = from a in db.spa_basic_info
                                 //join pr in db.spa_prices on new { id = a.id, ScatId = objModel.SelectedSubCatId } equals new { id = pr.spa_id, ScatId = pr.cat_id }
                             join pr in db.spa_prices on a.id equals pr.spa_id
                             join scat in db.CategeogySubCategories on pr.cat_id equals scat.id
                             join cat in db.CategeogySubCategories on scat.parentId equals cat.id
                             join cty in db.citys on a.cityId.Value equals cty.id
                             where objModel.nearbyZip.zip_codes.Contains(a.zipcode) && a.is_active
                             && scat.name.Trim().ToLower() != "na" && cat.name.Trim().ToLower() != "na"
                             select new { binfo = a, pri = pr, subCt = scat, ct = cat, cit = cty };

            if (objModel.SelectedCateId != 0)
            {
                filterdLst = filterdLst.Where(x => x.ct.id == objModel.SelectedCateId);
            }
            if (objModel.SelectedSubCatId != 0)
            {
                filterdLst = filterdLst.Where(x => x.subCt.id == objModel.SelectedSubCatId);
            }
            if (!String.IsNullOrEmpty(objModel.KeyWord))
            {
                filterdLst = filterdLst.Where(x => x.binfo.name.Trim().ToLower().Contains(objModel.KeyWord.Trim().ToLower()));
            }
            if (objModel.SelectedPriceId != 0)
            {
                price_range priceRange = db.price_range.Where(x => x.id == objModel.SelectedPriceId).SingleOrDefault();
                filterdLst = filterdLst.Where(x => (x.pri.price >= priceRange.min_price && x.pri.price <= priceRange.max_price) || x.pri.price == null);
            }
            var filLst = filterdLst.ToList();
            int getPriceSpaCount = 0;
            string getPriceSpaId = "";
            if (filLst.Any(x => x.pri.price == null || x.pri.price == 0))
            {
                getPriceSpaCount = filLst.Where(x => x.pri.price == null || x.pri.price == 0).Count();
                getPriceSpaId = String.Join(",", filLst.Where(x => x.pri.price == null || x.pri.price == 0).Select(x => x.binfo.id));
            }
            List<spaInfoResult_vm> totalLst = filLst.Select(x => new spaInfoResult_vm
            {
                id = x.binfo.id,
                name = x.binfo.name,
                cityId = x.binfo.cityId,
                info_about = x.binfo.info_about,
                website_url = x.binfo.website_url,
                address = x.binfo.address,
                contact_name = x.binfo.contact_name,
                contact_email = x.binfo.contact_email,
                contact_no = x.binfo.contact_no,
                spa_price = x.pri.price ?? null,
                spa_imgUrl = (x.binfo.spa_images.Count > 0) ? x.binfo.spa_images.Select(xa => xa.image_url).FirstOrDefault() : "",
                categoryName = x.ct.name,
                subCategoryName = x.subCt.name,
                SubCatId = x.subCt.id,
            }).OrderBy(x => x.spa_price, new NullPriceAtLast()).ToList();

            //Set View model object
            objSearchResult.totalCnt = totalLst.Count;
            objSearchResult.SpaListWithPrice = totalLst.ToPagedList(pageNumber, pageSize);
            objSearchResult.SpaIdForPriceReq = getPriceSpaId;
            objSearchResult.TotalSpaForPriceReq = getPriceSpaCount;
            if (objSearchResult.totalCnt > 0)
            {
                objModel.CategoryName = filLst.Select(x => x.ct.name).FirstOrDefault();
                objModel.SubCategoryName = filLst.Select(x => x.subCt.name).FirstOrDefault();
                objModel.cityName = filLst.Select(x => x.cit.name).FirstOrDefault();
                objModel.cityDescriptionName = filLst.Select(x => x.cit.description).FirstOrDefault();
            }
            else
            {
                ViewBag.ErrMsg = "<li class=\"list-group-item-warning\"> No Records found  </li>";
            }
            objSearchResult.SearchParam = objModel;
            return View(objSearchResult);
        }

        [HttpPost]
        public string getPriceMail(getPricedata modeldata)
        {
            string mstr;
            try
            {

                mstr = "Name " + modeldata.name + " Email : " + modeldata.Email + " BName:  " + modeldata.Bname + " Phone: " + modeldata.Phone + " Address: " + modeldata.Address + " Contact time: " + modeldata.ContactTime + " Prefered to contact by:  " + modeldata.PreferToContactBy + " spaIds: " + modeldata.SpaIdForPriceReq;
                Thread email = new Thread(delegate ()
                {
                    SendEmail(modeldata);
                });

                email.IsBackground = true;
                email.Start();

                mstr = "success";
            }
            catch (Exception ex)
            {
                Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                mstr = "fail";
            }
            return mstr;
        }

        [NonAction]
        public void SendEmail(getPricedata modeldata)
        {
            string[] spaId = { };
            if (!String.IsNullOrEmpty(modeldata.SpaIdForPriceReq)) {
                spaId = modeldata.SpaIdForPriceReq.Split(',');
            }
            
            List<spa_basic_info> spaEntity;
            using (spa_dbEntities db = new spa_dbEntities())
            {
                spaEntity = db.spa_basic_info.Where(x => spaId.Contains<string>(x.id.ToString()) && !String.IsNullOrEmpty(x.contact_email)).ToList();
            }

            string mailbody = "", mailTemplate = "";
            mailTemplate = System.IO.File.ReadAllText(System.Web.Hosting.HostingEnvironment.MapPath("~/MailTemplate/getPriceMail.html"));
            mailbody = mailTemplate.Replace("[xxxNamexxx]", modeldata.name).Replace("[xxxEmailxxx]", modeldata.Email).Replace("[xxxPhoneNumberxxx]", modeldata.Phone).Replace("[xxxBusinessNamexxx]", modeldata.Bname).Replace("[xxxAddressxxx]", modeldata.Address).Replace("[xxxContacttimexxx]", modeldata.ContactTime).Replace("[xxxPreferredtocontactbyxxx]", modeldata.PreferToContactBy);

            foreach (var item in spaEntity.Take(2))
            {
                SendEmail(item.contact_email, "Enquiry mail from Inkarn.", mailbody.Replace("[xxxSpaNamexxx]", item.name), true, modeldata.name);
            }
            mailbody = "Mail sample mail will be sent to email Ids";
            foreach (var item in spaEntity)
            {
                mailbody += item.contact_email + ", ";
            }
            SendEmail(Convert.ToString(ConfigurationManager.AppSettings["AdminEmailAddress"]), "Enquire Test Mail data", mailbody, true, "Inkarn");
        }

        [NonAction]
        public static string SendEmail(string toAddress, string subject, string body, bool IsBodyHtml, string MsgFrom)
        {
            string result = "Message Sent Successfully..!!";
            string senderID = Convert.ToString(ConfigurationManager.AppSettings["SmtpUserID"]);
            string senderPassword = Convert.ToString(ConfigurationManager.AppSettings["SmtpUserPassword"]);
            string Host = Convert.ToString(ConfigurationManager.AppSettings["SmtpHost"]);
            int Port = Convert.ToInt32(ConfigurationManager.AppSettings["SmtpPort"]);
            bool IsSslEnable = Convert.ToBoolean(ConfigurationManager.AppSettings["EnableSsl"]);
            try
            {
                SmtpClient smtp = new SmtpClient
                {
                    Host = Host,
                    Port = Port,
                    EnableSsl = IsSslEnable,
                    DeliveryMethod = SmtpDeliveryMethod.Network,
                    UseDefaultCredentials = false,
                    Credentials = new System.Net.NetworkCredential(senderID, senderPassword),
                    Timeout = 30000,
                };
                MailMessage message = new MailMessage(senderID, toAddress, subject, body);
                message.From = new MailAddress(senderID, MsgFrom);
                message.IsBodyHtml = IsBodyHtml;
                smtp.Send(message);
                smtp.Dispose();
            }
            catch (Exception ex)
            {
                Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                result = "Error sending email.!!!";
            }
            return result;
        }

        // GET: Search/Details/5
        public ActionResult Details(SearchModel objModel, long id, long subCatid)
        {
            int pageSize = 10;
            int pageNumber = 1;
            SearchReasult_VM objSearchResult = new SearchReasult_VM();
            objSearchResult.SearchParam = objModel;

            spaInfoResult_vm ObjspaDetail = new spaInfoResult_vm();
            var spDt_Qry = from a in db.spa_basic_info
                           join pr in db.spa_prices on new { id = a.id, ScatId = subCatid } equals new { id = pr.spa_id, ScatId = pr.cat_id }
                           join scat in db.CategeogySubCategories on pr.cat_id equals scat.id
                           join cat in db.CategeogySubCategories on scat.parentId equals cat.id
                           join cty in db.citys on a.cityId.Value equals cty.id
                           where a.id == id
                           select new { binfo = a, pri = pr, subCt = scat, ct = cat, cit = cty };
            var spDtObj = spDt_Qry.FirstOrDefault();
            ObjspaDetail.id = spDtObj.binfo.id;
            ObjspaDetail.name = spDtObj.binfo.name;
            ObjspaDetail.cityId = spDtObj.cit.id;
            ObjspaDetail.info_about = spDtObj.binfo.info_about;
            ObjspaDetail.website_url = spDtObj.binfo.website_url;
            ObjspaDetail.address = spDtObj.binfo.address;
            ObjspaDetail.is_active = spDtObj.binfo.is_active;
            ObjspaDetail.contact_name = spDtObj.binfo.contact_name;
            ObjspaDetail.contact_no = spDtObj.binfo.contact_no;
            ObjspaDetail.spa_price = spDtObj.pri.price;
            ObjspaDetail.categoryName = spDtObj.ct.name;
            ObjspaDetail.subCategoryName = spDtObj.subCt.name;
            ObjspaDetail.cityName = spDtObj.cit.name;
            ObjspaDetail.cityDescription = spDtObj.cit.description;
            ObjspaDetail.spaTiming = spDtObj.binfo.spa_time.ToList();
            ObjspaDetail.imgUrlLst = spDtObj.binfo.spa_images.Select(x => x.image_url).ToList();

            List<spaInfoResult_vm> totalLst = new List<spaInfoResult_vm>();
            totalLst.Add(ObjspaDetail);
            objSearchResult.SpaListWithPrice = totalLst.ToPagedList(pageNumber, pageSize);

            return View(objSearchResult);
        }

        // GET: Search/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Search/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Search/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Search/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Search/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Search/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
        //Func<TagBuilder, TagBuilder, TagBuilder>
        public static TagBuilder createanchorTag(TagBuilder li, TagBuilder a)
        {
            if (a.Attributes.ContainsKey("href"))
            {
                Uri uri;
                if (Uri.TryCreate("http://temp.org/" + a.Attributes["href"], UriKind.Absolute, out uri))
                {
                    var qs = uri.Query;
                    if (!string.IsNullOrWhiteSpace(qs))
                    {
                        var nvc = HttpUtility.ParseQueryString(qs);
                        String page = Convert.ToString(nvc["page"]);
                        if (page.ToLower().Trim() == "PREVIOUS".ToLower().Trim())
                        {
                            a.MergeAttribute("data-page-no", page);
                        }
                        else
                        {
                            a.MergeAttribute("data-page-no", page);
                        }
                    }
                }
            }
            else
            {
                int page;
                if (int.TryParse(a.InnerHtml, out page))
                    a.MergeAttribute("data-page", page.ToString());
            }
            li.InnerHtml = a.ToString();
            return li;
        }

    }

    public class NullPriceAtLast : IComparer<decimal?>
    {
        public int Compare(decimal? x, decimal? y)
        {
            if (y == null && x != null)
            {
                return -1;
            }
            else if (y != null && x == null)
            {
                return 1;
            }
            else if (x == 0 && y > 0)
            {
                return 1;
            }
            else if (x > 0 && y == 0)
            {
                return -1;
            }
            else
            {
                return Decimal.Compare(x.GetValueOrDefault(), y.GetValueOrDefault());
            }
        }
    }
}
