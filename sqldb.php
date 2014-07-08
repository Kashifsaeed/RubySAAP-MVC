<?php
// Create connection
$con=mysqli_connect("localhost","root","root","moizdb");

// Check connection
if (mysqli_connect_errno()) {
  echo "Failed to connect to MySQL: " . mysqli_connect_error();
}
else 
echo "connection success";
$sql="CREATE DATABASE moiz_db";
if (mysqli_query($con,$sql)) {
  echo "Database my_db created successfully";
} else {
  $con=mysqli_connect("localhost","root","root","moiz_db");
  if !(mysqli_connect_errno()) {
  echo "CONNECTED TO DATABASE moiz_db ";
} else
  echo "Error creating database: " . mysqli_error($con);
}

mysqli_close($con);
?>
