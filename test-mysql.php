<?php
$mysqli = new mysqli('localhost', 'root', 'your_mysql_root_password', 'test');
if ($mysqli->connect_error) {
    die('Connect Error (' . $mysqli->connect_errno . ') ' . $mysqli->connect_error);
}
echo 'MySQL Connected successfully';
$mysqli->close();
?>

