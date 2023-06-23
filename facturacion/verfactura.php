<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>AtorySolution</title>
  <!-- plugins:css -->
  <link rel="stylesheet" href="../assets/vendors/mdi/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="../assets/vendors/css/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- Plugin css for this page -->
  <!-- End Plugin css for this page -->
  <!-- inject:css -->
  <!-- endinject -->
  <!-- Layout styles -->
  <link rel="stylesheet" href="../assets/css/style.css">
  <!-- End layout styles -->
  <link rel="shortcut icon" href="../assets/images/favicon.png" />
</head>

<body>
  <div class="container-scroller">
    <!-- partial:../../partials/_sidebar.html -->

    <nav class="sidebar sidebar-offcanvas" id="sidebar">
      <div class="sidebar-brand-wrapper d-none d-lg-flex align-items-center justify-content-center fixed-top">
        <!-- Logo de Atory -->
        <a class="sidebar-brand brand-logo" href="../index.html">
          <img src="../assets/images/atori.png" alt="logo">
        </a>
        <!-- Volver a inicio -->
        <a class="sidebar-brand brand-logo-mini" href="../index.html">
          <img src="../assets/images/logo-mini.png" alt="logo">
        </a>
      </div>
      <ul class="nav">

        <li class="nav-item menu-items">
          <a class="nav-link" data-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
            <span class="menu-icon">
              <i class="mdi mdi-laptop"></i>
            </span>
            <span class="menu-title">Facturas</span>
            <i class="menu-arrow"></i>
          </a>
        </li>
      </ul>
    </nav>
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
      <!-- partial:../../partials/_navbar.html -->
      <nav class="navbar p-0 fixed-top d-flex flex-row">
        <div class="navbar-brand-wrapper d-flex d-lg-none align-items-center justify-content-center">
          <a class="navbar-brand brand-logo-mini" href="index.html"><img src="../assets/images/logo-mini.svg" alt="logo" /></a>
        </div>
        <div class="navbar-menu-wrapper flex-grow d-flex align-items-stretch">
          <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
            <span class="mdi mdi-menu"></span>
          </button>
          <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
            <span class="mdi mdi-format-line-spacing"></span>
          </button>
        </div>
      </nav>
      <!-- partial -->
      <?php
      include_once "conexion.php";

      $id=$_GET['id'];       
      $sql= "SELECT * FROM cliente  
      INNER JOIN factura
      ON cliente.idCliente=factura.cliente_idCliente
      WHERE idCliente= '$id';";

      if ($rta = $con->query($sql)) {
        while ($row = $rta->fetch_assoc()) {
          $id = $row['idCliente'];
          $td=$row['tipoDocumento'];
          $doc=$row['documentoCliente'];
          $nomc=$row['nombreCliente'];
          $telc=$row['telefonoCliente'];
          $emailc=$row['correoCliente'];
          $dc=$row['direccion'];
          $ec=$row['estadoCliente'];
          $creado=$row['creado'];
          $uact=$row['ultimaActualizacion'];
          $if=$row['idFactura'];
          $ffact=$row['fechaFactura'];
          $impt=$row['impuestoTotal'];
          $st=$row['valorTotalFactura'];
          $cid=$row['cliente_idCliente'];
          $estf=$row['estadoFactura'];
        }
      }
      ?>
      <div class="main-panel">
        <div class="content-wrapper">
          <div class="page-header">
            <h2 class="page-title">Factura</h2>
            <h4 class="card-title">Factura mes <?php echo "$ffact"?></h4>
          </div>
          <div class="row">
            <div class="col-md-6 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title">ESTIMADO <?php echo "$nomc" ?>, identificado con <?php echo "$td: $doc"?></h4>
                  <form class="forms-sample">
                    <div class="form-group">
                    <div class="card-body">
                  <h4 class="card-title">Esta es su factura correspontiente de <?php echo "$ffact"?> </h4> 
                  
                  <form class="forms-sample">
                  <div class="form-group">
                      <label for="cp"> La cual se encuentra:  <?php echo "$estf"?> </label>
                    </div>
                    <div class="form-group">
                      <label for="cp">Sub total: <?php echo "$st" ?></label>
                    </div>
                    <div class="form-group">
                      <label for="vel">Impuesto: <?php echo "$impt" ?></label>
                    </div>
                    <div class="form-group">
                      <label for="plan">Valor total a pagar: <?php echo " $st" ?></label>
                    </div>
                    <div class="form-group">
                      <label for="des"> Le recordamos su información de contacto, su telefono es <?php echo "$telc" ?> y su correo es: <?php echo "$emailc" ?></label>
                    </div>
                    <div class="form-group">
                      <label for="des"> Tambien le estará llegando una copia a su dirección <?php echo "$dc" ?></label>
                    </div>
                  </form>
                </div>
              </div>
            </div>
           
          <!-- content-wrapper ends -->
          <!-- partial:../../partials/_footer.html -->
          <footer class="footer">
            <div class="d-sm-flex justify-content-center justify-content-sm-between">
              <span class="text-muted d-block text-center text-sm-left d-sm-inline-block">Copyright © AtorySolution 2023</span>
          </footer>

        </div>
        <!-- partial -->
      </div>
      <!-- main-panel ends -->
    </div>
    <!-- page-body-wrapper ends -->
  </div>
  <!-- container-scroller -->
  <!-- plugins:js -->
  <script src="../assets/vendors/js/vendor.bundle.base.js"></script>
  <!-- endinject -->
  <!-- Plugin js for this page -->
  <!-- End plugin js for this page -->
  <!-- inject:js -->
  <script src="../assets/js/off-canvas.js"></script>
  <script src="../assets/js/hoverable-collapse.js"></script>
  <script src="../assets/js/misc.js"></script>
  <script src="../assets/js/settings.js"></script>
  <script src="../assets/js/todolist.js"></script>
  <!-- endinject -->
</body>

</html>