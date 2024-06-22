<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="QLTV.Module.TaiNguyen.NhaXuatBan.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
            <table class="auto-style30">
        <tr>
            <td class="auto-style31">&nbsp;</td>
            <td class="auto-style32" style="width: 130px">&nbsp;</td>
            <td class="auto-style32">&nbsp;</td>
            <td class="auto-style33" style="width: 54px">&nbsp;</td>
            <td class="auto-style33" style="width: 94px">&nbsp;</td>
            <td style="width: 125px">&nbsp;</td>
            <td class="auto-style35">&nbsp;</td>
            <td class="auto-style36">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style31">&nbsp;</td>
            <td class="auto-style32" style="width: 130px">&nbsp;</td>
            <td class="auto-style32">&nbsp;</td>
            <td class="auto-style33" style="width: 54px">&nbsp;</td>
            <td class="auto-style33" style="width: 94px">&nbsp;</td>
            <td style="width: 125px">&nbsp;</td>
            <td class="auto-style35">&nbsp;</td>
            <td class="auto-style36">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style39"></td>
            <td colspan="7" style="background-color: rgb(75, 83, 102)" class="auto-style40">
                <asp:Label ID="Label14" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Thao tác" ForeColor="White"></asp:Label>
            </td>
        </tr>
      
        <tr>
            <td class="auto-style10"></td>
            <td class="auto-style43" style="width: 130px">
                &nbsp;</td>
            <td class="auto-style43">
                <asp:Label ID="Label7" runat="server" Font-Bold="True" Text="ID : " Visible="False"></asp:Label>
            </td>
            <td class="auto-style44" style="width: 54px">
                <asp:TextBox ID="TextBoxID0" runat="server" Width="273px" Visible="False"></asp:TextBox>
            </td>
            <td class="auto-style44" style="width: 94px">
                &nbsp;</td>
            <td style="width: 125px">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style10"></td>
            <td class="auto-style43" style="width: 130px">
                &nbsp;</td>
            <td class="auto-style43">
                <asp:Label ID="Label19" runat="server" Font-Bold="True" Text="Nhà Xuất Bản"></asp:Label>
            </td>
            <td class="auto-style44" style="width: 54px">
                <asp:TextBox ID="TextBoxID1" runat="server" Width="273px" ></asp:TextBox>
            </td>
            <td class="auto-style44" style="width: 94px">
                &nbsp;</td>
            <td style="width: 125px">
                &nbsp;</td>
            <td rowspan="2" style="width: 67px">&nbsp;</td>
            <td rowspan="2" style="width: 122px">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style10"></td>
            <td class="auto-style43" style="width: 130px">
                &nbsp;</td>
            <td class="auto-style43">
                &nbsp;</td>
            <td class="auto-style44" style="width: 54px">
                &nbsp;</td>
            <td class="auto-style44" style="width: 94px">
                &nbsp;</td>
            <td style="width: 125px">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style70"></td>
            <td class="auto-style71" style="width: 130px">
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
            <td class="auto-style69">
                &nbsp;</td>
            <td style="width: 125px">
            </td>
            <td rowspan="2" style="width: 67px">&nbsp;</td>
            <td rowspan="2" style="width: 122px">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style12"></td>
            <td class="auto-style46" style="width: 130px">
                </td>
            <td class="auto-style46">
                &nbsp;</td>
            <td class="auto-style19" style="width: 54px">
                </td>
            <td class="auto-style19" style="width: 94px">
                &nbsp;</td>
            <td style="width: 125px"></td>
        </tr>
        <tr>
    <td class="auto-style62"></td>
    <td colspan="7" style="background-color: rgb(75, 83, 102)" class="auto-style64">
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
            <td class="auto-style52" style="width: 130px">
            </td>
            <td class="auto-style52">
                <asp:Label ID="Label20" runat="server" Font-Bold="True" Text="Tên Nhà Xuất Bản:"></asp:Label>
            </td>
            <td class="auto-style73" style="width: 54px">
                <asp:TextBox ID="TextBox1" runat="server" Width="273px"></asp:TextBox>
            </td>
            <td class="auto-style73" style="width: 94px">
                &nbsp;</td>
            <td style="width: 125px">
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Tìm kiếm" CssClass="btn btn-warning  mt-2" Width="100px" />
            </td>
            <td class="auto-style66"></td>
            <td class="auto-style67"></td>
        </tr>
        <tr>
            <td class="auto-style9"></td>
           <%-- <td style="width: 679px">&nbsp;</td>--%>
            <td colspan="7" rowspan="6" class="auto-style56">
                <asp:GridView ID="GridViewSach" runat="server" AllowSorting="True" AutoGenerateSelectButton="True" CellPadding="4" Width="1161px" AutoGenerateColumns="False" ForeColor="#333333" GridLines="None" OnPageIndexChanged="GridViewSach_PageIndexChanged" OnPageIndexChanging="GridViewSach_PageIndexChanging" AllowPaging="True" OnSelectedIndexChanged="GridViewSach_SelectedIndexChanged">
      <AlternatingRowStyle BackColor="White" />
      <Columns>
          <asp:BoundField DataField="ID" HeaderText="ID" />
          <asp:BoundField DataField="Tên Nhà Xuất Bản" HeaderText="Tên Nhà Xuất Bản" />
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
            <td class="auto-style32" style="width: 130px">&nbsp;</td>
            <td class="auto-style32">&nbsp;</td>
            <td colspan="3" class="auto-style35">&nbsp;</td>
            <td class="auto-style35">&nbsp;</td>
            <td class="auto-style36">&nbsp;</td>
        </tr>
    </table>
</asp:Content>
