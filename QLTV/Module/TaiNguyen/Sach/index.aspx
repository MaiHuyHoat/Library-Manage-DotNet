<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="QLTV.Module.TaiNguyen.Sach.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <table class="w-100">
        <tr>
            <td style="width: 67px">&nbsp;</td>
            <td style="width: 170px">&nbsp;</td>
            <td style="width: 237px">
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Quản lý sách"></asp:Label>
            </td>
            <td style="width: 135px">
                &nbsp;</td>
            <td>&nbsp;</td>
            <td style="width: 39px">&nbsp;</td>
            <td rowspan="26">&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 67px">&nbsp;</td>
            <td style="width: 170px">&nbsp;</td>
            <td style="width: 237px">&nbsp;</td>
            <td style="width: 135px">&nbsp;</td>
            <td>&nbsp;</td>
            <td style="width: 39px">&nbsp;</td>
        </tr>
        <tr>
            <td style="height: 21px; width: 67px;"></td>
            <td style="height: 21px; width: 170px"></td>
            <td style="height: 21px; width: 237px">&nbsp;</td>
            <td style="height: 21px; width: 135px">&nbsp;</td>
            <td style="height: 21px; ">&nbsp;</td>
            <td style="height: 21px; width: 39px">&nbsp;</td>
        </tr>
        <tr>
            <td rowspan="2" style="width: 67px">&nbsp;</td>
            <td style="width: 170px" rowspan="2">&nbsp;</td>
            <td style="width: 237px" rowspan="2">&nbsp;</td>
            <td style="width: 135px" rowspan="2">&nbsp;</td>
            <td rowspan="2">&nbsp;</td>
            <td style="width: 39px">&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 39px">&nbsp;</td>
        </tr>
        <tr>
            <td style="height: 21px; width: 67px"></td>
            <td style="height: 21px; width: 170px">
                <asp:Label ID="Label4" runat="server" Font-Bold="True" Text="ID : "></asp:Label>
            </td>
            <td style="width: 237px; height: 21px">
                <asp:TextBox ID="TextBoxID" runat="server" Width="220px"></asp:TextBox>
            </td>
            <td style="width: 135px; height: 21px">
                <asp:Label ID="Label9" runat="server" Font-Bold="True" Text="Giá : "></asp:Label>
            </td>
            <td style="width: 110px; height: 21px">
                <asp:TextBox ID="TextBoxTen0" runat="server" Width="220px"></asp:TextBox>
            </td>
            <td style="height: 21px; width: 39px">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 67px; height: 32px;"></td>
            <td style="width: 170px; height: 32px;">
                <asp:Label ID="Label5" runat="server" Font-Bold="True" Text="Tên sách : "></asp:Label>
            </td>
            <td style="width: 237px; height: 32px;">
                <asp:TextBox ID="TextBoxTen" runat="server" Width="220px"></asp:TextBox>
            </td>
            <td style="width: 135px; height: 32px;">
                <asp:Label ID="Label10" runat="server" Font-Bold="True" Text="Số lượng : "></asp:Label>
            </td>
            <td style="width: 110px; height: 32px;">
                <asp:TextBox ID="TextBoxTen1" runat="server" Width="220px"></asp:TextBox>
            </td>
            <td style="width: 39px; height: 32px;">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 67px; height: 25px;"></td>
            <td style="width: 170px; height: 25px;">
                <asp:Label ID="Label7" runat="server" Font-Bold="True" Text="Thể loại : "></asp:Label>
            </td>
            <td style="width: 237px; height: 25px;">
                <asp:DropDownList ID="DropDownList1" runat="server">
                </asp:DropDownList>
            </td>
            <td style="width: 135px; height: 25px;">
                <asp:Label ID="Label12" runat="server" Font-Bold="True" Text="Số trang : "></asp:Label>
            </td>
            <td style="width: 110px; height: 25px;">
                <asp:TextBox ID="TextBoxTen2" runat="server" Width="220px"></asp:TextBox>
            </td>
            <td style="width: 39px; height: 25px"></td>
        </tr>
        <tr>
            <td style="width: 67px">&nbsp;</td>
            <td style="width: 170px">
                <asp:Label ID="Label8" runat="server" Font-Bold="True" Text="Tác giả:"></asp:Label>
            </td>
            <td style="width: 237px; height: 21px">
                <asp:DropDownList ID="DropDownList2" runat="server">
                </asp:DropDownList>
            </td>
            <td style="width: 135px; " rowspan="3">
                <asp:Label ID="Label11" runat="server" Font-Bold="True" Text="Ảnh : "></asp:Label>
                <asp:Image ID="Image1" runat="server" />
            </td>
            <td style="width: 110px; " rowspan="3">
                <asp:FileUpload ID="FileUpload1" runat="server" />
            </td>
            <td style="width: 39px">&nbsp;</td>
        </tr>
        <tr>
            <td style="height: 25px; width: 67px;"></td>
            <td style="width: 170px; height: 25px;">
                <asp:Label ID="Label13" runat="server" Font-Bold="True" Text="Nhà xuất bản: "></asp:Label>
            </td>
            <td style="width: 237px; height: 25px;">
                <asp:DropDownList ID="DropDownList3" runat="server">
                </asp:DropDownList>
            </td>
            <td style="height: 25px; width: 39px"></td>
        </tr>
        <tr>
            <td style="height: 27px; width: 67px;"></td>
            <td style="width: 170px; height: 27px;"></td>
            <td style="width: 237px; height: 27px;"></td>
            <td style="height: 27px; width: 39px;"></td>
        </tr>
        <tr>
            <td style="height: 21px; width: 67px;"></td>
            <td style="width: 170px; height: 21px;">&nbsp;</td>
            <td style="width: 237px; height: 21px;">
                <asp:Button ID="ButtonThem" runat="server" CssClass="btn btn-success" OnClick="ButtonThem_Click" Text="Thêm" />
                <asp:Button ID="ButtonSua" runat="server" CssClass="btn btn-warning" OnClick="ButtonSua_Click" Text="Sửa" Width="59px" />
                <asp:Button ID="ButtonXoa" runat="server" CssClass="btn btn-danger" OnClick="ButtonXoa_Click" Text="Xoá" />
                <asp:Button ID="ButtonHuy0" runat="server" CssClass="btn btn-secondary" OnClick="ButtonHuy_Click" Text="Huỷ" />
            </td>
            <td style="width: 135px; height: 21px;">&nbsp;</td>
            <td style="width: 110px; height: 21px;">&nbsp;</td>
            <td style="height: 21px; width: 39px;"></td>
        </tr>
        <tr>
            <td rowspan="3" style="width: 67px">&nbsp;</td>
            <td style="width: 170px; height: 24px;"></td>
            <td style="width: 237px; height: 24px;"></td>
            <td style="width: 135px; height: 24px;"></td>
            <td style="height: 24px;"></td>
            <td style="height: 24px; width: 39px"></td>
        </tr>
        <tr>
            <td style="width: 170px">
                <asp:Label ID="Label6" runat="server" Font-Bold="True" Text="Tên sách :"></asp:Label>
            </td>
            <td style="width: 237px">
                <asp:TextBox ID="TextBoxSearch" runat="server" Width="288px"></asp:TextBox>
            </td>
            <td style="width: 135px">
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Tìm kiếm" />
            </td>
            <td>&nbsp;</td>
            <td style="width: 39px">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 170px">&nbsp;</td>
            <td style="width: 237px; height: 24px;"></td>
            <td style="width: 135px; height: 24px;"></td>
            <td style="height: 24px;"></td>
            <td style="height: 24px; width: 39px"></td>
        </tr>
        <tr>
            <td style="width: 67px">&nbsp;</td>
            <td style="width: 170px" rowspan="3">&nbsp;</td>
            <td colspan="4" rowspan="10">
                <asp:GridView ID="GridViewSach" runat="server" AllowSorting="True" AutoGenerateSelectButton="True" CellPadding="3" OnSelectedIndexChanged="GridViewSach_SelectedIndexChanged" Width="770px" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellSpacing="2">
                    <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                    <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                    <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                    <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#FFF1D4" />
                    <SortedAscendingHeaderStyle BackColor="#B95C30" />
                    <SortedDescendingCellStyle BackColor="#F1E5CE" />
                    <SortedDescendingHeaderStyle BackColor="#93451F" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td style="width: 67px">&nbsp;</td>
        </tr>
        <tr>
            <td rowspan="2" style="width: 67px">&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 67px">&nbsp;</td>
            <td style="width: 170px" rowspan="7">&nbsp;</td>
        </tr>
        <tr>
            <td style="height: 31px; width: 67px;"></td>
        </tr>
        <tr>
            <td style="width: 67px">&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 67px">&nbsp;</td>
        </tr>
        <tr>
            <td style="height: 24px; width: 67px;"></td>
        </tr>
        <tr>
            <td style="height: 24px; width: 67px;"></td>
        </tr>
        <tr>
            <td style="width: 67px">&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 67px">&nbsp;</td>
            <td style="width: 170px">&nbsp;</td>
            <td colspan="2">&nbsp;</td>
            <td>&nbsp;</td>
            <td style="width: 39px">&nbsp;</td>
        </tr>
    </table>
</asp:Content>
