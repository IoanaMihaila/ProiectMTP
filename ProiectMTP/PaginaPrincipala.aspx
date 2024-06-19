<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PaginaPrincipala.aspx.cs" Inherits="ProiectMTP.PaginaPrincipala" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <link href="TemplateFiles/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="TemplateFiles/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
    <link href="TemplateFiles/css/sb-admin-2.min.css" rel="stylesheet">

    <title>Cinema - Pagina Principala</title>

    <!-- Custom fonts for this template -->
    <link href="TemplateFiles/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="TemplateFiles/css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="Templatefiles/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

     <style type="text/css">
        .auto-style1 {
            color: #e74a3b;
            position: absolute;
            top: 136px;
            left: 456px;
        }
        .auto-style2 {
            color: #4e73df;
            position: absolute;
            top: 135px;
            left: 769px;
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
                <div class="sidebar-brand-text mx-3">CINEMA<sup></sup></div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
                    aria-expanded="true" aria-controls="collapsePages">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>Pages</span>
                </a>
                <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Login Screens:</h6>
                        <a class="collapse-item" href="Autentificare.aspx">Login</a>
                        <div class="collapse-divider"></div>
                        <h6 class="collapse-header">Other Pages:</h6>
                        <a class="collapse-item" href="Cautare.aspx">Cautare</a>
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
                    <asp:Label ID="lblUserName" runat="server" CssClass="auto-style2" ForeColor="Black"></asp:Label>

                    <asp:Label ID="lblErrorMessage" runat="server" Text="" CssClass="auto-style1"></asp:Label>

                    <!-- Sidebar Toggle (Topbar) -->
                        <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                            <i class="fa fa-bars"></i>
                        </button>

                    

                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">

                        <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                        <li class="nav-item dropdown no-arrow d-sm-none">
                        <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <i class="fas fa-search fa-fw"></i>
                        </a>
                        <!-- Dropdown - Messages -->
                        <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                        aria-labelledby="searchDropdown">
                            <div class="input-group">
                            <input type="text" class="form-control bg-light border-0 small"
                            placeholder="Search for..." aria-label="Search"
                            aria-describedby="basic-addon2">
                                <div class="input-group-append">
                                <button class="btn btn-danger" type="button">
                                <i class="fas fa-search fa-sm"></i>
                                </button>
                                </div>
                            </div>
                    </div>
                    </li>

                        <div class="topbar-divider d-none d-sm-block"></div>

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
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">Pagina Principala</h1>
                    <p class="mb-4">Nu rata cele mai tari filme din acest sezon la Cinema!</p>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-danger">Filme Cinema</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="tabelFilme" runat="server" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>TitluFilm</th>
                                            <th>Gen</th>
                                            <th>Data</th>
                                            <th>Sala</th>
                                            <th>Durata</th>
                                            <th>NrLocuri</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <asp:Button ID="ButtonLogin" runat="server" BackColor="Gray" BorderColor="Black" Height="57px" OnClick="ButtonLogin_Click" Text="Login" Width="218px" ForeColor="White" />
                    <asp:Button ID="ButtonCautare" runat="server" BackColor="Gray" BorderColor="Black" Height="57px" OnClick="ButtonCautare_Click" Text="Cautare" Width="218px" ForeColor="White" />
                    <asp:Button ID="ButtonModificare" runat="server" BackColor="Gray" BorderColor="Black" Height="57px" OnClick="ButtonModificare_Click" Text="Modificare" Width="218px" ForeColor="White" />
                    <asp:Button ID="ButtonStergere" runat="server" BackColor="Gray" BorderColor="Black" Height="57px" OnClick="ButtonStergere_Click" Text="Stergere" Width="218px" ForeColor="White" />
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.html">Logout</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="TemplateFiles/vendor/jquery/jquery.min.js"></script>
    <script src="TemplateFiles/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="TemplateFiles/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="TemplateFiles/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="TemplateFiles/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="TemplateFiles/vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="TemplateFiles/js/demo/datatables-demo.js"></script>

    </form>

</body>
</html>
