<?php
$usuario = $_POST['usuario'];
$password = $_POST['pass'];
session_start();
$_SESSION['usuario'] = $usuario;

$conn = mysqli_connect("localhost", "root", "", "atory");

$consulta = "SELECT * FROM usuario WHERE documentoUsuario = '$usuario'";
$resultado = mysqli_query($conn, $consulta);

if (mysqli_num_rows($resultado) == 1) {
  $fila = mysqli_fetch_assoc($resultado);
  $hashed_clave = $fila['claveUsuario'];

  // Verificar si la contraseña ingresada coincide con la contraseña encriptada almacenada en la base de datos
  if (password_verify($password, $hashed_clave)) {
    // Contraseña correcta, redirigir según el rol del usuario
    if ($fila['rol'] == 'Administrador' and $fila['estadoUsuario'] == 'Activo') {
      header("location: ../principal.php");
      exit;
    } elseif ($fila['rol'] == 'Tecnico' and $fila['estadoUsuario'] == 'Activo') {
      header("location: ../userTecnico/visitas/inicioVisitasT.php");
      exit;
    } else {
      header("location: errorvalid.php");
      exit;
    }
  } else {
    // Contraseña incorrecta
    header("location: errorvalid.php");
    exit;
  }
} else {
  // Usuario no encontrado
  header("location: errorvalid.php");
  exit;
}

mysqli_free_result($resultado);
mysqli_close($conn);
