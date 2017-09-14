using DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace code.Models
{
    public class SearchReasult_VM
    {
        public PagedList.IPagedList<spaInfoResult_vm> SpaListWithPrice { get; set; }
        public SearchModel SearchParam { get; set; }
        public string SpaIdForPriceReq { get; set; }
        public int TotalSpaForPriceReq { get; set; }
        public int totalCnt { get; set; }
    }

    public class getPricedata {
        public string name { get; set; }
        public string Email { get; set; }
        public string Bname { get; set; }
        public string Phone { get; set; }
        public string Address { get; set; }
        public string ContactTime { get; set; }
        public string PreferToContactBy { get; set; }
        public string SpaIdForPriceReq { get; set; }
        public string message { get; set; }
    }

    public class spaInfoResult_vm {
        public long id { get; set; }
        public string name { get; set; }
        public Nullable<long> cityId { get; set; }
        public string info_about { get; set; }
        public string website_url { get; set; }
        public string address { get; set; }
        public bool is_active { get; set; }
        public System.DateTime created_at { get; set; }
        public System.DateTime updated_at { get; set; }
        public string contact_name { get; set; }
        public string contact_email { get; set; }
        public string contact_no { get; set; }
        public decimal? spa_price { get; set; }
        public string spa_imgUrl { get; set; }

        public string categoryName { get; set; }
        public string subCategoryName { get; set; }
        public string cityName { get; set; }
        public string cityDescription { get; set; }
        public long SubCatId { get; set; }

        public List<string> imgUrlLst { get; set; }
        public List<spa_time> spaTiming { get; set; }
    }

    public class spaDetail
    {
        public long id { get; set; }
        public string name { get; set; }
        public Nullable<long> cityId { get; set; }
        public string info_about { get; set; }
        public string website_url { get; set; }
        public string address { get; set; }
        public bool is_active { get; set; }
        public System.DateTime created_at { get; set; }
        public System.DateTime updated_at { get; set; }
        public string contact_name { get; set; }
        public string contact_email { get; set; }
        public string contact_no { get; set; }
        public decimal spa_price { get; set; }
        public string spa_imgUrl { get; set; }

        public string categoryName { get; set; }
        public string subCategoryName { get; set; }
        public string cityName { get; set; }
        public string cityDescription { get; set; }

        public List<string> imgUrlLst { get; set; }
        public List<spa_time> spaTiming { get; set; }
    }
}