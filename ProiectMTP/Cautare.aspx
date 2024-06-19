

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cautare.aspx.cs" Inherits="ProiectMTP.Cautare" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Cinema - Cautare film</title>
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
            color: #800000;
            font-family: Broadway;
        }
        .auto-style2 {
            color: #000000;
            font-size: medium;
        }
        #imgFilm {
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.5); /* Adaugă o umbră de 10px cu opacitatea de 50% */
}
        .auto-style4 {
            font-family: Broadway;
        }
        .auto-style5 {
            font-family: "Dubai Medium";
        }
        .auto-style6 {
            margin-right: 0px;
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
                        <!-- Restul codului din topbar -->
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
                    <h1 class="auto-style4">Cautare film</h1>
                    <p class="h3 mb-4 text-gray-800"><strong>
                        <asp:Label ID="Label2" runat="server" CssClass="auto-style1" Text="Cauta filmul pe care ai vrea sa-l vizionezi la cinema:"></asp:Label>
                        </strong>
                    <p class="h3 mb-4 text-gray-800">
                        <asp:TextBox ID="txtCautare0" runat="server" Width="328px"></asp:TextBox>
                        <asp:Button ID="butonCautare0" runat="server" OnClick="butonCautare0_Click" Text="Cautare" />
                        <asp:Label ID="lblErrorMessage" runat="server" ForeColor="#CC0000" CssClass="auto-style5"></asp:Label>
                        <asp:Label ID="label1" runat="server" ForeColor="#009900"></asp:Label>
                        <div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="auto-style2">
            <asp:Label ID="labelCautare" runat="server" EnableViewState="False" ForeColor="Black" Font-Size="20px" Font-Bold="true" Font-Names="Arial, sans-serif" CssClass="auto-style5"></asp:Label>
            </h6>
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
                    </p>
                    <p class="text-left">
                        <asp:Image ID="imgFilm" runat="server" BackColor="#999999" BorderColor="Black" CssClass="auto-style6" />

                        <!-- Rating-ul cu steluțe -->
<div class="rating" id="filmRating">
    <input type="radio" name="star" id="star1" value="1"><label for="star1">★</label>
    <input type="radio" name="star" id="star2" value="2"><label for="star2">★</label>
    <input type="radio" name="star" id="star3" value="3"><label for="star3">★</label>
    <input type="radio" name="star" id="star4" value="4"><label for="star4">★</label>
    <input type="radio" name="star" id="star5" value="5"><label for="star5">★</label>&nbsp;&nbsp;&nbsp;&nbsp; <strong>RATING</strong></div>
                        <!-- Elementul pentru textul cu numărul de steluțe -->
<p id="ratingText" style="display: none;"></p>
                        
<script>
    if (document.getElementById('labelCautare').textContent.trim() === "Filmul este disponibil în cinema! Iată perioadele în care poate fi vizionat.") {
        // Adaugă un eveniment de clic pentru fiecare steluță
        document.querySelectorAll('.rating input[type="radio"]').forEach(function (star) {
            star.addEventListener('click', function () {
                // Afișează elementul pentru textul cu numărul de steluțe
                var ratingText = document.getElementById('ratingText');
                ratingText.style.display = 'block';
                // Actualizează textul cu numărul de steluțe selectate
                ratingText.textContent = "Ați apreciat filmul cu " + this.value + " steluțe.";
            });
        });
    }
</script>
                    </p>
                    <p class="h3 mb-4 text-gray-800">
                        &nbsp;</p>
                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <footer class="sticky-footer bg-white" style="text-align: center">
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

    </form>

</body>
</html>