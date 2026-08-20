<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: *");
require 'connect.php';

$flag['success'] = 0;

$full_name = mysqli_real_escape_string($con, $_POST['full_name']);
$email = mysqli_real_escape_string($con, $_POST['email']);
$phone = mysqli_real_escape_string($con, $_POST['phone']);
$national_id = mysqli_real_escape_string($con, $_POST['national_id']);
$password = mysqli_real_escape_string($con, $_POST['password']);

if ($res = mysqli_query($con, "insert into guests (full_name, email, phone, national_id, password) values ('$full_name', '$email', '$phone', '$national_id', '$password')")) {
    $flag['success'] = 1;
}

print(json_encode($flag));
mysqli_close($con);
?>