<%@Page Async="true" Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="QLTV.Module.MuonTra.LichSu.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <table class="w-100">
    <tr>
        <td style="width: 1%">&nbsp;</td>
        <td colspan="2">&nbsp;</td>
        <td style="width: 19%" class="w-25">&nbsp;</td>
        <td style="width: 1%" class="w-25">&nbsp;</td>
        <td style="width: 23%">&nbsp;</td>
        <td style="width: 14%">&nbsp;</td>
        <td style="width: 2%">&nbsp;</td>
    </tr>
    <tr>
        <td style="width: 1%; height: 29px;"></td>
        <td style="height: 29px;" colspan="2"></td>
        <td style="width: 19%; height: 29px;"></td>
        <td style="width: 1%; height: 29px;"></td>
        <td style="height: 29px; width: 23%;"></td>
        <td style="width: 14%; height: 29px;"></td>
        <td style="width: 2%; height: 29px;">&nbsp;</td>
    </tr>
    <tr>
        <td style="width: 1%;"></td>
        <td colspan="6" style="background-color: rgb(75, 83, 102)">
            <asp:Label ID="Label14" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Lịch sử mượn/trả" ForeColor="White"></asp:Label>
        </td>
        <td style="background-color: rgb(75, 83, 102); width: 2%;">
            &nbsp;</td>
    </tr>
    <tr>
        <td style="width: 1%; height: 21px;"></td>
        <td style="width: 14%; height: 21px;"></td>
        <td style="width: 21%; height: 21px;"></td>
        <td style="width: 19%; height: 21px;"></td>
        <td style="width: 1%; height: 21px;"></td>
        <td style="height: 21px; width: 23%;"></td>
        <td style="width: 14%; height: 21px;"></td>
        <td style="width: 2%; height: 21px;">&nbsp;</td>
    </tr>
    <tr>
        <td style="width: 1%">&nbsp;</td>
        <td style="width: 14%">&nbsp;</td>
        <td style="width: 21%">&nbsp;</td>
        <td style="width: 19%" class="w-25">&nbsp;</td>
        <td style="width: 1%" class="w-25">&nbsp;</td>
        <td style="width: 23%">&nbsp;</td>
        <td style="width: 14%"></td>
        <td style="width: 2%">&nbsp;</td>
    </tr>
    <tr>
        <td style="height: 21px; width: 1%"></td>
        <td style="width: 14%" rowspan="4">
                <asp:ImageButton ID="ImageButtonBook" runat="server" Height="174px" Width="162px" ImageUrl="~/Resources/image/book.png" />
        </td>
        <td style="height: 21px; width: 21%">
            <asp:Label ID="Label5" runat="server" Font-Bold="True" Text="Tên sách : "></asp:Label>
        </td>
        <td style="width: 19%; height: 21px">
            <asp:TextBox ID="TextBoxTen" runat="server" Width="205px" OnTextChanged="TextBoxTen_TextChanged"></asp:TextBox>
        </td>
        <td style="width: 1%; height: 21px">
            <asp:Label ID="Label9" runat="server" Font-Bold="True" Text="Người mượn:"></asp:Label>
        </td>
        <td style="height: 21px; width: 23%;">
            <asp:TextBox ID="TextBoxNguoiMuon" runat="server" Width="205px"></asp:TextBox>
        </td>
        <td style="height: 21px; width: 14%"></td>
        <td style="height: 21px; width: 2%"></td>
    </tr>
    <tr>
        <td style="width: 1%; height: 32px;"></td>
        <td style="width: 21%; height: 32px;">
            <asp:Label ID="Label26" runat="server" Font-Bold="True" Text="Giá : "></asp:Label>
        </td>
        <td style="width: 19%; height: 32px;">
            <asp:TextBox ID="TextBoxGia" runat="server" Width="205px" OnTextChanged="TextBoxTen_TextChanged"></asp:TextBox>
        </td>
        <td style="width: 1%; height: 32px;">
            <asp:Label ID="Label10" runat="server" Font-Bold="True" Text="Số CMT: "></asp:Label>
        </td>
        <td style="height: 32px; width: 23%;">
            <asp:TextBox ID="TextBoxCmt" runat="server" Width="205px"></asp:TextBox>
        </td>
        <td style="width: 14%; height: 32px;">
            &nbsp;</td>
        <td style="width: 2%; height: 32px;">
            &nbsp;</td>
    </tr>
    <tr>
        <td style="width: 1%; height: 25px;"></td>
        <td style="width: 21%; height: 25px;">
            <asp:Label ID="Label7" runat="server" Font-Bold="True" Text="Tình trạng trả sách : "></asp:Label>
        </td>
        <td style="width: 19%; height: 25px;">
            <asp:DropDownList ID="DropDownTinhTrang" runat="server" Width="205px" AutoPostBack="true" OnSelectedIndexChanged="DropDownTinhTrang_SelectedIndexChanged">
            </asp:DropDownList>
        </td>
        <td style="width: 1%; height: 25px;">
            <asp:Label ID="Label8" runat="server" Font-Bold="True" Text="Chức vụ:"></asp:Label>
        </td>
        <td style="height: 25px; width: 23%;">
            <asp:DropDownList ID="DropDownListChucVu" runat="server" Width="205px">
            </asp:DropDownList>
        </td>
        <td style="width: 14%; height: 25px">
            &nbsp;</td>
        <td style="width: 2%; height: 25px">
            &nbsp;</td>
    </tr>
    <tr>
        <td style="width: 1%">&nbsp;</td>
        <td style="width: 21%">
            <asp:Label ID="Label13" runat="server" Font-Bold="True" Text="Hạn trả sách: "></asp:Label>
        </td>
        <td style="width: 19%; height: 21px">
            <asp:TextBox ID="TextBoxHanTra" runat="server" Width="205px" OnTextChanged="TextBoxTen_TextChanged" TextMode="DateTimeLocal"></asp:TextBox>
        </td>
        <td style="width: 1%;" class="w-25">
            <asp:Label ID="Label19" runat="server" Font-Bold="True" Text="Số sách được mượn : "></asp:Label>
        </td>
        <td style="width: 23%">
                <asp:TextBox ID="TextBoxSoSach" runat="server" Width="60px"></asp:TextBox>
                <asp:Label ID="Label21" runat="server" CssClass="m-2" Text="Sách /" Font-Bold="True"></asp:Label>
                <asp:TextBox ID="TextBoxSoNgay" runat="server" Width="60px" style="height: 28px"></asp:TextBox>
                <asp:Label ID="Label22" runat="server" CssClass="m2" Text="Ngày" Font-Bold="True"></asp:Label>
            </td>
        <td style="width: 14%">&nbsp;</td>
        <td style="width: 2%">&nbsp;</td>
    </tr>
    <tr>
        <td style="height: 25px; width: 1%;"></td>
        <td style="width: 14%; height: 25px;">
            &nbsp;</td>
        <td style="width: 21%; height: 25px;">
            <asp:Label ID="Label18" runat="server" Font-Bold="True" Text="Ngày trả sách: "></asp:Label>
        </td>
        <td style="width: 19%; height: 25px;">
            <asp:TextBox ID="TextBoxNgayTra" runat="server" Width="205px" OnTextChanged="TextBoxTen_TextChanged" TextMode="DateTimeLocal" AutoPostBack="true"></asp:TextBox>
        </td>
        <td style="width: 1%; height: 25px;">
            <asp:Label ID="Label20" runat="server" Font-Bold="True" Text="Số sách đã mượn:"></asp:Label>
        </td>
        <td style="height: 25px; width: 23%;">
                <asp:TextBox ID="TextBoxSoSachDaMuon" runat="server" Width="60px"></asp:TextBox>
                <asp:Label ID="Label23" runat="server" CssClass="m-2" Text="Sách /" Font-Bold="True"></asp:Label>
                <asp:TextBox ID="TextBoxSoNgay1" runat="server" Width="60px"></asp:TextBox>
                <asp:Label ID="Label24" runat="server" CssClass="m2" Text="Ngày" Font-Bold="True"></asp:Label>
            </td>
        <td style="height: 25px; width: 14%"></td>
        <td style="height: 25px; width: 2%"></td>
    </tr>
    <tr>
        <td style="height: 27px; width: 1%;"></td>
        <td style="width: 14%; height: 27px;">
            &nbsp;</td>
        <td style="width: 21%; height: 27px;">
            <asp:Label ID="Label25" runat="server" Font-Bold="True" Text="Số tiền phải trả:"></asp:Label>
        </td>
        <td style="width: 19%; height: 27px;">
            <asp:TextBox ID="TextBoxMoney" runat="server" Width="205px"></asp:TextBox>
        </td>
        <td style="width: 1%; height: 27px;">
            &nbsp;</td>
        <td style="height: 27px; width: 23%;">
            &nbsp;</td>
        <td style="height: 27px; width: 14%;"></td>
        <td style="height: 27px; width: 2%;">&nbsp;</td>
    </tr>
    <tr>
        <td style="height: 27px; width: 1%;"></td>
        <td style="width: 14%; height: 27px;">
            &nbsp;</td>
        <td style="width: 21%; height: 27px;">
            <asp:Label ID="Label4" runat="server" Font-Bold="True" Text="ID : " Visible="False"></asp:Label>
        </td>
        <td style="width: 19%; height: 27px;">
            <asp:TextBox ID="TextBoxID" runat="server" Width="205px" Visible="False"></asp:TextBox>
        </td>
        <td style="width: 1%; height: 27px;">
            <asp:Button ID="ButtonSua" runat="server" CssClass="btn btn-warning  mt-2" OnClick="ButtonSua_Click" Text="Sửa" Width="70px" />
            <asp:Button ID="ButtonHuy0" runat="server" CssClass="btn btn-secondary mt-2" OnClick="ButtonHuy_Click" Text="Huỷ" Width="71px" />
        </td>
        <td style="height: 27px; width: 23%;">
            &nbsp;</td>
        <td style="height: 27px; width: 14%;"></td>
        <td style="height: 27px; width: 2%;">&nbsp;</td>
    </tr>
    <tr>
        <td style="height: 27px; width: 1%;"></td>
        <td style="width: 14%; height: 27px;">
            &nbsp;</td>
        <td style="width: 21%; height: 27px;">
            &nbsp;</td>
        <td style="width: 19%; height: 27px;">
            &nbsp;</td>
        <td style="width: 1%; height: 27px;">
            &nbsp;</td>
        <td style="height: 27px; width: 23%;">
            &nbsp;</td>
        <td style="height: 27px; width: 14%;"></td>
        <td style="height: 27px; width: 2%;">&nbsp;</td>
    </tr>
    <tr>
        <td style="width: 1%;"></td>
        <td colspan="6" style="background-color: rgb(75, 83, 102)">
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Danh sách " ForeColor="White"></asp:Label>
        </td>
        <td style="background-color: rgb(75, 83, 102); width: 2%;">
            &nbsp;</td>
        <td rowspan="2" style="width: 1%">&nbsp;</td>
        <td rowspan="2" style="width: 1%">&nbsp;</td>
    </tr>
    <tr>
        <td style="width: 1%">&nbsp;</td>
        <td style="height: 24px;" rowspan="2"></td>
        <td style="height: 24px;" rowspan="2"></td>
        <td style="width: 19%; height: 24px;" rowspan="2"></td>
        <td style="width: 1%; height: 24px;" rowspan="2"></td>
        <td style="height: 24px; width: 23%;" rowspan="2"></td>
        <td style="height: 24px; width: 14%" rowspan="2"></td>
        <td style="height: 24px; width: 2%" rowspan="2">&nbsp;</td>
    </tr>
    <tr>
        <td style="width: 1%">&nbsp;</td>
    </tr>
    <tr>
        <td style="width: 1%">&nbsp;</td>
        <td>&nbsp;</td>
        <td>
            <asp:Label ID="Label17" runat="server" Font-Bold="True" Text="Tìm kiếm theo CMT"></asp:Label>
            :</td>
        <td style="width: 19%" class="w-25">
            <asp:TextBox ID="TextBoxSearch" runat="server" Width="207px"></asp:TextBox>
        </td>
        <td style="width: 1%" class="w-25">
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Tìm kiếm" />
        </td>
        <td style="width: 23%">
            &nbsp;</td>
        <td style="width: 14%">&nbsp;</td>
        <td style="width: 2%">&nbsp;</td>
    </tr>
    <tr>
        <td style="width: 1%">&nbsp;</td>
        <td style="height: 39px;">&nbsp;</td>
        <td style="height: 39px;">&nbsp;</td>
        <td style="width: 19%; height: 39px;">&nbsp;</td>
        <td style="width: 1%; height: 39px;">&nbsp;</td>
        <td style="height: 39px; width: 23%;">&nbsp;</td>
        <td style="height: 39px; width: 14%"></td>
        <td style="height: 39px; width: 2%">&nbsp;</td>
    </tr>
    <tr>
        <td style="width: 1%; height: 43px;"></td>
        <td style="height: 43px;"></td>
        <td style="height: 43px;"></td>
        <td style="width: 19%; height: 43px;"></td>
        <td style="height: 43px; width: 1%;"></td>
        <td style="height: 43px; width: 23%;"></td>
        <td style="height: 43px; width: 14%;"></td>
        <td style="height: 43px; width: 2%;">&nbsp;</td>
    </tr>
    <tr>
        <td style="width: 1%">&nbsp;</td>
           <%-- <td style="width: 679px">&nbsp;</td>--%>
            <td colspan="6" rowspan="10">
                <asp:GridView ID="GridViewLichSu" runat="server" AllowSorting="True" AutoGenerateSelectButton="True" CellPadding="4" Width="1161px" AutoGenerateColumns="False" ForeColor="#333333" GridLines="None" OnPageIndexChanged="GridViewSach_PageIndexChanged" OnPageIndexChanging="GridViewSach_PageIndexChanging" AllowPaging="True" OnSelectedIndexChanged="GridViewSach_SelectedIndexChanged1">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" />
                        <asp:BoundField DataField="Người Mượn" HeaderText="Người Mượn" />
                        <asp:TemplateField HeaderText="Ảnh">
                            <ItemTemplate>
                                <asp:Image ID="Image2" runat="server" ImageUrl='<%# Eval("ImageUrl") %>' Width="50px" Height="50px" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Sách" HeaderText="Sách" />
                        <asp:BoundField DataField="Trạng thái trả sách" HeaderText="Trạng thái trả sách" />
                        <asp:BoundField DataField="Ngày phải trả / Ngày trả" HeaderText="Ngày phải trả / Ngày trả" />
                        <asp:BoundField DataField="Số tiền phải trả" HeaderText="Số tiền phải trả" />
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
            <td rowspan="10" style="width: 2%">
                &nbsp;</td>
    </tr>
    <tr>
        <td style="width: 1%">&nbsp;</td>
    </tr>
    <tr>
        <td rowspan="2" style="width: 1%">&nbsp;</td>
    </tr>
    <tr>
        <td style="width: 1%">&nbsp;</td>
        <td style="width: 1%" rowspan="7">&nbsp;</td>
    </tr>
    <tr>
        <td style="height: 31px; width: 1%;"></td>
    </tr>
    <tr>
        <td style="width: 1%">&nbsp;</td>
    </tr>
    <tr>
        <td style="width: 1%">&nbsp;</td>
    </tr>
    <tr>
        <td style="height: 24px; width: 1%;"></td>
    </tr>
    <tr>
        <td style="height: 24px; width: 1%;"></td>
    </tr>
    <tr>
        <td style="width: 1%">&nbsp;</td>
    </tr>
    <tr>
        <td style="width: 1%">&nbsp;</td>
        <td colspan="2">&nbsp;</td>
        <td colspan="2">&nbsp;</td>
        <td style="width: 23%">&nbsp;</td>
        <td style="width: 14%">&nbsp;</td>
        <td style="width: 2%">&nbsp;</td>
    </tr>
</table>
</asp:Content>
