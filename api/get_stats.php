<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type");
header("Content-Type: application/json");

if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {
    http_response_code(200);
    exit();
}

require __DIR__ . '/connect.php';

$totalResult = mysqli_query($con, "SELECT COUNT(*) AS total FROM guests");
$totalRow = mysqli_fetch_assoc($totalResult);

$checkedInResult = mysqli_query($con, "SELECT COUNT(*) AS checked_in FROM guests WHERE checked_in = 1");
$checkedInRow = mysqli_fetch_assoc($checkedInResult);

echo json_encode([
    "total_guests" => (int)$totalRow['total'],
    "checked_in" => (int)$checkedInRow['checked_in']
]);
?>