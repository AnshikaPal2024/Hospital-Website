<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="hospitalWebsite_1.Login" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

    <style>
        body {
            background-color: #f8f9fa;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .container {
            display: flex;
            width: 100%;
            max-width: 900px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        .image-container {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        .image-container img {
            max-width: 100%;
            height: auto;
            border-radius: 10px;
        }

        .card {
            flex: 1;
            padding: 30px;
            border-radius: 10px;
        }

        .form-control {
            border-radius: 0.5rem;
            margin-bottom: 15px;
        }

        .btn-save, .btn-submit {
            width: 100%;
            border-radius: 0.5rem;
        }

        .btn-save {
            background-color: #007bff;
            color: white;
        }

        .btn-save:hover {
            background-color: #0056b3;
        }

        .btn-submit {
            background-color: #28a745;
            color: white;
        }

        .btn-submit:hover {
            background-color: #218838;
        }

        .forgot-password:hover {
            text-decoration: underline;
        }

        .card {
            border-radius: 30px;
            background-color: rgba(255, 255, 255, 0.9);
            margin-right: 20px;
        }

        #forgot-password-container {
            display: none;
            width: 100%;
            max-width: 900px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        #forgot-password-form {
            padding: 20px;
        }

        .login-form-container h1 {
            color: darkblue;
        }

        .login-container, .forgot-password-container {
            display: flex;
            width: 100%;
            max-width: 900px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        .forgot-password-container .input-group-text {
            background-color: #007bff;
            color: white;
            border: none;
        }

        .forgot-password-container .form-group label {
            font-weight: bold;
            color: #333;
        }

        .forgot-password-container a {
            text-decoration: none;
            color: #007bff;
            font-weight: bold;
        }

        .forgot-password-container a:hover {
            text-decoration: underline;
        }

        /* For small screens, reduce container size and add margin */
        @media (max-width: 768px) {
            .container, .forgot-password-container {
                width: 100%;
                padding: 15px;
            }

            .card {
                padding: 20px;
            }

            .image-container img {
                max-width: 80%;
                height: auto;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Login page -->
        <div class="container" id="loginPage">
            <div class="image-container">
                <img src="image/login.gif" id="loginImage" alt="Login Image" />
            </div>

            <div id="cardLogin" class="card shadow login-form-container">
                <div class="card-body">
                    <h1 class="card-title text-center" style="color: darkblue;">Login</h1>
                    <div class="mb-3">
                        <asp:TextBox ID="email" runat="server" CssClass="form-control" Placeholder="Enter your Email" />
                    </div>
                    <asp:Button ID="btnotp" runat="server" Text="Send OTP" OnClick="btnotp_Click" class="btn btn-save mb-3" />
                    <div class="mb-3">
                        <asp:TextBox ID="txtverifyotp" runat="server" CssClass="form-control" Placeholder="Verify Your OTP" />
                    </div>

                    <div class="form-check mb-3">
                        <asp:CheckBox ID="checkeme" runat="server" class="form-check-input" />
                        <label class="form-check-label" for="checkeme">Remember Me</label>
                        <a href="javascript:void(0);" onclick="toggleForgotpassword();" class="forgot-password">Forgot Password?</a>
                    </div>

                    <asp:Button ID="btnverifyotp" runat="server" Text="Submit" OnClick="btnverifyotp_Click1" class="btn btn-submit" />

                    <div class="text-center mt-3">
                        Don't have an account? <a href="Register.aspx" class="text-danger font-weight-bold">Register here</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Forgot password page -->
        <div id="forgot-password-container">
            <div class="image-container">
                <img src="image/forgotpassword.svg" id="forgotPasswordImage" alt="Forgot Password Image" />
            </div>

            <div id="forgot-password-form" class="card shadow">
                <div class="card-body">
                    <h3 class="card-title text-center" style="color: darkblue;">Retrieve Password</h3>
                    <div class="form-group">
                        <label for="email">Enter Email Id</label>
                        <div class="input-group mb-3">
                            <span class="input-group-text" style="background-color: dodgerblue; color: white;">@</span>
                            <asp:TextBox ID="txtemail" runat="server" CssClass="form-control" placeholder="Enter your email" />
                        </div>
                        <asp:Label ID="lblmsg" runat="server" Text="" CssClass="text-danger mt-3"></asp:Label>
                    </div>
                    <asp:Button ID="btnsubmit" runat="server" Text="Submit" CssClass="btn btn-submit" OnClick="btnsubmit_Click" />

                    <div class="text-center mt-3">
                        <a href="Login.aspx" class="back-to-login">Back to login</a>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <script>
        function toggleForgotpassword() {
            var logDiv = document.getElementById('loginPage');
            var forgotPasswordDiv = document.getElementById('forgot-password-container');
            var loginImage = document.getElementById('loginImage');
            var forgotPasswordImage = document.getElementById('forgotPasswordImage');

            if (forgotPasswordDiv.style.display === "none" || forgotPasswordDiv.style.display === "") {
                logDiv.style.display = "none";
                forgotPasswordDiv.style.display = "flex";
                loginImage.style.display = "none";
                forgotPasswordImage.style.display = "block";
            } else {
                logDiv.style.display = "flex";
                forgotPasswordDiv.style.display = "none";
                loginImage.style.display = "block";
                forgotPasswordImage.style.display = "none";
            }
        }

        document.addEventListener('DOMContentLoaded', () => {
            const forgotPasswordDiv = document.getElementById('forgot-password-container');
            forgotPasswordDiv.style.display = 'none';
        });
    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
