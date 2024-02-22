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

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Atory Solutions</title>

  <link rel="stylesheet" href="../assets/vendors/mdi/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="../assets/vendors/css/vendor.bundle.base.css">


  <link rel="stylesheet" href="../assets/vendors/jvectormap/jquery-jvectormap.css">
  <link rel="stylesheet" href="../assets/vendors/flag-icon-css/css/flag-icon.min.css">
  <link rel="stylesheet" href="../assets/vendors/owl-carousel-2/owl.carousel.min.css">
  <link rel="stylesheet" href="../assets/vendors/owl-carousel-2/owl.theme.default.min.css">

  <link rel="stylesheet" href="../assets/css/style.css">

  <link rel="shortcut icon" href="../assets/images/favicon.png">

</head>

<body>
  <?php
  include '../menu/menuint.php';
  ?>



  <div class="main-panel">
    <div class="content-wrapper"> <!-- ESTO ES LO QUE TENEMOS QUE MODIFICAR -->
      <div class="page-header">
        <h1 style="font-size: 32px;">GESTIÓN FACTURAS</h1>
      </div>
      <div class="card">
        <div class="card-body">
          <a href="facturas.php" class="btn btn-primary btn-lg active" role="button" aria-pressed="true">Volver a facturas pendientes</a>
          <?php

          include("conexion.php");

          $sql = "SELECT cliente.idCliente,factura.cliente_idCliente,cliente.documentoCliente,cliente.nombreCliente,factura.idFactura,factura.fechaFactura,factura.valorTotalFactura,factura.estadoFactura FROM cliente 
        INNER JOIN factura
        ON cliente.idCliente=factura.cliente_idCliente
        WHERE estadoFactura='Pago'
        ORDER BY fechaFactura DESC;";

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
              $idf = $row['idFactura'];
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

                <th><a href="pend.php?id=<?php echo $row['cliente_idCliente']   ?>" class="btn btn-danger">Regresar a pendientes</a></th>

              </tr>
          <?php
            }
          }
          ?>

          <!-- ESTO ES LO QUE PODEMOS MODIFICAR -->
          <!-- partial:partials/_footer.html -->


        </div>
      </div>


    </div>



  </div>


  <script src="../assets/vendors/js/vendor.bundle.base.js"></script>

  <script src="../assets/vendors/chart.js/Chart.min.js"></script>
  <script src="../assets/vendors/progressbar.js/progressbar.min.js"></script>
  <script src="../assets/vendors/jvectormap/jquery-jvectormap.min.js"></script>
  <script src="../assets/vendors/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
  <script src="../assets/vendors/owl-carousel-2/owl.carousel.min.js"></script>

  <script src="../assets/js/off-canvas.js"></script>
  <script src="../assets/js/hoverable-collapse.js"></script>
  <script src="../assets/js/misc.js"></script>
  <script src="../assets/js/settings.js"></script>
  <script src="../assets/js/todolist.js"></script>

  <script src="../assets/js/dashboard.js"></script>

  <div class="jvectormap-tip"></div>
</body>

</html>