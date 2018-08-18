using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;
using ebus_project.Models;

namespace ebus_project
{
    public partial class ProductDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public IQueryable<Product> GetProduct([QueryString("productID")] int? productId)
        {
            var _db = new ProductContext();
            IQueryable<Product> query = _db.Products;
            if (productId.HasValue && productId > 0)
            {
                query = query.Where(p => p.PId == productId);
            }
            else
            {
                query = null;
            }
            return query;
        }
        public IQueryable<Category> GetCategories()
        {
            var _db = new Models.ProductContext();
            IQueryable<Category> query = _db.Categories;
            return query;
        }

        protected void SearchBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ProductList.aspx?search=" + HttpUtility.UrlEncode(SearchText.Text));
        }
    }
}