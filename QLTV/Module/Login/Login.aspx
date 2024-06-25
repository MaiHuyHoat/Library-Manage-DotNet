<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="QLTV.Module.Login.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            height: 653px;
        }
        .auto-style2 {
            width: 69px;
        }
        .auto-style3 {
            width: 514px;
        }
        .auto-style5 {
            width: 405px;
        }
        .auto-style7 {
            width: 100%;
            height: 642px;
        }
        .auto-style8 {
            height: 73px;
        }
        .auto-style9 {
            height: 60px;
        }
        .auto-style10 {
            height: 62px;
        }
        .auto-style14 {
            height: 50px;
        }
        .auto-style15 {
            height: 45px;
        }
        .auto-style16 {
            height: 53px;
        }
        .auto-style17 {
            width: 100%;
            height: 60px;
        }
        .auto-style18 {
            width: 106px;
        }
        .auto-style19 {
            height: 61px;
        }
        .auto-style20 {
            width: 100%;
            height: 51px;
        }
        .auto-style21 {
            height: 38px;
        }
        .auto-style22 {
            width: 100%;
            height: 175px;
        }
        .auto-style23 {
            width: 100%;
            height: 35px;
        }
        .auto-style26 {
            width: 39px;
        }
        .auto-style27 {
            width: 100%;
            height: 50px;
        }
        .auto-style29 {
            width: 100%;
            height: 42px;
        }
        .auto-style33 {
            margin-left: 4px;
        }
        .auto-style38 {
            width: 50px;
        }
        .auto-style40 {
            width: 83px;
        }
    </style>
</head>
<body style="height: 670px">
    <form id="form1" runat="server">
        <asp:Panel ID="Panel1" runat="server" BackColor="White" Height="652px" Width="1190px">
            <table cellpadding="0" cellspacing="0" class="auto-style1">
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">
                        <asp:Image ID="Image2" runat="server" ImageUrl="~/Resources/img/chart/login.jpg" Width="581px" />
                    </td>
                    <td class="auto-style26">&nbsp;</td>
                    <td class="auto-style5">
                        <table cellpadding="0" cellspacing="0" class="auto-style7">
                            <tr>
                                <td class="auto-style8"></td>
                            </tr>
                            <tr>
                                <td class="auto-style9">
                                    <table cellpadding="0" cellspacing="0" class="auto-style17">
                                        <tr>
                                            <td class="auto-style18">&nbsp;</td>
                                            <td>
                                                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="XX-Large" ForeColor="Black" Text="Đăng nhập"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style10"></td>
                            </tr>
                            <tr>
                                <td class="auto-style19">
                                    <table cellpadding="0" cellspacing="0" class="auto-style27">
                                        <tr>
                                            <td class="auto-style38">
                                                <asp:Image ID="Image7" runat="server" ImageUrl="~/Resources/img/chart/user.png" Height="29px" Width="27px" />
                                            </td>
                                            <td>
                                                <asp:TextBox ID="TextBox1" runat="server" BackColor="#CCCCCC" Font-Size="X-Large" ForeColor="Gray" Height="41px" Width="340px"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style14"></td>
                            </tr>
                            <tr>
                                <td class="auto-style14">
                                    <table cellpadding="0" cellspacing="0" class="auto-style29">
                                        <tr>
                                            <td class="auto-style38">
                                                <asp:Image ID="Image6" runat="server" Height="27px" ImageUrl="~/Resources/img/chart/padlock.png" Width="30px" />
                                            </td>
                                            <td>
                                                <asp:TextBox ID="TextBox2" runat="server" BackColor="#CCCCCC" Font-Size="X-Large" placeholder="tên đăng nhập" ForeColor="Gray" Height="41px" Width="340px"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style15"></td>
                            </tr>
                            <tr>
                                <td class="auto-style16">
                                    <table cellpadding="0" cellspacing="0" class="auto-style20">
                                        <tr>
                                            <td>
                                                <asp:Button ID="Button1" runat="server" BackColor="#009900" CssClass="auto-style33" Font-Bold="True" Font-Size="X-Large" ForeColor="White" Height="50px" Text="Đăng nhập" Width="391px" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style21"></td>
                            </tr>
                            <tr>
                                <td>
                                    <table cellpadding="0" cellspacing="0" class="auto-style22">
                                        <tr>
                                            <td class="auto-style21">
                                                <table cellpadding="0" cellspacing="0" class="auto-style23">
                                                    <tr>
                                                        <td class="auto-style40">&nbsp;</td>
                                                        <td>
                                                            <asp:Label ID="Label2" runat="server" Font-Size="Large" ForeColor="#999999" Text="Quên Tên đăng nhập / Mật khẩu"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>&nbsp;</td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </asp:Panel>
    </form>
</body>
</html>
