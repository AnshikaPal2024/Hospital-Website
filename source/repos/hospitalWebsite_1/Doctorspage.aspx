<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Doctorspage.aspx.cs" Inherits="hospitalWebsite_1.Doctorspage" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="StyleSheet1.css" rel="stylesheet" />
    <style>
        /* General styling */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            color: #333;
            margin: 0;
            padding: 0;
        }
        h1 {
       
            text-align: center;
            margin: 70px auto 10px;
            font-size: 2.5rem;
            color: #004085;
         background: linear-gradient(to right, #2e3192, #1bffff);
            border:groove;
            border-radius: 2px;
            padding: 20px;
            width:auto;  /* This ensures the width is adjusted to content */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        /* Doctor Profile Card */
        .doctor-profile {

            display: inline-block;
            width: 300px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin: 20px;
            overflow: hidden;
            text-align: center;
            transition: all 0.3s ease;
            margin-top:30px;
        }
        .doctor-container{
            display:grid;
            grid-template-columns:repeat(4,4fr);
            gap:normal;
             padding: 0px;
            justify-items: center;
        }

        .doctor-profile:hover {
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            transform: scale(1.05);
        }

        /* Doctor Info */
        .doctor-info {
            background-color: #004085;
            color: white;
            padding: 20px;
        }

        .doc-name {
            font-size: 1.8rem;
            margin-bottom: 5px;
        }

        .doc-position {
            font-size: 1.2rem;
            font-weight: normal;
        }

        /* Doctor Image */
        .doctor-image img {
            width: 50%;
            height: 200px;
            object-fit: cover;
            border-bottom: 2px solid #004085;
        }

        /* Doctor Details */
        .doctor-details {
            padding: 15px 20px; 
        }
        header .navbar{
              margin-bottom:0px;
        }


        .detail-row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 10px;
            font-size: 1.1rem;
        }

        .label {
            font-weight: bold;
            color: #004085;
        }

        .value {
            color: #555;
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
    color:white;
}


.footer-bottom {
    text-align: center;
    margin-top: 30px;
    font-size: 14px;
    color: aqua; 
}
       .maincontent {
            background-color: #0082a8;
            color:white;
            padding:20px;
            margin-bottom:20px;
            
            
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

            .banner-cards-container {
                flex-direction: column;
                align-items: center;
            }
        }
    </style>
      <script>
        // Function to toggle logout dropdown visibility
        function toggleDropdown() {
            document.getElementById("logoutDropdown").classList.toggle("show");
        }

        // Function to handle logout and session clearing
        function logout() {
            // Clear session
            sessionStorage.clear();
            // Hide the username and logout dropdown
            document.getElementById("lblUserName").style.display = "none";
            document.getElementById("logoutDropdown").style.display = "none";
            // Show the login button
            document.getElementById("btnlogin").style.display = "inline-block";
            // Redirect to login page
            window.location.href = "Login.aspx";
        }
      </script>
    <link href="StyleSheet1.css" rel="stylesheet" />
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

            <!-- Username and Dropdown for Logout -->
            <span id="lblUserName" class="username-circle" onclick="toggleDropdown()" style="<%= (Session["UserName"] != null) ? "display: inline-block;" : "display: none;" %>">
                <%: Session["UserName"] != null ? "Welcome, " + Session["UserName"].ToString() : "Welcome" %>
            </span>

            <!-- Logout Dropdown (visible only when user is logged in) -->
            <div id="logoutDropdown" class="dropdown-content" style="<%= (Session["UserName"] != null) ? "display: block;" : "display: none;" %>">
                <a href="javascript:void(0);" onclick="logout()">Logout</a>
            </div>
            
            <!-- Show this button only when the user is not logged in -->
            <div class="button-container">
                <% if (Session["UserName"] == null)
                    { %>
                    <asp:Button ID="btnlogin" runat="server" Text="Login/Register" CssClass="btn-login" PostBackUrl="~/Login.aspx" />
                <% }
                    else
                    { %>  <asp:Button ID="btnloginregister" runat="server" Text="Login/Register" CssClass="btn-login" PostBackUrl="~/Login.aspx" />
                   <%} %>

                <!-- Always show this button (Make Appointment) -->
               
            </div>
           
            <div class="right-icons">
                <div id="menu-bars" class="fas fa-bars"></div>
            </div>
        </header>

        <br />
        <br />
        <br />
        
        <!-- Doctor's name in the H1 tag with a border -->
        <div>
            <h1 class="maincontent">Doctors' Directory</h1> <!-- This will now display the doctor's name with a border -->
        </div>
        
            <div class="doctor-container">
        <div class="doctor-profile" id="Dr.Amol ">
            <div class="doctor-info">
                <h2 class="doc-name">Dr. Amol kakade</h2>
                <h3 class="doc-position">Consultant, Radiation Oncologist</h3>
            </div>
            <div class="doctor-image">
                <img src="image/dr_amol_kakade.jpg" alt="Dr. Aashish Contractor" />
            </div>
            <div class="doctor-details">
                <div class="detail-row">
                    <span class="label">Department:</span>
                    <span class="value">Radiation Oncology</span>
                </div>
            </div>
        </div>
          <div class="doctor-profile" id="Dr.Abhishek-kini">
            <div class="doctor-info">
                <h2 class="doc-name">Dr. Abhishek kini</h2>
                <h3 class="doc-position">Consultant</h3>
            </div>
            <div class="doctor-image">
                <img src="image/dr-abhishek-kini.jpg" alt="Dr.Abhishek" />
            </div>
            <div class="doctor-details">
                <div class="detail-row">
                    <span class="label">Department:</span>
                    <span class="value">Orthopaedics</span>
                </div>
            </div>
        </div>
                 <div class="doctor-profile" id="Dr.Abhishek Kulkarni">
            <div class="doctor-info">
                <h2 class="doc-name">Dr. Aashish Contractor</h2>
                <h3 class="doc-position">Consultant pediatric & Adolescent Endrocrinologist</h3>
            </div>
            <div class="doctor-image">
                <img src="image/dr-abhishek-k.jpg" />
            </div>
            <div class="doctor-details">
                <div class="detail-row">
                    <span class="label">Department:</span>
                    <span class="value">Pediatric & Adolescent Endrocrinologist</span>
                </div>
            </div>
        </div>
         <div class="doctor-profile" id="Dr. Aashish Contractor">
            <div class="doctor-info">
                <h2 class="doc-name">Dr.V Contractor</h2>
                <h3 class="doc-position">Consultant</h3>
            </div>
            <div class="doctor-image">
                <img src="image/jyoti-bajpai.jpg" />
            </div>
            <div class="doctor-details">
                <div class="detail-row">
                    <span class="label">Department:</span>
                    <span class="value">Rehabilitation and Sports Medicine</span>
                </div>
            </div>
        </div>
          <div class="doctor-profile" id="Dr.Divy ">
            <div class="doctor-info">
                <h2 class="doc-name">Dr.Divy Gopal</h2>
                <h3 class="doc-position">Consultant</h3>
            </div>
            <div class="doctor-image">
                <img src="image/dr-divya-gopal.jpg" alt="Dr.Divy" />
            </div>
            <div class="doctor-details">
                <div class="detail-row">
                    <span class="label">Department:</span>
                    <span class="value">Internal Medicine</span>
                </div>
            </div>
        </div>
          <div class="doctor-profile" id="Dr.vasant">
            <div class="doctor-info">
                <h2 class="doc-name">Dr.Vasant C Nagvekar </h2>
                <h3 class="doc-position">Director</h3>
            </div>
            <div class="doctor-image">
                <img src="image/dr-vasant-nagvekar.jpg" />
            </div>
            <div class="doctor-details">
                <div class="detail-row">
                    <span class="label">Department:</span>
                    <span class="value">Infectious Diseases</span>
                </div>
            </div>
        </div>
          <div class="doctor-profile" id="Dr.Akshay">
            <div class="doctor-info">
                <h2 class="doc-name">Dr. Akshay A Gupta</h2>
                <h3 class="doc-position">Consultant Neurosurgeon</h3>
            </div>
            <div class="doctor-image">
                <img src="image/dr_akshay_gupte_01.jpg" />
            </div>
            <div class="doctor-details">
                <div class="detail-row">
                    <span class="label">Department:</span>
                    <span class="value">Neuroscience</span>
                </div>
            </div>
        </div>
          <div class="doctor-profile" id="Dr. Imran">
            <div class="doctor-info">
                <h2 class="doc-name">Dr. Imran Hamzawala</h2>
                <h3 class="doc-position">Consultant</h3>
            </div>
            <div class="doctor-image">
                <img src="image/dr_imran_husain_hamzawala.jpg" />
            </div>
            <div class="doctor-details">
                <div class="detail-row">
                    <span class="label">Department:</span>
                    <span class="value">Obstetrics $ Gynaecology</span>
                </div>
            </div>
        </div>
         <div class="doctor-profile" id="Dr. aditya">
            <div class="doctor-info">
                <h2 class="doc-name">Dr.Aditya Daftary</h2>
                <h3 class="doc-position">Consultant</h3>
            </div>
            <div class="doctor-image">
                <img src="image/dradityadaftary.jpg" />
            </div>
            <div class="doctor-details">
                <div class="detail-row">
                    <span class="label">Department:</span>
                    <span class="value">Radiology</span>
                </div>
            </div>
        </div>
         <div class="doctor-profile" id="Dr.Karuna">
            <div class="doctor-info">
                <h2 class="doc-name">Dr. Karuna Luthra</h2>
                <h3 class="doc-position">Consultant</h3>
            </div>
            <div class="doctor-image">
                <img src="image/drarchanavazifdar.jpg" />
            </div>
            <div class="doctor-details">
                <div class="detail-row">
                    <span class="label">Department:</span>
                    <span class="value">Nuclear Medicine</span>
                </div>
            </div>
        </div>
          <div class="doctor-profile" id="Dr.Abhish Kulkarni">
            <div class="doctor-info">
                <h2 class="doc-name">Dr. Aashish Contractor</h2>
                <h3 class="doc-position">Consultant pediatric & Adolescent Endrocrinologist</h3>
            </div>
            <div class="doctor-image">
                <img src="image/dr-abhishek-k.jpg" />
            </div>
            <div class="doctor-details">
                <div class="detail-row">
                    <span class="label">Department:</span>
                    <span class="value">Pediatric & Adolescent Endrocrinologist</span>
                </div>
            </div>
        </div>
         <div class="doctor-profile" id="Dr. Aash">
            <div class="doctor-info">
                <h2 class="doc-name">Dr.V Contractor</h2>
                <h3 class="doc-position">Consultant</h3>
            </div>
            <div class="doctor-image">
                <img src="image/jyoti-bajpai.jpg" />
            </div>
            <div class="doctor-details">
                <div class="detail-row">
                    <span class="label">Department:</span>
                    <span class="value">Rehabilitation and Sports Medicine</span>
                </div>
            </div>
        </div>
            </div>
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
