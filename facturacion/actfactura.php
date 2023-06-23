<?php 
include "conexion.php";
$if=$_POST['if'];
$ffact=$_POST['ffact'];
$impt=$_POST['impt'];
$sub=$_POST['sub'];
$st=$_POST['st'];
$estf=$_POST['estf'];


$sql="UPDATE factura SET fechaFactura='$ffact', impuestoTotal='$impt', subTotal='$sub',valorTotalFactura='$st', estadoFactura='$estf' WHERE idFactura='$if';";

$query=mysqli_query($con,$sql);
if($query){
    Header("Location: facturas.php");
}


?>