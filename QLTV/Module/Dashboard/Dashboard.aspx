<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="QLTV.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p>
    </p>
    <asp:Panel ID="Panel1" runat="server" BackColor="Gray" Height="71px">
        <table class="w-100">
            <tr>
                <td style="height: 13px; width: 56px"></td>
                <td style="height: 13px; width: 857px"></td>
                <td style="height: 13px; width: 260px"></td>
                <td style="height: 13px"></td>
                <td style="height: 13px"></td>
            </tr>
            <tr>
                <td style="width: 56px">&nbsp;</td>
                <td style="width: 857px">
                    <asp:Label ID="Label33" runat="server" Font-Bold="True" Font-Size="X-Large" ForeColor="White" Text="Dashboard"></asp:Label>
                </td>
                <td style="width: 260px">
                    <asp:Image ID="Image22" runat="server" Height="16px" ImageUrl="~/Module/Dashboard/dường_kẻ-removebg-preview.png" Width="239px" />
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </asp:Panel>
   
    <p>
        &nbsp;</p>
    <p>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Trong vòng tháng này&nbsp;</p>
    <table class="w-100" style="height: 115px">
        <tr>
            <td style="width: 99px; height: 138px;"></td>
            <td style="width: 215px; height: 138px;">
                <asp:Panel ID="Panel2" runat="server" BackColor="#FF6666" Height="104px">
                    <table class="w-100" style="height: 109px; width: 215px;">
                        <tr>
                            <td style="width: 20px; height: 25px;"></td>
                            <td style="width: 59px; height: 25px;"></td>
                            <td style="height: 25px;" colspan="4">
                                <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="X-Small" ForeColor="White" Text="Sách trong thư viện"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 20px; height: 27px;"></td>
                            <td style="width: 59px; height: 27px;">
                                <asp:Image ID="Image1" runat="server" ForeColor="#FF99CC" Height="47px" ImageUrl="~/Module/Dashboard/living-room-books-group (1).png" Width="55px" />
                            </td>
                            <td style="width: 29px; height: 27px;"></td>
                            <td style="width: 43px; height: 27px;">
                                <asp:Label ID="Label2" runat="server" BorderColor="White" Font-Bold="True" Font-Size="X-Large" ForeColor="White" Text="19"></asp:Label>
                            </td>
                            <td style="height: 27px;" colspan="2">
                                <asp:Label ID="Label3" runat="server" Font-Bold="True" ForeColor="White" Text="Đầu sách"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 20px">&nbsp;</td>
                            <td style="width: 59px">&nbsp;</td>
                            <td colspan="3">
                                <asp:Image ID="Image2" runat="server" Height="19px" ImageUrl="~/Module/Dashboard/more.png" Width="19px" />
                                &nbsp;
                                <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Size="Small" ForeColor="White" Text="More"></asp:Label>
                            </td>
                            <td style="width: 6px">&nbsp;</td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
            <td style="width: 70px; height: 138px;"></td>
            <td style="width: 215px; height: 138px;">
                <asp:Panel ID="Panel3" runat="server" BackColor="#66CCFF" Height="107px">
                    <table class="w-100" style="height: 115px; width: 215px;">
                        <tr>
                            <td style="width: 20px; height: 25px;"></td>
                            <td style="width: 59px; height: 25px;"></td>
                            <td style="height: 25px;" colspan="4">
                                <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="X-Small" ForeColor="White" Text="Sách đã cho mượn"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 20px; height: 27px;"></td>
                            <td style="width: 59px; height: 27px;">
                                <asp:Image ID="Image3" runat="server" ForeColor="#FF99CC" Height="47px" ImageUrl="~/Module/Dashboard/open-book.png" Width="55px" />
                            </td>
                            <td style="width: 29px; height: 27px;"></td>
                            <td style="width: 43px; height: 27px;">
                                <asp:Label ID="Label7" runat="server" BorderColor="White" Font-Bold="True" Font-Size="X-Large" ForeColor="White" Text="23"></asp:Label>
                            </td>
                            <td style="height: 27px;" colspan="2">
                                <asp:Label ID="Label8" runat="server" Font-Bold="True" ForeColor="White" Text="Đầu sách"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 20px">&nbsp;</td>
                            <td style="width: 59px">&nbsp;</td>
                            <td colspan="3">
                                <asp:Image ID="Image4" runat="server" Height="19px" ImageUrl="~/Module/Dashboard/more.png" Width="19px" />
                                &nbsp;
                                <asp:Label ID="Label9" runat="server" Font-Bold="True" Font-Size="Small" ForeColor="White" Text="More"></asp:Label>
                            </td>
                            <td style="width: 6px">&nbsp;</td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
            <td style="width: 70px; height: 138px;"></td>
            <td style="width: 215px; height: 138px;">
                <asp:Panel ID="Panel4" runat="server" BackColor="#FF9966" Height="104px">
                    <table class="w-100" style="height: 109px; width: 215px;">
                        <tr>
                            <td style="width: 20px; height: 25px;"></td>
                            <td style="width: 59px; height: 25px;"></td>
                            <td style="height: 25px;" colspan="4">
                                <asp:Label ID="Label10" runat="server" Font-Bold="True" Font-Size="X-Small" ForeColor="White" Text="Sách đã trả lại"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 20px; height: 27px;"></td>
                            <td style="width: 59px; height: 27px;">
                                <asp:Image ID="Image5" runat="server" ForeColor="#FF99CC" Height="47px" ImageUrl="~/Module/Dashboard/book.png" Width="55px" />
                            </td>
                            <td style="width: 29px; height: 27px;"></td>
                            <td style="width: 43px; height: 27px;">
                                <asp:Label ID="Label11" runat="server" BorderColor="White" Font-Bold="True" Font-Size="X-Large" ForeColor="White" Text="8"></asp:Label>
                            </td>
                            <td style="height: 27px;" colspan="2">
                                <asp:Label ID="Label12" runat="server" Font-Bold="True" ForeColor="White" Text="Đầu sách"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 20px">&nbsp;</td>
                            <td style="width: 59px">&nbsp;</td>
                            <td colspan="3">
                                <asp:Image ID="Image6" runat="server" Height="19px" ImageUrl="~/Module/Dashboard/more.png" Width="19px" />
                                &nbsp;
                                <asp:Label ID="Label13" runat="server" Font-Bold="True" Font-Size="Small" ForeColor="White" Text="More"></asp:Label>
                            </td>
                            <td style="width: 6px">&nbsp;</td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
            <td style="width: 70px; height: 138px;"></td>
            <td style="width: 215px; height: 138px;">
                <asp:Panel ID="Panel5" runat="server" BackColor="#FF6666" Height="104px">
                    <table class="w-100" style="height: 109px; width: 215px;">
                        <tr>
                            <td style="width: 20px; height: 25px;"></td>
                            <td style="width: 59px; height: 25px;"></td>
                            <td style="height: 25px;" colspan="4">
                                <asp:Label ID="Label14" runat="server" Font-Bold="True" Font-Size="X-Small" ForeColor="White" Text="Số tiền thu được"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 20px; height: 27px;"></td>
                            <td style="width: 59px; height: 27px;">
                                <asp:Image ID="Image7" runat="server" ForeColor="#FF99CC" Height="47px" ImageUrl="~/Module/Dashboard/profit.png" Width="55px" />
                            </td>
                            <td style="width: 29px; height: 27px;"></td>
                            <td style="width: 43px; height: 27px; font-size: x-large; color: #FFFFFF;">
                                <span style="font-weight: bold">0</span></td>
                            <td style="height: 27px;" colspan="2">
                                <asp:Label ID="Label16" runat="server" Font-Bold="True" ForeColor="White" Text="Đồng"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 20px">&nbsp;</td>
                            <td style="width: 59px">&nbsp;</td>
                            <td colspan="3">
                                <asp:Image ID="Image8" runat="server" Height="19px" ImageUrl="~/Module/Dashboard/more.png" Width="19px" />
                                &nbsp;
                                <asp:Label ID="Label17" runat="server" Font-Bold="True" Font-Size="Small" ForeColor="White" Text="More"></asp:Label>
                            </td>
                            <td style="width: 6px">&nbsp;</td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
            <td style="height: 138px"></td>
        </tr>
    </table>
    <p style="height: 23px">
        &nbsp;</p>
    <p>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Trong vòng 6 tháng&nbsp;</p>
    <table class="w-100" style="height: 341px">
        <tr>
            <td style="width: 95px">&nbsp;</td>
            <td style="width: 290px">
                <asp:Panel ID="Panel6" runat="server" BackColor="#CCCCCC" Height="320px">
                    <asp:Image ID="Image12" runat="server" Height="155px" ImageUrl="~/Module/Dashboard/a1.jpg" style="margin-top: 16px" Width="291px" />
                    <asp:Panel ID="Panel9" runat="server" Height="150px">
                        <table class="w-100" style="height: 151px">
                            <tr>
                                <td style="height: 31px"></td>
                            </tr>
                            <tr>
                                <td>
                                    <table class="w-100">
                                        <tr>
                                            <td style="width: 30px">&nbsp;</td>
                                            <td>
                                                <asp:Label ID="Label18" runat="server" Font-Bold="True" Text="Số tiền thu được"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table class="w-100">
                                        <tr>
                                            <td style="width: 30px">&nbsp;</td>
                                            <td>
                                                <asp:Label ID="Label19" runat="server" Font-Size="Small" Text="Tiền thu bởi dịch vụ mượn /trả sách"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td style="height: 32px">
                                    <table class="w-100" style="height: 31px; margin-top: 11px">
                                        <tr>
                                            <td style="width: 50px">&nbsp;</td>
                                            <td style="width: 30px">
                                                <asp:Image ID="Image15" runat="server" Height="16px" ImageUrl="~/Module/Dashboard/refresh-page-option (1).png" Width="16px" />
                                            </td>
                                            <td>
                                                <asp:Label ID="Label24" runat="server" Font-Size="X-Small" Text="update 15 minutes ago"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                    </asp:Panel>
                </asp:Panel>
            </td>
            <td style="width: 100px">&nbsp;</td>
            <td style="width: 290px">
                <asp:Panel ID="Panel7" runat="server" BackColor="#CCCCCC" Height="318px">
                    <asp:Image ID="Image13" runat="server" Height="159px" ImageUrl="~/Module/Dashboard/a2.jpg" style="margin-top: 14px" Width="290px" />
                    <asp:Panel ID="Panel12" runat="server" Height="150px">
                        <table class="w-100" style="height: 151px">
                            <tr>
                                <td style="height: 31px"></td>
                            </tr>
                            <tr>
                                <td>
                                    <table class="w-100">
                                        <tr>
                                            <td style="width: 30px">&nbsp;</td>
                                            <td>
                                                <asp:Label ID="Label27" runat="server" Font-Bold="True" Text="Số lượng sách mượn"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table class="w-100">
                                        <tr>
                                            <td style="width: 30px">&nbsp;</td>
                                            <td>
                                                <asp:Label ID="Label28" runat="server" Font-Size="Small" Text="Số lượng sách mượn của độc giả"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td style="height: 32px">
                                    <table class="w-100" style="height: 31px; margin-top: 11px">
                                        <tr>
                                            <td style="width: 50px">&nbsp;</td>
                                            <td style="width: 30px">
                                                <asp:Image ID="Image20" runat="server" Height="16px" ImageUrl="~/Module/Dashboard/refresh-page-option (1).png" Width="16px" />
                                            </td>
                                            <td>
                                                <asp:Label ID="Label29" runat="server" Font-Size="X-Small" Text="update 15 minutes ago"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                    </asp:Panel>
                </asp:Panel>
            </td>
            <td style="width: 100px">&nbsp;</td>
            <td style="width: 290px">
                <asp:Panel ID="Panel8" runat="server" BackColor="#CCCCCC" Height="319px">
                    <asp:Image ID="Image14" runat="server" ImageUrl="~/Module/Dashboard/a3.jpg" Height="159px" style="margin-top: 13px" Width="290px" />
                    <asp:Panel ID="Panel11" runat="server" Height="146px">
                        <asp:Panel ID="Panel13" runat="server" Height="150px">
                            <table class="w-100" style="height: 151px">
                                <tr>
                                    <td style="height: 31px"></td>
                                </tr>
                                <tr>
                                    <td>
                                        <table class="w-100">
                                            <tr>
                                                <td style="width: 30px">&nbsp;</td>
                                                <td>
                                                    <asp:Label ID="Label30" runat="server" Font-Bold="True" Text="Tình trạng trả sách"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <table class="w-100">
                                            <tr>
                                                <td style="width: 30px">&nbsp;</td>
                                                <td>
                                                    <asp:Label ID="Label31" runat="server" Font-Size="Small" Text="Thống kê tình trạng sau khi mượn"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="height: 32px">
                                        <table class="w-100" style="height: 31px; margin-top: 11px">
                                            <tr>
                                                <td style="width: 50px">&nbsp;</td>
                                                <td style="width: 30px">
                                                    <asp:Image ID="Image21" runat="server" Height="16px" ImageUrl="~/Module/Dashboard/refresh-page-option (1).png" Width="16px" />
                                                </td>
                                                <td>
                                                    <asp:Label ID="Label32" runat="server" Font-Size="X-Small" Text="update 15 minutes ago"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </asp:Panel>
                </asp:Panel>
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
    <p>
    </p>
    <p>
    </p>
    <p>
    </p>
    <p>
    </p>
    <p>
    </p>
    <p>
    </p>
    <p>
    </p>
    </asp:Content>
 
