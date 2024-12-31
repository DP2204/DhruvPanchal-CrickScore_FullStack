<?php
include 'db_connect.php';
header('Content-Type: application/json');

$stmt = $pdo->query("SELECT * FROM matches ORDER BY id DESC LIMIT 1");
$match = $stmt->fetch(PDO::FETCH_ASSOC);

$stmt = $pdo->prepare("SELECT * FROM balls WHERE match_id = ? ORDER BY over_number, ball_number");
$stmt->execute([$match['id']]);
$balls = $stmt->fetchAll(PDO::FETCH_ASSOC);

$response = array_merge($match, ['balls' => $balls]);
echo json_encode($response); ?>