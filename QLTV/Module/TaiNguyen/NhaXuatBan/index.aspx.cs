using QLTV.Data.Entity;
using QLTV.Data.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLTV.Module.TaiNguyen.NhaXuatBan
{
    public partial class index : System.Web.UI.Page
    {
        private DBContext dbContext;
        public index()
        {
            dbContext = new DBContext();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            this.loadData(null);
        }
        private void loadData(Dictionary<string, string> constraint)
        {
            var query = from publisher in dbContext.Publisher
                        where publisher.Deleted == 0
                        select new { publisher };


            if (constraint != null)
            {
                if (constraint.TryGetValue("name", out string name))
                    query = query.Where(data => data.publisher.Name.ToLower().Contains(name.ToLower()));
            }


            List<NhaXuatBanShow> listData = query.Select(data => new NhaXuatBanShow
            {
                Id = data.publisher.Id,
                Name = data.publisher.Name
            }).ToList();

            DataTable dataTable = new DataTable();
            dataTable.Columns.Add("ID", typeof(string));
            dataTable.Columns.Add("Tên Nhà Xuất Bản", typeof(string));
            foreach (NhaXuatBanShow tgs in listData)
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

                string tenNxb = this.TextBoxID1.Text;
                Publisher model = new Publisher();
                model.Name = tenNxb;

                try
                {


                    this.dbContext.Add(model);
                    this.dbContext.SaveChanges();
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Thêm nhà xuất bản thành công ')", true);
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

        }

        protected void GridViewSach_SelectedIndexChanged(object sender, EventArgs e)
        {
            var query = from publisher in dbContext.Publisher
                        where publisher.Deleted == 0
                        select new { publisher };
            List<NhaXuatBanShow> listData = query.Select(data => new NhaXuatBanShow
            {
                Id = data.publisher.Id,
                Name = data.publisher.Name,
            }).ToList();
            if (GridViewSach.SelectedRow != null) // Check for selected row
            {
                int selectedId = Convert.ToInt32(GridViewSach.SelectedRow.Cells[1].Text); // Assuming ID is in the first column

                // No need for additional query or TextBoxTen validation (commented out)

                // Access data from listData based on selectedId (assuming you have populated listData before)
                NhaXuatBanShow selectedPublisher = listData.FirstOrDefault(c => c.Id == selectedId);

                if (selectedPublisher != null) // Check if a matching book is found
                {
                    TextBoxID0.Text = selectedPublisher.Id.ToString();
                    TextBoxID1.Text = selectedPublisher.Name;

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
                    string tenNxb = this.TextBoxID1.Text;
                    int idPublisher = Int16.Parse(TextBoxID0.Text);


                    Publisher model = dbContext.Publisher.FirstOrDefault(a => a.Id == idPublisher);
                    model.Deleted = 1;
                    dbContext.SaveChanges();
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Xoá nhà xuất bản thành công ')", true);
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

                string tenNxb = this.TextBoxID1.Text;
                int idPublisher = Int16.Parse(TextBoxID0.Text.ToString());


                Publisher model = this.dbContext.Publisher.FirstOrDefault(b => b.Id == idPublisher);
                model.Name = tenNxb;
                try
                {


                    this.dbContext.SaveChanges();
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Sửa nhà xuất bản thành công ')", true);
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
            if (!string.IsNullOrEmpty(this.TextBox1.Text)) constraint.Add("name", this.TextBox1.Text);
            this.loadData(constraint);
        }
    }
}