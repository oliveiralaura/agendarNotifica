<?php

require_once 'dbConfig.php';

include_once 'GoogleCalendarApi.class.php';

$statusMsg = '';
$status = 'danger';
    if(isset($_GET['code'])){
        $GoogleCalendarApi = new GoogleCalendarApi();

        $event_id = $_SESSION['last_event_id'];

        if(!empty($event_id)){
            $sqlQ = "SELECT * FROM events WHERE id = ?";
            $stmt = $db->prepare($sqlQ);
            $stmt->bind_param("i", $db_event_id);
            $db_event_id = $event_id;
            $stmt->execute();
            $result = $stmt->get_result();
            $eventData = $result->fetch_assoc();

            if(!empty($eventData)){
                $calendar_event = array(
                    'summary' => $eventData['title'],
                    'location' => $eventData['location'],
                    'description' => $eventData['description']
                );
                $event_datetime = array(
                    'event_date' => $eventData['date'],
                    'start_time' => $eventData['start_time'],
                    'end_time' => $eventData['time_to']
                );
                

                $access_token_sess = $_SESSION['google_access_token'];
                if(!empty($access_token_sess)){
                    $access_token = $access_token_sess;
                }else{
                    $data = $GoogleCalendarApi->GetAccessToken (GOOGLE_CLIENT_ID, REDIRECT_URI, GOOGLE_CLIENT_SECRET, $_GET['code']);
                    $access_token = $data['access_token'];
                    $_SESSION['google_access_token'] = $access_token;
                }

                if(!empty($access_toker)) {
                    try {
                        $user_timezone = $GoogleCalendarApi->GetUserCalendarTimezone($access_token);

                        $google_event_id = $GoogleCalendarApi->CreateCalendarEvent($access_token, 'primary', $calendar_event, 0, $event_datetime, $user_timezone);

                        if($google_event_id){
                            $sqlQ = 'UPDATE events set google_calendar_event_id=? where id=?';
                            $stmt = $db->prepare($sqlQ);
                            $stmt->bind_param("si", $db_google_event_id, $db_event_id);
                            $db_google_event_id = $google_event_id;
                            $db_event_id = $event_id;
                            $update = $stmt->execute();

                            unset($_SESSION['last_event_id']);
                            unset($_SESSION['google_acess_token']);

                            $status = 'sucess';
                            $statusMsg = '<p>Event #'.$event_id.' foi adicionado com sucesso</p>';
                            $statusMsg = '<p><a href="https://calendar.google.com/calendar/" target="_blank">Abrir calendário</a>';
                        }
                    } catch(Exception $e) {
                        $statusMsg = $e->getMessage();
                    }
                }else{
                    $statusMsg = 'Failed to fetch access token!';
                }
            }else{
                $statusMsg = 'Event data found!';
            }
        }else{
            $statusMsg = 'Event reference not found';
        }
        $_SESSION['status_response'] = array('status' => $status, 'status_msg' => $statusMsg);
        header('Location: index.php');
        exit();
    }