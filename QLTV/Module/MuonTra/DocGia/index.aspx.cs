using QLTV.Data.Entity;
using QLTV.Data.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Net.Mime.MediaTypeNames;

namespace QLTV.Module.MuonTra.DocGia
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
                this.loadData(null);
                this.setDropDownListChucVu();

            }

        }
        private void setDropDownListChucVu()
        {
            this.DropDownListChucVu.Items.Clear();
            this.DropDownListChucVu.Items.Add("Tất cả");

            this.DropDownListChucVuDS.Items.Clear();
            this.DropDownListChucVuDS.Items.Add("Tất cả");
            List<RoleReader> roleList = dbContext.RoleReader.ToList();

            foreach (RoleReader role in roleList)
            {
                this.DropDownListChucVu.Items.Add(role.Name);
                this.DropDownListChucVuDS.Items.Add(role.Name);
            }
            this.DropDownListChucVu.SelectedIndex = 0;
            this.DropDownListChucVuDS.SelectedIndex = 0;
        }
        public string getDrictoryApp()
        {
            string projectDirectory = AppDomain.CurrentDomain.BaseDirectory;

            return projectDirectory;
        }

        private void loadData(Dictionary<string, string> constraint)
        {
            var query = from reader in dbContext.Reader
                        join role in dbContext.RoleReader on reader.RoleId equals role.Id
                        where reader.Deleted == 0
                        select new { reader, role };


            if (constraint != null)
            {
                if (constraint.TryGetValue("name", out string name))
                    query = query.Where(data => data.reader.Name.ToLower().Contains(name.ToLower()));
               
                if (constraint.TryGetValue("dateofbirth", out string dateofbirth))
                {
                    if (dateofbirth.Equals("asc", StringComparison.OrdinalIgnoreCase))
                        query = query.OrderByDescending(data => data.reader.DateOfBirth);

                    if (dateofbirth.Equals("desc", StringComparison.OrdinalIgnoreCase))
                        query = query.OrderBy(data => data.reader.DateOfBirth);
                }
                if (constraint.TryGetValue("identitycard", out string identityCard))
                    query = query.Where(data => data.reader.IdentityCard.ToLower().Contains(identityCard.ToLower()));
                if (constraint.TryGetValue("roleName", out string roleName))
                    query = query.Where(data => data.role.Name.ToLower().Contains(roleName.ToLower()));
                if (constraint.TryGetValue("startedDate", out string startedDate))
                {
                    if (startedDate.Equals("asc", StringComparison.OrdinalIgnoreCase))
                        query = query.OrderByDescending(data => data.reader.StartDay);

                    if (startedDate.Equals("desc", StringComparison.OrdinalIgnoreCase))
                        query = query.OrderBy(data => data.reader.StartDay);
                }
            }
            List<DocGiaShow> listData = query.Select(data => new DocGiaShow
            {
                Id = data.reader.Id,
                Name = data.reader.Name,
                DateOfBirth = data.reader.DateOfBirth.ToString("dd-MM-yyyy"),
                IdentityCard = data.reader.IdentityCard,
                Role = data.role.Name,
                StartDay = data.reader.StartDay.ToString("dd-MM-yyyy")
            }).ToList();

            DataTable dataTable = new DataTable();
            dataTable.Columns.Add("ID", typeof(string));
            dataTable.Columns.Add("Tên", typeof(string)); // Store image URL as string
            dataTable.Columns.Add("Ngày sinh", typeof(string));
            dataTable.Columns.Add("CMT", typeof(string));
            dataTable.Columns.Add("Chức vụ", typeof(string));
            dataTable.Columns.Add("Ngày tạo", typeof(string));

            dataTable.Rows.Clear();
            foreach (DocGiaShow dgs in listData)
            {
                dataTable.Rows.Add(dgs.Id.ToString(), dgs.Name, dgs.DateOfBirth, dgs.IdentityCard, dgs.Role, dgs.StartDay);
            }
            GridViewDocGia.DataSource = dataTable;
            GridViewDocGia.DataBind();
        }
      
        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected async void ButtonThem_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(this.TextBoxTen.Text) ||
                string.IsNullOrEmpty(this.TextBoxDiaChi.Text) ||
                string.IsNullOrEmpty(this.TextBoxCMT.Text) ||
                string.IsNullOrEmpty(this.TextBoxTienCoc.Text) ||
                string.IsNullOrEmpty(this.TextBoxSoSach.Text) ||
                string.IsNullOrEmpty(this.TextBoxSoNgay.Text) ||
                this.DropDownListChucVu.SelectedIndex == 0)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Bạn cần nhập đủ thông tin')", true);
            }
            else
            {
                Reader model = new Reader();
                model.Name = this.TextBoxTen.Text;
                model.ReaderAddress = this.TextBoxDiaChi.Text;
                model.IdentityCard = this.TextBoxCMT.Text;
                model.Deposit = decimal.Parse(this.TextBoxTienCoc.Text);
                model.DateOfBirth = DateTime.Parse(this.TextBoxNgaySinh.Text);
                model.BooksBorrowed = int.Parse(this.TextBoxSoSach.Text);
                model.BorrowedTime = int.Parse(this.TextBoxSoNgay.Text);
                model.StartDay = DateTime.Parse(this.TextBoxNgayTao.Text);
                model.EndDay =  DateTime.Parse(this.TextBoxNgayHetHan.Text);
                model.RoleId = dbContext.RoleReader.Where(rr=>rr.Name.ToLower().Contains(this.DropDownListChucVu.SelectedItem.Text.ToString().ToLower())).Select(rr=>rr.Id).FirstOrDefault();
                try
                {
                    var query = dbContext.Reader.FirstOrDefault(r => r.IdentityCard == model.IdentityCard);
                    if (query != null)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('Đã tồn tại thông tin độc giả với chứng minh thư : {model.IdentityCard} trong thư viện !')", true);
                       
                        return;
                    }
                    this.dbContext.Add(model);
                    await this.dbContext.SaveChangesAsync();
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Đã thêm độc giả thành công .')", true);
                    this.loadData(null);
                }
                catch (Exception ex)
                {
                    System.Diagnostics.Trace.WriteLine("Lỗi : " + ex);
                }
            }
        }

        protected async void ButtonSua_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(this.TextBoxTen.Text) ||
                 string.IsNullOrEmpty(this.TextBoxDiaChi.Text) ||
                 string.IsNullOrEmpty(this.TextBoxCMT.Text) ||
                 string.IsNullOrEmpty(this.TextBoxTienCoc.Text) ||
                 string.IsNullOrEmpty(this.TextBoxSoSach.Text) ||
                 string.IsNullOrEmpty(this.TextBoxSoNgay.Text)
                 ||
                 this.DropDownListChucVu.SelectedIndex == 0
                 )
            {
                System.Diagnostics.Trace.WriteLine(this.DropDownListChucVu.SelectedIndex);
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Bạn cần nhập đủ thông tin')", true);
            }
            else
            {
                Reader model = this.dbContext.Reader.FirstOrDefault(b => b.Id == Int16.Parse(this.TextBoxID.Text));
                model.Name = this.TextBoxTen.Text;
                model.ReaderAddress = this.TextBoxDiaChi.Text;
                model.IdentityCard = this.TextBoxCMT.Text;
                model.Deposit = decimal.Parse(this.TextBoxTienCoc.Text);
                model.DateOfBirth = DateTime.Parse(this.TextBoxNgaySinh.Text);
                model.BooksBorrowed = int.Parse(this.TextBoxSoSach.Text);
                model.BorrowedTime = int.Parse(this.TextBoxSoNgay.Text);
                model.StartDay = DateTime.Parse(this.TextBoxNgayTao.Text);
                model.EndDay = DateTime.Parse(this.TextBoxNgayHetHan.Text);
                model.RoleId =  dbContext.RoleReader.Where(r=>r.Name.ToLower().Contains(this.DropDownListChucVu.SelectedItem.ToString().ToLower())).Select(r=>r.Id).FirstOrDefault();
                    
                    
                try
                {
                    var query = dbContext.Reader.FirstOrDefault(r => r.IdentityCard == model.IdentityCard);
                    this.dbContext.Update(model);
                    await this.dbContext.SaveChangesAsync();
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Đã sửa độc giả thành công .')", true);
                    this.loadData(null);
                }
                catch (Exception ex)
                {
                    System.Diagnostics.Trace.WriteLine("Lỗi : " + ex);
                }
            }
        }

        protected async void ButtonXoa_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(this.TextBoxID.Text) )
            {
                
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Lỗi')", true);
            }
            else
            {
                Reader model = this.dbContext.Reader.FirstOrDefault(b => b.Id == Int16.Parse(this.TextBoxID.Text));

                model.Deleted = 1;


                try
                {
                    var query = dbContext.Reader.FirstOrDefault(r => r.IdentityCard == model.IdentityCard);
                    this.dbContext.Update(model);
                    await this.dbContext.SaveChangesAsync();
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Đã xoá độc giả thành công .')", true);
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
            TextBoxTen.Text ="";

            TextBoxCMT.Text = "";

            TextBoxDiaChi.Text = "";

            TextBoxSoSach.Text = "";

            TextBoxSoNgay.Text = "";
            TextBoxTienCoc.Text = ""    ;
            
            DropDownListChucVu.SelectedIndex=0;

            TextBoxNgaySinh.Text = ""; ;

            TextBoxNgayTao.Text = "";
            TextBoxNgayHetHan.Text ="";
        }

        protected void GridViewDocGia_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
          


        }
       

        private void setExistedData(int idReader)
        {
            var query = from reader in dbContext.Reader
                        join role in dbContext.RoleReader on reader.RoleId equals role.Id
                        where reader.Id == idReader
                        select new { reader, role };
            var model = query.FirstOrDefault();
            if (model != null)
            {
                TextBoxID.Text = model.reader.Id.ToString();
                TextBoxTen.Text = model.reader.Name;

                TextBoxCMT.Text = model.reader.IdentityCard.ToString();

                TextBoxDiaChi.Text = model.reader.ReaderAddress;

                TextBoxSoSach.Text = model.reader.BooksBorrowed.ToString();

                TextBoxSoNgay.Text = model.reader.BorrowedTime.ToString();
                TextBoxTienCoc.Text = model.reader.Deposit.ToString();
                DropDownListChucVu.ClearSelection();
                DropDownListChucVu.Items.FindByText(model.role.Name).Selected=true;

                TextBoxNgaySinh.Text = model.reader.DateOfBirth.ToString("yyyy-MM-ddTHH:mm"); ;

                TextBoxNgayTao.Text = model.reader.StartDay.ToString("yyyy-MM-ddTHH:mm") ;
                TextBoxNgayHetHan.Text = model.reader.EndDay.ToString("yyyy-MM-ddTHH:mm");

            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Không tồn tại độc giả .')", true);
            }
        }

        protected void GridViewDocGia_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridViewDocGia.PageIndex = e.NewPageIndex;
            Dictionary<string, string> constraint = new Dictionary<string, string>();

            if (!string.IsNullOrEmpty(this.TextBoxCMTDS.Text))
            {
                constraint.Add("identitycard", this.TextBoxCMTDS.Text);
            }

            loadData(constraint);
        }

        protected void GridViewDocGia_SelectedIndexChanged(object sender, EventArgs e)
        {
          
            int idReader = Int16.Parse(this.GridViewDocGia.SelectedRow.Cells[1].Text);
        
            this.setExistedData(idReader);
        }

        protected void ButtonTimKiem_Click(object sender, EventArgs e)
        {
            Dictionary<string, string> constraint = new Dictionary<string, string>();
            if (this.DropDownListChucVuDS.SelectedIndex != 0) constraint.Add("roleName", this.DropDownListChucVuDS.SelectedItem.ToString());
            if (!string.IsNullOrEmpty(this.TextBoxCMTDS.Text)) constraint.Add("identitycard", this.TextBoxCMTDS.Text);
            this.loadData(constraint);
        }
    }
}






    