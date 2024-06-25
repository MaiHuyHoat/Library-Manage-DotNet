<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="QLTV.Module.BaoCao.DocGiaHetHan.index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <table class="w-100">
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="height: 28px"></td>
            <td colspan="7" style="background-color: rgb(75, 83, 102); height: 28px;">
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="X-Large" ForeColor="White" Text="Danh sách độc giả hết hạn sử dụng"></asp:Label>
            </td>
            <td colspan="7" style="background-color: rgb(75, 83, 102); height: 28px; margin-left: 40px;">
                <asp:Button ID="ButtonExport" runat="server" CssClass="btn btn-success" Text="Excel" Width="84px" OnClick="ButtonExport_Click" />
            </td>
            <td style="height: 28px"></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="height: 27px"></td>
            <td style="height: 27px">
                <asp:Label ID="Label2" runat="server" Font-Bold="True" Text="Chức vụ :"></asp:Label>
            </td>
            <td style="height: 27px">
                <asp:DropDownList ID="DropDownListChucVu" runat="server" Width="186px">
                </asp:DropDownList>
            </td>
            <td style="height: 27px">
                <asp:Label ID="Label3" runat="server" Font-Bold="True" Text="CMT:"></asp:Label>
            </td>
            <td style="height: 27px">
                <asp:TextBox ID="TextBoxCMT" runat="server" Width="182px"></asp:TextBox>
            </td>
            <td style="height: 27px">
                <asp:Button ID="ButtonTimKiem" runat="server" CssClass="btn btn-primary" OnClick="ButtonTimKiem_Click" Text="Tìm kiếm" />
            </td>
            <td style="height: 27px"></td>
            <td style="height: 27px"></td>
            <td style="height: 27px"></td>
            <td style="height: 27px"></td>
            <td style="height: 27px"></td>
            <td style="height: 27px"></td>
            <td style="height: 27px"></td>
            <td style="height: 27px"></td>
            <td style="height: 27px"></td>
            <td style="height: 27px"></td>
        </tr>
      
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td colspan="14" rowspan="2">
                <asp:GridView ID="GridViewData" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="1352px">

                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" />
                       
                        <asp:BoundField DataField="Tên độc giả" HeaderText="Tên độc giả" />
                        <asp:BoundField DataField="Ngày sinh" HeaderText="Ngày sinh" />
                        <asp:BoundField DataField="CMT" HeaderText="CMT" />
                        <asp:BoundField DataField="Chức vụ" HeaderText="Chức vụ" />
                        <asp:BoundField DataField="Ngày cấp thẻ" HeaderText="Ngày cấp thẻ" />
                        <asp:BoundField DataField="Ngày hết hạn thẻ" HeaderText="Ngày hết hạn thẻ" />
                        <asp:BoundField DataField="Số sách đã mượn" HeaderText="Số sách đã mượn" />
                           <asp:BoundField DataField="Số sách đã trả" HeaderText="Số sách đã trả" />
                        <asp:BoundField DataField="Số sách chưa trả" HeaderText="Số sách chưa trả" />
                    </Columns>

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
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
