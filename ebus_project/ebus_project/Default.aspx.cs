using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.Configuration;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;
using ebus_project.Models;

namespace ebus_project
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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

        public IQueryable<Product> GetProducts()
        {
            var _db = new ProductContext();
            IQueryable<Product> query = _db.Products;

            int allEntries = query.Count();
            Random randomNm = new Random();
            var randomNumbers = Enumerable.Range(1, allEntries).OrderBy(i => randomNm.Next()).ToArray();
            

            var id1 = randomNumbers[1];
            var id2 = randomNumbers[2];
            var id3 = randomNumbers[3];
            var id4 = randomNumbers[4];
            
            query = query.Where(p => p.PId == id1 || p.PId == id2 || p.PId == id3 || p.PId == id4);
           
            return query;
        }
       
    }

}
