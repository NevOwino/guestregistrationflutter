<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: *");
require 'connect.php';

$flag['success'] = 0;

$id = mysqli_real_escape_string($con, $_GET['id']);

if ($res = mysqli_query($con, "delete from guests where id='$id'")) {
    $flag['success'] = 1;
}

print(json_encode($flag));
mysqli_close($con);
?>