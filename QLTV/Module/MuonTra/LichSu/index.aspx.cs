using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.EntityFrameworkCore;
using QLTV.Data.Entity;
using QLTV.Data.Model;

namespace QLTV.Module.MuonTra.LichSu
{
    public partial class index : System.Web.UI.Page
    {
        private DBContext dbContext;
        private string pathApp;
        private string destinationFolder;
        private decimal money;

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
                setDropDownTinhTrang();

            }
        }
        private void setDropDownTinhTrang()
        {
            this.DropDownTinhTrang.Items.Clear();
            this.DropDownTinhTrang.Items.Add("Tất cả");
            this.DropDownTinhTrang.Items.Add("Bình thường");
            this.DropDownTinhTrang.Items.Add("Xấu");
            this.DropDownTinhTrang.Items.Add("Quá hạn");
            this.DropDownTinhTrang.Items.Add("Phải bồi thường hoàn toàn");
            this.DropDownTinhTrang.SelectedIndex = 0;
        }
        private void loadData(Dictionary<string, string> constraint)
        {
            int pageSize = GridViewLichSu.PageSize;
            int pageIndex = GridViewLichSu.PageIndex;
            var query = from BorrowTracking in dbContext.BorrowTracking
                        join BorrowRequest in dbContext.BorrowRequest on BorrowTracking.RequestId equals BorrowRequest.Id
                        join Reader in dbContext.Reader on BorrowRequest.ReaderId equals Reader.Id
                        join Book in dbContext.Book on BorrowRequest.BookId equals Book.Id
                        where BorrowRequest.Deleted == 0
                        where BorrowTracking.Deleted == 0
                        orderby BorrowRequest.UpdatedAt descending
                        select new { Book, BorrowRequest, Reader, BorrowTracking };
            if (constraint != null)
            {
                if (constraint.TryGetValue("cmt", out string cmt))
                    query = query.Where(data => data.Reader.IdentityCard.ToLower().Contains(cmt.ToLower()));
            }
            List<LSMuonShow> listData = query.Select(data => new LSMuonShow
            {
                Id = data.BorrowTracking.Id,
                Image = ResolveUrl("~/Resources/image/" + data.Book.Image),
                NameBook = data.Book.Name,
                NameReader = data.Reader.Name,
                IdentityCardReader = data.Reader.IdentityCard ?? "Trống",
                ReturnDate = data.BorrowTracking.ReturnDate,
                UpdatedAt = data.BorrowTracking.UpdatedAt,
                Price = data.Book.Price.ToString(),
                ReturnStatus = (int)data.BorrowTracking.ReturnStatus,
                FineAmount = data.BorrowTracking.FineAmound.ToString(),
                Deleted = data.BorrowTracking.Deleted
            }).ToList();

            DataTable dataTable = new DataTable();
            dataTable.Columns.Add("ID", typeof(string));
            dataTable.Columns.Add("Người mượn", typeof(string));
            dataTable.Columns.Add("ImageUrl", typeof(string)); // Store image URL as string
            dataTable.Columns.Add("Sách", typeof(string));
            dataTable.Columns.Add("Trạng thái trả sách", typeof(string));
            dataTable.Columns.Add("Ngày phải trả / Ngày trả", typeof(string));
            dataTable.Columns.Add("Số tiền phải trả", typeof(string));
            foreach (LSMuonShow lsm in listData)
            {
                string statusText;
                switch (lsm.ReturnStatus)
                {
                    case 0:
                        statusText = "Bình thường";
                        break;
                    case 1:
                        statusText = "Xấu";
                        break;
                    case 2:
                        statusText = "Quá hạn";
                        break;
                    case 3:
                        statusText = "Phải bồi thường hoàn toàn";
                        break;
                    default:
                        statusText = "Trạng thái không xác định";
                        break;
                }
                dataTable.Rows.Add(lsm.Id.ToString(), "Người mượn: " + lsm.NameReader + "\n" + "CMT: " + lsm.IdentityCardReader,
                     lsm.Image, "Sách: " + lsm.NameBook + "\nGiá: " + lsm.Price, statusText, "Ngày trả: " + lsm.ReturnDate.ToString("dd-MM-yyyy:mm") + "\nNgày phải trả: " + lsm.UpdatedAt.ToString("dd-MM-yyyy"), lsm.FineAmount);
            }
            GridViewLichSu.DataSource = dataTable;
            GridViewLichSu.DataBind();
        }
        public string getDrictoryApp()
        {
            string projectDirectory = AppDomain.CurrentDomain.BaseDirectory;

            return projectDirectory;
        }

        protected void TextBoxTen_TextChanged(object sender, EventArgs e)
        {
            var query = from BorrowTracking in dbContext.BorrowTracking
                        join BorrowRequest in dbContext.BorrowRequest on BorrowTracking.RequestId equals BorrowRequest.Id
                        join Reader in dbContext.Reader on BorrowRequest.ReaderId equals Reader.Id
                        join role in dbContext.RoleReader on Reader.RoleId equals role.Id
                        join Book in dbContext.Book on BorrowRequest.BookId equals Book.Id
                        where BorrowRequest.Deleted == 0
                        where BorrowTracking.Deleted == 0
                        where BorrowTracking.Id == Int16.Parse(TextBoxID.Text)
                        orderby BorrowRequest.UpdatedAt descending
                        select new { Book, BorrowRequest, Reader, BorrowTracking, role };
            var model = query.FirstOrDefault();
            DateTime duaDate = DateTime.Parse(this.TextBoxHanTra.Text);
            DateTime returnDate = DateTime.Parse(this.TextBoxNgayTra.Text);
            TimeSpan interval = returnDate - duaDate;
            int outDay = interval.Days;
            if (outDay > 0)
            {
                if (this.DropDownTinhTrang.SelectedIndex != 3)
                {
                    this.DropDownTinhTrang.SelectedIndex = 3;
                }

                this.money = (decimal)model.Book.Price * outDay * 10 / 100;

                this.TextBoxMoney.Text = this.money.ToString();

            }
            else
            {
                this.money = 0;
                this.TextBoxMoney.Text = "0";
            }
        }

        protected async void ButtonSua_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(this.TextBoxNgayTra.Text) ||
              string.IsNullOrEmpty(this.DropDownTinhTrang.SelectedIndex.ToString()))
            {
                System.Diagnostics.Trace.WriteLine(this.DropDownListChucVu.SelectedIndex);
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Bạn cần nhập đủ thông tin')", true);
            }
            else
            {
                BorrowTracking model = this.dbContext.BorrowTracking.FirstOrDefault(b => b.Id == Int16.Parse(this.TextBoxID.Text));
                model.ReturnDate = DateTime.Parse(this.TextBoxNgayTra.Text);
                model.ReturnStatus = DropDownTinhTrang.SelectedIndex - 1;
                model.FineAmound = decimal.Parse(TextBoxMoney.Text);
                try
                {
                    var query = dbContext.Reader.FirstOrDefault(b => b.Id == model.Id);
                    this.dbContext.Update(model);
                    await this.dbContext.SaveChangesAsync();
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Đã sửa thành công .')", true);
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
            TextBoxID.Text = "";
            TextBoxTen.Text = "";
            TextBoxNguoiMuon.Text = "";
            TextBoxGia.Text = "";
            TextBoxCmt.Text = "";
            DropDownListChucVu.SelectedItem.Text = "Tất cả";
            DropDownTinhTrang.SelectedIndex = 0;
            TextBoxSoSachDaMuon.Text = "";
            TextBoxSoSach.Text = "";
            TextBoxSoNgay.Text = "";
            TextBoxSoNgay1.Text = "";
            TextBoxHanTra.Text = "";
            TextBoxNgayTra.Text = "";
            TextBoxGia.Text = "";
            TextBoxMoney.Text = "";

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Dictionary<string, string> constraint = new Dictionary<string, string>();
            if (!string.IsNullOrEmpty(this.TextBoxSearch.Text)) constraint.Add("cmt", this.TextBoxSearch.Text);
            this.loadData(constraint);
        }
        private void setExistedDataAsync(int idBorrow)
        {
            var query = from BorrowTracking in dbContext.BorrowTracking
                        join BorrowRequest in dbContext.BorrowRequest on BorrowTracking.RequestId equals BorrowRequest.Id
                        join Reader in dbContext.Reader on BorrowRequest.ReaderId equals Reader.Id
                        join role in dbContext.RoleReader on Reader.RoleId equals role.Id
                        join Book in dbContext.Book on BorrowRequest.BookId equals Book.Id
                        where BorrowRequest.Deleted == 0
                        where BorrowTracking.Deleted == 0
                        where BorrowTracking.Id == idBorrow
                        orderby BorrowRequest.UpdatedAt descending
                        select new { Book, BorrowRequest, Reader, BorrowTracking, role };
            var model = query.FirstOrDefault();
            if (model != null)
            {
                TextBoxID.Text = model.BorrowTracking.Id.ToString();
                TextBoxTen.Text = model.Book.Name;
                TextBoxNguoiMuon.Text = model.Reader.Name;
                TextBoxGia.Text = model.Book.Price.ToString();
                TextBoxCmt.Text = model.Reader.IdentityCard.ToString();
                DropDownListChucVu.Items.Add(model.role.Name); ;
                DropDownListChucVu.SelectedItem.Text = model.role.Name;
                DropDownTinhTrang.SelectedIndex = (int)model.BorrowTracking.ReturnStatus + 1;
                ImageButtonBook.ImageUrl = ResolveUrl("~/Resources/image/" + model.Book.Image);
                TextBoxSoSach.Text = model.Reader.BorrowedTime.ToString();

                var resultTask = setBorrowedBookInMonth();

                resultTask.ContinueWith(t =>
                {
                    TextBoxSoSachDaMuon.Text = t.Result;
                });
                TextBoxSoNgay.Text = model.Reader.BorrowedTime.ToString();
                TextBoxSoNgay1.Text = model.Reader.BorrowedTime.ToString();
                TextBoxHanTra.Text = model.BorrowRequest.DueDate.ToString("yyyy-MM-ddTHH:mm");
                TextBoxNgayTra.Text = model.BorrowTracking.ReturnDate.ToString("yyyy-MM-ddTHH:mm");

                TextBoxTen.ReadOnly = true;
                TextBoxCmt.ReadOnly = true;
                TextBoxGia.ReadOnly = true;
                TextBoxSoNgay.ReadOnly = true;
                TextBoxSoSach.ReadOnly = true;
                TextBoxSoNgay1.ReadOnly = true;
                TextBoxSoSachDaMuon.ReadOnly = true;
                TextBoxNguoiMuon.ReadOnly = true;
                DropDownListChucVu.Enabled = false;
                TextBoxHanTra.ReadOnly = true;
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Không tồn tại độc giả .')", true);
            }

            if (this.DropDownTinhTrang.SelectedIndex == 1)
            {
                this.money = 0;
                this.TextBoxMoney.Text = this.money.ToString();
            }

            if (this.DropDownTinhTrang.SelectedIndex == 2) // xấu 
            {
                this.money = (decimal)model.Book.Price * 50 / 100;

                this.TextBoxMoney.Text = this.money.ToString();
            }
            if (this.DropDownTinhTrang.SelectedIndex == 3) // quá hạn
            {
                DateTime duaDate = DateTime.Parse(this.TextBoxHanTra.Text);
                DateTime returnDate = DateTime.Parse(this.TextBoxNgayTra.Text);
                TimeSpan interval = returnDate - duaDate;
                int outDay = interval.Days;
                if (outDay > 0)
                {
                    this.money = (decimal)model.Book.Price * outDay * 10 / 100;

                    this.TextBoxMoney.Text = this.money.ToString();

                }
                else
                {
                    this.money = 0;
                    this.TextBoxMoney.Text = "0";
                }

            }
            if (this.DropDownTinhTrang.SelectedIndex == 4) // phải bổi thường
            {

                this.money = (decimal)model.Book.Price;

                this.TextBoxMoney.Text = this.money.ToString();
            }
        }
        public async Task<string> setBorrowedBookInMonth()
        {
            var currentDate = DateTime.Now;

            // Lấy số lượng bản ghi trong bảng dbo.borrow_request
            // với điều kiện tháng và năm của cột updated_at bằng tháng và năm hiện tại
            var count = dbContext.BorrowRequest
                .Where(x => x.UpdatedAt.Month == currentDate.Month && x.UpdatedAt.Year == currentDate.Year)
                .Count();
            return count.ToString();


        }

        protected void GridViewSach_SelectedIndexChanged1(object sender, EventArgs e)
        {
            int idBorrow = Int16.Parse(this.GridViewLichSu.SelectedRow.Cells[1].Text);

            this.setExistedDataAsync(idBorrow);
        }
        protected void GridViewSach_PageIndexChanged(object sender, EventArgs e)
        {


        }
        protected void GridViewSach_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridViewLichSu.PageIndex = e.NewPageIndex;
            Dictionary<string, string> constraint = new Dictionary<string, string>();

            if (!string.IsNullOrEmpty(this.TextBoxSearch.Text))
            {
                constraint.Add("cmt", this.TextBoxSearch.Text);
            }

            loadData(constraint);
        }

        protected void DropDownTinhTrang_SelectedIndexChanged(object sender, EventArgs e)
        {
            var query = from BorrowTracking in dbContext.BorrowTracking
                        join BorrowRequest in dbContext.BorrowRequest on BorrowTracking.RequestId equals BorrowRequest.Id
                        join Reader in dbContext.Reader on BorrowRequest.ReaderId equals Reader.Id
                        join role in dbContext.RoleReader on Reader.RoleId equals role.Id
                        join Book in dbContext.Book on BorrowRequest.BookId equals Book.Id
                        where BorrowRequest.Deleted == 0
                        where BorrowTracking.Deleted == 0
                        where BorrowTracking.Id == Int16.Parse(TextBoxID.Text)
                        orderby BorrowRequest.UpdatedAt descending
                        select new { Book, BorrowRequest, Reader, BorrowTracking, role };
            var model = query.FirstOrDefault();
            if (this.DropDownTinhTrang.SelectedIndex == 1)
            {
                this.money = 0;
                this.TextBoxMoney.Text = this.money.ToString();
            }

            if (this.DropDownTinhTrang.SelectedIndex == 2) // xấu 
            {
                this.money = (decimal)model.Book.Price * 50 / 100;

                this.TextBoxMoney.Text = this.money.ToString();
            }
            if (this.DropDownTinhTrang.SelectedIndex == 3) // quá hạn
            {
                DateTime duaDate = DateTime.Parse(this.TextBoxHanTra.Text);
                DateTime returnDate = DateTime.Parse(this.TextBoxNgayTra.Text);
                TimeSpan interval = returnDate - duaDate;
                int outDay = interval.Days;
                if (outDay > 0)
                {
                    this.money = (decimal)model.Book.Price * outDay * 10 / 100;

                    this.TextBoxMoney.Text = this.money.ToString();

                }
                else
                {
                    this.money = 0;
                    this.TextBoxMoney.Text = "0";
                }

            }
            if (this.DropDownTinhTrang.SelectedIndex == 4) // phải bổi thường
            {

                this.money = (decimal)model.Book.Price;

                this.TextBoxMoney.Text = this.money.ToString();
            }


        }
    }
}