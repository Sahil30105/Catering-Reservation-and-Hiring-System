<?php 
session_start();
include('../includes/dbcon.php');
	$year=$_SESSION['year'];

	$query = mysqli_query($con, "
  SELECT 
    SUM(amount) AS amount, 
    DATE_FORMAT(payment_date, '%b') AS month
  FROM payment
  WHERE YEAR(payment_date) = '$year'
  GROUP BY month
") or die(mysqli_error($con));



	$category = array();
	//$category['name'];
 
	$series1 = array();
	$series1['name'] = 'Monthly Sales';

	while($r = mysqli_fetch_array($query)) {
		
	    //$count=$r['total'];
	    $category['name'][] =$r['month'];
	    $category['data'][] =$r['month'];
	    $series1['data'][] = $r['amount'];

}

$result = array();
array_push($result,$category);
array_push($result,$series1);
//array_push($result,$series2);

print json_encode($result, JSON_NUMERIC_CHECK);

mysqli_close($con);
//session_destroy(year);
?> 
