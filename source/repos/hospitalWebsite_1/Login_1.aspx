<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login_1.aspx.cs" Inherits="hospitalWebsite_1.Login_1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login with OTP</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            padding: 50px;
        }
        .container {
            max-width: 400px;
            margin: 0 auto;
            padding: 30px;
            background-color: white;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        input[type="email"], input[type="button"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
        }
        .error {
            color: red;
            font-weight: bold;
        }
        .success {
            color: green;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
         <div class="container">
        <h2>Login with OTP</h2>
        
        <!-- Error message display -->
        <asp:Label ID="lblErrorMessag" runat="server" CssClass="error"></asp:Label>

        <!-- Email input -->
        <label for="txtemail">Email</label>
        <asp:TextBox ID="txtemail" runat="server" CssClass="input" placeholder="Enter your email" type="email" />

        <!-- Submit Button -->
        <asp:Button ID="btnloginotp" runat="server" Text="Send OTP" OnClick="btnloginotp_Click" CssClass="button" />

        <!-- Success message display -->
        <asp:Label ID="lblSuccessMessage" runat="server" CssClass="success"></asp:Label>
    </div>
    </form>
</body>
</html>
