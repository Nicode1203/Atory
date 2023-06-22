<?php
//seguridad de sesiones paginacion (prueba 1)
session_start();
error_reporting(0);
$varsesion = $_SESSION['usuario'];
if ($varsesion == null || $varsesion = ''  ) {
    header("location:../../index.html");
    die();
    exit;
}

?>

<!-- CODIGO HTML -->
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

    <!-- partial -->


    <div class="main-panel">

        <div class="content-wrapper">
        <h1 style="font-size: 32px;">Visitas tecnicas e Instalaciones</h1>
            <div class="card-body">
            <a href="ingresarVisita.php" class="btn btn-primary">Ingresar nueva Visita</a>
                <a href="../excel/excelVisitas.php" class="btn btn-success">Exportar tabla a Excel</a>
                <?php
                include("../conexion.php");

                $sql = "SELECT * FROM visitas WHERE estadoVisita='Activo';";

                echo '<div class="table-responsive">
                <table class="table table-hover">
                <thead>
            <tr>
            <th> Nombre Cliente</th>
            <th> Telefono Cliente</th>
            <th> Direccion Cliente</th>
            <th> Nombre Tecnico </th>
            <th> Motivo de visita </th>
            <th> Dia de la visita </th>
        </tr>
        </thead>
        ';

                if ($rta = $con->query($sql)) {
                    while ($row = $rta->fetch_assoc()) {
                        $id = $row['idVisita'];
                        $docCliente = $row['documentoCliente'];
                        $nomCliente = $row['nombreCliente'];
                        $telCliente = $row['telefonoCliente'];
                        $emailCliente = $row['emailCliente'];
                        $dirCliente = $row['direccionCliente'];
                        $docTecnico = $row['documentoTecnico'];
                        $nomTec = $row['nombreTecnico'];
                        $telTec = $row['telefonoTecnico'];
                        $emailTec = $row['emailTecnico'];
                        $motivo = $row['motivoVisita'];
                        $diaVisita = $row['diaVisita'];
                        $eVisita = $row['estadoVisita'];
                ?>
                        <tr>
                            <td> <?php echo "$nomCliente" ?></td>
                            <td> <?php echo "$telCliente" ?></td>
                            <td> <?php echo "$dirCliente" ?></td>
                            <td> <?php echo "$nomTec" ?></td>
                            <td> <?php echo "$motivo" ?></td>
                            <td> <?php echo "$diaVisita" ?></td>
                            <td>
                                <a href="actualizarVisita.php?id=<?php echo $row['idVisita'] ?>" class="btn btn-info">Editar</a>
                            </td>
                            <th><a href="eliminarVisitaDes.php?i=<?php echo $row['idVisita'] ?>" class="btn btn-danger">Eliminar Visita</a></th>
                            </th>
                        </tr>
                <?php
                    }
                }

                ?>

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