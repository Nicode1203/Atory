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
  <!-- partial -->
  <?php
  include_once "conexion.php";

  $id = $_GET['id'];
  $sql = "SELECT * FROM cliente  
      INNER JOIN factura
      ON cliente.idCliente=factura.cliente_idCliente
      WHERE idCliente= '$id';";

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
      $creado = $row['creado'];
      $uact = $row['ultimaActualizacion'];
      $if = $row['idFactura'];
      $ffact = $row['fechaFactura'];
      $impt = $row['impuestoTotal'];
      $st = $row['valorTotalFactura'];
      $cid = $row['cliente_idCliente'];
      $estf = $row['estadoFactura'];
    }
  }
  ?>
  <div class="main-panel">
    <div class="content-wrapper">
      <div class="page-header">
        <h1 style="font-size: 32px;">SU FACTURA</h1>
        <nav aria-label="breadcrumb">
        </nav>
      </div>
      <div class="row">
        <div class="col-md-6 grid-margin stretch-card">
          <div class="card">
            <div class="card-body">

              <form class="forms-sample">
                <div class="form-group">
                  <div class="card-body">
                    <h4 class="card-title">Hola <?php echo "$nomc" ?></h4>
                    <h4 class="card-title">Con <?php echo "$td: $doc" ?></h4>
                    <h4 class="card-title">Pago oportuno :<?php echo "     $ffact" ?> </h4>


                      <div class="form-group">
                        <label for="des"> Su telefono es <?php echo "$telc" ?></label>
                      </div>
                      <div class="form-group">
                         <label for="des"> Su correo es: <?php echo "$emailc" ?></label>
                      </div>
                      <div class="form-group">
                        <label for="des">Su dirección <?php echo "$dc" ?></label>
                      </div>
                      <div class="form-group">
                        <label for="cp"> La cual se encuentra: <?php echo "$estf" ?> </label>
                      </div>
                      <div class="form-group">
                        <h4 label for="cp">Sub total: <?php echo "$st" ?></label></h4>
                      </div>
                      <div class="form-group">
                        <h4 label for="vel">Impuesto: <?php echo "$impt" ?></label></h4>
                      </div>
                      <div class="form-group">
                      <h4 label for="plan">________________________</label></h4>                        
                        <h4 label for="plan">Valor total a pagar: <?php echo " $st" ?></label></h4>
                      </div>

                      <a href="../index.html" class="btn btn-danger btn-lg active" role="button" aria-pressed="true">Volver a pagina inicial</a>

                  </div>
                </div>
            </div>

          </div>

        </div>

      </div>

    </div>

    <script src="../assets/vendors/js/vendor.bundle.base.js"></script>

    <script src="../assets/js/off-canvas.js"></script>
    <script src="../assets/js/hoverable-collapse.js"></script>
    <script src="../assets/js/misc.js"></script>
    <script src="../assets/js/settings.js"></script>
    <script src="../assets/js/todolist.js"></script>

</body>

</html>