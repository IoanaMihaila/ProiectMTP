<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TStergereRezervare.aspx.cs" Inherits="ProiectMTP.StergereRezervare" UnobtrusiveValidationMode="None"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Cinema - Stergere rezervare</title>
     <!-- Bootstrap core CSS -->
 <link href="TemplateFiles/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

 <!-- Custom fonts for this template -->
 <link href="TemplateFiles/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
 <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

 <!-- Custom styles for this template -->
 <link href="TemplateFiles/css/sb-admin-2.min.css" rel="stylesheet">
    <!-- Meta tags -->
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <!-- Custom fonts for this template-->
    <link href="TemplateFiles/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet" />

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            text-align: center;
            margin-left: auto;
            margin-right: auto;
            padding-left: 1.5rem;
            padding-right: 1.5rem;
        }
        .auto-style2 {
            font-family: Broadway;
        }
        .auto-style3 {
            font-size: medium;
            color: #CC0000;
            text-decoration: underline;
        }
    </style>
    </head>
<body id="page-top">
    <form id="form1" runat="server">
        <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-danger sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-film"></i>
                </div>
                <div class="sidebar-brand-text mx-3">CINEMA <sup></sup></div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">


            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item active">
                <a class="nav-link" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="true"
                    aria-controls="collapsePages">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>Pages</span>
                </a>
                <div id="collapsePages" class="collapse show" aria-labelledby="headingPages"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Login Screens:</h6>
                            <a class="collapse-item" href="Autentificare.aspx">Login</a>
                            <div class="collapse-divider"></div>
                        <h6 class="collapse-header">Other Pages:</h6>
                            <a class="collapse-item" href="PaginaPrincipala.aspx">Pagina Principala</a>
                            <a class="collapse-item" href="Adaugare_rezervare.aspx">Adaugare rezervare</a>
                            <a class="collapse-item" href="StergereRezervare.aspx">Stergere rezervare</a>
                   </div>
                </div>
            </li>
        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <!-- Sidebar Toggle (Topbar) -->
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>

                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">
                        <!-- Nav Item - User Information -->
                    <li class="nav-item dropdown no-arrow">
                        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                       <span class="mr-2 d-none d-lg-inline text-gray-600 small"></span>
                        <img class="img-profile rounded-circle"
                         src="Imagini/OIP.jpg" width="60" height="60">
                        </a>
                        <!-- Dropdown - User Information -->
                        <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                         aria-labelledby="userDropdown">
                        <a class="dropdown-item" href="Autentificare.aspx">
                        <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                        Logout
                        </a>
                </div>
                </li>
                    </ul>

                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="auto-style1">
                    <!-- Page Heading -->
                    <h1 class="auto-style2">Stergere rezervarea aleasa!</h1>
                    <asp class="sticky-footer bg-white" style="text-align: center">
    <div class="container my-auto" style="text-align: center">
        <br />
        <br />
        <asp:Label ID="label" runat="server" ForeColor="Black" Text="Apasati butonul 'Delete' aferent rezervarii pe care doriti sa o stergeti!" CssClass="auto-style2"></asp:Label>
        <br />
        <asp:Label ID="lblMessage" runat="server" ForeColor="#CC0000"></asp:Label>
        <br />
    </div>
</asp>
                    <!-- DataTales Example -->
<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="auto-style3"><strong>Rezervari bilete online</strong></h6>
    </div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="tabelRezervari" runat="server" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        
                        <th>NumeUtilizator</th>
                        <th>TitluFilm</th>
                        <th>Data</th>
                        <th>NrBilete</th>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </div>
</div>

                </div>
                <div class="text-center">
                <!-- /.container-fluid -->

                  <!--  <asp:Button ID="butonUndo" runat="server" BackColor="Maroon" ForeColor="White" Height="70px" Text="UNDO!" Width="151px" />
                    <asp:Button ID="butonRedo" runat="server" BackColor="Maroon" ForeColor="White" Height="70px" Text="REDO!" Width="151px" /> -->
                </div>

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->

        </div>
        

    </div>
        <p>
            &nbsp;</p>
    </form>
</body>
</html>

