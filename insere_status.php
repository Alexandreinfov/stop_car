<?php
	header('Access-Control-Allow-Origin: *');
    header('Content-Type: application/json;charset=UTF-8');

    $cod_os = $_POST["cod_os"];
    $status = $_POST["status"];

	$host = "localhost:3307";
    $db = "os";
    $user = "root";
    $pass = "usbw";

    $conn = new mysqli($host, $user, $pass, $db);
    $conn->set_charset("utf8");

    if($conn->connect_error){
        die("Falha na conexão: " .$conn->connect_error);
    }

   	$sql = "UPDATE ordem_servico SET status = '$status' WHERE cod_os = $cod_os";
    
    $conn->query($sql);
    $conn->close();

    header("location: listar_os.php");
?>