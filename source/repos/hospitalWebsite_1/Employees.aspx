<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Employees.aspx.cs" Inherits="hospitalWebsite_1.Employees" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Employee Dashboard</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>

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

        .content {
            margin-left: 250px;
            margin-top: 80px;
            padding: 20px;
            box-sizing: border-box;
        }

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
            box-sizing: border-box;
        }

        .admin-card {
            width: 30%;
            background-color: #fff;
            padding: 15px;
            border-radius: 8px;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
            text-align: center;
            transition: transform 0.3s ease;
            box-sizing: border-box;
        }

            .admin-card:hover {
                transform: translateY(-10px);
            }

        .admin-img {
            width: 60%;
            max-width: 100px;
            max-height: 100px;
            object-fit: cover;
            border-radius: 8px;
            margin-bottom: 15px;
        }

        .admin-card h4 {
            margin-top: 15px;
            color: #333;
            font-size: 18px;
        }

        @media (max-width: 768px) {
            .dashboard-box {
                padding: 20px;
            }

            .admin-card {
                width: 100%;
                margin-bottom: 15px;
            }

            .admin-img {
                width: 50%;
                max-width: 80px;
                max-height: 80px;
            }
        }

        @media (max-width: 480px) {
            .admin-card {
                width: 100%;
            }

            .admin-img {
                width: 40%;
                max-width: 70px;
                max-height: 70px;
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
            <a href="#">Employees</a>
            <a href="#">Doctors</a>
            <a href="AdminDashboard.aspx">Appointment</a>
        </div>

        <div class="header">
            <h2>Welcome to Admin Dashboard</h2>
        </div>

        <div class="content">
            <div class="container-fluid">
                <h3>Employee Details</h3>
                <!-- Button to trigger modal -->
                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#searchModal">
                    Add New Employee
                </button>
                <!----Gridview--->
                <div class="table-responsive mt-4">
                    <asp:GridView ID="gvdata" runat="server" AutoGenerateColumns="false" CssClass="table table-striped table-border">
                        <Columns>
                              <asp:BoundField DataField="id" HeaderText="ID" SortExpression="id" />
                            <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" />
                            <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
                            <asp:BoundField DataField="number" HeaderText="Number" SortExpression="number" />
                            <asp:BoundField DataField="department" HeaderText="Department" SortExpression="department" />
                        
                            <asp:TemplateField HeaderText="Edit">
                                <ItemTemplate>
                                    <button type="button" class="btn btn-warning" onclick="editEmployee(<%# Eval("id") %>)">Delete</button>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Action">
                                <ItemTemplate>
                                    <asp:Button ID="btnaction" runat="server" Text="view" CssClass="btn btn-success" />
                                </ItemTemplate>

                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>

                </div>

                <!-- Modal -->
                <div class="modal fade" id="searchModal" tabindex="-1" aria-labelledby="searchModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="searchModalLabel">Add Emlpoyee details</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <!-- ASP.NET controls inside modal -->
                                <asp:Label ID="Name" runat="server" Text="Name"></asp:Label><br />
                                <asp:TextBox ID="txtname" runat="server"></asp:TextBox><br />
                                <br />

                                <asp:Label ID="email" runat="server" Text="Email"></asp:Label><br />
                                <asp:TextBox ID="txtemail" runat="server"></asp:TextBox><br />
                                <br />

                                <asp:Label ID="number" runat="server" Text="Number"></asp:Label><br />
                                <asp:TextBox ID="txtnumber" runat="server"></asp:TextBox><br />
                                <br />

                                <asp:Label ID="depatment" runat="server" Text="Department"></asp:Label><br />
                                <asp:TextBox ID="txtdepartment" runat="server"></asp:TextBox>

                               



                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                <asp:Button ID="btnsaved" runat="server" class="btn btn-primary" Text="Saved" OnClick="btnsaved_Click" />

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
