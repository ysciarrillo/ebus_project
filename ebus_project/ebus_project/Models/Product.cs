using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ebus_project.Models
{
    public class Product
    {
        [ScaffoldColumn(false), Key]
        public int PId { get; set; }

        [Required, StringLength(100), Display(Name = "Product Brand")]
        public string PBrand { get; set; }

        [Required, StringLength(10000), Display(Name = "Product Description"), DataType(DataType.MultilineText)]
        public string PDescr { get; set; }

        public string PModel { get; set; }
        public string PImagePath { get; set; }

        public string PYear { get; set; }
        public string PRating { get; set; }

        public int? CId { get; set; }


        public virtual Category Category { get; set; }
    }
}