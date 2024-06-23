using OfficeOpenXml.Style;
using OfficeOpenXml;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Reflection;

namespace QLTV.Library
{
    public class ExcelExport<T>
    {
        private List<T> dataList;
        private string title;
        private string filePath;

        public ExcelExport(List<T> dataList, string title, string filePath)
        {
            this.dataList = dataList;
            this.title = title;
            this.filePath = filePath;
        }

        public bool ToExcel()
        {
            try
            {
                ExcelPackage.LicenseContext = LicenseContext.Commercial;
                using (var package = new ExcelPackage())
                {
                    var worksheet = package.Workbook.Worksheets.Add("Báo cáo");

                    // Đặt tiêu đề
                    worksheet.Cells["A1"].Value = title;
                    worksheet.Cells["A1:I1"].Merge = true;
                    worksheet.Cells["A1"].Style.Font.Bold = true;
                    worksheet.Cells["A1"].Style.Font.Size = 15;
                    worksheet.Cells["A1"].Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;

                    
                    Type objectType = dataList[0].GetType();

                    // Lấy danh sách các trường (thuộc tính) của đối tượng
                    FieldInfo[] fields = objectType.GetFields(BindingFlags.Instance | BindingFlags.Public | BindingFlags.NonPublic);

                    // Đặt tiêu đề cột và định dạng cho dòng đầu tiên
                    for (int j = 0; j < fields.Length; j++)
                    {
                        var cell = worksheet.Cells[4, j + 1];
                        cell.Value = fields[j].Name;
                        cell.Style.Font.Color.SetColor(System.Drawing.Color.White);
                        cell.Style.Fill.PatternType = ExcelFillStyle.Solid;
                        cell.Style.Fill.BackgroundColor.SetColor(System.Drawing.Color.DarkBlue);
                        cell.Style.Font.Bold = true;
                    }

                    // Export nội dung từ danh sách dataList
                    // Xuất dữ liệu từ danh sách dataList
                    for (int i = 0; i < dataList.Count; i++)
                    {
                        for (int j = 0; j < fields.Length; j++)
                        {
                            object value = fields[j].GetValue(dataList[i]); // Lấy giá trị của trường
                            worksheet.Cells[i + 4, j + 1].Value = value != null ? value.ToString() : "";
                        }

                        // Đặt chữ đậm cho hàng cuối cùng
                        if (i == dataList.Count - 1)
                        {
                            using (var range = worksheet.Cells[i + 4, 1, i + 4, fields.Length])
                            {
                                range.Style.Font.Bold = true;
                            }
                        }
                    }
                    // ** end code cu
                    // Tự động điều chỉnh độ rộng của từng cột
                    worksheet.Cells.AutoFitColumns();

                    // Trả về file dưới dạng mảng byte
                    // Lưu file Excel trực tiếp vào đường dẫn được chỉ định
                    var excelFile = new FileInfo(filePath);
                    package.SaveAs(excelFile);
                    return true;
                }

            }
            catch (Exception ex)
            {
                System.Diagnostics.Trace.WriteLine("error" + ex.Message);
                return false;
            }
        }
    }
}