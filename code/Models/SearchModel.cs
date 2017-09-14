using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace code.Models
{
    public class SearchModel
    {
        public SelectList cityLst { get; set; }
        public Int64 SelectedcityId { get; set; }
        public SelectList CategoryLst { get; set; }
        public Int64 SelectedCateId { get; set; }
        public SelectList SubCategoryLst { get; set; }
        public Int64 SelectedSubCatId { get; set; }
        public SelectList PriceLst { get; set; }
        public Int64 SelectedPriceId { get; set; }
        public string zipCode { get; set; }
        public string KeyWord { get; set; }

        public string cityName { get; set; }
        public string CategoryName { get; set; }
        public string SubCategoryName { get; set; }
        public string PriceLevelName { get; set; }
        public string cityDescriptionName { get; set; }
        public long? spaId { get; set; }
        public string searchSubmit { get; set; }

        public NearbyZipCode nearbyZip { get; set; }
    }

    public class NearbyZipCode
    {
        public NearbyZipCode() {
            zip_codes = new List<string>();
        }

        public List<string> zip_codes { get; set; }
        public int error_code { get; set; }
        public string error_msg { get; set; }
    }
}