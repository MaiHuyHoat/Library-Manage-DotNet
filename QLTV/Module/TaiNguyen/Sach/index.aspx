<%@ Page Async="true" Title=""   Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="QLTV.Module.TaiNguyen.Sach.index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <table class="w-100">
        <tr>
            <td style="width: 446px">&nbsp;</td>
            <td style="width: 110px">&nbsp;</td>
            <td style="width: 338px">&nbsp;</td>
            <td style="width: 135px">&nbsp;</td>
            <td>&nbsp;</td>
            <td style="width: 39px">&nbsp;</td>
            <td rowspan="2" style="width: 67px">&nbsp;</td>
            <td rowspan="2" style="width: 122px">&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 446px">&nbsp;</td>
            <td style="width: 110px">&nbsp;</td>
            <td style="width: 338px">&nbsp;</td>
            <td style="width: 135px">&nbsp;</td>
            <td>&nbsp;</td>
            <td style="width: 39px">&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 446px;"></td>
            <td colspan="5" style="background-color: rgb(75, 83, 102)">
                <asp:Label ID="Label14" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Thao tác" ForeColor="White"></asp:Label>
            </td>
            <td rowspan="2" style="width: 67px">&nbsp;</td>
            <td rowspan="2" style="width: 122px">&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 446px; height: 21px;"></td>
            <td style="width: 110px; height: 21px;"></td>
            <td style="width: 338px; height: 21px;"></td>
            <td style="width: 135px; height: 21px;"></td>
            <td style="height: 21px; "></td>
            <td style="width: 39px; height: 21px;"></td>
        </tr>
        <tr>
            <td style="width: 446px">&nbsp;</td>
            <td style="width: 110px">&nbsp;</td>
            <td style="width: 338px">&nbsp;</td>
            <td style="width: 135px">&nbsp;</td>
            <td>&nbsp;</td>
            <td style="width: 39px"></td>
            <td rowspan="2" style="width: 67px">&nbsp;</td>
            <td rowspan="2" style="width: 122px">&nbsp;</td>
        </tr>
        <tr>
            <td style="height: 21px; width: 446px"></td>
            <td style="height: 21px; width: 110px">
                <asp:Label ID="Label5" runat="server" Font-Bold="True" Text="Tên sách : "></asp:Label>
            </td>
            <td style="width: 338px; height: 21px">
                <asp:TextBox ID="TextBoxTen" runat="server" Width="220px" OnTextChanged="TextBoxTen_TextChanged"></asp:TextBox>
            </td>
            <td style="width: 135px; height: 21px">
                <asp:Label ID="Label9" runat="server" Font-Bold="True" Text="Giá : "></asp:Label>
            </td>
            <td style="height: 21px">
                <asp:TextBox ID="TextBoxGia" runat="server" Width="220px"></asp:TextBox>
            </td>
            <td style="height: 21px; width: 39px">
                <asp:Button ID="ButtonThem" runat="server" CssClass="btn btn-success" OnClick="ButtonThem_Click" Text="Thêm" />
                </td>
        </tr>
        <tr>
            <td style="width: 446px; height: 32px;"></td>
            <td style="width: 110px; height: 32px;">
                <asp:Label ID="Label7" runat="server" Font-Bold="True" Text="Thể loại : "></asp:Label>
            </td>
            <td style="width: 338px; height: 32px;">
                <asp:DropDownList ID="DropDownListTheLoai" runat="server" Width="129px">
                </asp:DropDownList>
            </td>
            <td style="width: 135px; height: 32px;">
                <asp:Label ID="Label10" runat="server" Font-Bold="True" Text="Số lượng : "></asp:Label>
            </td>
            <td style="height: 32px;">
                <asp:TextBox ID="TextBoxSoLuong" runat="server" Width="220px"></asp:TextBox>
            </td>
            <td style="width: 39px; height: 32px;">
                <asp:Button ID="ButtonSua" runat="server" CssClass="btn btn-warning  mt-2" OnClick="ButtonSua_Click" Text="Sửa" Width="59px" />
                </td>
            <td rowspan="2" style="width: 67px">&nbsp;</td>
            <td rowspan="2" style="width: 122px">&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 446px; height: 25px;"></td>
            <td style="width: 110px; height: 25px;">
                <asp:Label ID="Label8" runat="server" Font-Bold="True" Text="Tác giả:"></asp:Label>
            </td>
            <td style="width: 338px; height: 25px;">
                <asp:DropDownList ID="DropDownListTacGia" runat="server" Width="129px">
                </asp:DropDownList>
            </td>
            <td style="width: 135px; height: 25px;">
                <asp:Label ID="Label12" runat="server" Font-Bold="True" Text="Số trang : "></asp:Label>
            </td>
            <td style="height: 25px;">
                <asp:TextBox ID="TextBoxSoTrang" runat="server" Width="220px"></asp:TextBox>
            </td>
            <td style="width: 39px; height: 25px">
                <asp:Button ID="ButtonXoa" runat="server" CssClass="btn btn-danger  mt-2" OnClick="ButtonXoa_Click" Text="Xoá" />
                </td>
        </tr>
        <tr>
            <td style="width: 446px">&nbsp;</td>
            <td style="width: 110px">
                <asp:Label ID="Label13" runat="server" Font-Bold="True" Text="Nhà xuất bản: "></asp:Label>
            </td>
            <td style="width: 338px; height: 21px">
                <asp:DropDownList ID="DropDownListNhaXuatBan" runat="server" Width="129px">
                </asp:DropDownList>
            </td>
            <td style="width: 135px;">
                <asp:Label ID="Label11" runat="server" Font-Bold="True" Text="Ảnh : "></asp:Label>
                <asp:Image ID="Image1" runat="server" />
            </td>
            <td>
                <asp:FileUpload ID="FileUploadImage" runat="server" />
            </td>
            <td style="width: 39px">
                <asp:Button ID="ButtonHuy0" runat="server" CssClass="btn btn-secondary mt-2" OnClick="ButtonHuy_Click" Text="Huỷ" />
            </td>
            <td rowspan="2" style="width: 67px">&nbsp;</td>
            <td rowspan="2" style="width: 122px">&nbsp;</td>
        </tr>
        <tr>
            <td style="height: 25px; width: 446px;"></td>
            <td style="width: 110px; height: 25px;">
                <asp:Label ID="Label4" runat="server" Font-Bold="True" Text="ID : " Visible="False"></asp:Label>
            </td>
            <td style="width: 338px; height: 25px;">
                <asp:TextBox ID="TextBoxID" runat="server" Width="220px" Visible="False"></asp:TextBox>
            </td>
            <td style="width: 135px; height: 25px;">
                </td>
            <td style="height: 25px">
                </td>
            <td style="height: 25px; width: 39px"></td>
        </tr>
        <tr>
            <td style="height: 27px; width: 446px;"></td>
            <td style="width: 110px; height: 27px;"></td>
            <td style="width: 338px; height: 27px;">&nbsp;</td>
            <td style="width: 135px; height: 27px;">
                &nbsp;</td>
            <td style="height: 27px;">
                </td>
            <td style="height: 27px; width: 39px;"></td>
            <td rowspan="2" style="width: 67px">&nbsp;</td>
            <td rowspan="2" style="width: 122px">&nbsp;</td>
        </tr>
        <tr>
    <td style="width: 446px;"></td>
    <td colspan="5" style="background-color: rgb(75, 83, 102)">
        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Danh sách " ForeColor="White"></asp:Label>
    </td>
    <td rowspan="2" style="width: 67px">&nbsp;</td>
    <td rowspan="2" style="width: 122px">&nbsp;</td>
</tr>
        <tr>
            <td style="width: 446px">&nbsp;</td>
            <td style="width: 110px; height: 24px;" rowspan="2"></td>
            <td style="width: 338px; height: 24px;" rowspan="2"></td>
            <td style="width: 135px; height: 24px;" rowspan="2"></td>
            <td style="height: 24px; " rowspan="2"></td>
            <td style="height: 24px; width: 39px" rowspan="2"></td>
            <td style="height: 24px; width: 67px;" rowspan="2"></td>
            <td style="height: 24px; width: 122px;" rowspan="2"></td>
        </tr>
        <tr>
            <td style="width: 446px">&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 446px">&nbsp;</td>
            <td style="width: 110px">
                <asp:Label ID="Label16" runat="server" Font-Bold="True" Text="Ngày tạo :"></asp:Label>
            </td>
            <td style="width: 338px">
                <asp:DropDownList ID="DropDownListNgayTaoDS" runat="server" Width="142px">
                </asp:DropDownList>
            </td>
            <td style="width: 135px">
                <asp:Label ID="Label15" runat="server" Font-Bold="True" Text="Tác giả :"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="DropDownListTacGiaDS" runat="server" Width="144px">
                </asp:DropDownList>
            </td>
            <td style="width: 39px">
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Tìm kiếm" />
            </td>
            <td style="width: 67px">&nbsp;</td>
            <td style="width: 122px">&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 446px">&nbsp;</td>
            <td style="width: 110px; height: 39px;">
                <asp:Label ID="Label18" runat="server" Font-Bold="True" Text="Thể loại :"></asp:Label>
            </td>
            <td style="width: 338px; height: 39px;">
                <asp:DropDownList ID="DropDownListTheLoaiDS" runat="server" Width="144px">
                </asp:DropDownList>
            </td>
            <td style="width: 135px; height: 39px;">
                <asp:Label ID="Label17" runat="server" Font-Bold="True" Text="Tên sách :"></asp:Label>
            </td>
            <td style="height: 39px; ">
                <asp:TextBox ID="TextBoxSearch" runat="server" Width="288px"></asp:TextBox>
            </td>
            <td style="height: 39px; width: 39px"></td>
            <td style="height: 39px; width: 67px;"></td>
            <td style="height: 39px; width: 122px;"></td>
        </tr>
          <tr>
      <td style="width: 446px; height: 43px;"></td>
      <td style="width: 110px; height: 43px;"></td>
      <td style="width: 338px; height: 43px;"></td>
      <td style="height: 43px;"></td>
      <td style="height: 43px; "></td>
      <td style="height: 43px"></td>
      <td style="height: 43px; width: 67px;"></td>
  </tr>
        <tr>
            <td style="width: 446px">&nbsp;</td>
           <%-- <td style="width: 679px">&nbsp;</td>--%>
            <td colspan="5" rowspan="10">
                <asp:GridView ID="GridViewSach" runat="server" AllowSorting="True" AutoGenerateSelectButton="True" CellPadding="4" Width="1161px" AutoGenerateColumns="False" ForeColor="#333333" GridLines="None" OnPageIndexChanged="GridViewSach_PageIndexChanged" OnPageIndexChanging="GridViewSach_PageIndexChanging" AllowPaging="True">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" />
                        <asp:TemplateField HeaderText="Ảnh">
                            <ItemTemplate>
                                <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("ImageUrl") %>' Width="50px" Height="50px" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Tên Sách" HeaderText="Tên Sách" />
                        <asp:BoundField DataField="Tên Thể loại" HeaderText="Tên Thể loại" />
                        <asp:BoundField DataField="Tên Tác giả" HeaderText="Tên Tác giả" />
                        <asp:BoundField DataField="Đơn Giá" HeaderText="Đơn Giá" />
                        <asp:BoundField DataField="Số lượng" HeaderText="Số lượng" />
                        <asp:BoundField DataField="Ngày tạo" HeaderText="Ngày tạo" />
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
            <td style="width: 67px">&nbsp;</td>
            <td style="width: 122px">&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 446px">&nbsp;</td>
            <td style="width: 67px">&nbsp;</td>
            <td style="width: 122px">&nbsp;</td>
        </tr>
        <tr>
            <td rowspan="2" style="width: 446px">&nbsp;</td>
            <td style="width: 67px">&nbsp;</td>
            <td style="width: 122px">&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 679px">&nbsp;</td>
            <td style="width: 67px">&nbsp;</td>
            <td style="width: 122px">&nbsp;</td>
            <td style="width: 170px" rowspan="7">&nbsp;</td>
        </tr>
        <tr>
            <td style="height: 31px; width: 446px;"></td>
            <td style="width: 679px">&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 446px">&nbsp;</td>
            <td style="width: 679px">&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 446px">&nbsp;</td>
            <td style="width: 679px">&nbsp;</td>
        </tr>
        <tr>
            <td style="height: 24px; width: 446px;"></td>
            <td style="width: 679px">&nbsp;</td>
        </tr>
        <tr>
            <td style="height: 24px; width: 446px;"></td>
            <td style="width: 679px">&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 446px">&nbsp;</td>
            <td style="width: 679px">&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 446px">&nbsp;</td>
            <td style="width: 110px">&nbsp;</td>
            <td colspan="2">&nbsp;</td>
            <td>&nbsp;</td>
            <td style="width: 39px">&nbsp;</td>
            <td colspan="2">&nbsp;</td>
        </tr>
    </table>
</asp:Content>
