<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: *");
require 'connect.php';

$flag['success'] = 0;

$name = mysqli_real_escape_string($con, $_POST['name']);
$email = mysqli_real_escape_string($con, $_POST['email']);
$password = mysqli_real_escape_string($con, $_POST['password']);

if ($res = mysqli_query($con, "insert into admins (name, email, password) values ('$name', '$email', '$password')")) {
    $flag['success'] = 1;
}

print(json_encode($flag));
mysqli_close($con);
?>