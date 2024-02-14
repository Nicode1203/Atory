
 <?php
include("conexion.php");

$idCliente = $_POST['idCliente'];
$tipoVisita = $_POST['tipoVisita'];
$motivoVisita = $_POST['motivoVisita'];
$diaVisita = $_POST['diaVisita'];
$estadoVisita = $_POST['estadoVisita'];
$idTecnico = $_POST['idTecnico'];



$sql="INSERT INTO visitas (documentoCliente, nombreCliente, telefonoCliente, emailCliente, direccionCliente, documentoTecnico, nombreTecnico, telefonoTecnico, emailTecnico, motivoVisita, diaVisita)
 VALUES('$docC','$nomC','$telC','$emailC','$dir','$docT','$nomT','$telT','$emailT','$motivo','$dia')";


if ($con->query($sql) === TRUE) {
    echo "Los datos se han guardado correctamente.";
    
    include_once "tablasVisitas.php";
  } else {
    echo "Error al guardar los datos: " . $con->error;
  }
  
  $con->close();
?>
