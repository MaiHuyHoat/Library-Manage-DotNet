<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index2.aspx.cs" Inherits="QLTV.Module.TaiNguyen.TheLoai.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">


.w-100 {
  width: 100% !important;
}

table {
  caption-side: bottom;
  border-collapse: collapse;
}

*,
*::before,
*::after {
  box-sizing: border-box;
}

thead,
tbody,
tfoot,
tr,
td,
th {
  border-color: inherit;
  border-style: solid;
  border-width: 0;
}

input,
select,
textarea {
    max-width: 280px;
}

input,
button,
select,
optgroup,
textarea {
  margin: 0;
  font-family: inherit;
  font-size: inherit;
  line-height: inherit;
}

.btn-success {
  --bs-btn-color: #fff;
  --bs-btn-bg: #198754;
  --bs-btn-border-color: #198754;
  --bs-btn-hover-color: #fff;
  --bs-btn-hover-bg: #157347;
  --bs-btn-hover-border-color: #146c43;
  --bs-btn-focus-shadow-rgb: 60, 153, 110;
  --bs-btn-active-color: #fff;
  --bs-btn-active-bg: #146c43;
  --bs-btn-active-border-color: #13653f;
  --bs-btn-active-shadow: inset 0 3px 5px rgba(0, 0, 0, 0.125);
  --bs-btn-disabled-color: #fff;
  --bs-btn-disabled-bg: #198754;
  --bs-btn-disabled-border-color: #198754;
}

  .btn {
    transition: none;
  }

.btn {
  --bs-btn-padding-x: 0.75rem;
  --bs-btn-padding-y: 0.375rem;
  --bs-btn-font-family: ;
  --bs-btn-font-size: 1rem;
  --bs-btn-font-weight: 400;
  --bs-btn-line-height: 1.5;
  --bs-btn-color: #212529;
  --bs-btn-bg: transparent;
  --bs-btn-border-width: 1px;
  --bs-btn-border-color: transparent;
  --bs-btn-border-radius: 0.375rem;
  --bs-btn-hover-border-color: transparent;
  --bs-btn-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.15), 0 1px 1px rgba(0, 0, 0, 0.075);
  --bs-btn-disabled-opacity: 0.65;
  --bs-btn-focus-box-shadow: 0 0 0 0.25rem rgba(var(--bs-btn-focus-shadow-rgb), .5);
  display: inline-block;
  padding: var(--bs-btn-padding-y) var(--bs-btn-padding-x);
  font-family: var(--bs-btn-font-family);
  font-size: var(--bs-btn-font-size);
  font-weight: var(--bs-btn-font-weight);
  line-height: var(--bs-btn-line-height);
  color: var(--bs-btn-color);
  text-align: center;
  text-decoration: none;
  vertical-align: middle;
  cursor: pointer;
  -webkit-user-select: none;
  -moz-user-select: none;
  user-select: none;
  border: var(--bs-btn-border-width) solid var(--bs-btn-border-color);
  border-radius: var(--bs-btn-border-radius);
  background-color: var(--bs-btn-bg);
  transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out, border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
}

button,
[type=button],
[type=reset],
[type=submit] {
  -webkit-appearance: button;
}

select {
  word-wrap: normal;
}

button,
select {
  text-transform: none;
}

.mt-2 {
  margin-top: 0.5rem !important;
}

.btn-warning {
  --bs-btn-color: #000;
  --bs-btn-bg: #ffc107;
  --bs-btn-border-color: #ffc107;
  --bs-btn-hover-color: #000;
  --bs-btn-hover-bg: #ffca2c;
  --bs-btn-hover-border-color: #ffc720;
  --bs-btn-focus-shadow-rgb: 217, 164, 6;
  --bs-btn-active-color: #000;
  --bs-btn-active-bg: #ffcd39;
  --bs-btn-active-border-color: #ffc720;
  --bs-btn-active-shadow: inset 0 3px 5px rgba(0, 0, 0, 0.125);
  --bs-btn-disabled-color: #000;
  --bs-btn-disabled-bg: #ffc107;
  --bs-btn-disabled-border-color: #ffc107;
}

.btn-danger {
  --bs-btn-color: #fff;
  --bs-btn-bg: #dc3545;
  --bs-btn-border-color: #dc3545;
  --bs-btn-hover-color: #fff;
  --bs-btn-hover-bg: #bb2d3b;
  --bs-btn-hover-border-color: #b02a37;
  --bs-btn-focus-shadow-rgb: 225, 83, 97;
  --bs-btn-active-color: #fff;
  --bs-btn-active-bg: #b02a37;
  --bs-btn-active-border-color: #a52834;
  --bs-btn-active-shadow: inset 0 3px 5px rgba(0, 0, 0, 0.125);
  --bs-btn-disabled-color: #fff;
  --bs-btn-disabled-bg: #dc3545;
  --bs-btn-disabled-border-color: #dc3545;
}

.btn-secondary {
  --bs-btn-color: #fff;
  --bs-btn-bg: #6c757d;
  --bs-btn-border-color: #6c757d;
  --bs-btn-hover-color: #fff;
  --bs-btn-hover-bg: #5c636a;
  --bs-btn-hover-border-color: #565e64;
  --bs-btn-focus-shadow-rgb: 130, 138, 145;
  --bs-btn-active-color: #fff;
  --bs-btn-active-bg: #565e64;
  --bs-btn-active-border-color: #51585e;
  --bs-btn-active-shadow: inset 0 3px 5px rgba(0, 0, 0, 0.125);
  --bs-btn-disabled-color: #fff;
  --bs-btn-disabled-bg: #6c757d;
  --bs-btn-disabled-border-color: #6c757d;
}

th {
  text-align: inherit;
  text-align: -webkit-match-parent;
}

a {
  color: var(--bs-link-color);
  text-decoration: underline;
}
        .auto-style9 {
            width: 555px;
        }
        .auto-style10 {
            height: 34px;
            width: 555px;
        }
        .auto-style12 {
            height: 23px;
            width: 555px;
        }
        .auto-style15 {
            height: 44px;
            width: 555px;
        }
        .auto-style19 {
            height: 23px;
            width: 3px;
        }
        .auto-style30 {
            width: 100%;
            height: 842px;
        }
        .auto-style31 {
            width: 555px;
            height: 22px;
        }
        .auto-style32 {
            width: 163px;
            height: 22px;
        }
        .auto-style33 {
            width: 3px;
            height: 22px;
        }
        .auto-style34 {
            width: 135px;
            height: 22px;
        }
        .auto-style35 {
            height: 22px;
        }
        .auto-style36 {
            width: 39px;
            height: 22px;
        }
        .auto-style39 {
            width: 555px;
            height: 35px;
        }
        .auto-style40 {
            height: 35px;
        }
        .auto-style43 {
            height: 34px;
            width: 163px;
        }
        .auto-style44 {
            height: 34px;
            width: 3px;
        }
        .auto-style45 {
            height: 34px;
            width: 39px;
        }
        .auto-style46 {
            height: 23px;
            width: 163px;
        }
        .auto-style47 {
            height: 23px;
            width: 39px;
        }
        .auto-style52 {
            height: 61px;
            width: 163px;
        }
        .auto-style53 {
            height: 61px;
            width: 39px;
        }
        .auto-style56 {
            height: 363px;
        }
        .auto-style59 {
            width: 555px;
            height: 70px;
        }
        .auto-style61 {
            width: 170px;
            height: 255px;
        }
        .auto-style62 {
            width: 555px;
            height: 33px;
        }
        .auto-style64 {
            height: 33px;
        }
        .auto-style65 {
            width: 555px;
            height: 61px;
        }
        .auto-style66 {
            width: 67px;
            height: 61px;
        }
        .auto-style67 {
            width: 122px;
            height: 61px;
        }
        .auto-style69 {
            height: 37px;
        }
        .auto-style70 {
            width: 555px;
            height: 37px;
        }
        .auto-style71 {
            height: 37px;
            width: 163px;
        }
        .auto-style72 {
            height: 37px;
            width: 39px;
        }
        .auto-style73 {
            width: 3px;
            height: 61px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <table class="auto-style30">
        <tr>
            <td class="auto-style31">&nbsp;</td>
            <td class="auto-style32">&nbsp;</td>
            <td class="auto-style32">&nbsp;</td>
            <td class="auto-style33">&nbsp;</td>
            <td class="auto-style34">&nbsp;</td>
            <td class="auto-style35">&nbsp;</td>
            <td class="auto-style36">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style31">&nbsp;</td>
            <td class="auto-style32">&nbsp;</td>
            <td class="auto-style32">&nbsp;</td>
            <td class="auto-style33">&nbsp;</td>
            <td class="auto-style34">&nbsp;</td>
            <td class="auto-style35">&nbsp;</td>
            <td class="auto-style36">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style39"></td>
            <td colspan="6" style="background-color: rgb(75, 83, 102)" class="auto-style40">
                <asp:Label ID="Label14" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Thao tác" ForeColor="White"></asp:Label>
            </td>
        </tr>
      
        <tr>
            <td class="auto-style10"></td>
            <td class="auto-style43">
                &nbsp;</td>
            <td class="auto-style43">
                <asp:Label ID="Label7" runat="server" Font-Bold="True" Text="ID : " Visible="False"></asp:Label>
            </td>
            <td class="auto-style44">
                <asp:TextBox ID="TextBoxID0" runat="server" Width="273px" Visible="False"></asp:TextBox>
            </td>
            <td class="auto-style45">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style10"></td>
            <td class="auto-style43">
                &nbsp;</td>
            <td class="auto-style43">
                <asp:Label ID="Label19" runat="server" Font-Bold="True" Text="Thể loại : "></asp:Label>
            </td>
            <td class="auto-style44">
                <asp:TextBox ID="TextBoxID1" runat="server" Width="273px" ></asp:TextBox>
            </td>
            <td class="auto-style45">
                &nbsp;</td>
            <td rowspan="2" style="width: 67px">&nbsp;</td>
            <td rowspan="2" style="width: 122px">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style10"></td>
            <td class="auto-style43">
                &nbsp;</td>
            <td class="auto-style43">
                &nbsp;</td>
            <td class="auto-style44">
                &nbsp;</td>
            <td class="auto-style45">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style70"></td>
            <td class="auto-style71">
                </td>
            <td class="auto-style69" colspan="2">
                <asp:Button ID="ButtonThem" runat="server" CssClass="btn btn-success" OnClick="ButtonThem_Click" Text="Thêm" Width="100px" />
                &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="ButtonSua" runat="server" CssClass="btn btn-warning  mt-2" OnClick="ButtonSua_Click" Text="Sửa" Width="100px" />
                &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="ButtonXoa" runat="server" CssClass="btn btn-danger  mt-2" OnClick="ButtonXoa_Click" Text="Xoá" Width="100px" />
                &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="ButtonHuy0" runat="server" CssClass="btn btn-secondary mt-2" OnClick="ButtonHuy_Click" Text="Huỷ" Width="100px" />
            </td>
            <td class="auto-style72">
            </td>
            <td rowspan="2" style="width: 67px">&nbsp;</td>
            <td rowspan="2" style="width: 122px">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style12"></td>
            <td class="auto-style46">
                </td>
            <td class="auto-style46">
                &nbsp;</td>
            <td class="auto-style19">
                </td>
            <td class="auto-style47"></td>
        </tr>
        <tr>
    <td class="auto-style62"></td>
    <td colspan="6" style="background-color: rgb(75, 83, 102)" class="auto-style64">
        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Danh sách " ForeColor="White"></asp:Label>
    </td>
</tr>
        <tr>
            <td class="auto-style65">
                <table class="w-100">
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </td>
            <td class="auto-style52">
            </td>
            <td class="auto-style52">
                <asp:Label ID="Label20" runat="server" Font-Bold="True" Text="Tên thể loại :"></asp:Label>
            </td>
            <td class="auto-style73">
                <asp:TextBox ID="TextBox1" runat="server" Width="273px"></asp:TextBox>
            </td>
            <td class="auto-style53">
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Tìm kiếm" CssClass="btn btn-warning  mt-2" Width="100px" />
            </td>
            <td class="auto-style66"></td>
            <td class="auto-style67"></td>
        </tr>
        <tr>
            <td class="auto-style9"></td>
           <%-- <td style="width: 679px">&nbsp;</td>--%>
            <td colspan="6" rowspan="6" class="auto-style56">
                <asp:GridView ID="GridViewSach" runat="server" AllowSorting="True" AutoGenerateSelectButton="True" CellPadding="4" Width="1161px" AutoGenerateColumns="False" ForeColor="#333333" GridLines="None" OnPageIndexChanged="GridViewSach_PageIndexChanged" OnPageIndexChanging="GridViewSach_PageIndexChanging" AllowPaging="True" OnSelectedIndexChanged="GridViewSach_SelectedIndexChanged">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" />
                        <asp:BoundField DataField="Tên Thể loại" HeaderText="Tên Thể loại" />
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle ForeColor="White" HorizontalAlign="Center" BackColor="#2461BF" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td class="auto-style10">&nbsp;</td>
        </tr>
        <tr>
            <td rowspan="2" class="auto-style59">&nbsp;</td>
        </tr>
        <tr>
            <td rowspan="7" class="auto-style61">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style15"></td>
        </tr>
        <tr>
            <td class="auto-style62">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style62">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style62"></td>
        </tr>
        <tr>
            <td class="auto-style62"></td>
        </tr>
        <tr>
            <td class="auto-style62">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style31">&nbsp;</td>
            <td class="auto-style32">&nbsp;</td>
            <td class="auto-style32">&nbsp;</td>
            <td colspan="2" class="auto-style35">&nbsp;</td>
            <td class="auto-style35">&nbsp;</td>
            <td class="auto-style36">&nbsp;</td>
        </tr>
    </table>
        <div>
        </div>
    </form>
</body>
</html>
