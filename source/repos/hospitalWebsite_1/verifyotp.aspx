<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="verifyotp.aspx.cs" Inherits="hospitalWebsite_1.verifyotp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
       <asp:Label ID="Name" runat="server" Text="Name" ></asp:Label>
        <asp:TextBox ID="txtname" runat="server" ></asp:TextBox>
            </div>
        <div>
            <asp:Label ID ="phone" runat="server" Text="PhoneNumber"></asp:Label>
            <asp:TextBox ID="txtphone" runat="server"></asp:TextBox>
            <asp:Button ID="btnlogin" runat="server" Text="login" OnClick="btnlogin_Click" ForeColor="#FF6666" />
        </div>
         <div>
            <asp:Label ID ="verify" runat="server" Text="VerifyOTP"></asp:Label>
            <asp:TextBox ID="txtotp" runat="server"></asp:TextBox>
        </div>
        <div>
            <asp:Button ID="btnverify" runat="server" Text="verify" OnClick="btnverify_Click" />
        </div>
    </form>
</body>
</html>
