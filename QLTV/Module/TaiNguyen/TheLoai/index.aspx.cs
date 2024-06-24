using QLTV.Data.Entity;
using QLTV.Data.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLTV.Module.TaiNguyen.TheLoai
{
    public partial class index1 : System.Web.UI.Page
    {
        private DBContext dbContext;

        public index1()
        {
            dbContext = new DBContext();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            this.loadData(null);

        }
        private void loadData(Dictionary<string, string> constraint)
        {
            var query = from category in dbContext.Category
                        where category.Deleted == 0
                        select new { category };


            if (constraint != null)
            {
                if (constraint.TryGetValue("name", out string name))
                    query = query.Where(data => data.category.Name.ToLower().Contains(name.ToLower()));
            }


            List<TheLoaiShow> listData = query.Select(data => new TheLoaiShow
            {
                Id = data.category.Id,
                Name = data.category.Name
            }).ToList();

            DataTable dataTable = new DataTable();
            dataTable.Columns.Add("ID", typeof(string));
            dataTable.Columns.Add("Tên Thể loại", typeof(string));
            foreach (TheLoaiShow tgs in listData)
            {
                dataTable.Rows.Add(tgs.Id.ToString(), tgs.Name);
            }
            GridViewSach.DataSource = dataTable;
            GridViewSach.DataBind();
        }
        protected void ButtonThem_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(this.TextBoxID1.Text))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Bạn cần nhập đủ thông tin ')", true);
            }
            else
            {

                string tenTl = this.TextBoxID1.Text;
                Category model = new Category();
                model.Name = tenTl;

                try
                {


                    this.dbContext.Add(model);
                    this.dbContext.SaveChanges();
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Thêm thể loại thành công ')", true);
                    this.loadData(null);
                    ;
                }
                catch (Exception ex)
                {
                    System.Diagnostics.Trace.WriteLine("Lỗi : " + ex);
                }


            }
        }
        protected void GridViewSach_PageIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridViewSach_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridViewSach.PageIndex = e.NewPageIndex;
            Dictionary<string, string> constraint = new Dictionary<string, string>();

            if (!string.IsNullOrEmpty(this.SearchCategory.Text))
            {
                constraint.Add("name", this.SearchCategory.Text);
            }

            loadData(constraint);
        }



        protected void GridViewSach_SelectedIndexChanged(object sender, EventArgs e)
        {
            var query = from category in dbContext.Category
                        where category.Deleted == 0
                        select new { category };
            List<TheLoaiShow> listData = query.Select(data => new TheLoaiShow
            {
                Id = data.category.Id,
                Name = data.category.Name,
            }).ToList();
            if (GridViewSach.SelectedRow != null) // Check for selected row
            {
                int selectedId = Convert.ToInt32(GridViewSach.SelectedRow.Cells[1].Text); // Assuming ID is in the first column

                // No need for additional query or TextBoxTen validation (commented out)

                // Access data from listData based on selectedId (assuming you have populated listData before)
                TheLoaiShow selectedCategory = listData.FirstOrDefault(c => c.Id == selectedId);

                if (selectedCategory != null) // Check if a matching book is found
                {
                    TextBoxID0.Text = selectedCategory.Id.ToString();
                    TextBoxID1.Text = selectedCategory.Name;

                }

            }
        }
        protected void ButtonXoa_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(this.TextBoxID1.Text) || string.IsNullOrEmpty(TextBoxID0.Text))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Bạn cần nhập đủ thông tin ')", true);
            }
            else
            {

                try
                {
                    string tenTl = this.TextBoxID1.Text;
                    int idCategory = Int16.Parse(TextBoxID0.Text);


                    Category model = dbContext.Category.FirstOrDefault(a => a.Id == idCategory);
                    model.Deleted = 1;
                    dbContext.SaveChanges();
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Xoá thể loại thành công ')", true);
                    this.ButtonHuy_Click(sender, e);
                    this.loadData(null);
                }
                catch (Exception ex)
                {
                    System.Diagnostics.Trace.WriteLine("Lỗi : " + ex);
                }
            }
        }

        protected void ButtonHuy_Click(object sender, EventArgs e)
        {
            this.TextBoxID1.Text = "";
            TextBoxID0.Text = "";
        }

        protected void ButtonSua_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(this.TextBoxID1.Text) || string.IsNullOrEmpty(TextBoxID0.Text))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Bạn cần nhập đủ thông tin ')", true);
            }
            else
            {

                string tenTl = this.TextBoxID1.Text;
                int idCategory = Int16.Parse(TextBoxID0.Text.ToString());


                Category model = this.dbContext.Category.FirstOrDefault(b => b.Id == idCategory);
                model.Name = tenTl;
                try
                {


                    this.dbContext.SaveChanges();
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Sửa thể loại thành công ')", true);
                    this.ButtonHuy_Click(sender, e);
                    loadData(null);
                }
                catch (Exception ex)
                {
                    System.Diagnostics.Trace.WriteLine("Lỗi : " + ex);
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Dictionary<string, string> constraint = new Dictionary<string, string>();
            if (!string.IsNullOrEmpty(this.SearchCategory.Text)) constraint.Add("name", this.SearchCategory.Text);
            this.loadData(constraint);
        }

    }
}