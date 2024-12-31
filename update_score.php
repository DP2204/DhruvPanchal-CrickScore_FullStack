    <?php
    include 'db_connect.php';
    header('Content-Type: application/json');

    $data = json_decode(file_get_contents('php://input'), true);
    $runs = $data['runs'];
    $isOut = $data['isOut'];
    $overNumber = $data['overNumber'];
    $ballNumber = $data['ballNumber'];

    $pdo->beginTransaction();

    try {
        // Get current match
        $stmt = $pdo->query("SELECT * FROM matches ORDER BY id DESC LIMIT 1");
        $match = $stmt->fetch(PDO::FETCH_ASSOC);
        
        // Insert ball
        $stmt = $pdo->prepare("INSERT INTO balls (match_id, over_number, ball_number, runs, is_out) VALUES (?, ?, ?, ?, ?)");
        $stmt->execute([$match['id'], $overNumber, $ballNumber, $runs, $isOut]);
        
        // Update match score
        $newScore = $match['current_score'] + $runs;
        $newWickets = $match['wickets'] + ($isOut ? 1 : 0);
        $newBall = ($ballNumber + 1) % 6;
        $newOver = $overNumber + ($ballNumber == 5 ? 1 : 0);
        
        $stmt = $pdo->prepare("UPDATE matches SET current_score = ?, wickets = ?, current_over = ?, current_ball = ? WHERE id = ?");
        $stmt->execute([$newScore, $newWickets, $newOver, $newBall, $match['id']]);
        
        $pdo->commit();
        echo json_encode(['success' => true]);
    } catch(Exception $e) {
        $pdo->rollBack();
        echo json_encode(['error' => $e->getMessage()]);
    }
    ?>