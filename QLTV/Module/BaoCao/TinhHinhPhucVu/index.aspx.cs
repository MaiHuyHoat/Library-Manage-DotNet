using QLTV.Data.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using QLTV.Data.Entity;
using QLTV.Data.Model;
using System.Data;
using QLTV.Library;
namespace QLTV.Module.BaoCao.TinhHinhPhucVu
{
    public partial class index : System.Web.UI.Page
    {
        private DBContext dbContext;
   
        protected void Page_Load(object sender, EventArgs e)
        {
            dbContext= new DBContext();
            this.loadData(null);

        }
        private void loadData(Dictionary<string, string> constraint)
        {
            var query = from book in dbContext.Book
                        join borrowRequest in dbContext.BorrowRequest on book.Id equals borrowRequest.BookId

                        join borrowTracking in dbContext.BorrowTracking on borrowRequest.Id equals borrowTracking.RequestId
                        where book.Deleted == 0 && borrowRequest.DueDate >= DateTime.Now.AddMonths(-6) && borrowRequest.DueDate <= DateTime.Now
                        group new { book, borrowRequest, borrowTracking } by new { book.Id, book.Image, book.Name, book.Amount } into bookGroup
                        select new
                        {
                            Id = bookGroup.Key.Id,
                            Image = bookGroup.Key.Image,
                            NameBook = bookGroup.Key.Name,
                            AmountBook = bookGroup.Key.Amount,
                            CountServed = bookGroup.Count(),
                            Borrow = bookGroup.Sum(data => data.borrowRequest.Status == 0 ? 1 : 0),
                            ReturnGood = bookGroup.Sum(data => data.borrowTracking.ReturnStatus == 1 ? 1 : 0),
                            ReturnBad = bookGroup.Sum(data => data.borrowTracking.ReturnStatus == 2 ? 1 : 0),
                            ReturnVeryBad = bookGroup.Sum(data => data.borrowTracking.ReturnStatus == 3 ? 1 : 0),
                            TotalFineAmount = bookGroup.Sum(data => data.borrowTracking.FineAmound ?? 0)
                        };
            if (constraint != null)
            {


                if (constraint.TryGetValue("name", out string name))
                    query = query.Where(data => data.NameBook.ToLower().Contains(name.ToLower()));


            }
            List<BaoCaoShow> listData = query.Select(data => new BaoCaoShow
            {
                Id = data.Id,
                PathImage = ResolveUrl("~/Resources/image/" + data.Image),
                Name = data.NameBook,
                Amount = data.AmountBook,
                CountServed = data.CountServed,
                Borrow = data.Borrow,
                ReturnGood = data.ReturnGood,
                ReturnBad = data.ReturnBad,
                ReturnVeryBad = data.ReturnVeryBad,
                TotalFineAmount = (int)data.TotalFineAmount
            }).ToList();
     
            DataTable dataTable = new DataTable();

            dataTable.Columns.Add("ID", typeof(string));
            dataTable.Columns.Add("ImageUrl", typeof(string));
            dataTable.Columns.Add("Tên Sách", typeof(string));
            dataTable.Columns.Add("Tổng SL", typeof(string));
            dataTable.Columns.Add("Đang mượn", typeof(string));
            dataTable.Columns.Add("SL Phục vụ", typeof(string));
            dataTable.Columns.Add("TL Tốt", typeof(string));
            dataTable.Columns.Add("TL Xấu", typeof(string));
            dataTable.Columns.Add("TL Bồi thường", typeof(string));
            dataTable.Columns.Add("Tiền Bồi thường", typeof(string));

            dataTable.Rows.Clear();

            foreach (BaoCaoShow bs in listData)
            {
                // Đảm bảo rằng đường dẫn hình ảnh tồn tại trước khi thêm vào DataGridView
                if (System.IO.File.Exists(bs.PathImage))
                {
                    dataTable.Rows.Add(bs.Id.ToString(), ResolveUrl("~/Resources/image/book.png" ), bs.Name, bs.Amount, bs.CountServed, bs.Borrow, bs.ReturnGood, bs.ReturnBad, bs.ReturnVeryBad, bs.TotalFineAmount);
                }
                else
                {

                    dataTable.Rows.Add(bs.Id.ToString(), bs.PathImage, bs.Name, bs.Amount+" Quyển", bs.CountServed+ " Quyển", bs.Borrow + " Quyển", bs.ReturnGood + " Quyển", bs.ReturnBad + " Quyển", bs.ReturnVeryBad + " Quyển", bs.TotalFineAmount + " Đồng");
                }
              
            }
            GridViewData.DataSource = dataTable;
            GridViewData.DataBind();
        }

        protected void ButtonTimKiem_Click(object sender, EventArgs e)
        {
            Dictionary<string, string> constraint = new Dictionary<string, string>();
            if (!string.IsNullOrEmpty(this.TextBoxTimKiem.Text)) constraint.Add("name", this.TextBoxTimKiem.Text);
            this.loadData(constraint);
        }

        protected void ButtonExport_Click(object sender, EventArgs e)
        {
            var query = from book in dbContext.Book
                        join borrowRequest in dbContext.BorrowRequest on book.Id equals borrowRequest.BookId

                        join borrowTracking in dbContext.BorrowTracking on borrowRequest.Id equals borrowTracking.RequestId
                        where book.Deleted == 0 && borrowRequest.DueDate >= DateTime.Now.AddMonths(-6) && borrowRequest.DueDate <= DateTime.Now
                        group new { book, borrowRequest, borrowTracking } by new { book.Id, book.Image, book.Name, book.Amount } into bookGroup
                        select new
                        {
                            Id = bookGroup.Key.Id,
                            Image = bookGroup.Key.Image,
                            NameBook = bookGroup.Key.Name,
                            AmountBook = bookGroup.Key.Amount,
                            CountServed = bookGroup.Count(),
                            Borrow = bookGroup.Sum(data => data.borrowRequest.Status == 0 ? 1 : 0),
                            ReturnGood = bookGroup.Sum(data => data.borrowTracking.ReturnStatus == 1 ? 1 : 0),
                            ReturnBad = bookGroup.Sum(data => data.borrowTracking.ReturnStatus == 2 ? 1 : 0),
                            ReturnVeryBad = bookGroup.Sum(data => data.borrowTracking.ReturnStatus == 3 ? 1 : 0),
                            TotalFineAmount = bookGroup.Sum(data => data.borrowTracking.FineAmound ?? 0)
                        };
          
            List<BaoCaoShow> listData = query.Select(data => new BaoCaoShow
            {
                Id = data.Id,
                PathImage = ResolveUrl("~/Resources/image/" + data.Image),
                Name = data.NameBook,
                Amount = data.AmountBook,
                CountServed = data.CountServed,
                Borrow = data.Borrow,
                ReturnGood = data.ReturnGood,
                ReturnBad = data.ReturnBad,
                ReturnVeryBad = data.ReturnVeryBad,
                TotalFineAmount = (int)data.TotalFineAmount
            }).ToList();
            List<TinhHinhPhucVuExportExcel> exportData = new List<TinhHinhPhucVuExportExcel>();
            exportData.Add(new TinhHinhPhucVuExportExcel("id", "Tên sách", "Số lượng(hiện có)", "Số lượng sách phục vụ", "Đang mượn", "TL tốt", "TL xấu", "TL bồi thường", "Tổng số tiền bồi thường"));
            int totalAmountBook = 0;
            int totalCountServed = 0;
            int totalReturnGood = 0;
            int totalReturnBad = 0;
            int totalReturnVeryBad = 0;
            double totalMoney = 0;
            int totalBook = 0;
            int totalCountBorrow = 0;
            foreach (BaoCaoShow bs in listData)
            {
                string id = bs.Id.ToString();
                string nameBook = bs.Name.ToString();
                string amountBook = bs.Amount.ToString();
                string countServed = bs.CountServed.ToString();
                string returnGood = bs.ReturnGood.ToString();
                string returnBad = bs.ReturnBad.ToString();
                string returnVeryBad = bs.ReturnVeryBad.ToString();
                string totalFineAmount = bs.TotalFineAmount.ToString() + " đồng";
                int countBorrow = int.Parse(countServed) - int.Parse(returnGood) - int.Parse(returnBad) - int.Parse(returnVeryBad);
                string strCountBorrow = countBorrow.ToString();
                // Cộng tổng 
                totalAmountBook += bs.Amount;
                totalCountServed += bs.CountServed;
                totalReturnGood += bs.ReturnGood;
                totalReturnBad += bs.ReturnBad;
                totalReturnVeryBad += bs.ReturnVeryBad;
                totalMoney += bs.TotalFineAmount;
                totalBook++;
                totalCountBorrow += countBorrow;
                exportData.Add(new TinhHinhPhucVuExportExcel(id, nameBook, amountBook, countServed, strCountBorrow, returnGood, returnBad, returnVeryBad, totalFineAmount));
            }
            exportData.Add(new TinhHinhPhucVuExportExcel("Tổng ", totalBook.ToString(), totalAmountBook.ToString(), totalCountServed.ToString(), totalCountBorrow.ToString(),
                totalReturnGood.ToString(), totalReturnBad.ToString(), totalReturnVeryBad.ToString(), totalMoney.ToString() + " đồng"));


            try
            {
                string filePath = @"D:\ExportExcel.xlsx";
                ExcelExport<TinhHinhPhucVuExportExcel> excelExport = new ExcelExport<TinhHinhPhucVuExportExcel>(exportData, "Báo cáo tình hình phục vụ sách của thư viện", filePath);


                //System.Diagnostics.Trace.WriteLine("so luong : " + exportData.Count);
                //return;

                // nếu đường dẫn null hoặc rỗng thì báo không hợp lệ và return hàm

                bool rs = excelExport.ToExcel();
                if (rs)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('Xuất dữ liệu ra Excel thành công!') ", true);
                }else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('Lỗi : Không thể thực hiện được hành động !' ", true);
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Trace.WriteLine("error"+ex.Message);
            }
        }
    }
}