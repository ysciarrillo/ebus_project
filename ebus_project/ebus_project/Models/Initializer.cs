using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace ebus_project.Models
{
    public class Initializer: DropCreateDatabaseIfModelChanges<ProductContext>
    {
        protected override void Seed(ProductContext context)
        {
            GetCategory().ForEach(c => context.Categories.Add(c));
            GetProduct().ForEach(p => context.Products.Add(p));
            
        }
        private static List<Category> GetCategory()
        {
            var category = new List<Category>
            {
                new Category()
                {
                   CId = 1,
                   CName = "Laptops",
                   CDescr = "Laptop PCs"
                }
            };
            return category;
        }
        private static List<Product> GetProduct()
        {
            var products = new List<Product>
            {
                new Product()
                {
                  PId = 1,
                  PBrand = "Lenovo",
                  PModel = "Z710",
                  PDescr = "Best laptop ever",
                  PRating = "100",
                  PYear = "2014",
                  CId = 1


                }
            };
            return products;
        }
    }
    
}