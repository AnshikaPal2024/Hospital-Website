<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contactpage.aspx.cs" Inherits="hospitalWebsite_1.Contactpage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Contact Us - Hospital</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="StyleSheet1.css" rel="stylesheet" />
    <script src="JavaScript.js"></script>
    <style>
        /* Styling for the main content section */
        .main-content {
            margin-top: 20px;
            background-color: #0082a8;
            padding: 20px;
            font-size: x-large;
            color: white;
            text-align: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        /* Contact section styling */
        .internal-bg {
            background-image: url(image/contact-bg.jpg);
            background-size: cover;
            background-position: center;
            padding-top: 80px;
            padding-bottom: 100px;
            position: relative;
        }

        .over-gradient-bg {
            background: rgba(0, 0, 0, 0.5);
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
        }

        .contact-header {
            color: white;
            font-size: 32px;
            font-weight: bold;
            margin-bottom: 30px;
            text-align: center;
        }

        /* Styling for the contact form */
        .contact-form {
            background-color: rgba(255, 255, 255, 0.8);
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .form-group label {
            font-size: 16px;
            font-weight: bold;
        }

        .form-group input, .form-group textarea {
            font-size: 14px;
            padding: 10px;
            border-radius: 4px;
            border: 1px solid #ccc;
            width: 100%;
            margin-bottom: 15px;
        }

        .form-group textarea {
            resize: vertical;
        }

        .btn-submit {
            background-color: #0082a8;
            color: white;
            padding: 10px 20px;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
            border: none;
        }

        .btn-submit:hover {
            background-color: #006f85;
        }

        /* Footer Styling */
        .footer {
            background-color: #07292B;
            color: #FFFFFF;
            padding: 40px 0;
            font-family: Arial, sans-serif;
        }

        .footer-section {
            margin-bottom: 30px;
        }

        .footer-section h3 {
            font-size: 18px;
            margin-bottom: 15px;
        }

        .footer-section ul {
            list-style: none;
            padding: 0;
        }

        .footer-section ul li {
            margin-bottom: 8px;
        }

        .footer-section ul li a {
            color: aqua;
            text-decoration: none;
            font-size: 14px;
        }

        .footer-section ul li a:hover {
            color: white;
        }

        .footer-bottom {
            text-align: center;
            margin-top: 30px;
            font-size: 14px;
            color: aqua;
        }

        /* Responsive styling for smaller screens */
        @media (max-width: 768px) {
            .footer {
                padding: 20px 0;
            }

            .container {
                flex-direction: column;
                align-items: center;
            }

            .footer-section {
                text-align: center;
                margin-bottom: 20px;
            }

            .footer-section.important-links {
                margin-left: 0; /* Reset margin on mobile */
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <header>
            <div class="logo">
                <img src="image/logo2.png" alt="Hospital Logo" />
            </div>
            <nav class="navbar" id="navbar">
                <a href="Hospitalpage.aspx">Home</a>
                <a href="About_Us.aspx">About</a>
                <a href="PatientService.aspx">Service</a>
                <a href="Doctorspage.aspx">Doctors</a>
                <a href="#">Blog</a>
                <a href="Contactpage.aspx">Contact</a>
            </nav>

            <% if (Session["UserName"] != null)
                { %>
            <span id="lblUserName" class="username-circle" onclick="toggleDropdown()">Welcome, <%= Session["UserName"] %>
            </span>

            <!-- Logout Dropdown -->
            <div>
                <asp:Button ID="btnlogout" runat="server" Text="Logout" OnClick="btnlogout_Click" />
            </div>
            <% }
            else
            { %>
            <!-- Login Button (visible only when logged out) -->
            <asp:Button ID="btnlogin" runat="server" Text="Login/Register" CssClass="btn-login" PostBackUrl="~/Login.aspx" />
            <% } %>

            <div class="right-icons">
                <div id="menu-bars" class="fas fa-bars"></div>
            </div>
        </header>

        <div class="main-content">
            <h3 class="display-4">Contact Us</h3>
        </div>

        <section class="internal-bg w-600 bg_cover pt-80 pb-100">
            <div class="over-gradient-bg"></div>
            <div class="container">
                <div class="row d-flex justify-content-center">
                    <div class="col-lg-6">
                        <h2 class="contact-header">We'd love to hear from you</h2>
                        <!-- Contact Form -->
                        <div class="contact-form">
                            <div class="form-group">
                       <asp:Label ID="Label1" runat="server" Text="Your First Name"></asp:Label>
                          <asp:TextBox ID="txtname" runat="server" placeholder="Enter your name"></asp:TextBox>
                               
                            </div>
                            <div class="form-group">
                           <asp:Label ID="lastname" runat="server" Text="Your Last Name"></asp:Label>
                            <asp:TextBox ID="txtlastname" runat="server" placeholder="Enter Your LastName"></asp:TextBox>
                            </div>
                             <div class="form-group">
                                <asp:Label ID="phone" runat="server" Text="Your First Phone"></asp:Label>
                               <asp:TextBox ID="txtphone" runat="server" placeholder="Enter Your PhoneNumber"></asp:TextBox>
                            </div>
                            <div class="form-group">
                               <asp:Label ID="Email" runat="server" Text="Your First Email"></asp:Label>
                                <asp:TextBox ID="txtemail"  runat="server" placeholder="Enter Your Email"></asp:TextBox>
                            </div>
                            <div class="form-group">
                               <asp:Label ID="messge" runat="server" Text="Message"></asp:Label>
                                <asp:TextBox ID="message" runat="server"   placeholder="Write your message here"></asp:TextBox>
                            </div>
                            
                            <asp:Button ID="btnsubmit" runat="server" class="btn-submit" Text="Send Message" />
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Footer Section -->
        <div class="footer">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 footer-section">
                        <h3>Important Links</h3>
                        <ul>
                            <li><a href="#">Introduction</a></li>
                            <li><a href="#">Contact Us</a></li>
                            <li><a href="#">Vision, Mission, Values</a></li>
                            <li><a href="#">Blog</a></li>
                            <li><a href="#">Biomedical Waste Report</a></li>
                        </ul>
                    </div>

                    <div class="col-md-4 footer-section">
                        <h3>Our Services</h3>
                        <ul>
                            <li><a href="#">Outpatient</a></li>
                            <li><a href="#">Inpatient Service</a></li>
                            <li><a href="#">Day Care Service</a></li>
                            <li><a href="#">Sitemap</a></li>
                        </ul>
                    </div>

                    <div class="col-md-4 footer-section">
                        <h3>Connect With Us</h3>
                        <ul>
                            <li><a href="#">Facebook</a></li>
                            <li><a href="#">Twitter</a></li>
                            <li><a href="#">Instagram</a></li>
                            <li><a href="#">LinkedIn</a></li>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="footer-bottom">
                <p>&copy; 2024 Your Company. All rights reserved.</p>
            </div>
        </div>
    </form>
</body>
</html>
