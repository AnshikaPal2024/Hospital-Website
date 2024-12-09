<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="About_Us.aspx.cs" Inherits="hospitalWebsite_1.About_Us" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
         <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/flat-ui/2.3.0/css/flat-ui.min.css" rel="stylesheet" />
    <script src="javaScript.js">

    </script>
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
                            color: white;
                        }

        .footer-bottom {
            text-align: center;
            margin-top: 30px;
            font-size: 14px;
            color: aqua;
        }

        .banner-cards-container {
            display: flex;
            justify-content: space-between;
            gap: 20px;
            margin-top: 20px;
            flex-wrap: wrap;
        }

        .banner-card {
            width: 100%;
            max-width: 300px;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            text-align: center;
            padding: 10px;
            overflow: hidden;
        }

            /* Image inside the card */
            .banner-card img {
                width: 20%;
                height: auto;
                border-radius: 8px;
                object-fit: cover;
            }


            /* Title styling */
            .banner-card h4 {
                margin-top: 10px;
                font-size: 18px;
                color: #07292B;
                font-weight: bold;
                text-transform: uppercase;
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

            .banner-card {
                max-width: 90%;
                margin-bottom: 20px;
            }
          

        }
      
        .mvm-card img {
            width: 50px;
            height: auto;
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
            <span id="lblUserName" class="username-circle" onclick="toggleDropdown()" style="<%= (Session["UserName"] != null) ? "display: inline-block;": "display: none;" %>">
                <%: Session["UserName"] != null ? "Welcome, " + Session["UserName"].ToString() : "Welcome" %>
            </span>

            <!-- Logout Dropdown (visible only when user is logged in) -->
            <div id="logoutDropdown" class="dropdown-content" style="<%= (Session["UserName"] != null) ? "display: block;": "display: none;" %>">
                <a href="javascript:void(0);" onclick="logout()">Logout</a>
            </div>

            <!-- Show this button only when the user is not logged in -->
            <div class="button-container">
                <% if (Session["UserName"] == null)
                    { %>
                <asp:Button ID="btnlogin" runat="server" Text="Login/Register" CssClass="btn-login" PostBackUrl="~/Login.aspx" />
                <% }
                    else
                    { %>
                <asp:Button ID="btnloginregister" runat="server" Text="Login/Register" CssClass="btn-login" PostBackUrl="~/Login.aspx" />
                <% } %>
            </div>

            <div class="right-icons">
                <div id="menu-bars" class="fas fa-bars"></div>
            </div>
        </header>

        <!-- Banner -->
        <div class="banner">
            <div class="banner-img">
                <picture>
                    <img src="image/about1.jpg" />
                </picture>
            </div>
        </div>

        <!-- Gradient Background Section -->
        <div>
            <h1 style="background: linear-gradient(to right,#2e3192, #1bffff); color: white; padding: 30px; font-size: 36px; font-family: 'Arial', sans-serif; text-align: center; border-radius: 8px; box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);">PROFILE & HISTORY
    </h1>
        </div>
        <div>
            <h2>
                <strong>Welcome to Holy Spirit Hospital,Andheri (E),Mumbai</strong>
            </h2>
            <h3>
                <strong>Established in 1967 | A Charitable Trust Hospital</strong>
            </h3>
            <p>
                <strong>"Owned and managed by the"
               <em>Missionary Sisters&nbsp;Servants of the Holy Spirit</em>
                    , Holy Spirit Hospital has served the community for over 50 years, growing from a small clinic into a 300-bed multi-specialty tertiary care hospital. We are committed to providing comprehensive healthcare to approximately two million people, with a special focus on serving to&nbsp;all.
                </strong>
            </p>
        </div>
       <!-- Mission, Vision & Motto Section -->
<div class="mvm bg_cover mt-5 pt-4 pl-5 pr-5 pl-pr" style="background-image: url(https://www.holyspirithospital.org/images/bg/mvm-bg.jpg); border-radius: 20px; padding-bottom:500px;">    <div class="container text-center text-white">
        <div class="mt-3">
            <h2 style="font-size: 48px; font-weight: bold;">Our Mission, Vision &amp; Motto</h2>
            <p style="font-size: 18px; line-height: 1.6;">
                Inspired by the life-giving Spirit of God, our mission at Holy Spirit Hospital is to respect life, 
                through person-oriented, quality healthcare for all in loving service.
            </p>
        </div>
    </div>
</div>

<!-- Cards Section Above the Banner -->
<div class="row pl-5 pr-5 pl-pr" style="margin-top: -500px;  position: relative; z-index: 10;">
    <div class="col-md-4 mb-6">
        <div class="card text-center">
            <img src="image/a-mission-icon.svg" alt="Mission Icon" class="card-img-top" />
            <div class="card-body">
                <h5 class="card-title">Our Mission</h5>
                <p class="card-text">
                    Inspired by the life-giving Spirit of God, our mission at Holy Spirit Hospital is to respect life, through person-oriented, quality healthcare for all in loving service.
                </p>
                <a href="#" class="btn btn-primary">Read More</a>
            </div>
        </div>
    </div>

    <!-- Vision Card -->
    <div class="col-md-4 mb-4">
        <div class="card text-center">
            <img src="image/b-vision-icon.svg" alt="Vision Icon" class="card-img-top" />
            <div class="card-body">
                <h5 class="card-title">Our Vision</h5>
                <p class="card-text">
                    Imbued with God's love, our vision of Holy Spirit Hospital is to contribute substantially towards curative, preventive and promotive health care through our ministry of healing to one &amp; all, irrespective of caste, color, or creed at reasonable cost.
                </p>
                <a href="#" class="btn btn-primary">Read More</a>
            </div>
        </div>
    </div>

    <!-- Motto Card -->
    <div class="col-md-4 mb-4">
        <div class="card text-center">
            <img src="image/c-moto-icon.svg" alt="Motto Icon" class="card-img-top" />
            <div class="card-body">
                <h5 class="card-title">Our Motto</h5>
                <p class="card-text">
                    "In His Service, With Compassion &amp; Love"
                </p>
                <a href="#" class="btn btn-primary">Read More</a>
            </div>
        </div>
    </div>
</div>

        <!-- Banner Cards Container -->
        <div class="banner-cards-container">
            <!-- Card for the first image -->
            <div class="banner-card" style="background: linear-gradient(to right, #2e3192, #1bffff); color: white;">
                <img src="image/compains.jpg" />
                <p>
                    We have a deeper level of patient understanding and are always empathetic to their needs. This encourages a culture of providing a higher standard of patient-centred care.
                </p>
            </div>

            <!-- Card for the second image -->
            <div class="banner-card" style="background: linear-gradient(to right, #2e3192, #1bffff); color: white;">
                <img src="image/efficency.jpg" />
                <p>
                    We create a responsive healing environment, by being nimble to the needs of our patients and delivering what they really need with precision and timing.
                </p>
            </div>

            <!-- Card for the third image -->
            <div class="banner-card" style="background: linear-gradient(to right, #2e3192, #1bffff); color: white;">
                <img src="image/concestency.jpg" />
                <p>
                    We always deliver on our commitment and ensure the highest level of patient care is met at every stage, every time. We believe that only through consistency can we achieve our patients’ trust and fulfil our goals.
                </p>
            </div>
        </div>

        <!-- Footer -->
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
