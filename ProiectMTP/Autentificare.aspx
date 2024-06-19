<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Autentificare.aspx.cs" Inherits="ProiectMTP.Autentificare" UnobtrusiveValidationMode="None"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Cinema - Login</title>
    <!-- Bootstrap core CSS -->
    <link href="TemplateFiles/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="TemplateFiles/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="TemplateFiles/css/sb-admin-2.min.css" rel="stylesheet">
    <style type="text/css">
        .auto-style1 {
            position: relative;
            width: 100%;
            flex: 0 0 58.33333%;
            max-width: 58.33333%;
            text-align: center;
            padding-left: .75rem;
            padding-right: .75rem;
        }
        .auto-style2 {
            margin-bottom: 1rem;
            text-align: left;
        }
    </style>
</head>
<body class="bg-gradient-danger">
    <form id="form1" runat="server">
        <div class="container">

            <!-- Adăugarea label-ului de eroare -->

            <div class="card o-hidden border-0 shadow-lg my-5">
                <div class="card-body p-0">
                    <!-- Nested Row within Card Body -->
                    <div class="row">
                        <div class="col-lg-5 d-none d-lg-block bg-login-image" style="background-image: url('Imagini/autentificare.jpg');"></div>
                        <div class="auto-style1">
                            <div class="p-5">
                                <div class="text-center">
                                    <h1 class="h4 text-gray-900 mb-4">Welcome Back!</h1>
                                </div>
                                </div>
                                    <div class="auto-style2">
                                        <asp:DropDownList ID="ddlUsername" runat="server" CssClass="form-control form-control-user" Width="1278px">
                                            <asp:ListItem Text="Select Username" Value="" />
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorUN" runat="server" ControlToValidate="ddlUsername" ErrorMessage="Camp Obligatoriu!" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="auto-style2">
                                        &nbsp;<asp:TextBox ID="txtPassword" runat="server" Height="34px" Width="1260px" TextMode="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorPass" runat="server" ControlToValidate="txtPassword" ErrorMessage="Camp Obligatoriu!" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                                    </div>
                                    <asp:Label ID="lblErrorMessage" runat="server" ForeColor="#CC0000"></asp:Label>
                                    <asp:Button ID="ButtonLogin" runat="server" BackColor="#999999" Text="Login" CssClass="offset-sm-0" ForeColor="White" Height="54px" OnClick="ButtonLogin_Click1" Width="158px" />
                                    <asp:Label ID="label1" runat="server" ForeColor="#009900"></asp:Label>
                                    <hr>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </form>

    <!-- Bootstrap core JavaScript-->
    <script src="TemplateFiles/vendor/jquery/jquery.min.js"></script>
    <script src="TemplateFiles/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="TemplateFiles/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="TemplateFiles/js/sb-admin-2.min.js"></script>
</body>
</html>
