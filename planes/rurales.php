<?php
//seguridad de sesiones paginacion (prueba 1)
session_start();
error_reporting(0);
$varsesion= $_SESSION['usuario'];
if ($varsesion == null || $varsesion='' ) {
    header ("location:../index.html");
    die();
    exit;
}

?>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Corona Admin</title>
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
  <?php
  include '../menu/menuint.php';
  ?>
  <!-- partial -->
  <div class="main-panel">
    <div class="content-wrapper">
      <div class="page-header">
        <h3 class="page-title"> Planes Rurales </h3>

      </div>
      <div class="row">
        <div class="col-md-12 grid-margin stretch-card">
          <div class="card">
            <div class="card-body">
              <h4 class="card-title">Lista de Planes</h4>
              <form class="forms-sample">
                <?php
                include_once "conexion.php";
                $sql = "SELECT * FROM plan WHERE tipoPlan='rural';";
                echo '<div class="table-responsive">
                      <table class="table table-hover">
                      <thead>
                          <tr>
                              <th> Codigo Plan </th>
                              <th> Velocidad de Plan</th>
                              <th> Nombre de Plan</th>
                              <th> Precio de Plan</th>
                              <th> Estado de Plan</th>
                              <th> Consultar plan</th>
                              <th> Eliminar</th>
                          </tr>
                        </thead>
                          ';
                if ($rta = $con->query($sql)) {
                  while ($row = $rta->fetch_assoc()) {
                    $cp = $row['codigoPlan'];
                    $vel = $row['velocidad'];
                    $nplan = $row['nombrePlan'];
                    $pplan = $row['precioPlan'];
                    $des = $row['desPlan'];
                    $estadop = $row['estadoPlan'];
                ?>
                    <tr>
                      <td> <?php echo "$cp" ?></td>
                      <td> <?php echo "$vel" ?></td>
                      <td> <?php echo "$nplan" ?></td>
                      <td> <?php echo "$pplan" ?></td>
                      <td> <?php echo "$estadop" ?></td>
                      <th>
                        <a href="actualizar.php?cp=<?php echo $row['codigoPlan'] ?>" class="btn btn-info">Editar</a>
                    
                      <th><a href="eliminarplan.php?cp=<?php echo $row['codigoPlan'] ?>" class="btn btn-danger">Eliminar</a></th>
                      
                    </tr>
                <?php
                  }
                }

                ?>
                <div class="form-button mt-5">
                  <button id="submit" type="submit" formmethod="post" formaction="consultarplanes.php" class="btn btn-primary">Consular Plan</button>
                  <button id="submit" type="submit" formmethod="post" formaction="nuevoplan.php" class="btn btn-primary">Ingresar nuevo plan</button>
                  <button id="submit" type="submit" formmethod="post" formaction="tablaplanes.php" class="btn btn-primary"> Ver tabla completa de planes </button>
                </div>



              </form>
            </div>
          </div>
        </div>
      </div>

      <!-- content-wrapper ends -->

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