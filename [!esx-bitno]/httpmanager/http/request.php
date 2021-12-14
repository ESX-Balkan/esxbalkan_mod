<?php

$DobijenaData = file_get_contents('php://input');
$test = json_decode( $DobijenaData , true);

$mysqli = new mysqli("51.91.215.126", "esx_mod", "XySjaYh9B48SJSeX", "esx_mod");

if (mysqli_connect_errno()) {
    printf("error na konekciji: %s\n", mysqli_connect_error());
    exit();
}

$id = $test["id"];
$querry= mysqli_query($mysqli, "SELECT * FROM users where identifier = '" . mysqli_real_escape_string($mysqli, $id) . "'"); 

$rezultat = mysqli_fetch_assoc($querry);

echo json_encode($rezultat);


?>