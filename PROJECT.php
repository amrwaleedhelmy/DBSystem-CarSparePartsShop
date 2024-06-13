<!DOCTYPE html>
<html>
<body>

<h1>This is Amr Osman and Rawan Albinzayed's work in COSC 312 Final project</h1>

<?php
echo nl2br("Here is the SQL statement output result\n");

   $dbhost = 'localhost:3306';
   $dbuser = 'root';
   $dbpass = 'root';
   
   
   
   error_reporting(E_ALL ^ E_DEPRECATED);
   $conn = mysql_connect($dbhost, $dbuser, $dbpass);
   
   if(! $conn ) {
      die('Could not connect: ' . mysql_error());
   }
   
   $sql = 'SELECT Item_ID, Item_Description, Price FROM Items';
   mysql_select_db('pro');
   $retval = mysql_query( $sql, $conn );
   
   if(! $retval ) {
      die('Could not get data: ' . mysql_error());
   }
   
   while($row = mysql_fetch_array($retval, MYSQL_ASSOC)) {
      echo "\r\nITEM ID :{$row['Item_ID']}  <br> ".
         "Item Description : {$row['Item_Description']} <br> ".
         "Price : {$row['Price']} <br> ".
         "--------------------------------<br>";
   }
   
   echo "Fetched data successfully\n";
   
   
?>

</body>
</html>