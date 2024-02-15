
<?php
$host = 'localhost';
$user = 'root';
$password = '';
$database = 'atory';

$mysqli = new mysqli($host, $user, $password, $database);

if ($mysqli->connect_error) {
  die('Error de conexión: ' . $mysqli->connect_error);
}

$idCliente = $_POST['idCliente'];
$tipoVisita = $_POST['tipoVisita'];
$motivoVisita = $_POST['motivoVisita'];
$diaVisita = $_POST['diaVisita'];
$estadoVisita = $_POST['estadoVisita'];
$idTecnico = $_POST['idTecnico'];

// Insertar nueva visita
$query = "INSERT INTO visitas (tipoVisita, motivoVisita, diaVisita, estadoVisita, visita_idCliente)
VALUES('$tipoVisita','$motivoVisita','$diaVisita','$estadoVisita','$idCliente')";
$result = $mysqli->query($query);

// Obtener el ID de la visita recién insertada
$idVisita = $mysqli->insert_id;

// Obtener el ID del usuario que realizará la visita


// Actualizar la tabla user_visita con la nueva visita
$query = "INSERT INTO user_visita (visita_idVisita, user_idUser)
          VALUES ('$idVisita', '$idTecnico')";
$result = $mysqli->query($query);


if ($result === TRUE) {
  echo "Los datos se han guardado correctamente.";
  include_once "tablasVisitas.php";
} else {
  echo "Error al guardar los datos: " . $mysqli->error;
}

$mysqli->close();
?>
