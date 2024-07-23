<?php
error_reporting(E_ALL);
ini_set('display_errors',1);

$servername = "localhost";
$username = "plix";
$password = "A";

// Create connection
$conn = new mysqli($servername, $username, $password);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
echo "Connected successfully";
?>

