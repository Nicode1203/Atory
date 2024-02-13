<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Atory-Visita consulta</title>
  <!-- plugins:css -->
  <link rel="stylesheet" href="../assets/vendors/mdi/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="../assets/vendors/css/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- Plugin css for this page -->
  <!-- End Plugin css for this page -->
  <!-- inject:css -->
  <!-- endinject -->
  <!-- Layout styles -->
  <link rel="stylesheet" href="../../assets/css/style.css">
  <!-- End layout styles -->
  <link rel="shortcut icon" href="../assets/images/favicon.png" />
</head>

<body>
  <?php
  include '../menu/menuint.php';
  ?>
  <!-- partial -->
  <?php
  include_once "conexion.php";
  $id = $_GET["id"];
  $sql = "SELECT * FROM visitas WHERE idVisita='$id';";
  if ($rta = $con->query($sql)) {
    while ($row = $rta->fetch_assoc()) {
      $nomCliente = $row['nombreCliente'];
      $telCliente = $row['telefonoCliente'];
      $dirCliente = $row['direccionCliente'];
      $nomTec = $row['nombreTecnico'];
      $motivo = $row['motivoVisita'];
      $diaVisita = $row['diaVisita'];
    }
  }
  ?>
  <div class="main-panel">
    <div class="content-wrapper">
      <div class="page-header">
        <h3 class="page-title">Visitas: </h3>
      </div>
      <div class="row">
        <div class="col-md-12 grid-margin stretch-card">
          <div class="card">
            <div class="card-body">
              <h4 class="card-title"><?php echo "$nomCliente" ?></h4>
              <form class="forms-sample">
                <div class="form-group">
                  <label for="">Telefono Cliente: <?php echo "$telCliente" ?></label>
                </div>
                <div class="form-group">
                  <label for="vel">Direccion Cliente : <?php echo "$dirCliente" ?></label>
                </div>
                <div class="form-group">
                  <label for="plan">Nombre Tecnico : <?php echo " $nomTec" ?></label>
                </div>
                <div class="form-group">
                  <label for="plan">Motivo de la visita : <?php echo " $motivo" ?></label>
                </div>
                <div class="form-group">
                  <label for="plan">Fecha de la visita : <?php echo " $diaVisita" ?></label>
                </div>
                <div class="form-button mt-5">
                  <button id="submit" type="submit" formmethod="post" formaction="../visitas/tablasVisitas.php" class="btn btn-primary">Volver a todas las visitas</button>
                </div>

              </form>
            </div>
          </div>
        </div>
      </div>

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