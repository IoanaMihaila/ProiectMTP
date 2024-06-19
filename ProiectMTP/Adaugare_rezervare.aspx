<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Adaugare_rezervare.aspx.cs" Inherits="ProiectMTP.Adaugare_rezervare" UnobtrusiveValidationMode="None"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Cinema - Adaugare Rezervare</title>
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
            font-size: small;
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
                        <h1 class="auto-style2">Rezervare bilet online la cinema!</h1>
                        <p class="auto-style3">Poti rezerva maxim 10 bilete per utilizator!</p>
                        <asp class="sticky-footer bg-white" style="text-align: center">
                            <div class="container my-auto" style="text-align: center">
                                <div class="copyright text-center my-auto">
                                    <asp:Label ID="Label1" runat="server" Text="Introduceti titlul filmului: "></asp:Label>
                                    <asp:DropDownList ID="ddlTitluFilm" AutoPostBack="True" runat="server" Width="208px">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlTitluFilm" ErrorMessage="Camp obligatoriu!" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                                </div>
                                <asp:Label ID="Label2" runat="server" Text="Introduceti data si ora:  "></asp:Label>
                                <asp:DropDownList ID="ddlDataOra" runat="server" Width="213px">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlDataOra" ErrorMessage="Camp obligatoriu!" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                                <br />
                                <asp:Label ID="Label3" runat="server" Text="Introduceti numarul de bilete pe care il doriti:"></asp:Label>
                                <asp:TextBox ID="txtNrBilete" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtNrBilete" ErrorMessage="Camp obligatoriu!" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                                <asp:Label ID="labelValidare" runat="server" ForeColor="#CC0000"></asp:Label>
                                <br />
                                <asp:HiddenField ID="hiddenImageData" runat="server" />
                                <br />
                                <asp:Label ID="Label4" runat="server" Text="Încărcați imaginea filmului pentru rezervare:"></asp:Label>
                                <asp:Label ID="labelIMG" runat="server" ForeColor="#CC0000"></asp:Label>
                                <br style="background-image: url('Imagini/Fundal.jpg')" />

                                <div id="dropZone" runat="server" style="border: 2px dashed #ccc; padding: 20px;">
                                    Trageți și plasați fișiere aici
                                </div>
                                
                                 <script>
                                    document.addEventListener("DOMContentLoaded", function () {
                                        var dropArea = document.getElementById("dropZone");

                                        // Eveniment pentru a preveni acțiunea implicită a browserului pentru tragerea și plasarea fișierelor
                                        dropArea.addEventListener("dragover", function (e) {
                                            e.preventDefault();
                                        });

                                        // Eveniment pentru a procesa fișierele trase și plasate
                                        dropArea.addEventListener("drop", function (e) {
                                            e.preventDefault();
                                            var files = e.dataTransfer.files;
                                            handleFiles(files);
                                        });
                                    });

                                    function handleFiles(files) {
                                        if (files.length > 0) {
                                            var file = files[0];
                                            if (file.type.match("image.*")) {
                                                var reader = new FileReader();

                                                reader.onload = function (e) {
                                                    var img = document.createElement("img");
                                                    img.src = e.target.result;
                                                    img.style.width = "200px";
                                                    img.style.margin = "5px";

                                                    var dropArea = document.getElementById("dropZone");
                                                    dropArea.appendChild(img);

                                                    // Save the image data in a hidden field for the form
                                                    var hiddenImageField = document.getElementById('<%= hiddenImageData.ClientID %>');
                                                    hiddenImageField.value = e.target.result;
                                                };

                                                reader.readAsDataURL(file);
                                            } else {
                                                alert("Doar fișierele de imagine sunt acceptate.");
                                            }
                                        }
                                    }
                                </script> 

                                <asp:Button ID="butonRezervare" runat="server" BackColor="Gray" ForeColor="White" Height="55px" Text="Rezerva!" Width="154px" OnClick="butonRezervare_Click" OnClientClick="return confirmRezervare();" />
                                <script type="text/javascript">
                                    function confirmRezervare() {
                                        return confirm("Ești sigur că vrei să rezervi biletele?");
                                    }
                                </script>
                                <asp:Label ID="lblErrorMessage" runat="server" ForeColor="Maroon"></asp:Label>
                                <asp:Label ID="lbl1" runat="server" ForeColor="#009933"></asp:Label>
                                <br />
                                <br />
                                <br />
                                <br />
                            </div>
                        </asp>

                        <!-- DataTales Example -->
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-danger">Rezervari bilete online</h6>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="tabelRezervari" runat="server" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>Imagine</th>
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
                    <!-- /.container-fluid -->

                </div>
                <!-- End of Main Content -->

            </div>

        </div>
    </form>
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            var rows = document.querySelectorAll("#tabelRezervari tr");
            rows.forEach(function (row) {
                row.addEventListener("click", function () {
                    console.log("Row clicked!");
                });
            });
        });
    </script>

</body>
</html>
