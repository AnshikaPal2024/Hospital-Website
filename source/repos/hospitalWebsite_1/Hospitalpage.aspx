<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Hospitalpage.aspx.cs" Inherits="hospitalWebsite_1.Hospitalpage" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Hospital</title>

    <link href="https://cdnjs.cloudflare.com/ajax/libs/flat-ui/2.3.0/css/flat-ui.min.css" rel="stylesheet" />
    <script src="javaScript.js"></script>
    <link href="StyleSheet1.css" rel="stylesheet" />
    <style>
        /* Style the username in a circle */
        .username-circle {
            background-color: coral;
            color: white;
            border-radius: 60%;
            width: 85px;
            height: 85px;
            text-align: center;
            line-height: 40px;
            cursor: pointer;
            display: inline-block;
            font-weight: bold;
            font-size: 14px;
            padding: 5px;
        }

        #logoutDropdown {
            display: none; /* Hide the dropdown initially */
            position: absolute;
            background-color: #f9f9f9;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
            z-index: 1;
        }

        .dropdown-content a {
            color: black;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
        }

            .dropdown-content a:hover {
                background-color: #ddd;
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
                    margin-left: 0; /* Reset margin on mobile */
                }
        }
    </style>
   <script>
      
       function showLoginButton() {
           document.getElementById("btnlogin").style.display = "inline-block";
           document.getElementById("lblUserName").style.display = "none";
       }

       function showUsername(userName) {
           document.getElementById("lblUserName").innerText = "Welcome, " + userName;
           document.getElementById("lblUserName").style.display = "inline-block";
           document.getElementById("btnlogin").style.display = "none";
       }
   </script>

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
            <asp:Button ID="btnlogin" runat="server" Text="Login/Register" CssClass="btn-login" Height="50px" PostBackUrl="~/Login.aspx" />
            <% } %>

            <div class="right-icons">
                <div id="menu-bars" class="fas fa-bars"></div>
            </div>
        </header>

        <div class="main-home">
            <div class="home">
                <div class="home-left-content">
                    <span>Welcome to Hospital Management</span>
                    <h2>We Take Care of Our<br />
                        Patients' Health</h2>
                    <p class="lorem">Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
                    <div class="home-btn">
                        <a href="#">Read More</a>
                    </div>

                </div>
                <div class="home-right-content">
                    <img src="image/d2.png" alt="Patient Care Image" />
                </div>
            </div>
        </div>

        <div class="technology">
            <div class="main-technology">
                <div class="inner-technology">
                    <div class="img">
                        <img src="image/hand.png" alt="Hand Image" />
                    </div>
                    <h2>Quality & Safety</h2>
                    <p>Our Delmont hospital utilizes state-of-the-art technology and employs a team of true experts.</p>
                </div>
                <div class="inner-technology">
                    <div class="img">
                        <img src="image/doc1.jpg" alt="Doctor Icon" />
                    </div>
                    <h2>Quality & Safety</h2>
                    <p>Our Delmont hospital utilizes state-of-the-art technology and employs a team of true experts.</p>
                </div>
                <div class="inner-technology">
                    <div class="img">
                        <img src="image/user.jpg" alt="User Image" />
                    </div>
                    <h2>Quality & Safety</h2>
                    <p>Our Delmont hospital utilizes state-of-the-art technology and employs a team of true experts.</p>
                </div>
            </div>
        </div>

        <!-- About Section -->
        <div class="main-about">
            <div class="inner-main-about">
                <div class="about-inner-content-left">
                    <img src="image/doctors_img.png" alt="Doctor Image" />
                </div>
                <div class="about-inner-content">
                    <div class="about-right-content">
                        <h2>We are setting Standards in Research<br />
                            What's more, Clinical Care.</h2>
                        <p>
                            We provide the most full medical services, so every person could have the opportunity<br />
                            or receive qualitative medical help.
                        </p>
                        <p class="aboutsec-content">Our Clinic has grown to provide a world-class facility for the treatment of tooth loss, dental cosmetic, and more advanced restorative dentistry. We are among the most qualified implant providers in AUS with over 30 years of quality training and experience.</p>
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
 
    </form>
</body>
</html>
