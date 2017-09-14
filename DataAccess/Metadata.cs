using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess
{
    public class cityMetadata
    {
        [Required(AllowEmptyStrings = false, ErrorMessage = "Please enter name")]
        public string name { get; set; }
    }

    public class CategeogySubCategoryMetadata
    {
        [Required(AllowEmptyStrings = false, ErrorMessage = "Please enter name")]
        public string name { get; set; }
    }
}
