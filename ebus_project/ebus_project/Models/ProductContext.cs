using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace ebus_project.Models
{
  
         public class ProductContext: DbContext
    {
         public ProductContext() : base("Ebus_Connection")
    {
    }
    public DbSet<Category> Categories { get; set; }
    public DbSet<Product> Products { get; set; }
    
    }
}