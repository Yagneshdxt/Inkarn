using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess
{
    [MetadataType(typeof(cityMetadata))]
    public partial class city
    {
    }

    [MetadataType(typeof(CategeogySubCategoryMetadata))]
    public partial class CategeogySubCategory { }
}
