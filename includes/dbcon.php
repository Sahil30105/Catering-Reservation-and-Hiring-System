<?php
$con = mysqli_connect("localhost","root","123456","reservation");

// Check connection
if (mysqli_connect_errno())
  {
  echo "Failed to connect to MySQL: " . mysqli_connect_error();
  }
?>