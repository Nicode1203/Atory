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
        <h1 style="font-size: 32px;">GESTIÓN PLANES</h1>

      </div>
      <div class="row">
        <div class="col-md-12 grid-margin stretch-card">
          <div class="card">
            <div class="card-body">

              <form class="forms-sample">
                <?php
                include_once "conexion.php";
                $sql = "SELECT * FROM plan WHERE estadoPlan='Archivado';";
                echo '<div class="table-responsive">
                      <table class="table table-hover">
                      <thead>
                          <tr>
                              <th> Codigo Plan </th>
                              <th> Velocidad de Plan</th>
                              <th> Nombre de Plan</th>
                              <th> Precio de Plan</th>
                              <th> Estado de Plan</th>
                              <th> Actualizar</th>
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
                        <a href="../planes/actualizar.php?cp=<?php echo $row['codigoPlan'] ?>" class="btn btn-info">Editar</a>
                      </th>
                      </th>
                      <th>
                        <a href="../planes/activarplan.php?cp=<?php echo $row['codigoPlan'] ?>" class="borrar btn btn-danger">Volver a activar</a>
                      </th>
                      </th>
                      <td>

                      </td>
                    </tr>
                <?php
                  }
                }

                ?>
                <div class="form-button mt-5">
                  <button id="submit" type="submit" formmethod="post" formaction="../planes/rurales.php" class="btn btn-primary btn-lg">Ver planes rurales</button>
                  <button id="submit" type="submit" formmethod="post" formaction="../planes/urbanos.php" class="btn btn-primary btn-lg">Ver planes urbanos</button>
                  <button id="submit" type="submit" formmethod="post" formaction="../planes/empresariales.php" class="btn btn-primary btn-lg">Ver planes empresariales</button>
                  <button id="submit" type="submit" formmethod="post" formaction="../planes/nuevoplan.php" class="btn btn-primary btn-lg">Ingresar nuevo plan</button>
                  <button id="submit" type="submit" formmethod="post" formaction="../planes/consultarplanes.php" class="btn btn-primary btn-lg">Consultar Plan</button>
                  <button id="submit" type="submit" formmethod="post" formaction="../planes/tablaplanes.php" class="btn btn-warning btn-lg">Ver planes Activos</button>
                  <a href="../excel/excelPlanes.php" class="btn btn-success btn-lg">Exportar tabla a Excel</a>
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
  <!-- Estas ultimas lineas son para la alerta DE BORRAR, INSERTA SWEET ALERT Y LUEGO ESTA EL SCRIPT PARA BORRAR-->
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  <script>
    $('.borrar').on('click', function(e) {
      e.preventDefault();
      var self = $(this);
      console.log(self.data('title'));
      Swal.fire({
        title: 'Esta seguro que desea continuar?',
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Confirmar',
        cancelButtonText: 'No',
        background: '#34495E'
      }).then((result) => {
        if (result.isConfirmed) {

          location.href = self.attr('href');
        }
      })
    })
  </script>
</body>

</html>