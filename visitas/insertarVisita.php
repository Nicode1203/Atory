
 <?php
include("conexion.php");

$idCliente = $_POST['idCliente'];
$tipoVisita = $_POST['tipoVisita'];
$motivoVisita = $_POST['motivoVisita'];
$diaVisita = $_POST['diaVisita'];
$estadoVisita = $_POST['estadoVisita'];
$idTecnico = $_POST['idTecnico'];

$sql1 = "UPDATE visitas
SET tipoVisita = '$tipoVisita', motivoVisita = '$motivoVisita' , diaVisita = '$diaVisita' , estadoVisita = '$estadoVisita'
WHERE idVisita = '$idVisita';";

$sql1="INSERT INTO visitas (tipoVisita, motivoVisita, diaVisita, estadoVisita, visita_idCliente)
 VALUES('$tipoVisita','$motivoVisita','$diaVisita','$estadoVisita','$idCliente')";


if ($con->query($sql) === TRUE) {
    echo "Los datos se han guardado correctamente.";
    
    include_once "tablasVisitas.php";
  } else {
    echo "Error al guardar los datos: " . $con->error;
  }
  
  $con->close();
?>
