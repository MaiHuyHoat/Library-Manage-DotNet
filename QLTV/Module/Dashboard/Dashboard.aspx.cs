using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
using QLTV.Data.Model;
namespace QLTV
{
    public partial class Default : System.Web.UI.Page
    {
        private DBContext _dbContext;
        protected void Page_Load(object sender, EventArgs e)
        {
            _dbContext = new DBContext();
            setData1();
            setData2();
        }
        private void setData1()
        {
            var query1 = this._dbContext.Book.Count();
            this.LabelSachTrongThuVien.Text = query1.ToString();
            var query2 = (from BorrowRequest in this._dbContext.BorrowRequest
                          where BorrowRequest.UpdatedAt.Month == DateTime.Now.Month
                          select BorrowRequest.BookId)
                         .Distinct()
                         .Count();
            this.LabelSachDaChoMuon.Text = query2.ToString();
            var query3 = (from BorrowRequest in this._dbContext.BorrowRequest
                          where BorrowRequest.Status == 1
                          where BorrowRequest.UpdatedAt.Month == DateTime.Now.Month
                          select BorrowRequest.BookId)
                         .Distinct()
                         .Count();
            this.LabelSachDaTraLai.Text = query3.ToString();

            var query4 = (from BorrowTracking in _dbContext.BorrowTracking
                          where BorrowTracking.UpdatedAt.Month == DateTime.Now.Month
                          select BorrowTracking.FineAmound
                          )
                          .Sum();
            decimal totalMoneyInMonth = query4 ?? 0;
            this.LabelSoTienThuDuoc.Text = totalMoneyInMonth.ToString("#,##0 ;(#,##0 )");




        }
        public void setData2()
        {
            setStackAreaChart();
            setBarChart();
            setPieChart();
        }
        public void setStackAreaChart()
        {
            // set so tien gui tra sach
            var query1 = (from BorrowTracking in _dbContext.BorrowTracking
                          where BorrowTracking.UpdatedAt >= DateTime.Now.AddMonths(-5) && BorrowTracking.UpdatedAt <= DateTime.Now
                          select BorrowTracking
                         );
            List<BorrowTracking> listData1 = query1.ToList();
            List<decimal> listMoney6F = new List<decimal>();
            List<decimal> listmoneyN = new List<decimal>();
            List<string> date6F = new List<string>();
            for (int i = 0; i < 3; i++)
            {
                string title = null;
                switch (i)
                {
                    case 0:
                        title = "Trả sách xấu";
                        break;
                    case 1:
                        title = "Trả sách quá hạn";
                        break;
                    case 2:
                        title = "Trả sách bồi thường";
                        break;
                    default:
                        break;
                }


                DateTime dateTime6F = DateTime.Now.AddMonths(-5);
                date6F.Add(dateTime6F.ToString("dd-MM-yyyy"));
                decimal money6F = listData1.Where(bt
                        => bt.UpdatedAt.Month == dateTime6F.Month && bt.UpdatedAt.Year == dateTime6F.Year
                        && bt.ReturnStatus == i + 2
                        ).Sum(bt => bt.FineAmound) ?? 0;
                listMoney6F.Add(money6F);

                decimal moneyN = listData1.Where(bt
                       => bt.UpdatedAt.Month == DateTime.Now.Month && bt.UpdatedAt.Year == DateTime.Now.Year
                       && bt.ReturnStatus == i + 2
                       ).Sum(bt => bt.FineAmound) ?? 0;
                listmoneyN.Add(moneyN);



            }
            var data = new
            {
                datasets = new[]
       {
        new
        {
            label = "Trả sách xấu",
            data = new[]
            {
                new { x = date6F[0].ToString(), y = listMoney6F[0]  },
                new { x = DateTime.Now.ToString("dd-MM-yyyy"), y = listmoneyN[0] }
            },
            borderColor = "rgba(54, 162, 235, 1)",     // Xanh
            backgroundColor = "rgba(54, 162, 235, 0.2)", // Xanh nhạt
            fill = true
        },
        new
        {
            label = "Trả sách quá hạn",
            data = new[]
            {
                new { x = date6F[1].ToString(), y = listMoney6F[1]  },
                new { x = DateTime.Now.ToString("dd-MM-yyyy"), y = listmoneyN[1] }
            },
            borderColor = "rgba(255, 99, 132, 1)",     // Đỏ
            backgroundColor = "rgba(255, 99, 132, 0.2)", // Đỏ nhạt
            fill = true
        },
        new
        {
            label = "Trả sách bồi thường",
            data = new[]
            {
                new { x = date6F[2].ToString(), y = listMoney6F[2]  },
                new { x = DateTime.Now.ToString("dd-mm-yyyy"), y = listmoneyN[2] }
            },
            borderColor = "rgba(255, 206, 86, 1)",     // Vàng
            backgroundColor = "rgba(255, 206, 86, 0.2)", // Vàng nhạt
            fill = true
        }
    }
            };


            string jsonData = JsonConvert.SerializeObject(data);
            HiddenFieldStackArea.Text = jsonData;
        }
        public void setBarChart()
        {
            var query = (from BorrowRequest in _dbContext.BorrowRequest
                         where BorrowRequest.UpdatedAt >= DateTime.Now.AddMonths(-5) && BorrowRequest.UpdatedAt <= DateTime.Now
                         select BorrowRequest
                      );
            List<BorrowRequest> listData = query.ToList();
            // Tạo danh sách tháng
            List<string> labels = GetLast6Months();
            List<int> countBook= new List<int>();   
            for (int j = 5; j >= 0; j--)
            {
                DateTime dateTime = DateTime.Now.AddMonths(-j);
                int count = listData.Where(br
                    => br.UpdatedAt.Month == dateTime.Month && br.UpdatedAt.Year == dateTime.Year
                    ).Count();
               countBook.Add(count);
            }
            // Tạo đối tượng JSON
            var data = new
            {
                labels = labels,
                datasets = new[]
                {
                new
                {
                    label = "Số lượng sách mượn trong vòng 6 tháng",
                    data = countBook,
                    backgroundColor = new string[]
                    {
                        "rgba(255, 99, 132, 0.2)",
                        "rgba(255, 159, 64, 0.2)",
                        "rgba(255, 205, 86, 0.2)",
                        "rgba(75, 192, 192, 0.2)",
                        "rgba(54, 162, 235, 0.2)",
                        "rgba(153, 102, 255, 0.2)"
                    },
                    borderColor = new string[]
                    {
                        "rgb(255, 99, 132)",
                        "rgb(255, 159, 64)",
                        "rgb(255, 205, 86)",
                        "rgb(75, 192, 192)",
                        "rgb(54, 162, 235)",
                        "rgb(153, 102, 255)"
                    },
                    borderWidth = 1
                }
            }
            };

            string jsonData = JsonConvert.SerializeObject(data);
            HiddenFieldBasicChart.Text = jsonData;

        }
        // Phương thức để lấy danh sách 6 tháng gần nhất
        public List<string> GetLast6Months()
        {
            List<string> months = new List<string>();
            DateTime currentDate = DateTime.Now;

            for (int i = 0; i < 6; i++)
            {
                months.Add(currentDate.ToString("MM-yyyy"));
                currentDate = currentDate.AddMonths(-1);
            }

            months.Reverse(); 
            return months;
        }
        public void setPieChart()
        {
            var query1 = (from BorrowTracking in _dbContext.BorrowTracking
                          where BorrowTracking.UpdatedAt >= DateTime.Now.AddMonths(-5) && BorrowTracking.UpdatedAt <= DateTime.Now
                          group BorrowTracking by BorrowTracking.ReturnStatus into groupItems
                          select new
                          {
                              returnCode = groupItems.Key,
                              count = groupItems.Count()
                          }
 ).ToArray();

            // Dữ liệu mẫu từ mã JavaScript object
            var labels = new List<string> { "Bình thường", "Xấu", "Quá hạn", "Phải bồi thường hoàn toàn" };
            var countBook = new List<int> ();
          
            foreach (var item in query1)
            {
              
                switch (item.returnCode)
                {
                    case 1:
                        //pie.Title = "Bình thường";
                        countBook.Add(0);
                        countBook[0] = item.count;
                        break;
                    case 2:
                        //pie.Title = "Xấu";
                        countBook.Add(0);
                        countBook[1] = item.count;
                        break;
                    case 3:
                        //pie.Title = "Quá hạn";
                        countBook.Add(0);
                        countBook[2] = item.count;
                        break;
                    case 4:
                        //pie.Title = "Phải bồi thường hoàn toàn";
                        countBook.Add(0);
                        countBook[3] = item.count;
                        break;
                        
                    default:
                        break;
                }
               
            }

       

            // Tạo đối tượng tương ứng trong C#
            var data = new
            {
                labels = labels,
                datasets = new[]
                {
                new
                {
                    label = "Số lượng sách mượn trong vòng 6 tháng",
                    data = countBook,
                     backgroundColor = new string[]
                    {
                        "rgba(54, 162, 235, 0.2)",   // Blue
                        "rgba(255, 99, 132, 0.2)",  // Red
                        "rgba(153, 102, 255, 0.2)", // Purple (Tím)
                        "rgba(255, 205, 86, 0.2)"   // Yellow
                    },
                    borderColor = new string[]
                    {
                        "rgb(54, 162, 235)",    // Blue
                        "rgb(255, 99, 132)",    // Red
                        "rgb(153, 102, 255)",   // Purple (Tím)
                        "rgb(255, 205, 86)"     // Yellow
                    },
                    borderWidth = 1
                }
            }
            };
            string jsonData = JsonConvert.SerializeObject(data);
            HiddenFieldPieChart.Text = jsonData;
        }




    }
}