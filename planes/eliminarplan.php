<?php

include("conexion.php");

$cp = $_GET['cp'];

$sql = "UPDATE plan SET estadoPlan='Archivado' WHERE codigoPlan='$cp'";
$query = mysqli_query($con, $sql);

if ($query) {
    Header("Location: ../planes/tablaplanes.php");
}
