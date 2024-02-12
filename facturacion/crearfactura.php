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
  <?php
  include("conexion.php");
  $doc = $_POST['id'];
  $sql = "SELECT * FROM cliente  
  INNER JOIN plan
  ON cliente.plan_idPlan=plan.idPlan
  WHERE documentoCliente= '$doc'";
  $query = mysqli_query($con, $sql);
  $row = mysqli_fetch_array($query);
  if ($rta = $con->query($sql)) {
    while ($row = $rta->fetch_assoc()) {
      $id = $row['idCliente'];
      $td = $row['tipoDocumento'];
      $doc = $row['documentoCliente'];
      $nomc = $row['nombreCliente'];
      $telc = $row['telefonoCliente'];
      $emailc = $row['correoCliente'];
      $dc = $row['direccion'];
      $ec = $row['estadoCliente'];
      $plancliente=$row['plan_idPlan'];
      $creado = $row['creado'];
      $uact = $row['ultimaActualizacion'];
      $idplan=$row['idPlan'];
      $codigoplan=$row['codigoPlan'];
      $tipoplan=$row['tipoPlan'];
      $velplan=$row['$velocidad'];
      $nombreplan=$row['nombrePlan'];
      $precioplan=$row['precioPlan'];
      $descripcionplan=$row['desPlan'];
      $estadoplan=$row['estadoPlan'];
      $cid=$id;
      $st=$precioplan;
      $impt=$st*0.19;
      $sub=$st*0.81;
    }
  }

  ?>
  ?>
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
  <!-- partial -->


  <div class="main-panel">
    <div class="content-wrapper"> <!-- ESTO ES LO QUE TENEMOS QUE MODIFICAR -->
      <div class="card-body">
        <h4 class="card-title">INGRESAR NUEVA FACTURA</h4>
        <p class="card-description"> Cliente: <?php echo "$doc"  ?></p>
        <p class="card-description"> Documento:<?php echo "$nomc"  ?> </p>
        <p class="card-description"> Telefono:<?php echo "$telc"  ?> </p>
        <p class="card-description"> Correo Electronico:<?php echo "$emailc"  ?> </p>
        <p class="card-description"> Dirección Cliente:<?php echo "$dc"  ?> </p>
        <p class="card-description"> Plan del cliente:<?php echo "$tipoplan"  ?> </p>
        <p class="card-description"> velocidad del plan:<?php echo "$velplan"  ?> </p>
        <p class="card-description"> Subtotal a pagar: <?php echo "$sub"  ?> </p>
        <p class="card-description"> Impuestos: <?php echo "$impt"  ?> </p>
        <p class="card-description"> Total: <?php echo "$st"  ?> </p>
        <p class="card-description"> Ingrese fecha de pago:</p>
        <form action="actfactura.php" method="POST">
          <input type="hidden" name="if" value="<?php echo "$if"  ?>">
          <input type="hidden" name="id" value="<?php echo "$id"  ?>">
          <input type="hidden" name="cid" value="<?php echo "$cid"  ?>">
          <input type="date" class="form-control mb-3" name="ffact" placeholder="Fecha de factura">
          <input type="hidden" name="impt" value="<?php echo "$impt"  ?>">
          <input type="hidden" name="sub" value="<?php echo "$sub"  ?>">
          <input type="hidden" name="st" value="<?php echo "$st"  ?>">
          
          <input type="submit" class="btn btn-primary btn-block" value="crear" formmethod="post" formaction=ingresarfactura.php>
        </form>

        <div class="row">
          <div>
            <div>

            </div>
          </div>

        </div>




      </div>
      <!-- ESTO ES LO QUE PODEMOS MODIFICAR -->
      <!-- partial:partials/_footer.html -->

      <!-- partial -->
    </div>
    <footer class="footer">
      <div class="d-sm-flex justify-content-center justify-content-sm-between">
        <span class="text-muted d-block text-center text-sm-left d-sm-inline-block">Copyright © Atory Solution 2023</span>
        <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center"> <a href=" " target="_blank"></a> </span>
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