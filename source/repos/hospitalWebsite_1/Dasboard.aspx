<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dasboard.aspx.cs" Inherits="hospitalWebsite_1.Dasboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Dashboard</title>
    <style>
        /* Sidebar styles */
        .sidebar {
            height: 100vh;
            width: 250px;
            position: fixed;
            left: 0;
            top: 0;
            background-color: #07292B;
            padding: 20px;
            color: aqua;
            box-sizing: border-box; /* Ensure the padding doesn't affect the width */
        }

        .sidebar a {
            color: white;
            padding: 10px;
            text-decoration: none;
            display: block;
            font-size: 18px;
            margin: 8px 0;
            border-radius: 5px;
        }

        .sidebar a:hover {
            background-color: coral;
        }

        /* Navbar header styles */
        .header {
            background-color: deepskyblue;
            color: white;
            padding: 15px;
            text-align: center;
            border-radius: 8px;
            position: fixed;
            width: calc(100% - 250px); /* Ensure it takes up the full width minus the sidebar */
            left: 250px; /* Align it to the right of the sidebar */
            top: 0;
            z-index: 1000; /* Make sure the header is on top of other content */
        }

        /* Content styling */
        .content {
            margin-left: 250px; /* Ensure content starts after the sidebar */
            margin-top: 80px; /* Push content below the navbar */
            padding: 20px;
            box-sizing: border-box; /* Include padding in the width calculation */
        }

        /* Container for all the boxes (flexbox for responsive layout) */
        .dashboard-box {
            background-color: #f0f8ff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
            margin-top: 20px;
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 15px;
            box-sizing: border-box; /* Ensure padding doesn't affect the width */
        }

        /* Card Styling */
        .admin-card {
            width: 30%;
            background-color: #fff;
            padding: 15px;
            border-radius: 8px;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
            text-align: center;
            transition: transform 0.3s ease;
            box-sizing: border-box; /* Include padding and border in the width */
        }

        .admin-card:hover {
            transform: translateY(-10px); /* Hover effect to lift the card */
        }

        /* Styling for the images inside each card */
        .admin-img {
            width: 60%;
            max-width: 100px;
            max-height: 100px;
            object-fit: cover;
            border-radius: 8px;
            margin-bottom: 15px;
        }

        /* Styling for the title under each image */
        .admin-card h4 {
            margin-top: 15px;
            color: #333;
            font-size: 18px;
        }

        /* Responsive Design - Stack images on smaller screens */
        @media (max-width: 768px) {
            .dashboard-box {
                padding: 20px;
            }

            .admin-card {
                width: 100%; /* Make the images take up full width */
                margin-bottom: 15px; /* Reduce margin for compact view */
            }

            .admin-img {
                width: 50%;
                max-width: 80px; /* Adjust max-width for better fit */
                max-height: 80px; /* Adjust max-height for better fit */
            }
        }

        @media (max-width: 480px) {
            .admin-card {
                width: 100%; /* Ensure full width on very small screens */
            }

            .admin-img {
                width: 40%; /* Scale the image to fit smaller space */
                max-width: 70px; /* Adjust max-width for very small screens */
                max-height: 70px; /* Adjust max-height for very small screens */
            }
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="sidebar">
            <h3 class="text-center text-white">Admin panel</h3>
            <a href="Dasboard.aspx">Dashboard</a>
            <a href="#">Patients</a>
            <a href="Employees.aspx">Employees</a>
            <a href="#">Doctors</a>
            <a href="AdminDashboard.aspx">Appointment</a>
        </div>

        <div class="header">
            <h2>Welcome to Admin Dashboard</h2>
              <asp:Label ID="lblUserName" runat="server" Text="Welcome, User" style="margin-left: 10px;"></asp:Label>
        </div>

        <div class="content">
            <div class="container-fluid">
                <h3>Hospital Dashboard</h3>

                <!-- Container Box for Admin Dashboard Images -->
                <div class="dashboard-box">
                    <!-- Admin Image Box 1 -->
                    <div class="admin-card">
                        <img src="image/Capture2.PNG" class="admin-img" />
                        <h4>Out Patient</h4>
                    </div>

                    <!-- Admin Image Box 2 -->
                    <div class="admin-card">
                        <img src="image/Capture2.PNG" class="admin-img" />
                        <h4>In Patient</h4>
                    </div>

                    <!-- Admin Image Box 3 -->
                    <div class="admin-card">
                        <img src="image/Capture2.PNG" class="admin-img" />
                        <h4>Hospital Employee</h4>
                    </div>
                </div>
              <div class="content">
            <div class="container-fluid">
                <h3>Hospital Employees</h3>

                </div>
            </div>
        </div>
    </form>
</body>
</html>
