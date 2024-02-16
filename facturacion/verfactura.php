<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>AtorySolution</title>
  <link rel="stylesheet" href="../assets/vendors/mdi/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="../assets/vendors/css/vendor.bundle.base.css">
  <link rel="stylesheet" href="../assets/css/style.css">
  <link rel="shortcut icon" href="../assets/images/favicon.png" />
  <style>
    .form-group>div {
      margin-bottom: 1px;
      /* Ajusta este valor según lo necesites */
    }
  </style>
</head>

<body>
  <?php
  include_once "conexion.php";

  $id = $_GET['id'];
  $sql = "SELECT * FROM cliente  
  INNER JOIN plan
  on cliente.plan_idPlan=plan.idPlan
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
      $plancliente = $row['plan_idPlan'];
      $creado = $row['creado'];
      $uact = $row['ultimaActualizacion'];
      $idplan = $row['idPlan'];
      $codigoplan = $row['codigoPlan'];
      $tipoplan = $row['tipoPlan'];
      $vp = $row['velocidad'];
      $nombreplan = $row['nombrePlan'];
      $precioplan = $row['precioPlan'];
      $descripcionplan = $row['desPlan'];
      $estadoplan = $row['estadoPlan'];
      $if = $row['idFactura'];
      $ffact = $row['fechaFactura'];
      $impt = $row['impuestoTotal'];
      $sub = $row['subTotal'];
      $st = $row['valorTotalFactura'];
      $cid = $row['cliente_idCliente'];
      $estf = $row['estadoFactura'];
    }
  }
  ?>
  <div class="main-panel">
    <div class="content-wrapper">
      <div class="page-header">
        <h2 class="page-title">FACTURA</h2>
      </div>
      <div class="row">
        <div class="col-md-6 grid-margin stretch-card">
          <div class="card">
            <div class="card-body">
              <div style="text-align: center;">
                <img class="logo" src="../empresa/logoEmpresa.png" alt="logo" style="max-width: 20%; height: auto" class="img-responsive" />
              </div>
              <br>
              <center>
                <h2 class="card-title">BITS PLAY SAS</h2>
              </center>


              <form class="forms-sample">

                <div class="form-group">
                  <div class="card-body">

                    <form class="forms-sample">
                      <center><class="card-title">PROVEEDORES DE SERVICIO DE INTERNET</center>
                      <center><class="card-title">NIT. 989988998-8 </center>
                      <center><class="card-title">tel. +57 312 2800098 </center>
                      <center><class="card-title">whatsapp +57 318 6005008 </center>
                      <br>
                      <h4 class="card-title">Hola <?php echo "$nomc" ?></h4>

                      <div class="form-group">
                        <div>
                          <label for="cp">Con : <?php echo "$td: $doc" ?></label>
                        </div>
                        <div>
                          <label for="des"> Su telefono es <?php echo "$telc" ?></label>
                        </div>
                        <div>
                          <label for="des"> Su correo es: <?php echo "$emailc" ?></label>
                        </div>
                        <div>
                          <label for="cp">Tu factura correspondiente al : <?php echo "$ffact" ?></label>
                        </div>
                        <div>
                          <label for="cp">Con <?php echo "$nombreplan" ?></label>
                        </div>
                        <div>
                          <label for="cp">Tipo: <?php echo "$tipoplan" ?></label>
                        </div>
                        <div>
                          <label for="cp">Velocidad: <?php echo "$vp" ?></label>
                        </div>
                        <div>
                          <label for="cp">Tu factura se encuentra actualmente: <?php echo "$estf" ?> </label>
                        </div>
                        <br>
                        <div>
                          <center><label for="cp">Sub total: <?php echo "$sub" ?></label></center>
                        </div>
                        <div>
                          <center><label for="vel">IVA 19%: <?php echo "$impt" ?></label></center>
                        </div>
                        <div>
                          <center><label>_______________________</label></center>
                        </div>
                        <div>
                          <center><label for="plan">Valor total a pagar: <?php echo " $st" ?></label></center>
                        </div>

                      </div>

                      <a href="../index.html" class="btn btn-light btn-lg active" role="button" aria-pressed="true">Volver </a>
                    </form>
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