using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace DataAccess
{
    public class spa_VM
    {
        public spa_VM() {
            categoryLst = new List<Intcheckboxmodel>();
            Selectedprices = new List<Intcheckboxmodel>();
        }
        public spa_basic_info basic_info { get; set; }
        public List<spa_time> timings { get; set; }
        public List<spa_images> images { get; set; }
        public List<Intcheckboxmodel> categoryLst { get; set; }
        public List<Intcheckboxmodel> Selectedprices { get; set; }
    }

    public class spaListdispaly {
        public spa_basic_info basic_info { get; set; }
        public string spaCategoryName { get; set; }
        public string spaSubCategoryName { get; set; }
        public string spaDisplayImageUrl { get; set; }
    }

    public class Intcheckboxmodel {
        public long Id { get; set; }
        public string name { get; set; }
        public bool isChecked { get; set; }
        public string prices { get; set; }
    }
}
