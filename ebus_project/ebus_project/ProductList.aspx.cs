using System;
using System.Collections.Generic;
using System.Data.Entity.Core.Common.CommandTrees;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;
using ebus_project.Models;

namespace ebus_project
{
    public partial class ProductList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            productList.SelectMethod = Request.Url.Query.Contains("search") ? "GetSearch" : "GetProducts";
        }

        protected void SearchBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ProductList.aspx?search=" + HttpUtility.UrlEncode(SearchText.Text));
        }
        public IQueryable<Product> GetProducts([QueryString("id")] int? categoryId)
        {
            var _db = new ProductContext();
            IQueryable<Product> query = _db.Products;
            if (categoryId.HasValue && categoryId > 0)
            {
                query = query.Where(p => p.CId == categoryId);
            }
            return query;
        }
        public IQueryable<Category> GetCategories()
        {
            var _db = new Models.ProductContext();
            IQueryable<Category> query = _db.Categories;
            return query;
        }
       
        public IQueryable<Product> GetSearch([QueryString("search")] string search)
        {
            
            var _db = new ProductContext();
            IQueryable<Product> query = _db.Products;
         
            query = query.Where(p => p.PModel.Contains(search) || p.PBrand.Contains(search) || p.PYear.Contains(search) || p.PRating.Contains(search));

            SearchNumber.Text = "Number of matches:" + query.Count();
            return query;
        }
       
    }
}