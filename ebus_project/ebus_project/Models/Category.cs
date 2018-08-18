using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ebus_project.Models
{
    public class Category
    {
        [ScaffoldColumn(false), Key]
        public int CId { get; set; }

        [Required, StringLength(100), Display(Name = "Category Name")]
        public string CName { get; set; }

        [Display(Name = "Category Description")]
        public string CDescr { get; set; }

        public virtual ICollection<Category> Categories { get; set; }
    }
}