<?php 
session_start();
include('includes/dbcon.php');

$id = $_SESSION['id'];
$venue = $_POST['venue'];
$date = $_POST['date'];
$time = $_POST['time'];
$motif = $_POST['motif'];
$pax = $_POST['pax'];
$type = $_POST['type'];
$ocassion = $_POST['ocassion'];
$cid = $_POST['combo_id'];
$date = date("Y-m-d", strtotime($date));

// Check if the date is already reserved
$query = mysqli_query($con, "SELECT * FROM `reservation` WHERE r_date='$date' AND r_status = 'Approved'");
if (mysqli_num_rows($query) > 0) {
    echo "<script>alert('Date is already reserved'); window.history.back();</script>";
} else {
    // Fetch combo details
    $combo_query = mysqli_query($con, "SELECT * FROM combo WHERE combo_id='$cid'");
    if ($row = mysqli_fetch_array($combo_query)) {
        $price = $row['combo_price'];
        $payable = $pax * $price;

        // Update reservation details
        $update_query = "UPDATE reservation SET 
                        payable='$payable', 
                        balance='$payable', 
                        r_venue='$venue', 
                        r_date='$date', 
                        r_time='$time', 
                        r_motif='$motif',
                        r_ocassion='$ocassion', 
                        r_type='$type', 
                        pax='$pax', 
                        combo_id='$cid', 
                        price='$price' 
                        WHERE rid='$id'";

        if (mysqli_query($con, $update_query)) {
            $_SESSION['id'] = $id;
            echo "<script>document.location='payment.php'</script>";
        } else {
            die("Error updating reservation: " . mysqli_error($con));
        }
    } else {
        echo "<script>alert('Invalid Combo ID'); window.history.back();</script>";
    }
}
?>
