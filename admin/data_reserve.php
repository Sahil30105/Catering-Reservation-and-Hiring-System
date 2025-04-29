<?php 
session_start();
include('../includes/dbcon.php');

$year1 = $_SESSION['year1'];

$query = mysqli_query($con, "
    SELECT 
        COUNT(*) AS count, 
        DATE_FORMAT(r_date, '%b') AS month 
    FROM reservation 
    WHERE YEAR(r_date) = '$year1' 
      AND (r_status = 'Finished' OR r_status = 'Approved') 
    GROUP BY MONTH(r_date), DATE_FORMAT(r_date, '%b')
") or die(mysqli_error($con));


	$category = array();
	//$category['name'];

	$series1 = array();
	$series1['name'] = 'Approved and Finished';

	while($r = mysqli_fetch_array($query)) {
		
	    //$count=$r['total'];
	    $category['name'][] =$r['month'];
	    $category['data'][] =$r['month'];
	    $series1['data'][] = $r['count'];

}

$result = array();
array_push($result,$category);
array_push($result,$series1);
//array_push($result,$series2);

print json_encode($result, JSON_NUMERIC_CHECK);

mysqli_close($con);

//session_destroy(year1);
?> 
