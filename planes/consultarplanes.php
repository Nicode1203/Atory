<?php
//seguridad de sesiones paginacion (prueba 1)
session_start();
error_reporting(0);
$varsesion= $_SESSION['usuario'];
if ($varsesion == null || $varsesion='') {
    header ("location:../index.html");
    die();
    exit;
}

?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>ATORY - Admin</title>
    <!-- Estilos de los plugins -->
    <link rel="stylesheet" href="../assets/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="../assets/vendors/css/vendor.bundle.base.css">
    <!-- Fin de los estilos de los plugins -->
    <!-- Estilos del archivo actual -->
    <link rel="stylesheet" href="../assets/css/style.css">
    <!-- Fin de los estilos del archivo actual -->
    <link rel="shortcut icon" href="../assets/images/favicon.png">
</head>

<body>
    <?php
    include '../menu/menuint.php';
    ?>
    <!-- Parcial -->
    <div class="main-panel">
        <div class="content-wrapper">
            <div class="page-header">
                <h1 style="font-size: 32px;">GESTIÓN Planes</h1>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item active" aria-current="page">Esta usted en el módulo de Planes</li>
                    </ol>
                </nav>
            </div>
            <div class="row">
                <div class="col-12 grid-margin stretch-card">
                    <div class="card">
                        <!-- CONTENIDO -->
                        <h4 class="card-title">Consultas de Planes</h4>
                        <form class="forms-sample">
                            <div class="form-group">
                                <label for="cp">Ingrese codigo de plan</label>
                                <input type="text" class="form-control" name="cp" id="cp" placeholder="Ingrese Código del plan">
                            </div>
                            <div>
                                <br>
                                <button id="submit" type="submit" formmethod="post" formaction="../planes/plan.php" class="btn btn-primary">Consultar Plan</button>
                                <!--<button id="submit" type="submit" formmethod="post" formaction="../principal.html" class="btn btn-primary">Volver al inicio</button> -->
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- Extremos del contenedor de contenido -->
        <!-- Parcial -->
    </div>
    <!-- main-panel fin -->
    </div>
    <!-- page-body-wrapper fin -->
    </div>
    <!-- container-scroller -->
    <!-- Scripts -->
    <script src="../assets/vendors/js/vendor.bundle.base.js"></script>
    <script src="../assets/js/off-canvas.js"></script>
    <script src="../assets/js/hoverable-collapse.js"></script>
    <script src="../assets/js/misc.js"></script>
    <!-- Fin de los scripts -->
</body>

</html>