using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QLTV.Data.Entity;
using QLTV.Data.Model;
namespace QLTV.Module.TaiNguyen.TacGia
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
            dataTable.Columns.Add("Tên tác giả", typeof(string));
            foreach (TacGiaShow tgs in listData)
            {
                dataTable.Rows.Add(tgs.Id.ToString(), tgs.Name);
            }
            GridViewTacGia.DataSource = dataTable;
            GridViewTacGia.DataBind();
        }

        protected void ButtonThem_Click(object sender, EventArgs e)
        {
           
            if (string.IsNullOrEmpty(this.TextBoxTen.Text))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Bạn cần nhập đủ thông tin ')", true);
            }
            else
            {

                string tenTg = this.TextBoxTen.Text;
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

        protected void GridViewTacGia_SelectedIndexChanged(object sender, EventArgs e)
        {
            TextBoxID.Text = this.GridViewTacGia.SelectedRow.Cells[1].Text;
            TextBoxTen.Text = this.GridViewTacGia.SelectedRow.Cells[2].Text; 
        }

        protected  void ButtonSua_Click(object sender, EventArgs e)
        {
          
            if (string.IsNullOrEmpty(this.TextBoxTen.Text) || string.IsNullOrEmpty(TextBoxID.Text))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Bạn cần nhập đủ thông tin ')", true);
            }
            else
            {

                string tenTg = this.TextBoxTen.Text;
                int idAuthor = Int16.Parse(TextBoxID.Text.ToString());


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

        protected  void ButtonXoa_Click(object sender, EventArgs e)
        {
         
            if (string.IsNullOrEmpty(this.TextBoxTen.Text) || string.IsNullOrEmpty(TextBoxID.Text))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Bạn cần nhập đủ thông tin ')", true);
            }
            else
            {
      
                try
                {
                    string tenTg = this.TextBoxTen.Text;
                    int idAuthor = Int16.Parse(TextBoxID.Text);

                   
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

        protected void ButtonHuy_Click(object sender, EventArgs e)
        {
            this.TextBoxTen.Text = "";
            TextBoxID.Text = "";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(this.TextBoxSearch.Text) )
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Bạn cần nhập đủ thông tin ')", true);
            }
            else
            {

                try
                {
                   
                    Dictionary<string, string> constraint = new Dictionary<string, string>();
                    if (!string.IsNullOrEmpty(this.TextBoxSearch.Text)) constraint.Add("name", this.TextBoxSearch.Text);
                    this.loadData(constraint);
                   
                }
                catch (Exception ex)
                {
                    System.Diagnostics.Trace.WriteLine("Lỗi : " + ex);
                }
            }
        }
    }
}