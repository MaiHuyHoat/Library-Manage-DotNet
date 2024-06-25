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
using QLTV.Library;
namespace QLTV.Module.BaoCao.SachItSuDung
{
    public partial class index : System.Web.UI.Page
    {
        private DBContext dbContext;
        protected void Page_Load(object sender, EventArgs e)
        {
            dbContext = new DBContext();
            this.loadData(null);
            if (!IsPostBack)
            {
                this.setDropDownListTacgia();
                this.setComboxTheLoai();
            }
    

        }
        private void loadData(Dictionary<string, string> constraint)
        {


            var query = $@"SELECT 
                    b.id,
                    b.image,
                    b.name AS book_name,
                    c.name AS category_name,
                    a.name AS author_name,
                    (SELECT COUNT(*) FROM dbo.borrow_request br WHERE br.book_id = b.id AND br.updated_at <= GETDATE() AND br.updated_at >= DATEADD(MONTH, -6, GETDATE())) AS SoLuotPhucVu
                FROM 
                    dbo.book b
                LEFT JOIN 
                    dbo.author a ON b.author_id = a.id
                LEFT JOIN 
                    dbo.category c ON b.category_id = c.id
                LEFT JOIN 
                    dbo.borrow_request br ON b.id = br.book_id
                WHERE 
                    1 = 1";

            if (constraint != null && constraint.Count() > 0)
            {
                if (constraint.TryGetValue("name", out string name))
                    query += $" AND LOWER(b.name) LIKE '%{name.ToLower()}%'";

                if (constraint.TryGetValue("authorName", out string authorName))
                    query += $" AND LOWER(a.name) LIKE '%{authorName.ToLower()}%'";

                if (constraint.TryGetValue("categoryName", out string categoryName))
                    query += $" AND LOWER(c.name) LIKE '%{categoryName.ToLower()}%'";


                // Thêm phần GROUP BY và HAVING vào cuối câu truy vấn SQL
                if (constraint.TryGetValue("BorrowRequestCount", out string BorrowRequestCount))
                {
                    query += @" GROUP BY  
                b.id,
                b.image,
                b.name ,
                c.name,
                a.name 
               HAVING 
          (SELECT COUNT(*) FROM dbo.borrow_request br WHERE br.book_id = b.id  AND br.updated_at <= GETDATE() AND br.updated_at >= DATEADD(MONTH, -6, GETDATE())) <= "+ int.Parse(BorrowRequestCount)+"";
                }
                else
                {
                    query += @" GROUP BY  
                b.id,
                b.image,
                b.name ,
                c.name,
                a.name 
                HAVING 
               (SELECT COUNT(*) FROM dbo.borrow_request br WHERE br.book_id = b.id  AND br.updated_at <= GETDATE() AND br.updated_at >= DATEADD(MONTH, -6, GETDATE()))<=5";
                }

            }
            else
            {
                query += @" GROUP BY  
                b.id,
                b.image,
                b.name ,
                c.name,
                a.name 
                HAVING 
               (SELECT COUNT(*) FROM dbo.borrow_request br WHERE br.book_id = b.id  AND br.updated_at <= GETDATE() AND br.updated_at >= DATEADD(MONTH, -6, GETDATE()))<=5";
            }

            List<SachItSuDungShow> listData = new List<SachItSuDungShow>();
            using (var command = dbContext.Database.GetDbConnection().CreateCommand())
            {
                command.CommandText = query;
                dbContext.Database.OpenConnection();
                try
                {
                    using (var reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            int id = reader.GetInt32(reader.GetOrdinal("id"));
                            string name = reader.GetString(reader.GetOrdinal("book_name"));
                            string image = ResolveUrl("~/Resources/image/" + reader.GetString(reader.GetOrdinal("image")));
                            string authorName = reader.GetString(reader.GetOrdinal("author_name"));
                            int borrowRequestCount = reader.GetInt32(reader.GetOrdinal("SoLuotPhucVu"));
                            string categoryName = reader.GetString(reader.GetOrdinal("category_name"));

                            listData.Add(new SachItSuDungShow(id, image, name, borrowRequestCount, categoryName, authorName));
                        }
                    }
                }
                catch (Exception ex) {
                    System.Diagnostics.Trace.WriteLine("sql query: "+query);
                    return;
                }
              
            }


            DataTable dataTable= new DataTable();   

            // Thêm các cột vào DataTable
            dataTable.Columns.Add("ID", typeof(string));
            dataTable.Columns.Add("ImageUrl", typeof(string)); // Cột ảnh
            dataTable.Columns.Add("Tên Sách", typeof(string));
            dataTable.Columns.Add("Thể loại", typeof(string));
            dataTable.Columns.Add("Tác giả", typeof(string));
            dataTable.Columns.Add("SL đã Phục vụ", typeof(string));

            foreach (SachItSuDungShow ss in listData)
            {
                // Đảm bảo rằng đường dẫn hình ảnh tồn tại trước khi thêm vào DataGridView
              

                    dataTable.Rows.Add(ss.Id.ToString(),
                       ss.PathImage
                        , ss.Name, ss.Category, ss.Author, ss.BorrowRequestCount);
                
            }
            this.GridViewData.DataSource = dataTable;
            this.GridViewData.DataBind();
        }
        private void setDropDownListTacgia()
        {
            this.DropDownListTacGia.Items.Clear();
            this.DropDownListTacGia.Items.Add("Tất cả");
            List<Author> authorList = dbContext.Author.ToList();

            foreach (Author author in authorList)
            {
                this.DropDownListTacGia.Items.Add(author.Name);
            }
            this.DropDownListTacGia.SelectedIndex = 0;
        }
        private void setComboxTheLoai()
        {
            this.DropDownListTheLoai.Items.Clear();
            this.DropDownListTheLoai.Items.Add("Tất cả");
            List<Category> categoryList = dbContext.Category.ToList();

            foreach (Category category in categoryList)
            {
                this.DropDownListTheLoai.Items.Add(category.Name);
            }
            this.DropDownListTheLoai.SelectedIndex = 0;
        }

        protected void ButtonExport_Click(object sender, EventArgs e)
        {
            Dictionary<string, string> constraint = new Dictionary<string, string>();

            if (this.DropDownListTacGia.SelectedIndex != 0) constraint.Add("authorName", this.DropDownListTacGia.SelectedItem.Text.ToString());
            if (this.DropDownListTheLoai.SelectedIndex != 0) constraint.Add("categoryName", this.DropDownListTheLoai.SelectedItem.Text.ToString());
            if (!string.IsNullOrEmpty(this.TextBoxTen.Text)) constraint.Add("name", this.TextBoxTen.Text);
            if (!string.IsNullOrEmpty(this.TextBoxCaiDatSoLuong.Text)) constraint.Add("BorrowRequestCount", this.TextBoxCaiDatSoLuong.Text);
            var query = $@"SELECT 
                    b.id,
                    b.image,
                    b.name AS book_name,
                    c.name AS category_name,
                    a.name AS author_name,
                    (SELECT COUNT(*) FROM dbo.borrow_request br WHERE br.book_id = b.id AND br.updated_at <= GETDATE() AND br.updated_at >= DATEADD(MONTH, -6, GETDATE())) AS SoLuotPhucVu
                FROM 
                    dbo.book b
                LEFT JOIN 
                    dbo.author a ON b.author_id = a.id
                LEFT JOIN 
                    dbo.category c ON b.category_id = c.id
                LEFT JOIN 
                    dbo.borrow_request br ON b.id = br.book_id
                WHERE 
                    1 = 1";

            if (constraint != null && constraint.Count() > 0)
            {
                if (constraint.TryGetValue("name", out string name))
                    query += $" AND LOWER(b.name) LIKE '%{name.ToLower()}%'";

                if (constraint.TryGetValue("authorName", out string authorName))
                    query += $" AND LOWER(a.name) LIKE '%{authorName.ToLower()}%'";

                if (constraint.TryGetValue("categoryName", out string categoryName))
                    query += $" AND LOWER(c.name) LIKE '%{categoryName.ToLower()}%'";


                // Thêm phần GROUP BY và HAVING vào cuối câu truy vấn SQL
                if (constraint.TryGetValue("BorrowRequestCount", out string BorrowRequestCount))
                {
                    query += @" GROUP BY  
                b.id,
                b.image,
                b.name ,
                c.name,
                a.name 
               HAVING 
                  (SELECT COUNT(*) FROM dbo.borrow_request br WHERE br.book_id = b.id  AND br.updated_at <= GETDATE() AND br.updated_at >= DATEADD(MONTH, -6, GETDATE())) <= " + int.Parse(BorrowRequestCount) + "";
                }
                else
                {
                    query += @" GROUP BY  
                b.id,
                b.image,
                b.name ,
                c.name,
                a.name 
                HAVING 
               (SELECT COUNT(*) FROM dbo.borrow_request br WHERE br.book_id = b.id  AND br.updated_at <= GETDATE() AND br.updated_at >= DATEADD(MONTH, -6, GETDATE()))<=5";
                }

            }
            else
            {
                query += @" GROUP BY  
                b.id,
                b.image,
                b.name ,
                c.name,
                a.name 
                HAVING 
               (SELECT COUNT(*) FROM dbo.borrow_request br WHERE br.book_id = b.id  AND br.updated_at <= GETDATE() AND br.updated_at >= DATEADD(MONTH, -6, GETDATE()))<=5";
            }

            List<SachItSuDungShow> listData = new List<SachItSuDungShow>();
            using (var command = dbContext.Database.GetDbConnection().CreateCommand())
            {
                command.CommandText = query;
                dbContext.Database.OpenConnection();
                using (var reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        int id = reader.GetInt32(reader.GetOrdinal("id"));
                        string name = reader.GetString(reader.GetOrdinal("book_name"));
                        string image = ResolveUrl("~/Resources/image/" + reader.GetString(reader.GetOrdinal("image")));
                        string authorName = reader.GetString(reader.GetOrdinal("author_name"));
                        int borrowRequestCount = reader.GetInt32(reader.GetOrdinal("SoLuotPhucVu"));
                        string categoryName = reader.GetString(reader.GetOrdinal("category_name"));

                        listData.Add(new SachItSuDungShow(id, image, name, borrowRequestCount, categoryName, authorName));
                    }
                }
            }
            List<SachItSuDungExportExcel> exportExcels = new List<SachItSuDungExportExcel>();
            exportExcels.Add(new SachItSuDungExportExcel("Id", "Tên", "Thể loại", "Tác giả", "Số lượng phục vụ"));
            foreach (SachItSuDungShow ss in listData)
            {

                exportExcels.Add(new SachItSuDungExportExcel(ss.Id.ToString(), ss.Name.ToString(), ss.Category, ss.Author, ss.BorrowRequestCount.ToString()));

            }
            try
            {
                string filePath = @"D:\SachItDuocSuDung.xlsx";
                ExcelExport<SachItSuDungExportExcel> excelExport = new ExcelExport<SachItSuDungExportExcel>(exportExcels, "Danh sách sách ít được sử dụng trong thư viện", filePath);


                //System.Diagnostics.Trace.WriteLine("so luong : " + exportData.Count);
                //return;

                // nếu đường dẫn null hoặc rỗng thì báo không hợp lệ và return hàm

                bool rs = excelExport.ToExcel();
                if (rs)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('Xuất dữ liệu ra Excel thành công!') ", true);
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('Lỗi : Không thể thực hiện được hành động !' ", true);
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Trace.WriteLine("error" + ex.Message);
            }
        }

        protected void ButtonTimKiem_Click(object sender, EventArgs e)
        {
            Dictionary<string, string> constraint = new Dictionary<string, string>();

            if (this.DropDownListTacGia.SelectedIndex != 0) constraint.Add("authorName", this.DropDownListTacGia.SelectedItem.Text.ToString());
            if (this.DropDownListTheLoai.SelectedIndex != 0) constraint.Add("categoryName", this.DropDownListTheLoai.SelectedItem.Text.ToString());
            if (!string.IsNullOrEmpty(this.TextBoxTen.Text)) constraint.Add("name", this.TextBoxTen.Text);
            if (!string.IsNullOrEmpty(this.TextBoxCaiDatSoLuong.Text)) constraint.Add("BorrowRequestCount", this.TextBoxCaiDatSoLuong.Text);
            this.loadData(constraint);
        }
    }
}