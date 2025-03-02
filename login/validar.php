<?php
session_start();

// Datos de conexión a la base de datos en Hostinger
$host = "localhost"; 
$user = "u480925299_root";
$pass = "Administrator2025*";
$db = "u480925299_atory2025";

// Establecer conexión con la base de datos
$conn = mysqli_connect($host, $user, $pass, $db);

// Verificar conexión
if (!$conn) {
    die("Error de conexión: " . mysqli_connect_error());
}

// Verificar que los datos del formulario están llegando
if (!isset($_POST['usuario']) || !isset($_POST['pass'])) {
    die("Error: No se recibieron los datos del formulario.");
}

$usuario = trim($_POST['usuario']);
$password = trim($_POST['pass']);

// Si los valores están vacíos, redirigir al error
if (empty($usuario) || empty($password)) {
    die("Error: Usuario o contraseña vacíos.");
}

// Usar una consulta preparada para mayor seguridad
$stmt = $conn->prepare("SELECT rol, claveUsuario FROM usuario WHERE nombresUsuario = ?");
$stmt->bind_param("s", $usuario);
$stmt->execute();
$resultado = $stmt->get_result();

// Verificar si el usuario existe en la base de datos
if ($filas = $resultado->fetch_assoc()) {
    echo "Usuario encontrado<br>";
    echo "Clave en la BD (Hasheada): " . $filas['claveUsuario'] . "<br>";

    // Verificar contraseña con password_verify()
    if (password_verify($password, $filas['claveUsuario'])) {  
        echo "Contraseña correcta<br>";
        
        $_SESSION['usuario'] = $usuario;

        // Redirigir según el rol del usuario
        if ($filas['rol'] == 'Administrador') {
            header("location:../principal.php");
        } elseif ($filas['rol'] == 'Tecnico') {
            header("location:../userTecnico/visitas/tablasVisitas.php");
        } else {
            header("location:errorvalid.php");
        }
        exit;
    } else {
        echo "Contraseña incorrecta<br>";
        exit;
    }
} else {
    echo "Usuario no encontrado<br>";
    exit;
}

// Cerrar conexiones
$stmt->close();
$conn->close();
?>
