<?php

define( 'MYSQL_HOST', 'localhost' );
define( 'MYSQL_USER', 'root' );
define( 'MYSQL_PASSWORD', '' );
define( 'MYSQL_DB_NAME', 'agendardigital' );

define('GOOGLE_CLIENT_ID', '448249692960-ac87029ekh6qf6b9of4slcs3cthnpujn.apps.googleusercontent.com');
define('GOOGLE_CLIENT_SECRET', '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');
define('GOOGLE_OAUTH_SCOPE', 'https://www.googleapis.com/auth/calendar');
define('REDIRECT_URI', 'https://localhost/agendarNotifica/google_calendar_event_sync.php');

$googleOauthURL = 'https://accounts.google.com/o/oauth2/auth?scope='.urlencode(GOOGLE_OAUTH_SCOPE).'&redirect_uri='.REDIRECT_URI.'&response_type=code&client_id='.GOOGLE_CLIENT_ID.'&access_type=online';

if(!session_id()) session_start();