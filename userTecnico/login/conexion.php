<?php

    $host = "localhost";
    $User = "root";
    $pass = "12345";

    $db = "atory";

    $conexion = mysqli_connect($host, $User , $pass, $db);

    if (!$con) {
     echo "Conexion fallida";
    }
