<?php

include("conexion.php");

$cp=$_GET['cp'];

$sql="UPDATE SET estadoPlan='Archivado' FROM plan WHERE codigoPlan='$cp'";  
$query=mysqli_query($con,$sql);

    if($query){
        Header("Location: ../planes/tablaplanes.php");
    }
?>
