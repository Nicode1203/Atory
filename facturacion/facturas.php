<?php
//seguridad de sesiones paginacion (prueba 1)
session_start();
error_reporting(0);
$varsesion = $_SESSION['usuario'];
if ($varsesion == null || $varsesion = '') {
  header("location:../index.html");
  die();
  exit;
}

?>
<!DOCTYPE html>
<html>

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Atory Solutions</title>
  <!-- plugins:css -->
  <link rel="stylesheet" href="../assets/vendors/mdi/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="../assets/vendors/css/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- Plugin css for this page -->
  <link rel="stylesheet" href="../assets/vendors/jvectormap/jquery-jvectormap.css">
  <link rel="stylesheet" href="../assets/vendors/flag-icon-css/css/flag-icon.min.css">
  <link rel="stylesheet" href="../assets/vendors/owl-carousel-2/owl.carousel.min.css">
  <link rel="stylesheet" href="../assets/vendors/owl-carousel-2/owl.theme.default.min.css">

  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <!-- endinject -->
  <!-- Layout styles -->
  <link rel="stylesheet" href="../assets/css/style.css">
  <!-- End layout styles -->
  <link rel="shortcut icon" href="../assets/images/favicon.png">
  <style type="text/css">
    /* Chart.js */
    @keyframes chartjs-render-animation {
      from {
        opacity: .99
      }

      to {
        opacity: 1
      }
    }

    .chartjs-render-monitor {
      animation: chartjs-render-animation 1ms
    }

    .chartjs-size-monitor,
    .chartjs-size-monitor-expand,
    .chartjs-size-monitor-shrink {
      position: absolute;
      direction: ltr;
      left: 0;
      top: 0;
      right: 0;
      bottom: 0;
      overflow: hidden;
      pointer-events: none;
      visibility: hidden;
      z-index: -1
    }

    .chartjs-size-monitor-expand>div {
      position: absolute;
      width: 1000000px;
      height: 1000000px;
      left: 0;
      top: 0
    }

    .chartjs-size-monitor-shrink>div {
      position: absolute;
      width: 200%;
      height: 200%;
      left: 0;
      top: 0
    }
  </style>
</head>

<body>
  <?php
  include '../menu/menuint.php';
  ?>


  <div class="main-panel">
    <div class="content-wrapper"> <!-- ESTO ES LO QUE TENEMOS QUE MODIFICAR -->
      <h1 style="font-size: 32px;">GESTIÓN FACTURAS</h1>
      <div class="card">
      <div class="card-body">
      <a href="factcliente.php" class="btn btn-danger" role="button" aria-pressed="true">Ingresar factura</a>
        <a href="fpagas.php" class="btn btn-primary active" role="button" aria-pressed="true">Ver facturas pagas</a>
        <a href="consultarf.php" class="btn btn-primary active" role="button" aria-pressed="true">Consultar facturas</a>
        
        <a href="../excel/excelFactura.php" class="btn btn-success">Exportar tabla a Excel</a>
        <?php

        include("conexion.php");

        $sql = "SELECT cliente.idCliente,factura.cliente_idCliente,cliente.documentoCliente,cliente.nombreCliente,factura.fechaFactura,factura.valorTotalFactura,factura.estadoFactura FROM cliente 
                    INNER JOIN factura
                    ON cliente.idCliente=factura.cliente_idCliente
                    WHERE estadoFactura='Pendiente';";

        echo '<div class="table-responsive">
            <table class="table table-hover">
            <thead>
        <tr>
        <th> Documento Cliente </th>
        <th> Nombre Cliente</th>
        <th> Fecha Factura</th>
        <th> Valor Total</th>
        <th> Estado factura</th>
        <th> Consultas</th>
        <th> Pago</th>
    </tr>
    </thead>
    ';

        if ($rta = $con->query($sql)) {
          while ($row = $rta->fetch_assoc()) {
            $a = $row['idCliente'];
            $b = $row['cliente_idCliente'];
            $dc = $row['documentoCliente'];
            $nomc = $row['nombreCliente'];
            $ffact = $row['fechaFactura'];
            $st = $row['valorTotalFactura'];
            $estf = $row['estadoFactura'];


        ?>
            <tr>
              <td> <?php echo "$dc" ?></td>
              <td> <?php echo "$nomc" ?></td>
              <td> <?php echo "$ffact" ?></td>
              <td> <?php echo "$st" ?></td>
              <td> <?php echo "$estf" ?></td>
              <th>
                <a href="verfacturaAdmin.php?id=<?php echo  $row['idCliente'] ?>" class="btn btn-info">ver factura</a>

              <th><a href="eliminarf.php?id=<?php echo $row['cliente_idCliente']   ?>" class="btn btn-danger">Pago</a></th>

            </tr>
        <?php
          }
        }
        ?>
</div>
        <!-- ESTO ES LO QUE PODEMOS MODIFICAR -->
        <!-- partial:partials/_footer.html -->

        <!-- partial -->
      </div>
      <footer class="footer">
        <div class="d-sm-flex justify-content-center justify-content-sm-between">
          <span class="text-muted d-block text-center text-sm-left d-sm-inline-block">Copyright © Atory Solution 2023</span>
          
        </div>
      </footer>
      <!-- main-panel ends -->
    </div>
    
    <!-- page-body-wrapper ends -->


  </div>

  <!-- container-scroller -->
  <!-- plugins:js -->
  <script src="../assets/vendors/js/vendor.bundle.base.js"></script>
  <!-- endinject -->
  <!-- Plugin js for this page -->
  <script src="../assets/vendors/chart.js/Chart.min.js"></script>
  <script src="../assets/vendors/progressbar.js/progressbar.min.js"></script>
  <script src="../assets/vendors/jvectormap/jquery-jvectormap.min.js"></script>
  <script src="../assets/vendors/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
  <script src="../assets/vendors/owl-carousel-2/owl.carousel.min.js"></script>
  <!-- End plugin js for this page -->
  <!-- inject:js -->
  <script src="../assets/js/off-canvas.js"></script>
  <script src="../assets/js/hoverable-collapse.js"></script>
  <script src="../assets/js/misc.js"></script>
  <script src="../assets/js/settings.js"></script>
  <script src="../assets/js/todolist.js"></script>
  <!-- endinject -->
  <!-- Custom js for this page -->
  <script src="../assets/js/dashboard.js"></script>
  <!-- End custom js for this page -->

  <div class="jvectormap-tip"></div>
</body>

</html>