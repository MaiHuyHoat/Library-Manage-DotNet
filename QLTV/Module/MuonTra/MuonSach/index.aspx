<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="QLTV.Module.MuonTra.MuonSach.index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <table class="w-100">
        <tr>
            <td>&nbsp;</td>
            <td style="width: 166px">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td style="width: 12px">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td colspan="6" style="background-color: rgb(75, 83, 102)">
                <asp:Label ID="Label14" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Mượn / Trả" ForeColor="White"></asp:Label>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td style="width: 166px">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td style="width: 12px">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td style="width: 166px">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td style="width: 12px">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td rowspan="8" style="width: 166px">
                <asp:ImageButton ID="ImageButton1" runat="server" Height="184px" Width="210px" ImageUrl="~/Resources/image/book.png" />
            </td>
            <td>
                <asp:Label ID="Label15" runat="server" Font-Bold="True" Text="Mã sách: "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server" Width="213px"></asp:TextBox>
            </td>
            <td>
                <asp:Label ID="Label22" runat="server" Font-Bold="True" Text="Số CMT: "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox5" runat="server" Width="213px"></asp:TextBox>
            </td>
            <td style="width: 12px">
                <asp:Button ID="ButtonTraCuu" runat="server" CssClass="btn btn-primary" OnClick="ButtonTraCuu_Click" Text="Tra cứu" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="height: 27px"></td>
            <td style="height: 27px">
                <asp:Label ID="Label16" runat="server" Font-Bold="True" Text="Tên sách : "></asp:Label>
            </td>
            <td style="height: 27px">
                <asp:TextBox ID="TextBox2" runat="server" Width="211px"></asp:TextBox>
            </td>
            <td style="height: 27px">
                <asp:Label ID="Label23" runat="server" Font-Bold="True" Text="Tên độc giả: "></asp:Label>
            </td>
            <td style="height: 27px">
                <asp:TextBox ID="TextBox6" runat="server" Width="213px"></asp:TextBox>
            </td>
            <td style="height: 27px; width: 12px">&nbsp;</td>
            <td style="height: 27px"></td>
        </tr>
        <tr>
            <td style="height: 27px"></td>
            <td style="height: 27px">
                <asp:Label ID="Label17" runat="server" Font-Bold="True" Text="Thể loại: "></asp:Label>
            </td>
            <td style="height: 27px">
                <asp:DropDownList ID="DropDownList1" runat="server" Width="225px">
                </asp:DropDownList>
            </td>
            <td style="height: 27px">
                <asp:Label ID="Label24" runat="server" Font-Bold="True" Text="Chức vụ : "></asp:Label>
            </td>
            <td style="height: 27px">
                <asp:DropDownList ID="DropDownList4" runat="server" Width="225px">
                </asp:DropDownList>
            </td>
            <td style="height: 27px; width: 12px">
                <asp:Button ID="ButtonMuon" runat="server" CssClass="btn btn-success" OnClick="ButtonMuon_Click" Text="Mượn" />
            </td>
            <td style="height: 27px"></td>
        </tr>
        <tr>
            <td style="height: 22px"></td>
            <td style="height: 22px">
                <asp:Label ID="Label18" runat="server" Font-Bold="True" Text="Tác giả : "></asp:Label>
            </td>
            <td style="height: 22px">
                <asp:DropDownList ID="DropDownList2" runat="server" Width="225px">
                </asp:DropDownList>
            </td>
            <td style="height: 22px">
                <asp:Label ID="Label25" runat="server" Font-Bold="True" Text="Số sách được mượn : "></asp:Label>
            </td>
            <td style="height: 22px">
                <asp:TextBox ID="TextBoxSoSach" runat="server" Width="73px"></asp:TextBox>
                <asp:Label ID="Label29" runat="server" CssClass="m-2" Text="Sách" Font-Bold="True"></asp:Label>
                <asp:TextBox ID="TextBoxSoNgay" runat="server" Width="73px"></asp:TextBox>
                <asp:Label ID="Label30" runat="server" CssClass="m2" Text="Ngày" Font-Bold="True"></asp:Label>
            </td>
            <td style="height: 22px; width: 12px">
                <asp:Button ID="ButtonTra" runat="server" CssClass="btn btn-warning" OnClick="ButtonTra_Click" Text="Trả" />
            </td>
            <td style="height: 22px"></td>
        </tr>
        <tr>
            <td style="height: 21px"></td>
            <td style="height: 21px">
                <asp:Label ID="Label19" runat="server" Font-Bold="True" Text="Nhà xuất bản  : "></asp:Label>
            </td>
            <td style="height: 21px">
                <asp:DropDownList ID="DropDownList3" runat="server" Width="225px">
                </asp:DropDownList>
            </td>
            <td style="height: 21px">
                <asp:Label ID="Label26" runat="server" Font-Bold="True" Text="Số sách đã mượn  : "></asp:Label>
            </td>
            <td style="height: 21px">
                <asp:TextBox ID="TextBoxSoSach0" runat="server" Width="73px"></asp:TextBox>
                <asp:Label ID="Label31" runat="server" CssClass="m-2" Text="Sách" Font-Bold="True"></asp:Label>
                <asp:TextBox ID="TextBoxSoNgay0" runat="server" Width="73px"></asp:TextBox>
                <asp:Label ID="Label32" runat="server" CssClass="m2" Text="Ngày" Font-Bold="True"></asp:Label>
            </td>
            <td style="height: 21px; width: 12px"></td>
            <td style="height: 21px"></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:Label ID="Label20" runat="server" Font-Bold="True" Text="Ngày xuất bản : "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox3" runat="server" TextMode="DateTimeLocal" Width="211px"></asp:TextBox>
            </td>
            <td>
                <asp:Label ID="Label27" runat="server" Font-Bold="True" Text="Ngày tạo : "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox7" runat="server" TextMode="DateTimeLocal" Width="211px"></asp:TextBox>
            </td>
            <td style="width: 12px">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="height: 21px"></td>
            <td style="height: 21px">
                <asp:Label ID="Label21" runat="server" Font-Bold="True" Text="Giá : "></asp:Label>
            </td>
            <td style="height: 21px">
                <asp:TextBox ID="TextBox4" runat="server" Width="213px"></asp:TextBox>
            </td>
            <td style="height: 21px">
                <asp:Label ID="Label28" runat="server" Font-Bold="True" Text="Ngày hết hạn: "></asp:Label>
            </td>
            <td style="height: 21px">
                <asp:TextBox ID="TextBox8" runat="server" TextMode="DateTimeLocal" Width="211px"></asp:TextBox>
            </td>
            <td style="height: 21px; width: 12px"></td>
            <td style="height: 21px"></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td style="width: 12px">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td style="width: 166px">&nbsp;</td>
            <td>&nbsp;</td>
            <td>
                <asp:Label ID="Label33" runat="server" Font-Bold="True" Text="Hạn trả sách : "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox9" runat="server" TextMode="DateTimeLocal" Width="211px"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
            <td style="width: 12px">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td style="width: 166px">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td style="width: 12px">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td colspan="6" style="background-color: rgb(75, 83, 102)">
                <asp:Label ID="Label34" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Danh sách mượn" ForeColor="White"></asp:Label>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td style="width: 166px">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td style="width: 12px">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
          <tr>
      <td>&nbsp;</td>
      <td style="width: 166px">
                <asp:Label ID="Label35" runat="server" Font-Bold="True" Text="Ngày tạo : "></asp:Label>
              </td>
      <td>
                <asp:DropDownList ID="DropDownListNgayTao" runat="server" Width="225px">
                </asp:DropDownList>
              </td>
      <td>&nbsp;</td>
      <td>
                <asp:Label ID="Label36" runat="server" Font-Bold="True" Text="Số CMT: "></asp:Label>
              </td>
      <td>
                <asp:TextBox ID="TextBoxSoCMTDS" runat="server" Width="213px"></asp:TextBox>
              </td>
      <td style="width: 12px">
                <asp:Button ID="ButtonTimKiem" runat="server" OnClick="ButtonTimKiem_Click" Text="Tìm kiếm" />
              </td>
      <td>&nbsp;</td>
  </tr>
                <tr>
    <td>&nbsp;</td>
    <td style="width: 166px">&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td style="width: 12px">&nbsp;</td>
    <td>&nbsp;</td>
</tr>
        <tr>
            <td>&nbsp;</td>
            <td colspan="6" rowspan="4">

                <asp:GridView ID="GridViewData" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" Width="1291px" AllowPaging="True" AutoGenerateSelectButton="True">
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" />
                        <asp:TemplateField HeaderText="Ảnh">
                            <ItemTemplate>
                                <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("ImageUrl") %>' Width="50px" Height="50px" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Tên Sách" HeaderText="Tên Sách" />
                        <asp:BoundField DataField="Người mượn" HeaderText="Người mượn" />
                        <asp:BoundField DataField="Chứng minh thư" HeaderText="Chứng minh thư" />
                        <asp:BoundField DataField="Ngày mượn" HeaderText="Ngày mượn" />
                        <asp:BoundField DataField="Hạn trả" HeaderText="Hạn trả" />
                      
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
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
