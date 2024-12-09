<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="hospitalWebsite_1.AdminDashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        /* Custom styles */
        body {
            font-family: 'Arial', sans-serif;
        }
        .container-fluid {
            margin-top: 20px;
        }
        .sidebar {
            height: 100vh;
            width: 250px;
            position: fixed;
            top: 0;
            left: 0;
            background-color: #343a40;
            padding-top: 20px;
            color: white;
        }
        .sidebar a {
            color: white;
            padding: 10px;
            text-decoration: none;
            display: block;
        }
        .sidebar a:hover {
            background-color: #575757;
        }
        .content {
            margin-left: 260px;
            padding: 20px;
        }
        .header {
            background-color: #007bff;
            color: white;
            padding: 15px;
            text-align: center;
        }
        .table th, .table td {
            text-align: center;
        }
        .btn-confirm {
            background-color: #28a745;
            color: white;
        }
        .btn-cancel {
            background-color: #dc3545;
            color: white;
        }
        .btn-confirm:hover, .btn-cancel:hover {
            opacity: 0.8;
        }
    </style>
</head>
<body>
    <!-- Start of Form -->
    <form id="form1" runat="server">
        <div class="sidebar">
            <h3 class="text-center text-white">Admin Panel</h3>
            <a href="Dasboard.aspx">Dashboard</a>
            <a href="#">Patients</a>
            <a href="#">Employees</a>
            <a href="#">Doctors</a>
            <a href="AdminDashboard.aspx">Appointment</a>
        </div>
        
        <div class="content">
            <div class="header">
                <h2>Welcome to Admin Dashboard</h2>
            </div>

            <div class="container-fluid">
                <h3>Manage Appointments</h3>
                <asp:GridView ID="gvappointment" runat="server" AutoGenerateColumns="false" CssClass="table table-striped">
                    <Columns>
                        <asp:BoundField DataField="AppointmentId" HeaderText="Appointment ID" SortExpression="AppointmentId" />
                        <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName" />
                        <asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="LastName" />
                        <asp:BoundField DataField="dob" HeaderText="Date of Birth" SortExpression="dob" />
                        <asp:BoundField DataField="gender" HeaderText="Gender" SortExpression="gender" />
                        <asp:BoundField DataField="phone" HeaderText="Phone Number" SortExpression="phone" />
                        <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
                        <asp:BoundField DataField="appointmentdate" HeaderText="Appointment Date" SortExpression="appointmentdate" />
                        <asp:BoundField DataField="selectdoc" HeaderText="Doctor" SortExpression="selectdoc" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="btnConfirm" runat="server" Text="Confirm" CommandName="Confirm" CommandArgument='<%# Eval("AppointmentId") %>' CssClass="btn btn-confirm" />
                                <asp:Button ID="btnCancel" runat="server" Text="Cancel" CommandName="Cancel" CommandArgument='<%# Eval("AppointmentId") %>' CssClass="btn btn-cancel" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </form> <!-- End of Form -->
</body>
</html>
