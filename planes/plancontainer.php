<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Atory</title>
  <!-- Archivos de estilo de los plugins -->
  <link rel="stylesheet" href="../assets/vendors/mdi/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="../assets/vendors/css/vendor.bundle.base.css">
  <!-- Fin de la inyección de estilos de los plugins -->
  <!-- Estilos personalizados para esta página -->
  <!-- Fin de la inyección de estilos personalizados -->
  <!-- Estilos de diseño -->
  <link rel="stylesheet" href="../assets/css/style.css">
  <!-- Fin de los estilos de diseño -->
  <link rel="shortcut icon" href="../assets/images/favicon.png" />
</head>

<body>
  <div class="container-scroller">
    <!-- Barra lateral parcial -->
    <!-- Fin de la barra lateral parcial -->
    <?php
    include_once "conexion.php";

    // Consulta para obtener datos del plan con códigoPlan='1'
    $sql = "SELECT * FROM plan WHERE codigoPlan='1';";
    if ($rta = $con->query($sql)) {
      while ($row = $rta->fetch_assoc()) {
        $cp = $row['codigoPlan'];
        $vel = $row['velocidad'];
        $nplan = $row['nombrePlan'];
        $pplan = $row['precioPlan'];
        $des = $row['desPlan'];
        $estadop = $row['estadoPlan'];
        $tplan = $row['tipoPlan'];
      }
    }
    ?>
    <div class="main-panel">
      <div class="content-wrapper">
        <div class="page-header">
          <h2 class="page-title">NUESTROS PLANES</h2>
        </div>
        <div class="row">
          <div class="col-md-6 grid-margin stretch-card">
            <div class="card">
              <div class="card-body">
                <h4 class="card-title"><?php echo "$nplan" ?></h4>
                <form class="forms-sample">
                  <div class="form-group">
                    <label for="cp">Tipo de plan: <?php echo "$tplan" ?></label>
                  </div>
                  <div class="form-group">
                    <label for="vel">Velocidad del plan: <?php echo "$vel" ?></label>
                  </div>
                  <div class="form-group">
                    <label for="plan">Tiene un valor de: <?php echo " $pplan" ?></label>
                  </div>
                  <div class="form-group">
                    <label for="des"><?php echo "$des" ?></label>
                  </div>
                  <a href="solplan.php" class="btn btn-primary btn-lg" role="button" aria-pressed="true">Solicitar plan</a>
                </form>
              </div>
            </div>
          </div>
          <?php
          include_once "conexion.php";

          // Consulta para obtener datos del plan con códigoPlan='2'
          $sql = "SELECT * FROM plan WHERE codigoPlan='2';";
          if ($rta = $con->query($sql)) {
            while ($row = $rta->fetch_assoc()) {
              $cp = $row['codigoPlan'];
              $vel = $row['velocidad'];
              $nplan = $row['nombrePlan'];
              $pplan = $row['precioPlan'];
              $des = $row['desPlan'];
              $estadop = $row['estadoPlan'];
              $tplan = $row['tipoPlan'];
            }
          }
          ?>
          <div class="col-md-6 grid-margin stretch-card">
            <div class="card">
              <div class="card-body">
                <h4 class="card-title"><?php echo "$nplan" ?></h4>
                <form class="forms-sample">
                  <div class="form-group">
                    <label for="cp">Tipo de plan: <?php echo "$tplan" ?></label>
                  </div>
                  <div class="form-group">
                    <label for="vel">Velocidad del plan: <?php echo "$vel" ?></label>
                  </div>
                  <div class="form-group">
                    <label for="plan">Tiene un valor de: <?php echo " $pplan" ?></label>
                  </div>
                  <div class="form-group">
                    <label for="des"><?php echo "$des" ?></label>
                  </div>
                  <a href="solplan.php" class="btn btn-primary btn-lg" role="button" aria-pressed="true">Solicitar plan</a>
                </form>
              </div>
            </div>
          </div>
        </div>

        <?php
        include_once "conexion.php";

        // Consulta para obtener datos del plan con códigoPlan='3'
        $sql = "SELECT * FROM plan WHERE codigoPlan='3';";
        if ($rta = $con->query($sql)) {
          while ($row = $rta->fetch_assoc()) {
            $cp = $row['codigoPlan'];
            $vel = $row['velocidad'];
            $nplan = $row['nombrePlan'];
            $pplan = $row['precioPlan'];
            $des = $row['desPlan'];
            $estadop = $row['estadoPlan'];
            $tplan = $row['tipoPlan'];
          }
        }
        ?>
        <div class="row">
          <div class="col-md-6 grid-margin stretch-card">
            <div class="card">
              <div class="card-body">
                <h4 class="card-title"><?php echo "$nplan" ?></h4>
                <form class="forms-sample">
                  <div class="form-group">
                    <label for="cp">Tipo de plan: <?php echo "$tplan" ?></label>
                  </div>
                  <div class="form-group">
                    <label for="vel">Velocidad del plan: <?php echo "$vel" ?></label>
                  </div>
                  <div class="form-group">
                    <label for="plan">Tiene un valor de: <?php echo " $pplan" ?></label>
                  </div>
                  <div class="form-group">
                    <label for="des"><?php echo "$des" ?></label>
                  </div>
                  <a href="solplan.php" class="btn btn-primary btn-lg" role="button" aria-pressed="true">Solicitar plan</a>
                </form>
              </div>
            </div>
          </div>

          <?php
          include_once "conexion.php";

          // Consulta para obtener datos del plan con códigoPlan='4'
          $sql = "SELECT * FROM plan WHERE codigoPlan='4';";
          if ($rta = $con->query($sql)) {
            while ($row = $rta->fetch_assoc()) {
              $cp = $row['codigoPlan'];
              $vel = $row['velocidad'];
              $nplan = $row['nombrePlan'];
              $pplan = $row['precioPlan'];
              $des = $row['desPlan'];
              $estadop = $row['estadoPlan'];
              $tplan = $row['tipoPlan'];
            }
          }
          ?>
          <div class="col-md-6 grid-margin stretch-card">
            <div class="card">
              <div class="card-body">
                <h4 class="card-title"><?php echo "$nplan" ?></h4>
                <form class="forms-sample">
                  <div class="form-group">
                    <label for="cp">Tipo de plan: <?php echo "$tplan" ?></label>
                  </div>
                  <div class="form-group">
                    <label for="vel">Velocidad del plan: <?php echo "$vel" ?></label>
                  </div>
                  <div class="form-group">
                    <label for="plan">Tiene un valor de: <?php echo " $pplan" ?></label>
                  </div>
                  <div class="form-group">
                    <label for="des"><?php echo "$des" ?></label>
                  </div>
                  <a href="solplan.php" class="btn btn-primary btn-lg" role="button" aria-pressed="true">Solicitar plan</a>
                </form>
              </div>
            </div>
          </div>
        </div>

        <?php
        include_once "conexion.php";

        // Consulta para obtener datos del plan con códigoPlan='5'
        $sql = "SELECT * FROM plan WHERE codigoPlan='5';";
        if ($rta = $con->query($sql)) {
          while ($row = $rta->fetch_assoc()) {
            $cp = $row['codigoPlan'];
            $vel = $row['velocidad'];
            $nplan = $row['nombrePlan'];
            $pplan = $row['precioPlan'];
            $des = $row['desPlan'];
            $estadop = $row['estadoPlan'];
            $tplan = $row['tipoPlan'];
          }
        }
        ?>
        <div class="row">
          <div class="col-md-6 grid-margin stretch-card">
            <div class="card">
              <div class="card-body">
                <h4 class="card-title"><?php echo "$nplan" ?></h4>
                <form class="forms-sample">
                  <div class="form-group">
                    <label for="cp">Tipo de plan: <?php echo "$tplan" ?></label>
                  </div>
                  <div class="form-group">
                    <label for="vel">Velocidad del plan: <?php echo "$vel" ?></label>
                  </div>
                  <div class="form-group">
                    <label for="plan">Tiene un valor de: <?php echo " $pplan" ?></label>
                  </div>
                  <div class="form-group">
                    <label for="des"><?php echo "$des" ?></label>
                  </div>
                  <a href="solplan.php" class="btn btn-primary btn-lg" role="button" aria-pressed="true">Solicitar plan</a>
                </form>
              </div>
            </div>
          </div>
          <?php
          include_once "conexion.php";

          // Consulta para obtener datos del plan con códigoPlan='6'
          $sql = "SELECT * FROM plan WHERE codigoPlan='6';";
          if ($rta = $con->query($sql)) {
            while ($row = $rta->fetch_assoc()) {
              $cp = $row['codigoPlan'];
              $vel = $row['velocidad'];
              $nplan = $row['nombrePlan'];
              $pplan = $row['precioPlan'];
              $des = $row['desPlan'];
              $estadop = $row['estadoPlan'];
              $tplan = $row['tipoPlan'];
            }
          }
            ?>
            <div class="col-md-6 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title"><?php echo "$nplan" ?></h4>
                  <form class="forms-sample">
                    <div class="form-group">
                      <label for="cp">tipo de plan: <?php echo "$tplan" ?></label>
                    </div>
                    <div class="form-group">
                      <label for="vel">velocidad del plan: <?php echo "$vel" ?></label>
                    </div>
                    <div class="form-group">
                      <label for="plan">Tiene un valor de : <?php echo " $pplan" ?></label>
                    </div>
                    <div class="form-group">
                      <label for="des"><?php echo "$des" ?></label>
                    </div>
                    <a href="solplan.php" class="btn btn-primary btn-lg" role="button" aria-pressed="true">Solicitar plan</a>

                  </form>
                </div>
              </div>
            </div>
          </div>

          <?php
          include_once "conexion.php";

          $sql = "SELECT * FROM plan WHERE codigoPlan='7';";
          if ($rta = $con->query($sql)) {
            while ($row = $rta->fetch_assoc()) {
              $cp = $row['codigoPlan'];
              $vel = $row['velocidad'];
              $nplan = $row['nombrePlan'];
              $pplan = $row['precioPlan'];
              $des = $row['desPlan'];
              $estadop = $row['estadoPlan'];
              $tplan = $row['tipoPlan'];
            }
          }
          ?>
          <div class="row">
            <div class="col-md-6 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title"><?php echo "$nplan" ?></h4>
                  <form class="forms-sample">
                    <div class="form-group">
                      <label for="cp">tipo de plan: <?php echo "$tplan" ?></label>
                    </div>
                    <div class="form-group">
                      <label for="vel">velocidad del plan: <?php echo "$vel" ?></label>
                    </div>
                    <div class="form-group">
                      <label for="plan">Tiene un valor de : <?php echo " $pplan" ?></label>
                    </div>
                    <div class="form-group">
                      <label for="des"><?php echo "$des" ?></label>
                    </div>
                    <a href="solplan.php" class="btn btn-primary btn-lg" role="button" aria-pressed="true">Solicitar plan</a>

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