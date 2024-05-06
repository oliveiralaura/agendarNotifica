<?php

require_once 'dbConfig.php';

$postData = $statusMsg = $valErr = '';
$status = 'danger';

if(isset($_POST['submit'])){
    $_SESSION['postData'] = $_POST;
    $title = !empty($_POST['title'])?trim($_POST['title']):'';
    $description = !empty($_POST['description'])?trim($_POST['description']):'';
    $location = !empty($_POST['location'])?trim($_POST['location']):'';
    $date = !empty($_POST['date'])?trim($_POST['date']):'';
    $time_from = !empty($_POST['time_from'])?trim($_POST['time_from']):'';
    $time_to = !empty($_POST['time_to'])?trim($_POST['time_to']):'';

    if(empty($title)){
        $valErr .= 'Please enter event title .< br/>';
    }
    if(empty($date)){
        $valErr .= 'Please enter event date .< br/>';
    }


    if(empty($valErr)){
        $sqlQ = "INSERT INTO events (title, description, location, date, time_from, time_to, created) values(?,?,?,?,?,?,NOW())";
        $stmt = $db->prepare($sqlQ);
        $stmt->bind_param("ssssss", $db_title, $db_description, $db_location, $db_date, $db_time_from, $db_time_to);
        $db_title = $title;
        $db_description = $description;
        $db_location = $location;
        $db_date = $date;
        $db_time_from = $time_from;
        $db_time_to = $time_to;
        $insert = $stmt->execute();

        if($insert) {
            $event_id = $stmt->insert_id;
            unset($_SESSION['postData']);

            $_SESSION['last_event_id'] = $event_id;

            header("Location: $googleOauthURL");
            exit();
        }else{
            $statusMsg = 'Something went wrong, please try again after some time.';
        }
    }else{
        $statusMsg = '<p>Please fill all the mandatory fields:</p>';
    }
}else{
    $statusMsg = 'Form submission failed!';
}

$_SESSION['status_response'] = array('status' => $status, 'status_msg' => $statusMsg);

header("Location: index.php");
exit();

