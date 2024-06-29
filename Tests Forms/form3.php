<?php

if(isset($_POST["page"])){
    echo "<br>Form loaded";

    $conn = new mysqli("localhost", "root", "", "tests_db");

    if($conn->connect_error){
        die("<br> Database connection failed" . $conn->connection_aborted);
    }else{
        echo "<br> Database connection successful"; 
    }
}
else{
    echo"Form not loaded";
    echo ("<a href = 'form3.html'> Return </a>");
}

?>