<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PatientAppointment.aspx.cs" Inherits="hospitalWebsite_1.PatientAppointment" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Appointment Form</title>

    <!-- External CSS -->
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />
    <link href="StyleSheet1.css" rel="stylesheet" />

    <style>
        :root {
            --maincolor: #2ec8a6;
            --secondcolor: #f8a803;
            --thirdcolor: #f4ab01;
            --textcolor: #4A5764;
        }

        /* Main Content Area */
        .main-content {
            margin-top: 10px;
            background-color:  #0082a8;
            padding: 8px;
            color: white;
            text-align: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        /* Container with background image */
        .container.mt-5 {
            background-image: url('image/reg1.png');
            background-size: cover;
            background-position: center;
            padding: 40px 0;
            position: relative;
            max-width: 100%;
            height: 100vh;
        }

        /* Card styling */
        .card-registration {
            background-color: white;
            border-radius: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            position: relative;
            z-index: 1;
            margin: 0 auto;
            padding: 40px;
            max-width: 700px;
            margin-top: -80px;
        }

        .card-body {
            padding: 30px;
        }

        .form-outline {
            margin-bottom: 1.5rem;
        }

        .form-outline label {
            font-size: 1.4rem;
            font-weight: bold;
            color: #333;
        }

        .form-control-lg {
            padding: 1.2rem;
            font-size: 1.4rem;
            border-radius: 10px;
            border: 1px solid #ddd;
        }

        .form-check-inline input {
            margin-right: 10px;
        }

        .form-check-inline label {
            font-size: 1rem;
            color: #333;
        }

        /* Enhanced Submit Button */
        .btn-primary {
            background-color: #0D4549;
            border-color: #0D4549;
            font-size: 1.6rem;
            font-weight: bold;
            color: white;
            padding: 15px 30px;
            border-radius: 12px;
            cursor: pointer;
            text-align: center;
            width: 100%;
            transition: all 0.3s ease;
        }

        .btn-primary:hover {
            background-color: #38a1db;
            border-color: #38a1db;
            transform: scale(1.05);
        }

        .btn-primary:focus {
            outline: none;
            box-shadow: 0 0 0 3px rgba(56, 161, 219, 0.5);
        }

        .footer {
            background-color: #07292B;
            color: #FFFFFF;
            padding: 4px 0;
            font-family: Arial, sans-serif;
        }

        .container {
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 1px;
        }

        /* Footer sections */
        .footer-section {
            flex: 1;
            min-width: 100px;
        }

        .footer-section.important-links {
            margin-left: 50px;
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
                margin-left: 0;
            }
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">
        <!-- Header Section -->
        <header>
            <div class="logo">
                <img src="image/logo2.png" alt="Hospital Logo" />
            </div>
            <nav class="navbar" id="navbar">
                <a href="Hospitalpage.aspx">Home</a>
                <a href="About_Us.aspx">About</a>
                <a href="UserAppointment.aspx">Service</a>
                <a href="Doctorspage.aspx">Doctors</a>
                <a href="#">Blog</a>
                <a href="#">Contact</a>
            </nav>
            <asp:Label ID="lblUserName" runat="server" Text="Welcome, User" style="margin-left: 10px;"></asp:Label>
            <div class="button-container">
                <asp:Button ID="btnlogin" runat="server" Text="Login/Register" CssClass="btn-login" PostBackUrl="~/Login.aspx" />
                <asp:Button ID="btnAppointment" runat="server" Text="Make Appointment" CssClass="btn-appointment" />
            </div>

            <div class="right-icons">
                <div id="menu-bars" class="fas fa-bars"></div>
            </div>
        </header>

        <!-- Main Content Section -->
        <div class="main-content">
            <h1 class="display-4">Book an Appointment</h1>
            <p class="lead">Fill in the details below to schedule your appointment with our doctors.</p>
        </div>

        <!-- Appointment Form -->
        <div class="container mt-5">
            <div class="card card-registration">
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-outline">
                                <label for="txtfirstname">First Name</label>
                                <asp:TextBox ID="txtfirstname" runat="server" class="form-control form-control-lg" placeholder="Enter First Name"  />
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-outline">
                                <label for="txtlastname">Last Name</label>
                                <asp:TextBox ID="txtlastname" runat="server" class="form-control form-control-lg" placeholder="Enter Last Name"  />
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-outline">
                                <label for="datedob">Date of Birth</label>
                                <asp:TextBox ID="datedob" runat="server" TextMode="Date" class="form-control form-control-lg" required />
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-outline">
                                <label for="ddlgender">Gender</label>
                                <asp:DropDownList ID="ddlgender" runat="server" class="form-control form-control-lg" required>
                                    <asp:ListItem Value="male">Male</asp:ListItem>
                                    <asp:ListItem Value="female">Female</asp:ListItem>
                                    <asp:ListItem Value="other">Other</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-outline">
                                <label for="txtphone">Phone Number</label>
                                <asp:TextBox ID="txtphone" runat="server" class="form-control form-control-lg" placeholder="Enter Phone Number" required />
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-outline">
                                <label for="txtemail">Email Address</label>
                                <asp:TextBox ID="txtemail" runat="server" class="form-control form-control-lg" placeholder="Enter Email Address" required />
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-outline">
                                <label for="appointmentDate">Preferred Appointment Date</label>
                                <asp:TextBox ID="appointmentDate" runat="server" TextMode="Date" class="form-control form-control-lg" required />
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-outline">
                                <label for="ddldoctor">Select Doctor</label>
                                <asp:DropDownList ID="ddldoctor" runat="server" class="form-control form-control-lg" required>
                                    <asp:ListItem Value="Dr.(Prof.) Jyoti Bajpai">Medical oncology</asp:ListItem>
                                    <asp:ListItem Value="Dr.Vasant C Nagvekar">Infection Diseases</asp:ListItem>
                                    <asp:ListItem Value="Dr. Abhishek Kini">Orthopedics</asp:ListItem>
                                    <asp:ListItem Value="Dr.Aditya Drftary">Radiology</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>

                    <div class="form-group text-center">
                        <asp:Button ID="btnsubmit" runat="server" Text="Submit" CssClass="btn-primary" OnClick="btnsubmit_Click"/>
                    </div>
                </div>
            </div>
        </div>

        <!-- Footer Section -->
        <div class="footer">
            <div class="container">
                <div class="footer-section important-links">
                    <h3>Important Links</h3>
                    <ul>
                        <li><a href="#">Introduction</a></li>
                        <li><a href="#">Contact Us</a></li>
                        <li><a href="#">Vision, Mission, Values</a></li>
                        <li><a href="#">Blog</a></li>
                        <li><a href="#">Biomedical Waste Report</a></li>
                    </ul>
                </div>

                <div class="footer-section">
                    <h3>Our Services</h3>
                    <ul>
                        <li><a href="#">Outpatient</a></li>
                        <li><a href="#">Inpatient Service</a></li>
                        <li><a href="#">Day Care Service</a></li>
                        <li><a href="#">Sitemap</a></li>
                    </ul>
                </div>

                <div class="footer-section">
                    <h3>Connect With Us</h3>
                    <ul>
                        <li><a href="#">Facebook</a></li>
                        <li><a href="#">Twitter</a></li>
                        <li><a href="#">Instagram</a></li>
                        <li><a href="#">LinkedIn</a></li>
                    </ul>
                </div>
            </div>

            <div class="footer-bottom">
                <p>&copy; 2024 Your Company. All rights reserved.</p>
            </div>
        </div>
    </form>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
