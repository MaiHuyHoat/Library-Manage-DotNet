using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
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
        private decimal money;

      
        protected void Page_Load(object sender, EventArgs e)
        {
            dbContext = new DBContext();
            pathApp = this.getDrictoryApp();
            if (!IsPostBack) {
             
                this.loadData(null);
                this.setDropDownListCreatedDate();
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
                DueDate = data.BorrowRequest.DueDate,
              
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
                        ss.NameBook, ss.NameReader, ss.IdentityCardReader, ss.BorrowDate.ToString("dd-MM-yyyy HH:mm:ss"), ss.DueDate.ToString("dd-MM-yyyy HH:mm:ss"));
                
            }
            GridViewData.DataSource = dataTable;
            GridViewData.DataBind();
        }
        private void setDropDownListCreatedDate()
        {
            // set  DropDownList ngay tao
            this.DropDownListNgayTao.Items.Clear();
            this.DropDownListNgayTao.Items.Add("Mặc định ");
            this.DropDownListNgayTao.Items.Add("Tăng dần");
            this.DropDownListNgayTao.Items.Add("Giảm dần");
            this.DropDownListNgayTao.SelectedIndex = 0;

        }
        protected void ButtonTraCuu_Click(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrEmpty(TextBoxCMT.Text))
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Mã độc giả tra không được trống ')", true);

                }
                else
                {
                    string cmt = TextBoxCMT.Text.Trim();
                    this.setExistedDataReader(cmt);
                }
                if (string.IsNullOrEmpty(TextBoxMaSach.Text))
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Mã sách tra không được trống !')", true);

                }
                else
                {
                    int maSach = int.Parse(TextBoxMaSach.Text);
                    this.setExistedDataSach(maSach);
                }
            }
            catch (Exception ex) { 
            
            System.Diagnostics.Trace.WriteLine("error: "+ex.ToString());
            }
        }
        private void setNullInput()
        {
            TextBoxIDBowrow.Text = null;
            TextBoxDueDate.Text = null;
            DropDownListTinhTrangTraSach.SelectedIndex = 0;
            TextBoxReturnDate.Text = null;
            TextBoxTienBoiThuong.Text = null;   
            // Data reader

            // Set các giá trị của TextBox về null và enable = true
            TextBoxIDReader.Text = null;
            TextBoxTenDocGia.Text = null;
            TextBoxCMT.Text = null;
            TextBoxSoNgay.Text = null;
            TextBoxSoNgay2.Text = null;
            TextBoxSoSach.Text = null;
            TextBoxSoSachDaMuon.Text = null;
            TextBoxNgayTao.Text = null;
            TextBoxNgayHetHan.Text = null;

            TextBoxSoNgay.Enabled = true;
            TextBoxSoSach.Enabled = true;
            TextBoxSoNgay2.Enabled = true;
            TextBoxSoSachDaMuon.Enabled = true;
            TextBoxTenDocGia.Enabled = true;
            TextBoxCMT.Enabled = true;
            TextBoxIDReader.Enabled = true;

            TextBoxNgayTao.Enabled = true;
            TextBoxNgayHetHan.Enabled = true;

            // Xóa các mục của DropDownList và enable = true
            DropDownListChucVu.Items.Clear();
            DropDownListChucVu.Enabled = true;
            // Set data book 
            // Set các giá trị của TextBox về null và enable = true
            TextBoxMaSach.Text = null;
            TextBoxTenSach.Text = null;
            TextBoxGia.Text = null;
            TextBoxNgayTao.Text = null;
            TextBoxNgayXuatBan.Text = null;

            // Enable các TextBox
            TextBoxMaSach.Enabled = true;
            TextBoxTenSach.Enabled = true;
            TextBoxGia.Enabled = true;
            TextBoxNgayTao.Enabled = true;
            TextBoxNgayXuatBan.Enabled = true;

            // Clear các mục của DropDownList và enable = true
            DropDownListNhaXuatBan.Items.Clear();
            DropDownListNhaXuatBan.Enabled = true;

            DropDownListTacGia.Items.Clear();
            DropDownListTacGia.Enabled = true;

            DropDownListTheLoai.Items.Clear();
            DropDownListTheLoai.Enabled = true;

            // Xóa hình ảnh của ImageButton
            ImageButtonBook.ImageUrl = ResolveUrl("~/Resources/image/book.png");

       


        }
        private async void setExistedDataReader(string cmt)
        {
            var query = from reader in dbContext.Reader
                        join role in dbContext.RoleReader on reader.RoleId equals role.Id
                        where reader.IdentityCard.Trim() == cmt
                        select new { reader, role };
            var model = query.FirstOrDefault();
            if (model != null)
            {
                TextBoxIDReader.Text = model.reader.Id.ToString();
                TextBoxTenDocGia.Text = model.reader.Name;

                TextBoxCMT.Text = model.reader.IdentityCard.ToString();



                TextBoxSoNgay.Text = model.reader.BorrowedTime.ToString();
                TextBoxSoNgay2.Text = model.reader.BorrowedTime.ToString();
                TextBoxSoSach.Text = model.reader.BorrowedTime.ToString();





                TextBoxSoSachDaMuon.Text = await this.setBorrowedBookInMonth();
                DropDownListChucVu.Items.Clear();
                DropDownListChucVu.Items.Add(model.role.Name);
                DropDownListChucVu.ClearSelection();
                DropDownListChucVu.Items.FindByText(model.role.Name).Selected = true ; 
                
    



                TextBoxNgayTao.Text = model.reader.StartDay.ToString("yyyy-MM-ddTHH:mm")    ;
                TextBoxNgayHetHan.Text = model.reader.EndDay.ToString("yyyy-MM-ddTHH:mm");

               

                TextBoxSoNgay. Enabled = false;
                TextBoxSoSach. Enabled = false;
                TextBoxSoNgay2. Enabled = false;
                TextBoxSoSachDaMuon. Enabled = false;
                TextBoxTenDocGia. Enabled = false;
           


                DropDownListChucVu.Enabled = false;
                TextBoxNgayHetHan.Enabled = false;

                TextBoxNgayTao.Enabled = false;
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Mã sách tra không được trống !')", true);
           
                TextBoxCMT.Text = null;
            }
        }
        async public Task<string> setBorrowedBookInMonth()
        {
            var currentDate = DateTime.Now;

            // Lấy số lượng bản ghi trong bảng dbo.borrow_request
            // với điều kiện tháng và năm của cột updated_at bằng tháng và năm hiện tại
            var count = dbContext.BorrowRequest
                .Where(x => x.UpdatedAt.Month == currentDate.Month && x.UpdatedAt.Year == currentDate.Year)
                .Count();
            return count.ToString();
        }
      
        private void setExistedDataSach(int idBook)
        {
            System.Diagnostics.Trace.WriteLine("id book : " + idBook);
            var query = from book in dbContext.Book
                        join category in dbContext.Category on book.CategoryId equals category.Id
                        join author in dbContext.Author on book.AuthorId equals author.Id
                        join publisher in dbContext.Publisher on book.PublisherId equals publisher.Id

                        where book.Id == idBook

                        select new { book, category, author, publisher };
            var model = query.FirstOrDefault();
            if (model != null)
            {
                //this.idBook = model.book.Id;
                TextBoxMaSach.Text = model.book.Id.ToString();
                TextBoxTenSach.Text = model.book.Name;

                TextBoxGia.Text = model.book.Price.ToString();



                // Clear existing items, add the specified item, and select it for DropDownListNhaXuatBan
                DropDownListNhaXuatBan.Items.Clear();
                DropDownListNhaXuatBan.Items.Add(model.publisher.Name);
                DropDownListNhaXuatBan.ClearSelection();
                DropDownListNhaXuatBan.Items.FindByText(model.publisher.Name).Selected = true;

                // Clear existing items, add the specified item, and select it for DropDownListTacGia
                DropDownListTacGia.Items.Clear();
                DropDownListTacGia.Items.Add(model.author.Name);
                DropDownListTacGia.ClearSelection();
                DropDownListTacGia.Items.FindByText(model.author.Name).Selected = true;

                // Clear existing items, add the specified item, and select it for DropDownListTheLoai
                DropDownListTheLoai.Items.Clear();
                DropDownListTheLoai.Items.Add(model.category.Name);
                DropDownListTheLoai.ClearSelection();
                DropDownListTheLoai.Items.FindByText(model.category.Name).Selected = true;



                TextBoxNgayTao.Text = model.book.CreateDay.ToString("yyyy-MM-ddTHH:mm");

                TextBoxNgayXuatBan.Text = model.book.PublicationYear.ToString("yyyy-MM-ddTHH:mm");

                //string path = System.IO.Path.Combine(this.pathApp ?? this.getDrictoryApp(), "Resources", "image", model.book.Image);
                //if (!File.Exists(path))
                //{
                //    path = System.IO.Path.Combine(this.pathApp ?? this.getDrictoryApp(), "Resources", "image", "book.png");
                //}

                //Image image = Image.FromFile(path);
                //pictureBoxAnh.Image = image;
                //pictureBoxAnh.SizeMode = PictureBoxSizeMode.Zoom;

                ImageButtonBook.ImageUrl = ResolveUrl("~/Resources/image/" + model.book.Image);

                System.Diagnostics.Trace.WriteLine(ResolveUrl("~/Resources/image/" + model.book.Image));
                
               

                DropDownListNhaXuatBan.Enabled = false;
                DropDownListTacGia.Enabled = false;
                DropDownListTheLoai.Enabled = false;
                TextBoxNgayXuatBan.Enabled = false;
                TextBoxNgayTao.Enabled = false;
                TextBoxGia.Enabled = false;
                TextBoxTenSach.Enabled = false;
               
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Không tìm thấy thông tin sách với mã trên !')", true);
           
                TextBoxMaSach.Text = null;
            }
        }
        protected async void ButtonMuon_Click(object sender, EventArgs e)
        {
            TextBoxCheDo.Text = "muon";
            LabelCheDo.Text = "Mượn sách";
            LabelTienBoiThuong.Visible= false;
            TextBoxTienBoiThuong.Visible = false;
            LabelDong.Visible = false;
            LabelReturnDate.Visible = false;
            TextBoxReturnDate.Visible = false;
            ButtonTraCuu.Visible = true;
            LabelTinhTrangTraSach.Visible = false;
            DropDownListTinhTrangTraSach.Visible=false;

        }

        protected void ButtonTra_Click(object sender, EventArgs e)
        {
            TextBoxCheDo.Text = "tra";
            LabelCheDo.Text = "Trả sách";
            LabelTienBoiThuong.Visible = true;
            TextBoxTienBoiThuong.Visible = true;
            LabelDong.Visible = true;
            LabelReturnDate.Visible = true;
            TextBoxReturnDate.Visible = true;
            ButtonTraCuu.Visible = false;
            LabelTinhTrangTraSach.Visible = true;
            DropDownListTinhTrangTraSach.Visible = true;
        }

       

        protected void ButtonTimKiem_Click(object sender, EventArgs e)
        {
            Dictionary<string, string> constraint = new Dictionary<string, string>();
            if (this.DropDownListNgayTao.SelectedIndex != 0)
            {
                if (this.DropDownListNgayTao.SelectedIndex == 1) constraint.Add("updatedAt", "desc");
                if (this.DropDownListNgayTao.SelectedIndex == 2) constraint.Add("updatedAt", "asc");
            }

            if (!string.IsNullOrEmpty(this.TextBoxCMTDS.Text)) constraint.Add("cmt", this.TextBoxCMTDS.Text);
            this.loadData(constraint);
        }

        protected void GridViewData_SelectedIndexChanged(object sender, EventArgs e)
        {
            var id = Int16.Parse(this.GridViewData.SelectedRow.Cells[1].Text);
            var query = from BorrowRequest in dbContext.BorrowRequest
                        join Reader in dbContext.Reader on BorrowRequest.ReaderId equals Reader.Id
                        join Book in dbContext.Book on BorrowRequest.BookId equals Book.Id
                        where BorrowRequest.Id == id
                        select new { Reader, BorrowRequest, Book };
            var model = query.FirstOrDefault();
            if (model != null)
            {
                this.TextBoxIDBowrow.Text = model.BorrowRequest.Id.ToString();
                this.setExistedDataSach(model.Book.Id);
                Reader reader = dbContext.Reader.FirstOrDefault(r => r.Id == model.Reader.Id);
                this.setExistedDataReader(reader.IdentityCard);
                this.TextBoxDueDate.Text = model.BorrowRequest.DueDate.ToString("yyyy-MM-ddTHH:mm"); 
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Không tìm thấy thông tin sách!')", true);
            }
        }

        protected async void Button1_Click(object sender, EventArgs e)
        {
            bool cheDo= TextBoxCheDo.Text=="muon"? true: false;
            if (cheDo) {
                //chế độ mượn
                if (string.IsNullOrEmpty(TextBoxMaSach.Text) ||
                   string.IsNullOrEmpty(TextBoxCMT.Text)
                   )
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Không được thiếu thông tin độc giả vả thông tin sách!')", true);
                    return;
                }
                if (int.Parse(TextBoxSoSachDaMuon.Text) >= int.Parse(TextBoxSoSach.Text))
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Độc giả đã mượn sách quá số lần quy định !')", true);

                    return;
                }
                BorrowRequest br = new BorrowRequest();
                br.UpdatedAt = DateTime.Now;
                br.DueDate = DateTime.Parse(this.TextBoxDueDate.Text);
                br.ReaderId = Int16.Parse(TextBoxIDReader.Text);
                br.BookId = Int16.Parse(TextBoxMaSach.Text);
                br.Status = 0;
                br.Deleted = 0;

                Book b = dbContext.Book.FirstOrDefault(book => book.Id == br.BookId);
                b.Amount--;
                await dbContext.SaveChangesAsync();


                dbContext.Add(br);

                await dbContext.SaveChangesAsync();
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Đã thêm thông tin mượn sách thành công !')", true);

                this.loadData(null);
            }
            else
            {
                // chế độ trả
                BorrowRequest br = dbContext.BorrowRequest.FirstOrDefault(brow => brow.Id == Int16.Parse(this.TextBoxIDBowrow.Text));
                br.Status = 1;
                await dbContext.SaveChangesAsync();
                BorrowTracking bt = new BorrowTracking();
                bt.RequestId = br.Id;
                bt.ReturnDate =DateTime.Parse(this.TextBoxReturnDate.Text);
                bt.ReturnStatus = (int)this.DropDownListTinhTrangTraSach.SelectedIndex + 1;
                bt.FineAmound = decimal.Parse(this.TextBoxTienBoiThuong.Text);
                bt.UpdatedAt = DateTime.Now;
                bt.Deleted = 0;
                dbContext.BorrowTracking.Add(bt);
                await dbContext.SaveChangesAsync();
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Đã thêm thông tin trả sách thành công !')", true);
                this.loadData(null);
            }
            this.setNullInput();
        }

        protected void TextBoxReturnDate_TextChanged(object sender, EventArgs e)
        {
            DateTime duaDate =DateTime.Parse(this.TextBoxDueDate.Text);
            DateTime returnDate = DateTime.Parse(this.TextBoxReturnDate.Text);
            TimeSpan interval = returnDate - duaDate;
            int outDay = interval.Days;
            Book book = dbContext.Book.FirstOrDefault(b => b.Id == Int16.Parse(this.TextBoxMaSach.Text));
            if (outDay > 0)
            {
                if (this.DropDownListTinhTrangTraSach.SelectedIndex != 2)
                {
                    this.DropDownListTinhTrangTraSach.SelectedIndex = 2;
                }

                this.money = (decimal)book.Price * outDay * 10 / 100;

                this.TextBoxTienBoiThuong.Text = this.money.ToString();

            }
            else
            {
                this.money = 0;
                this.TextBoxTienBoiThuong.Text = "0";
            }
        }

        protected void DropDownListTinhTrangTraSach_SelectedIndexChanged(object sender, EventArgs e)
        {
            Book book = dbContext.Book.FirstOrDefault(b => b.Id == Int16.Parse(this.TextBoxMaSach.Text));

            if (this.DropDownListTinhTrangTraSach.SelectedIndex != 0)
            {
                if (this.DropDownListTinhTrangTraSach.SelectedIndex == 1) // xấu 
                {
                    this.money = (decimal)book.Price * 50 / 100;

                    this.TextBoxTienBoiThuong.Text = this.money.ToString();
                }
                if (this.DropDownListTinhTrangTraSach.SelectedIndex == 2) // quá hạn
                {
                    DateTime duaDate = DateTime.Parse(this.TextBoxDueDate.Text);
                    DateTime returnDate = DateTime.Parse(this.TextBoxDueDate.Text);
                    TimeSpan interval = returnDate - duaDate;
                    int outDay = interval.Days;
                    if (outDay > 0)
                    {
                        this.money = (decimal)book.Price * outDay * 10 / 100;

                        this.TextBoxTienBoiThuong.Text = this.money.ToString();

                    }
                    else
                    {
                        this.money = 0;
                        this.TextBoxTienBoiThuong.Text = "0";
                    }

                }
                if (this.DropDownListTinhTrangTraSach.SelectedIndex == 3) // phải bổi thường
                {

                    this.money = (decimal)book.Price;

                    this.TextBoxTienBoiThuong.Text = this.money.ToString();



                }
            }
        }

        protected void ButtonHuy_Click(object sender, EventArgs e)
        {
            setNullInput();
        }
    }
}