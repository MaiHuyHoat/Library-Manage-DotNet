using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.EntityFrameworkCore;
using QLTV.Data.Entity;
using QLTV.Data.Model;

namespace QLTV.Module.TaiNguyen.Sach
{
    public partial class index : System.Web.UI.Page
    {
        private DBContext dbContext;
        private string pathApp;
        public index()
        {
            dbContext = new DBContext();
            pathApp = this.getDrictoryApp();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            this.loadData(null);
        }
        public string getDrictoryApp()
        {
            string projectDirectory = AppDomain.CurrentDomain.BaseDirectory;
            string[] words = projectDirectory.Split(new char[] { '\\' });
            Array.Resize(ref words, words.Length - 4);
            return string.Join("\\", words);
        }

        private void loadData(Dictionary<string, string> constraint)
        {

            var query = from book in dbContext.Book join category in dbContext.Category on book.CategoryId equals category.Id
                        join author in dbContext.Author on book.AuthorId equals author.Id
                        where book.Deleted == 0
                        select new { book, category, author };


            if (constraint != null)
            {
                if (constraint.TryGetValue("name", out string name))
                    query = query.Where(data => data.book.Name.ToLower().Contains(name.ToLower()));
            }


            List<SachShow> listData = query.Select(data => new SachShow
            {
                Id = data.book.Id,
                //PathImage = System.IO.Path.Combine(this.pathApp ?? this.getDrictoryApp(), "Resources", "image", data.book.Image),
                Name = data.book.Name,
                Amount = data.book.Amount,
                Category = data.category.Name ?? "Trống",
                Author = data.author.Name ?? "Trống",
                Price = data.book.Price.ToString(),
                CreatedDate = data.book.CreateDay.ToString("dd-MM-yyyy")
            }).ToList();

            DataTable dataTable = new DataTable();
            dataTable.Columns.Add("ID", typeof(string));
            //dataTable.Columns.Add("Ảnh", typeof(byte[]));
            dataTable.Columns.Add("Tên Sách", typeof(string));
            dataTable.Columns.Add("Tên Thể loại", typeof(string));
            dataTable.Columns.Add("Tên Tác giả", typeof(string));
            dataTable.Columns.Add("Tên Giá", typeof(string));
            dataTable.Columns.Add("Số lượng", typeof(string));
            dataTable.Columns.Add("Ngày tạo", typeof(string));
            foreach (SachShow ss in listData)
            {
                //string imagePath = System.IO.Path.Combine(this.pathApp ?? this.getDrictoryApp(), "Resources", "image", ss.Image);
                //byte[] imageData = null;
                //if (System.IO.File.Exists(imagePath))
                //{
                //    imageData = System.IO.File.ReadAllBytes(imagePath);
                //}

                dataTable.Rows.Add(ss.Id.ToString(), ss.Name, ss.Category, ss.Author, ss.Price, ss.Amount, ss.CreatedDate);
            }
            GridViewSach.DataSource = dataTable;
            GridViewSach.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void ButtonThem_Click(object sender, EventArgs e)
        {

        }

        protected void ButtonSua_Click(object sender, EventArgs e)
        {

        }

        protected void ButtonXoa_Click(object sender, EventArgs e)
        {

        }

        protected void ButtonHuy_Click(object sender, EventArgs e)
        {

        }

        protected void GridViewSach_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}