<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: *");
require 'connect.php';

$flag['success'] = 0;
$flag['data'] = array();

$email = mysqli_real_escape_string($con, $_GET['email']);
$password = mysqli_real_escape_string($con, $_GET['password']);

if ($res = mysqli_query($con, "select * from admins where email='$email' and password='$password'")) {
    if (mysqli_num_rows($res) > 0) {
        $flag['success'] = 1;
    }
    while ($row = mysqli_fetch_assoc($res)) {
        $flag['data'][] = $row;
    }
}

print(json_encode($flag));
mysqli_close($con);
?>