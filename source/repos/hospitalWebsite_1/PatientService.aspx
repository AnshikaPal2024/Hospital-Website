<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PatientService.aspx.cs" Inherits="hospitalWebsite_1.PatientService" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Patient And Service</title>
     <link href="https://cdnjs.cloudflare.com/ajax/libs/flat-ui/2.3.0/css/flat-ui.min.css" rel="stylesheet" />
    <script src="javaScript.js"></script>  <!-- Assuming you will link your external JS here -->
    <link href="StyleSheet1.css" rel="stylesheet" />
    <style>
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
            color:white;
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
            <asp:Button ID="btnlogin" runat="server" Text="Login/Register" CssClass="btn-login" PostBackUrl="~/Login.aspx" />
            <% } %>

           
            <div class="right-icons">
                <div id="menu-bars" class="fas fa-bars"></div>
            </div>
        </header>
           <!------footer------>
        <div class="footer">
            <div class="container">
                <!-- First Segment (Important Links) -->
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

                <!-- Second Segment (Our Services) -->
                <div class="footer-section">
                    <h3>Our Services</h3>
                    <ul>
                        <li><a href="#">Outpatient</a></li>
                        <li><a href="#">Inpatient Service</a></li>
                        <li><a href="#">Day Care Service</a></li>
                        <li><a href="#">Sitemap</a></li>
                    </ul>
                </div>

                <!-- Optional Third Segment (Social Media, etc.) -->
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

            <!-- Footer Bottom (Copyright) -->
            <div class="footer-bottom">
                <p>&copy; 2024 Your Company. All rights reserved.</p>
            </div>
        </div>
    
    </form>
</body>
</html>
