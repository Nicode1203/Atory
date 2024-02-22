<?php

    $host = "localhost";
    $User = "root";
    $pass = "";

    $db = "atory";

    $conexion = mysqli_connect($host, $User , $pass, $db);

    if (!$con) {
     echo "Conexion fallida";
    }
