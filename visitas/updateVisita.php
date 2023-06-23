<?php

include("conexion.php");

$id=$_POST['id'];
$docC=$_POST['docC'];
$nomC=$_POST['nomC'];
$telC=$_POST['telC'];
$emailC=$_POST['emailC'];
$dir=$_POST['dir'];
$docT=$_POST['docT'];
$nomT=$_POST['nomT'];
$telT=$_POST['telT'];
$emailT=$_POST['emailT'];
$motivo=$_POST['motivo'];
$dia=$_POST['dia'];

$sql="UPDATE visitas SET  documentoCliente='$docC', nombreCliente='$nomC', telefonoCliente= '$telC', emailCliente= '$emailC', direccionCliente= '$dir', documentoTecnico= '$docT', nombreTecnico='$nomT', telefonoTecnico='$telT', emailTecnico='$emailT',motivoVisita='$motivo',diaVisita='$dia' WHERE idVisita='$id';";

$query=mysqli_query($con,$sql);
if($query){
    Header("Location: tablasVisitas.php");
}
?>