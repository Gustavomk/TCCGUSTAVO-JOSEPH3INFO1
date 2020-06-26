<?php
$dbservername = 'localhost';
$dbusername = 'root';
$dbpassword= '';
$dbdatabase = 'usuarios';

    $connect = mysqli_connect ($dbservername, $dbusername, $dbpassword, $dbdatabase);

    if (mysqli_connect_error()) {


    echo "Failed to connect to MySQL: " . mysqli_connect_error();

}
?>