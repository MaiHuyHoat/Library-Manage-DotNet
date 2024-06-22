using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
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
        private string destinationFolder;
        public index()
        {
            dbContext = new DBContext();
            pathApp = this.getDrictoryApp();
        }
        protected void Page_Load(object sender, EventArgs e)
        {

            this.loadData(null);
            this.destinationFolder = Path.Combine(this.getDrictoryApp(), "Resources", "image");
            if (!IsPostBack)
            {
                setDropDownListTacGia();
                setComboxTheLoai();
                setComboxNhaXuatBan();
                setComboboxCreatedDate();
              
            }
            
        }
        public string getDrictoryApp()
        {
            string projectDirectory = AppDomain.CurrentDomain.BaseDirectory;
            
            return projectDirectory;
        }

        private void loadData(Dictionary<string, string> constraint)
        {
            int pageSize = GridViewSach.PageSize;
            int pageIndex = GridViewSach.PageIndex;
            var query = from book in dbContext.Book join category in dbContext.Category on book.CategoryId equals category.Id
                        join author in dbContext.Author on book.AuthorId equals author.Id
                        where book.Deleted == 0
                        select new { book, category, author };


            if (constraint != null)
            {
                if (constraint.TryGetValue("name", out string name))
                    query = query.Where(data => data.book.Name.ToLower().Contains(name.ToLower()));
              
                    
            }
            int totalRecord= query.Count();
            // Apply pagination using Skip and Take
             //query = query.Skip(pageIndex * pageSize).Take(pageSize);

            List<SachShow> listData = query.Select(data => new SachShow
            {
                Id = data.book.Id,
                PathImage = ResolveUrl("~/Resources/image/" + data.book.Image),
                Name = data.book.Name,
                Amount = data.book.Amount,
                Category = data.category.Name ?? "Trống",
                Author = data.author.Name ?? "Trống",
                Price = data.book.Price.ToString(),
                CreatedDate = data.book.CreateDay.ToString("dd-MM-yyyy HH:mm:ss")
            }).ToList();

            DataTable dataTable = new DataTable();
            dataTable.Columns.Add("ID", typeof(string));
            dataTable.Columns.Add("ImageUrl", typeof(string)); // Store image URL as string
            dataTable.Columns.Add("Tên Sách", typeof(string));
            dataTable.Columns.Add("Tên Thể loại", typeof(string));
            dataTable.Columns.Add("Tên Tác giả", typeof(string));
            dataTable.Columns.Add("Đơn Giá", typeof(string));
            dataTable.Columns.Add("Số lượng", typeof(string));
            dataTable.Columns.Add("Ngày tạo", typeof(string));
            foreach (SachShow ss in listData)
            {
       
              
                dataTable.Rows.Add(ss.Id.ToString(),
                     ss.PathImage
                    , ss.Name, ss.Category, ss.Author, ss.Price, ss.Amount, ss.CreatedDate);
            }
            GridViewSach.DataSource = dataTable;
            GridViewSach.DataBind();
            //GridViewSach.PagerSettings.Visible = totalRecord / 10 > 1;
        }
        private void setDropDownListTacGia()
        {
            this.DropDownListTacGia.Items.Clear();
            this.DropDownListTacGia.Items.Add("Tất cả");

            this.DropDownListTacGiaDS.Items.Clear();
            this.DropDownListTacGiaDS.Items.Add("Tất cả");
            List<Author> authorList = dbContext.Author.ToList();

            foreach (Author author in authorList)
            {
                this.DropDownListTacGia.Items.Add(author.Name);
                this.DropDownListTacGiaDS.Items.Add(author.Name);
            }
            this.DropDownListTacGiaDS.SelectedIndex = 0;
            this.DropDownListTacGiaDS.SelectedIndex = 0;
        }
        private void setComboxTheLoai()
        {
            this.DropDownListTheLoai.Items.Clear();
            this.DropDownListTheLoai.Items.Add("Tất cả");

            this.DropDownListTheLoaiDS.Items.Clear();
            this.DropDownListTheLoaiDS.Items.Add("Tất cả");

            List<Category> categoryList = dbContext.Category.ToList();

            foreach (Category category in categoryList)
            {
                this.DropDownListTheLoai.Items.Add(category.Name);
                this.DropDownListTheLoaiDS.Items.Add(category.Name);
            }
            this.DropDownListTheLoai.SelectedIndex = 0;
            this.DropDownListTheLoaiDS.SelectedIndex = 0;
        }
        private void setComboxNhaXuatBan()
        {
            this.DropDownListNhaXuatBan.Items.Clear();
            this.DropDownListNhaXuatBan.Items.Add("Chọn nhà xuất bản ");

            List<Publisher> list = dbContext.Publisher.ToList();

            foreach (Publisher item in list)
            {
                this.DropDownListNhaXuatBan.Items.Add(item.Name);
            }
            this.DropDownListNhaXuatBan.SelectedIndex = 0;
        }
        private void setComboboxCreatedDate()
        {
            // set  combobox ngay tao
            this.DropDownListNgayTaoDS.Items.Clear();
            this.DropDownListNgayTaoDS.Items.Add("Mặc định ");
            this.DropDownListNgayTaoDS.Items.Add("Tăng dần");
            this.DropDownListNgayTaoDS.Items.Add("Giảm dần");
            this.DropDownListNgayTaoDS.SelectedIndex = 0;

        }
        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected async void ButtonThem_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(this.TextBoxTen.Text) 
                ||
               string.IsNullOrEmpty(this.TextBoxSoLuong.Text)
               ||
               string.IsNullOrEmpty(this.TextBoxSoTrang.Text)
               ||

               this.DropDownListTheLoai.SelectedIndex == 0
               ||
               this.DropDownListNhaXuatBan.SelectedIndex == 0
               ||
               this.DropDownListTacGia.SelectedIndex == 0

               )
            {
                
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Bạn cần nhập đủ thông tin')", true);
            }
            else
            {


                
                try
                {
                    Book model = new Book();
                    model.Name = this.TextBoxTen.Text;
                    System.Diagnostics.Trace.WriteLine(TextBoxTen.Text);
                   
                    model.Amount = int.Parse(this.TextBoxSoLuong.Text);
                    model.Price = decimal.Parse(this.TextBoxGia.Text);
                    model.NumberOffPages = int.Parse(this.TextBoxSoTrang.Text);

                    model.CreateDay = DateTime.Now;
                    model.Image = this.FileUploadImage.FileName;
                    String publisherName= this.DropDownListNhaXuatBan.SelectedItem.ToString();
                    model.PublisherId = dbContext.Publisher.Where(p=>p.Name.Equals(publisherName, StringComparison.OrdinalIgnoreCase)).Select(p=>p.Id).FirstOrDefault();
                    String authorName= this.DropDownListTacGia.SelectedItem.ToString(); 
                    model.AuthorId = dbContext.Author.Where(a=>a.Name.Equals(authorName,StringComparison.OrdinalIgnoreCase)).Select(a=>a.Id).FirstOrDefault();
                 
                    string categoryName=this.DropDownListTheLoai.SelectedItem.ToString();   
                    model.CategoryId = dbContext.Category.Where(c => c.Name.Equals(categoryName, StringComparison.OrdinalIgnoreCase)).Select(c => c.Id).FirstOrDefault();
                    model.PublicationYear = DateTime.Now;
                  
               
                    string destinationPath = Path.Combine(this.destinationFolder, model.Image);
                    this.FileUploadImage.SaveAs(destinationPath);
                    
                    this.dbContext.Add(model);
                    await this.dbContext.SaveChangesAsync();
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Đã thêm sách thành công')", true);
                    this.loadData(null);
                }
                catch (Exception ex)
                {
                    System.Diagnostics.Trace.WriteLine("Lỗi : " + ex);
                }

            }
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

        protected void GridViewSach_PageIndexChanged(object sender, EventArgs e)
        {
            

        }

        protected void GridViewSach_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridViewSach.PageIndex = e.NewPageIndex;
            Dictionary<string, string> constraint = new Dictionary< string, string>();

            if (!string.IsNullOrEmpty(this.TextBoxSearch.Text))
            {
                constraint.Add("name", this.TextBoxSearch.Text);
            }

            loadData(constraint);
        }

        protected void GridViewSach_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {

        }

        protected void TextBoxTen_TextChanged(object sender, EventArgs e)
        {

        }
    }
}