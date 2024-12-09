<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="hospitalWebsite_1.Register" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Patient Registration</title>
 

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
       <link href="StyleSheet1.css" rel="stylesheet" />
    <style>
      
        body {
            background-color: #f4f4f4;
            font-family: Arial, sans-serif;
            margin: 0;
            background: url('image/back5.jpg') no-repeat center center fixed;
       
            background-repeat:no-repeat;
       
            background-size: cover; /* Ensures the image covers the entire page */
            font-family: Arial, sans-serif;
            margin: 0;
       
            display: flex;
            justify-content: center;
            align-items: center;
         
        }
        
        .container {
            display: flex;
            width: 800px; /* Adjusted width */
            margin-top: 100px; /* Ensure space for the fixed header */
            height: auto; /* Set height to auto */
            background-color: white; /* Contrast background */
            border-radius: 10px; /* Rounded corners */
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1); /* Shadow effect */
          
        }
        .image-container {
            flex: 1; /* Flex for the image */
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 2px; /* Padding for better spacing */
        }
        .image-container img {
            max-width: 100%; /* Responsive image */
            height: auto;
            border-radius: 10px; /* Optional: round the image corners */
        }
        .card-container {
            flex: 1; /* Flex for the card */
            padding: 30px; /* Increased padding for more space */
            border-radius:30px;
        }
        h2 {
            text-align: center;
            color:darkblue;
            margin-bottom: 20px;
            font-weight: 600;
            font-size: 2.4rem; /* Increased font size */
        }
        .form-control,
        .form-select {
            padding: 12px; /* Increased padding for better touch targets */
            margin: 10px 0; /* Increased margin for spacing */
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 1.2rem; /* Increased font size */
            transition: border-color 0.3s, box-shadow 0.3s;
        }
        .form-control:focus,
        .form-select:focus {
            border-color: #007bff;
            outline: none;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
        }
        .btn-save {
            background-color: var(--maincolor);
            color: white;
            border: none;
            padding: 15px;
            border-radius: 8px;
            cursor: pointer;
            width: 100%;
            font-size: 1.5rem; /* Increased button font size */
            transition: background-color 0.3s;
            margin-top: 10px;
        }
        .btn-save:hover {
            background-color: #0056b3;
        }
        .error-message {
            color: red;
            text-align: center;
            font-weight: bold;
            margin-bottom: 10px;
          
        }
        .login-link {
            text-align: center;
            margin-top: 15px;
            font-size: 1.3rem;
        }
        .login-link a {
            color: var(--maincolor);
            font-weight: bold;
        }
        .login-link a:hover {
            text-decoration: underline;
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
                <a href="#">About</a>
                <a href="PatientAppointment.aspx">Service</a>
                <a href="Doctorspage.aspx">Doctors</a>
                <a href="#">Blog</a>
                <a href="#">Contact</a>
            </nav>
            <div class="button-container">
                <asp:Button ID="btnlogin" runat="server" Text="Login/Register" CssClass="btn-login" PostBackUrl="~/Login.aspx" />
                   <asp:Button ID="btnAppointment" runat="server" Text="Make Appointment" CssClass="btn-appointment" />
            </div>

          <div class="right-icons">
              <div id="menu-bars" class="fas fa-bars"></div>
          </div>

        </header>


        <div class="container">
            <div class="image-container">
                <img src="image/patient2.jpg" alt="Patient Image" />
            </div>
            <div class="card-container">
                <div class="card">
                    <div class="card-body">
                        <h2>Patient Registration</h2>
                        <div class="error-message" id="errorMessage" runat="server" visible="false"></div>
                        <asp:TextBox ID="txtname" runat="server" CssClass="form-control" Placeholder="Enter Full Name"></asp:TextBox>
                           
                        <asp:TextBox ID="txtemail" runat="server" CssClass="form-control" Placeholder="Enter Email"></asp:TextBox>
                        <asp:TextBox ID="txtpassword" runat="server" CssClass="form-control" TextMode="Password" Placeholder="Enter Password"></asp:TextBox>
                   
                       <asp:TextBox ID="txtconformpass" runat="server" CssClass="form-control" TextMode="Password" placeholder="Enter Confirm password"></asp:TextBox>
                        <div style="margin-top: 10px; margin-bottom: 10px;">
                            <asp:CheckBox ID="checkterm" runat="server" Style="margin-right: 5px;"  />
                            <span style="padding-left: 0px; font-size:large;">I agree to the terms & conditions</span>
                        </div>

                        <asp:Button ID="btnsave" runat="server" CssClass="btn-save" Text="Register" OnClick="btnsave_Click" />
                        <p class="login-link" style="font-size:large;">Already have an account? <a href="Login.aspx">Login here</a></p>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

    <script>
        const menuBars = document.getElementById("menu-bars");
        const navbar = document.querySelector(".navbar");

        menuBars.addEventListener("click", () => {
            navbar.classList.toggle("active");
        });
    </script>
</body>
</html>
