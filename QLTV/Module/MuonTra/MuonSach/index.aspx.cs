using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using QLTV.Data.Entity;
using QLTV.Data.Model;
namespace QLTV.Module.MuonTra.MuonSach
{
    public partial class index : System.Web.UI.Page
    {
        private DBContext dbContext;
    
        private string pathApp;
        protected void Page_Load(object sender, EventArgs e)
        {
            dbContext = new DBContext();
            pathApp = this.getDrictoryApp();
            if (!IsPostBack) {
             
                this.loadData(null);
                this.setComboboxCreatedDate();
            }
        }
        public string getDrictoryApp()
        {
            string projectDirectory = AppDomain.CurrentDomain.BaseDirectory;

            return projectDirectory;
        }
        private void loadData(Dictionary<string, string> constraint)
        {
            var query = from BorrowRequest in dbContext.BorrowRequest
                        join Reader in dbContext.Reader on BorrowRequest.ReaderId equals Reader.Id
                        join Book in dbContext.Book on BorrowRequest.BookId equals Book.Id
                        where BorrowRequest.Deleted == 0
                        where BorrowRequest.Status == 0
                        orderby BorrowRequest.UpdatedAt descending
                        select new { Book, BorrowRequest, Reader };


            if (constraint != null)
            {
                if (constraint.TryGetValue("cmt", out string cmt))
                    query = query.Where(data => data.Reader.IdentityCard.ToLower().Contains(cmt.ToLower()));



                if (constraint.TryGetValue("updatedAt", out string updatedAt))
                {
                    if (updatedAt.Equals("asc", StringComparison.OrdinalIgnoreCase))
                        query = query.OrderByDescending(data => data.BorrowRequest.UpdatedAt);

                    if (updatedAt.Equals("desc", StringComparison.OrdinalIgnoreCase))
                        query = query.OrderBy(data => data.BorrowRequest.UpdatedAt);
                }
            }


            List<MuonSachShow> listData = query.Select(data => new MuonSachShow
            {
                Id = data.BorrowRequest.Id,
                Image = ResolveUrl("~/Resources/image/" + data.Book.Image),
                NameBook = data.Book.Name,
                NameReader = data.Reader.Name,
                IdentityCardReader = data.Reader.IdentityCard ?? "Trống",
                BorrowDate = data.BorrowRequest.UpdatedAt,
                DueDate = data.BorrowRequest.DueDate
            }).ToList();

            DataTable dataTable = new DataTable();
            dataTable.Columns.Add("ID", typeof(string));
            dataTable.Columns.Add("ImageUrl", typeof(string)); // Store image URL as string
            dataTable.Columns.Add("Tên Sách", typeof(string));
            dataTable.Columns.Add("Người mượn", typeof(string));
            dataTable.Columns.Add("Chứng minh thư", typeof(string));
            dataTable.Columns.Add("Ngày mượn", typeof(string));
            dataTable.Columns.Add("Hạn trả", typeof(string));
            dataTable.Rows.Clear();


            foreach (MuonSachShow ss in listData)
            {
                // Đảm bảo rằng đường dẫn hình ảnh tồn tại trước khi thêm vào GridView
               

                    dataTable.Rows.Add(ss.Id.ToString(),
                        ss.Image,
                        ss.NameBook, ss.NameReader, ss.IdentityCardReader, ss.BorrowDate.ToString("dd-MM-yyyy"), ss.DueDate.ToString("dd-MM-yyyy"));
                
            }
            GridViewData.DataSource = dataTable;
            GridViewData.DataBind();
        }
        private void setComboboxCreatedDate()
        {
            // set  combobox ngay tao
            this.DropDownListNgayTao.Items.Clear();
            this.DropDownListNgayTao.Items.Add("Mặc định ");
            this.DropDownListNgayTao.Items.Add("Tăng dần");
            this.DropDownListNgayTao.Items.Add("Giảm dần");
            this.DropDownListNgayTao.SelectedIndex = 0;

        }
        protected void ButtonTraCuu_Click(object sender, EventArgs e)
        {

        }

        protected void ButtonMuon_Click(object sender, EventArgs e)
        {

        }

        protected void ButtonTra_Click(object sender, EventArgs e)
        {

        }

       

        protected void ButtonTimKiem_Click(object sender, EventArgs e)
        {

        }
    }
}