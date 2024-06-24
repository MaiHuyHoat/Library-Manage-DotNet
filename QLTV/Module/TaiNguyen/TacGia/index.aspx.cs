using QLTV.Data.Entity;
using QLTV.Data.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLTV.Module.TaiNguyen.TacGia
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
            var query = from author in dbContext.Author
                        where author.Deleted == 0
                        select new { author };


            if (constraint != null)
            {
                if (constraint.TryGetValue("name", out string name))
                    query = query.Where(data => data.author.Name.ToLower().Contains(name.ToLower()));
            }


            List<TacGiaShow> listData = query.Select(data => new TacGiaShow
            {
                Id = data.author.Id,
                Name = data.author.Name
            }).ToList();

            DataTable dataTable = new DataTable();
            dataTable.Columns.Add("ID", typeof(string));
            dataTable.Columns.Add("Tên Tác Giả", typeof(string));
            foreach (TacGiaShow tgs in listData)
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

                string tenTg = this.TextBoxID1.Text;
                Author model = new Author();
                model.Name = tenTg;

                try
                {


                    this.dbContext.Add(model);
                    this.dbContext.SaveChanges();
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Thêm tác giả thành công ')", true);
                    this.loadData(null);
                    ;
                }
                catch (Exception ex)
                {
                    System.Diagnostics.Trace.WriteLine("Lỗi : " + ex);
                }


            }
        }

        protected void ButtonSua_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(this.TextBoxID1.Text) || string.IsNullOrEmpty(TextBoxID0.Text))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Bạn cần nhập đủ thông tin ')", true);
            }
            else
            {

                string tenTg = this.TextBoxID1.Text;
                int idAuthor = Int16.Parse(TextBoxID0.Text.ToString());


               Author model = this.dbContext.Author.FirstOrDefault(b => b.Id == idAuthor);
                model.Name = tenTg;
                try
                {


                    this.dbContext.SaveChanges();
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Sửa tác giả thành công ')", true);
                    this.ButtonHuy_Click(sender, e);
                    loadData(null);
                }
                catch (Exception ex)
                {
                    System.Diagnostics.Trace.WriteLine("Lỗi : " + ex);
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
                    string tenTg = this.TextBoxID1.Text;
                    int idAuthor = Int16.Parse(TextBoxID0.Text);


                    Author model = dbContext.Author.FirstOrDefault(a => a.Id == idAuthor);
                    model.Deleted = 1;
                    dbContext.SaveChanges();
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Xoá tác giả thành công ')", true);
                    this.ButtonHuy_Click(sender, e);
                    this.loadData(null);
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
            if (!string.IsNullOrEmpty(this.SearchAuthor.Text)) constraint.Add("name", this.SearchAuthor.Text);
            this.loadData(constraint);
        }

        protected void GridViewSach_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridViewSach.PageIndex = e.NewPageIndex;
            Dictionary<string, string> constraint = new Dictionary<string, string>();

            if (!string.IsNullOrEmpty(this.SearchAuthor.Text))
            {
                constraint.Add("name", this.SearchAuthor.Text);
            }

            loadData(constraint);
        }

        protected void GridViewSach_PageIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridViewSach_SelectedIndexChanged(object sender, EventArgs e)
        {
            var query = from author in dbContext.Author
                        where author.Deleted == 0
                        select new { author };
            List<TacGiaShow> listData = query.Select(data => new TacGiaShow
            {
                Id = data.author.Id,
                Name = data.author.Name,
            }).ToList();
            if (GridViewSach.SelectedRow != null) // Check for selected row
            {
                int selectedId = Convert.ToInt32(GridViewSach.SelectedRow.Cells[1].Text); // Assuming ID is in the first column

                // No need for additional query or TextBoxTen validation (commented out)

                // Access data from listData based on selectedId (assuming you have populated listData before)
                TacGiaShow selectedAuthor = listData.FirstOrDefault(c => c.Id == selectedId);

                if (selectedAuthor != null) // Check if a matching book is found
                {
                    TextBoxID0.Text = selectedAuthor.Id.ToString();
                    TextBoxID1.Text = selectedAuthor.Name;

                }

            }
        }

        protected void ButtonHuy_Click(object sender, EventArgs e)
        {
            this.TextBoxID1.Text = "";
            TextBoxID0.Text = "";
        }
    }
}