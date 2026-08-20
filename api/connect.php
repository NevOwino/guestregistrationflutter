<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: *");
$host = "localhost";
$user = "root";
$password = "";
$db = "guestregistration";
$con = mysqli_connect($host,$user,$password,$db);
?>