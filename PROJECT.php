<!DOCTYPE html>
<html>
<body>

<h1>This is Amr Osman and Rawan Albinzayed's work in COSC 312 Final project</h1>

<?php
echo nl2br("Here is the SQL statement output result\n");

   $dbhost = 'localhost';
   $dbuser = 'root';
   $dbpass = '';
   $dbname = 'pro';
   
   // Create connection using mysqli
   $conn = mysqli_connect($dbhost, $dbuser, $dbpass, $dbname);
   
   if(!$conn) {
      die('Could not connect: ' . mysqli_connect_error());
   }
   
   $sql = 'SELECT Item_ID, Item_Description, Price FROM Items';
   $retval = mysqli_query($conn, $sql);
   
   if(!$retval) {
      die('Could not get data: ' . mysqli_error($conn));
   }
   
   while($row = mysqli_fetch_assoc($retval)) {
      echo "\r\nITEM ID :{$row['Item_ID']}  <br> ".
         "Item Description : {$row['Item_Description']} <br> ".
         "Price : {$row['Price']} <br> ".
         "--------------------------------<br>";
   }
   
   echo "Fetched data successfully\n";
   
   mysqli_close($conn);
   
?>

</body>
</html>
