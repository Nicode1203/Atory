

<!-- CODIGO HTML -->
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Atory - Admin</title>
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

    <div class="main-panel">
        <div class="content-wrapper"> <!-- ESTO ES LO QUE TENEMOS QUE MODIFICAR -->
            <div class="col-md-6 grid-margin stretch-card">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title">INGRESO DE CUENTAS BANCARIAS</h4>
                        <p class="card-description"> Ingrese información del banco</p>
                        <form class="forms-sample">
                            <div class="form-group">
                                <label for="num_cuenta">Numero de cuenta</label>
                                <input type="text" class="form-control" name="num_cuenta" id="num_cuenta" placeholder="ingrese numero de cuenta" >
                            </div>

                            <div class="form-group">
                                <label for="nomb_banco">Nombre del banco</label>
                                <input type="text" class="form-control" name="nomb_banco" id="nomb_banco" placeholder="ingrese nombre del banco" >
                            </div>

                            <p class="card-description"> Estado cuenta bancaria:</p>
                            <select class="form-select" aria-label="Default select example" name="estadoCuenta" id="estadoCuenta" >
                                <option value="Activo">Activo </option>
                                <option value="Archivado">Inactivo</option>
                                <p></p>
                            </select>

                            <div>
                                <br>
                                <button id="submit" type="submit" formmethod="post" formaction="insertarBanco.php" class="btn btn-primary">Guardar</button>
                                <button id="submit" type="submit" formmethod="post" formaction="index.html" class="btn btn-primary"> Volver al inicio </button>

                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <!-- ESTO ES LO QUE PODEMOS MODIFICAR -->
        </div>

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