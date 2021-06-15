<?php
$code = 101;
$msg = "Record List Successfully";
$output = array();

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "start_war";
$conn = new mysqli($servername, $username, $password, $dbname);
$uriSegments = explode("/", parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH));
$id = isset($uriSegments[3]) ? $uriSegments[3]:'';
// echo '<pre>';print_r($uriSegments[3]);  die;
if ($conn->connect_error) {
    // die("Connection failed: " . $conn->connect_error);
    $msg = "Connection failed: " . $conn->connect_error;
}

// if (isset($_GET['action']) && !empty($_GET['action'])) {
    $action = isset($_GET['action']) ? $_GET['action']:'';

    // API for get single Record
    if (!empty($id)) {
        $sql = "SELECT s.*, c.name as category_name FROM `start_war_ship` s LEFT JOIN starship_category c ON c.id = s.category_id WHERE s.id = '".$id."'";
        $result = $conn->query($sql);
        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                $output = $row;
            }
            $code = 100;
            $msg = "Record List Successfully";
        }
    } 
    else{
        // API for get list all Record
        $output = array();
        $category = array();
        $ships = array();
        $sql = "SELECT * from starship_category";
        $category_result = $conn->query($sql);
        if ($category_result->num_rows > 0) {
            // output data of each row
            while ($row = $category_result->fetch_assoc()) {
                $category[] = $row;
            }
            $code = 100;
        }

        $sql = "SELECT s.*, c.name as category_name FROM `start_war_ship` s LEFT JOIN starship_category c ON c.id = s.category_id";
        $result = $conn->query($sql);
        if ($result->num_rows > 0) {
            // output data of each row
            while ($row = $result->fetch_assoc()) {
                $ships[] = $row;
            }
            $code = 100;
        }
        $output = array(
          'starship_class' => $category,
          'starship' => $ships,
        );
    }

// }else{
//   $msg = "Please pass action";
// }


$response = array(
  'code' => $code,
  'data' => $output,
  'message' => $msg,
);
print(json_encode($response, JSON_PRETTY_PRINT));

$conn->close();
