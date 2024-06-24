using QLTV.Data.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QLTV.Data.Entity;
using QLTV.Data.Model;
using QLTV.Library;
using System.Data;

namespace QLTV.Module.BaoCao.DocGiaHetHan
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
                this.setDropDownListChucVu();
            }
         
        }
        private void loadData(Dictionary<string, string> constraint)
        {
            //var query = from reader in dbContext.Readers
            //            join role in dbContext.RoleReaders on reader.RoleId equals role.Id
            //            where reader.Deleted == 0 && reader.EndDay <= DateTime.Now
            //            select new { reader, role };

            var query = from reader in dbContext.Reader
                        join role in dbContext.RoleReader on reader.RoleId equals role.Id
                        where reader.Deleted == 0 && reader.EndDay <= DateTime.Now
                        select new
                        {
                            reader,
                            role,
                            SoSachDaMuon = dbContext.BorrowRequest.Where(br => br.ReaderId == reader.Id).Count(),
                            SoSachDaTra = dbContext.BorrowRequest.Where(br => br.ReaderId == reader.Id && br.Status == 1).Count(),
                            SoSachChuaTra = dbContext.BorrowRequest.Where(br => br.ReaderId == reader.Id).Count() - dbContext.BorrowRequest.Where(br => br.ReaderId == reader.Id && br.Status == 1).Count()
                        };


            if (constraint != null)
            {
                if (constraint.TryGetValue("name", out string name))
                    query = query.Where(data => data.reader.Name.ToLower().Contains(name.ToLower()));
                //if (constraint.TryGetValue("dateofbirth", out string dateofbirth))
                //    query = query.Where(data => data.reader.DateOfBirth.ToLower().Contains(dateofbirth.ToLower()));
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
            List<DocGiaHetHanShow> listDocGiaHH = query.Select(data => new DocGiaHetHanShow
            {
                Id = data.reader.Id,
                Name = data.reader.Name,
                DateOfBirth = data.reader.DateOfBirth.ToString("dd-MM-yyyy"),
                IdentityCard = data.reader.IdentityCard,
                Role = data.role.Name,
                StartDate = data.reader.StartDay.ToString("dd-MM-yyyy"),
                EndDate = data.reader.EndDay.ToString("dd-MM-yyyy"),
                BorrowRequestCount = data.SoSachDaMuon,
                BookReturned = data.SoSachDaTra,
                BookNotReturned = data.SoSachChuaTra
            }).ToList();
            DataTable dataTable = new DataTable();
            dataTable.Columns.Add("ID", typeof(string));
            dataTable.Columns.Add("Tên độc giả", typeof(string));
            dataTable.Columns.Add("Ngày sinh", typeof(string));
            dataTable.Columns.Add("CMT", typeof(string));
            dataTable.Columns.Add("Chức vụ", typeof(string));
            dataTable.Columns.Add("Ngày cấp thẻ", typeof(string));
            dataTable.Columns.Add("Ngày hết hạn thẻ", typeof(string));
            dataTable.Columns.Add("Số sách đã mượn", typeof(string)); // Số sách đã trả
            dataTable.Columns.Add("Số sách đã trả", typeof(string)); // Số sách đã trả
            dataTable.Columns.Add("Số sách chưa trả", typeof(string));
            dataTable.Rows.Clear();
            foreach (DocGiaHetHanShow dgs in listDocGiaHH)
            {
                dataTable.Rows.Add(dgs.Id.ToString(), dgs.Name, dgs.DateOfBirth, dgs.IdentityCard, dgs.Role, dgs.StartDate, dgs.EndDate, dgs.BorrowRequestCount, dgs.BookReturned, dgs.BookNotReturned);

            }
            this.GridViewData.DataSource = dataTable;
            this.GridViewData.DataBind();

        }
        protected void ButtonExport_Click(object sender, EventArgs e)
        {
            Dictionary<string, string> constraint = new Dictionary<string, string>();
            if (this.DropDownListChucVu.SelectedIndex != 0) constraint.Add("roleName", this.DropDownListChucVu.SelectedItem.ToString());
            if (!string.IsNullOrEmpty(this.TextBoxCMT.Text)) constraint.Add("identitycard", this.TextBoxCMT.Text);
            var query = from reader in dbContext.Reader
                        join role in dbContext.RoleReader on reader.RoleId equals role.Id
                        where reader.Deleted == 0 && reader.EndDay <= DateTime.Now
                        select new
                        {
                            reader,
                            role,
                            SoSachDaMuon = dbContext.BorrowRequest.Where(br => br.ReaderId == reader.Id).Count(),
                            SoSachDaTra = dbContext.BorrowRequest.Where(br => br.ReaderId == reader.Id && br.Status == 1).Count(),
                            SoSachChuaTra = dbContext.BorrowRequest.Where(br => br.ReaderId == reader.Id).Count() - dbContext.BorrowRequest.Where(br => br.ReaderId == reader.Id && br.Status == 1).Count()
                        };


            if (constraint != null)
            {
                if (constraint.TryGetValue("name", out string name))
                    query = query.Where(data => data.reader.Name.ToLower().Contains(name.ToLower()));
                //if (constraint.TryGetValue("dateofbirth", out string dateofbirth))
                //    query = query.Where(data => data.reader.DateOfBirth.ToLower().Contains(dateofbirth.ToLower()));
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
            List<DocGiaHetHanShow> listDocGiaHH = query.Select(data => new DocGiaHetHanShow
            {
                Id = data.reader.Id,
                Name = data.reader.Name,
                DateOfBirth = data.reader.DateOfBirth.ToString("dd-MM-yyyy"),
                IdentityCard = data.reader.IdentityCard,
                Role = data.role.Name,
                StartDate = data.reader.StartDay.ToString("dd-MM-yyyy"),
                EndDate = data.reader.EndDay.ToString("dd-MM-yyyy"),
                BorrowRequestCount = data.SoSachDaMuon,
                BookReturned = data.SoSachDaTra,
                BookNotReturned = data.SoSachChuaTra
            }).ToList();
            List<DocGiaHetHanExportExcel> exportData = new List<DocGiaHetHanExportExcel>();
            exportData.Add(new DocGiaHetHanExportExcel("Id", "Tên", "CMT", "Ngày sinh", "Chức vụ", "Ngày cấp thẻ", "Ngày hết hạn", "Số sách đã mượn", "Số sách đã trả", "Số sách chưa trả"));
            foreach (DocGiaHetHanShow dgs in listDocGiaHH)
            {
                exportData.Add(new DocGiaHetHanExportExcel(dgs.Id.ToString(), dgs.Name, dgs.IdentityCard, dgs.DateOfBirth, dgs.Role, dgs.StartDate, dgs.EndDate, dgs.BorrowRequestCount.ToString(), dgs.BookReturned.ToString(), dgs.BookNotReturned.ToString()));
            }
            try
            {
                string filePath = @"D:\DanhSachDocGiaHethan.xlsx";
                ExcelExport<DocGiaHetHanExportExcel> excelExport = new ExcelExport<DocGiaHetHanExportExcel>(exportData, "Danh sách độc giả hết hạn sử dụng ", filePath);


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
        private void setDropDownListChucVu()
        {
            this.DropDownListChucVu.Items.Clear();
            this.DropDownListChucVu.Items.Add("Tất cả");
            List<RoleReader> roleList = dbContext.RoleReader.ToList();

            foreach (RoleReader role in roleList)
            {
                this.DropDownListChucVu.Items.Add(role.Name);
            }
            this.DropDownListChucVu.SelectedIndex = 0;
        }
        protected void ButtonTimKiem_Click(object sender, EventArgs e)
        {
            Dictionary<string, string> constraint = new Dictionary<string, string>();
            if (this.DropDownListChucVu.SelectedIndex != 0) constraint.Add("roleName", this.DropDownListChucVu.SelectedItem.Text.ToString());
            if (!string.IsNullOrEmpty(this.TextBoxCMT.Text)) constraint.Add("identitycard", this.TextBoxCMT.Text);
            this.loadData(constraint);
        }
    }
}