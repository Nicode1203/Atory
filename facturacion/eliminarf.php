
<?php

include("conexion.php");

$id=$_GET['id'];

$sql="UPDATE factura SET  estadoFactura='Pago'WHERE cliente_idCliente='$id'";  
$query=mysqli_query($con,$sql);

    if($query){
        Header("Location: facturas.php");
    }
?>
