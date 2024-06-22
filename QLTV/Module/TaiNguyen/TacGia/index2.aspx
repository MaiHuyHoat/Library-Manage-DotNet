<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="index2.aspx.cs" Inherits="QLTV.Module.TaiNguyen.TacGia.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <table class="w-100">
    <tr>
        <td>&nbsp;</td>
        <td style="width: 188px">&nbsp;</td>
        <td style="width: 215px">
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Quản lý tác giả"></asp:Label>
        </td>
        <td style="width: 306px">
            &nbsp;</td>
        <td style="width: 145px">&nbsp;</td>
        <td style="width: 106px">&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td style="width: 188px">&nbsp;</td>
        <td style="width: 215px">&nbsp;</td>
        <td style="width: 306px">&nbsp;</td>
        <td style="width: 145px">&nbsp;</td>
        <td style="width: 106px">&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td style="height: 21px"></td>
        <td style="height: 21px; width: 188px"></td>
        <td style="height: 21px; width: 215px">&nbsp;</td>
        <td style="height: 21px; width: 306px">&nbsp;</td>
        <td style="height: 21px; width: 145px;">&nbsp;</td>
        <td style="height: 21px; width: 106px;"></td>
        <td style="height: 21px"></td>
        <td style="height: 21px"></td>
    </tr>
    <tr>
        <td rowspan="2">&nbsp;</td>
        <td style="width: 188px" rowspan="2">&nbsp;</td>
        <td style="width: 215px" rowspan="2">&nbsp;</td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
        <td rowspan="2">&nbsp;</td>
        <td rowspan="2">&nbsp;</td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td style="height: 21px; width: 188px">
            &nbsp;</td>
        <td style="height: 21px; width: 270px">
            <asp:Label ID="Label4" runat="server" Font-Bold="True" Text="ID : "></asp:Label>
        </td>
        <td style="width: 215px; height: 21px">
            <asp:TextBox ID="TextBoxID" runat="server" Width="220px"></asp:TextBox>
        </td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
        <td style="height: 21px"></td>
        <td style="height: 21px"></td>
    </tr>
    <tr>
        <td style="width: 188px">
            &nbsp;</td>
        <td style="width: 270px">
            <asp:Label ID="Label5" runat="server" Font-Bold="True" Text="Tên tác giả : "></asp:Label>
        </td>
        <td style="width: 215px">
            <asp:TextBox ID="TextBoxTen" runat="server" Width="220px"></asp:TextBox>
        </td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
        <td style="height: 21px; width: 188px">&nbsp;</td>
        <td style="height: 21px; width: 270px">&nbsp;</td>
    </tr>
    <tr>
        <td style="width: 188px">&nbsp;</td>
        <td style="width: 270px">&nbsp;</td>
        <td style="width: 215px">&nbsp;</td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
        <td style="width: 188px">&nbsp;</td>
        <td style="width: 270px">&nbsp;</td>
    </tr>
    <tr>
        <td style="width: 188px">&nbsp;</td>
        <td style="width: 270px">
            &nbsp;</td>
        <td style="width: 215px; height: 21px">
            <asp:Button ID="ButtonThem" runat="server" CssClass="btn btn-success" OnClick="ButtonThem_Click" Text="Thêm" />
            <asp:Button ID="ButtonSua" runat="server" CssClass="btn btn-warning" OnClick="ButtonSua_Click" Text="Sửa" Width="59px" />
            <asp:Button ID="ButtonXoa" runat="server" CssClass="btn btn-danger" OnClick="ButtonXoa_Click" Text="Xoá" />
            <asp:Button ID="ButtonHuy0" runat="server" CssClass="btn btn-secondary" OnClick="ButtonHuy_Click" Text="Huỷ" />
        </td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
        <td style="width: 188px">&nbsp;</td>
        <td style="width: 270px">&nbsp;</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td style="width: 188px">&nbsp;</td>
        <td style="width: 215px">&nbsp;</td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
        <td style="width: 188px">&nbsp;</td>
        <td style="width: 270px">&nbsp;</td>
    </tr>
    <tr>
        <td style="height: 27px"></td>
        <td style="width: 188px; height: 27px;">
            <asp:Label ID="Label6" runat="server" Font-Bold="True" Text="Tên tác giả :"></asp:Label>
        </td>
        <td style="width: 215px; height: 27px;">
            <asp:TextBox ID="TextBoxSearch" runat="server" Width="288px"></asp:TextBox>
        </td>
        <td style="height: 27px">
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Tìm kiếm" />
        </td>
        <td style="height: 27px">
        </td>
        <td style="height: 27px">
        </td>
        <td style="height: 27px"></td>
        <td style="height: 27px"></td>
    </tr>
    <tr>
        <td style="height: 21px"></td>
        <td style="width: 188px; height: 21px;"></td>
        <td style="width: 215px; height: 21px;"></td>
        <td style="height: 21px">
        </td>
        <td style="height: 21px">
        </td>
        <td style="height: 21px">
        </td>
        <td style="height: 21px"></td>
        <td style="height: 21px"></td>
    </tr>
    <tr>
        <td rowspan="10">&nbsp;</td>
        <td style="width: 188px" rowspan="10">&nbsp;</td>
        <td style="width: 215px">&nbsp;</td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td style="width: 215px">
            <asp:GridView ID="GridViewTacGia" runat="server" AllowSorting="True" AutoGenerateSelectButton="True" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridViewTacGia_SelectedIndexChanged" Width="531px">
                <AlternatingRowStyle BackColor="White" />
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
        </td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td style="width: 215px">&nbsp;</td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td style="width: 215px">&nbsp;</td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td style="width: 215px">&nbsp;</td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td style="width: 215px">&nbsp;</td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td style="width: 215px">&nbsp;</td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td style="width: 215px">&nbsp;</td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td style="width: 215px">&nbsp;</td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td style="width: 215px">&nbsp;</td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td style="width: 188px">&nbsp;</td>
        <td style="width: 215px">&nbsp;</td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td style="width: 188px">&nbsp;</td>
        <td style="width: 215px">&nbsp;</td>
        <td style="width: 306px">&nbsp;</td>
        <td style="width: 145px">&nbsp;</td>
        <td style="width: 106px">&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td style="width: 188px">&nbsp;</td>
        <td style="width: 215px">&nbsp;</td>
        <td style="width: 306px">&nbsp;</td>
        <td style="width: 145px">&nbsp;</td>
        <td style="width: 106px">&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td style="width: 188px">&nbsp;</td>
        <td style="width: 215px">&nbsp;</td>
        <td style="width: 306px">&nbsp;</td>
        <td style="width: 145px">&nbsp;</td>
        <td style="width: 106px">&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td style="width: 188px">&nbsp;</td>
        <td style="width: 215px">&nbsp;</td>
        <td style="width: 306px">&nbsp;</td>
        <td style="width: 145px">&nbsp;</td>
        <td style="width: 106px">&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td style="width: 188px">&nbsp;</td>
        <td style="width: 215px">&nbsp;</td>
        <td style="width: 306px">&nbsp;</td>
        <td style="width: 145px">&nbsp;</td>
        <td style="width: 106px">&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td style="width: 188px">&nbsp;</td>
        <td style="width: 215px">&nbsp;</td>
        <td style="width: 306px">&nbsp;</td>
        <td style="width: 145px">&nbsp;</td>
        <td style="width: 106px">&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td style="width: 188px">&nbsp;</td>
        <td style="width: 215px">&nbsp;</td>
        <td style="width: 306px">&nbsp;</td>
        <td style="width: 145px">&nbsp;</td>
        <td style="width: 106px">&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
</table>

</asp:Content>
