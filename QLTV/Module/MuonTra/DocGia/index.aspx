<%@ Page Async="true" Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="QLTV.Module.MuonTra.DocGia.index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <table class="w-100">
        <tr>
            <td style="width: 45px">&nbsp;</td>
            <td style="width: 165px">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 45px">&nbsp;</td>
            <td colspan="6" style="background-color: rgb(75, 83, 102)">
                <asp:Label ID="Label14" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Thao tác" ForeColor="White"></asp:Label>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 45px">&nbsp;</td>
            <td style="width: 165px">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 45px">&nbsp;</td>
            <td style="width: 165px">
                <asp:Label ID="Label5" runat="server" Font-Bold="True" Text="Tên độc giả : "></asp:Label>
             </td>
            <td>
                <asp:TextBox ID="TextBoxTen" runat="server" Width="220px"></asp:TextBox>
            </td>
            <td>
                <asp:Label ID="Label18" runat="server" Font-Bold="True" Text="Ngày sinh : "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBoxNgaySinh" runat="server" TextMode="DateTimeLocal" Width="211px"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 45px; height: 31px;"></td>
            <td style="width: 165px; height: 31px;">
                <asp:Label ID="Label15" runat="server" Font-Bold="True" Text="Địa chỉ : "></asp:Label>
            </td>
            <td style="height: 31px">
                <asp:TextBox ID="TextBoxDiaChi" runat="server" Width="220px" ></asp:TextBox>
            </td>
            <td style="height: 31px">
                <asp:Label ID="Label27" runat="server" Font-Bold="True" Text="Số CMT : "></asp:Label>
            </td>
            <td style="height: 31px">
                <asp:TextBox ID="TextBoxCMT" runat="server" Width="210px" ></asp:TextBox>
            </td>
            <td style="height: 31px">
                <asp:Button ID="ButtonThem" runat="server" CssClass="btn btn-success" OnClick="ButtonThem_Click" Text="Thêm" />
            </td>
            <td style="height: 31px"></td>
            <td style="height: 31px"></td>
        </tr>
        <tr>
            <td style="width: 45px">&nbsp;</td>
            <td style="width: 165px">
                <asp:Label ID="Label16" runat="server" Font-Bold="True" Text="Chức vụ : "></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="DropDownListChucVu" runat="server" Width="224px">
                </asp:DropDownList>
            </td>
            <td>
                <asp:Label ID="Label28" runat="server" Font-Bold="True" Text="Tiền cọc : "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBoxTienCoc" runat="server" Width="208px"></asp:TextBox>
            </td>
            <td>
                <asp:Button ID="ButtonSua" runat="server" CssClass="btn btn-warning  mt-2" OnClick="ButtonSua_Click" Text="Sửa" Width="59px" />
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="height: 21px; width: 45px;"></td>
            <td style="width: 165px; height: 21px;">
                <asp:Label ID="Label17" runat="server" Font-Bold="True" Text="Số sách được mượn: "></asp:Label>
            </td>
            <td style="height: 21px; display: flex">
                <asp:TextBox ID="TextBoxSoSach" runat="server" Width="73px"></asp:TextBox>
                <asp:Label ID="Label19" runat="server" CssClass="m-2" Text="Sách" Font-Bold="True"></asp:Label>
                <asp:TextBox ID="TextBoxSoNgay" runat="server" Width="73px"></asp:TextBox>
                <asp:Label ID="Label20" runat="server" CssClass="m2" Text="Ngày" Font-Bold="True"></asp:Label>
            </td>
            <td style="height: 21px">
                <asp:Label ID="Label29" runat="server" Font-Bold="True" Text="Ngày tạo: "></asp:Label>
            </td>
            <td style="height: 21px">
                <asp:TextBox ID="TextBoxNgayTao" runat="server" TextMode="DateTimeLocal" Width="211px"></asp:TextBox>
            </td>
            <td style="height: 21px">
                <asp:Button ID="ButtonXoa" runat="server" CssClass="btn btn-danger  mt-2" OnClick="ButtonXoa_Click" Text="Xoá" />
            </td>
            <td style="height: 21px"></td>
            <td style="height: 21px"></td>
        </tr>
        <tr>
            <td style="height: 21px; width: 45px;"></td>
            <td style="width: 165px; height: 21px;">
                <asp:Label ID="Label31" runat="server" Font-Bold="True" Text="ID : " Visible="False"></asp:Label>
             </td>
            <td style="height: 21px;">
                <asp:TextBox ID="TextBoxID" runat="server" Width="220px" Visible="False"></asp:TextBox>
            </td>
            <td style="height: 21px">
                <asp:Label ID="Label30" runat="server" Font-Bold="True" Text="Ngày hết hạn : "></asp:Label>
            </td>
            <td style="height: 21px">
                <asp:TextBox ID="TextBoxNgayHetHan" runat="server" TextMode="DateTimeLocal" Width="211px"></asp:TextBox>
            </td>
            <td style="height: 21px">
                <asp:Button ID="ButtonHuy0" runat="server" CssClass="btn btn-secondary mt-2" OnClick="ButtonHuy_Click" Text="Huỷ" />
            </td>
            <td style="height: 21px"></td>
            <td style="height: 21px"></td>
        </tr>
        <tr>
            <td style="width: 45px">&nbsp;</td>
            <td style="width: 165px">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 45px">&nbsp;</td>
            <td colspan="6" style="background-color: rgb(75, 83, 102)">
                <asp:Label ID="Label24" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Danh sách độc giả" ForeColor="White"></asp:Label>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 45px">&nbsp;</td>
            <td style="width: 165px">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 45px">&nbsp;</td>
            <td style="width: 165px">
                <asp:Label ID="Label25" runat="server" Font-Bold="True" Text="Chức vụ : "></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="DropDownListChucVuDS" runat="server" Width="210px">
                </asp:DropDownList>
            </td>
            <td>
                <asp:Label ID="Label26" runat="server" Font-Bold="True" Text="CMT : "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBoxCMTDS" runat="server" Width="233px"></asp:TextBox>
            </td>
            <td>
                <asp:Button ID="ButtonTimKiem" runat="server" CssClass="btn btn-primary" OnClick="ButtonTimKiem_Click" Text="Tìm kiếm" />
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 45px">&nbsp;</td>
            <td style="width: 165px">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 45px">&nbsp;</td>
            <td colspan="6" rowspan="3">
                <asp:GridView ID="GridViewDocGia" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="1241px" AutoGenerateColumns="False" AutoGenerateSelectButton="True" OnSelectedIndexChanged="GridViewDocGia_SelectedIndexChanged" >
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" />
                      
                        <asp:BoundField DataField="Tên" HeaderText="Tên " />
                        <asp:BoundField DataField="Ngày sinh" HeaderText="Ngày sinh" />
                        <asp:BoundField DataField="CMT" HeaderText="CMT" />
                        <asp:BoundField DataField="Chức vụ" HeaderText="Chức vụ" />
                        <asp:BoundField DataField="Ngày tạo" HeaderText="Ngày tạo" />
                       
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
            <td style="width: 45px">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 45px">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>

</asp:Content>
