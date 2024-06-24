<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="QLTV.Module.BaoCao.TinhHinhPhucVu.index" %>

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
            <td style="width: 923px">&nbsp;</td>
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
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="X-Large" ForeColor="White" Text="Thống kê tình hình phục vụ sách của thư viện (6 tháng gần đây)"></asp:Label>
            </td>
            <td colspan="7" style="background-color: rgb(75, 83, 102); height: 28px;" >
                <asp:Button ID="ButtonExport" runat="server" CssClass="btn btn-success" Text="Excel" Width="84px" OnClick="ButtonExport_Click" />
            </td>
            <td style="height: 28px"></td>
        </tr>
        <tr>
            <td style="height: 21px"></td>
            <td style="height: 21px"></td>
            <td style="height: 21px"></td>
            <td style="height: 21px"></td>
            <td style="height: 21px"></td>
            <td style="height: 21px"></td>
            <td style="height: 21px"></td>
            <td style="height: 21px; width: 923px"></td>
            <td style="height: 21px"></td>
            <td style="height: 21px"></td>
            <td style="height: 21px"></td>
            <td style="height: 21px"></td>
            <td style="height: 21px"></td>
            <td style="height: 21px"></td>
            <td style="height: 21px"></td>
            <td style="height: 21px"></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>
                <asp:Label ID="Label2" runat="server" Font-Bold="True" Text="Tên sách :"></asp:Label>
            </td>
            <td style="width: 923px">
                <asp:TextBox ID="TextBoxTimKiem" runat="server" Width="283px"></asp:TextBox>
            </td>
            <td>
                <asp:Button ID="ButtonTimKiem" runat="server" CssClass="btn btn-primary" Text="Tìm kiếm" OnClick="ButtonTimKiem_Click" />
            </td>
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
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td style="width: 923px">&nbsp;</td>
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
            <td colspan="14" rowspan="3">

                <asp:GridView ID="GridViewData" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="1349px">

                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" />
                        <asp:TemplateField HeaderText="Ảnh">
                            <ItemTemplate>
                                <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("ImageUrl") %>' Width="50px" Height="50px" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Tên Sách" HeaderText="Tên Sách" />
                        <asp:BoundField DataField="Tổng SL" HeaderText="Tổng SL" />
                                <asp:BoundField DataField="Đang mượn" HeaderText="Đang mượn" />
                        <asp:BoundField DataField="SL Phục vụ" HeaderText="SL Phục vụ" />
                        <asp:BoundField DataField="TL Tốt" HeaderText="TL Tốt" />
                        <asp:BoundField DataField="TL Xấu" HeaderText="TL Xấu" />
                        <asp:BoundField DataField="TL Bồi thường" HeaderText="TL Bồi thường" />
                        <asp:BoundField DataField="Tiền Bồi thường" HeaderText="Tiền Bồi thường" />
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
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
