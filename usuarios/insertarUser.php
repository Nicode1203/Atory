
<?php
include("conexion.php");

$td = $_POST['td'];
$id = $_POST['id'];
$nombres = $_POST['nombre'];
$telefono = $_POST['tel'];
$email = $_POST['email'];
$clave = $_POST['clave'];
$estado = $_POST['estado'];
$creacion = $_POST['creacion'];
$act = $_POST['act'];
$rol = $_POST['rol'];

// Esta linea es para encriptar la contraseña
$hashed_clave = password_hash($clave, PASSWORD_DEFAULT);

$sql = "INSERT INTO usuario (tipoDocumento, documentoUsuario, nombresUsuario, telefonoUsuario, correoUsuario, claveUsuario, estadoUsuario, creado, ultimaActualizacion,rol)
 VALUES('$td','$id','$nombres','$telefono','$email','$hashed_clave','$estado','$creacion','$act','$rol')";


if ($con->query($sql) === TRUE) {
  echo "Los datos se han guardado correctamente.";

  include_once "tablasUser.php";
} else {
  echo "Error al guardar los datos: " . $con->error;
}

$con->close();
?>
