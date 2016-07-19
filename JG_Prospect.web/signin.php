<?php  
ob_start();
session_start();
//start of code to insert in sql server
$serverName = "73.188.87.130\sql2008r2"; //serverName\instanceName

    $connectionInfo = array( "Database"=>"jgrove_JGP", "UID"=>"sa", "PWD"=>"sa@12345");
    $conn = sqlsrv_connect( $serverName, $connectionInfo);
    if( $conn === false ) {
         die( print_r( sqlsrv_errors(), true));
    }
	else
	{//echo "Success";
	}

  $url = "https://sandbox.synapsepay.com/api/v3/user/signin";

$sql_user = "SELECT * FROM dbo.new_customer  where id='".$_SESSION['Cust_Id']."'";
$query_user = sqlsrv_query($conn, $sql_user);
						
$row_user = sqlsrv_fetch_array($query_user);

  $payload = array(
    "client" => array(
      //your client ID and secret
      "client_id" => "kScn5jUr2RaSO8UWwcQL",  
      "client_secret" => "hwDbVVNFBwcHkzvZpiAkMv7gUid2COzEAytcPfHA"
    ),
    "login" =>array(
      //email and password of the user.
      "email" => $row_user['Email'],
      "password" => $row_user['Password']
    ),
    "user" =>array(
      //the id of the user profile that you wish to sign into.
      '_id' =>array(
        '$oid' =>$row_user['oid'],
      ),
      "fingerprint" =>"suasusau21324redakufejfjsf",
      "ip" =>"192.168.0.1",
     
      
      
     
    )
  );


 $json=json_encode($payload);
//echo "<pre>";
//print_r($json);
//exit;
//$payload=json_encode($json);




$sUrl= "https://sandbox.synapsepay.com/api/v3/user/signin";
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL,$sUrl);
    curl_setopt($ch, CURLOPT_VERBOSE, 1);
    curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 0);
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
    curl_setopt($ch, CURLOPT_POST, 1);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1); 
    curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-Type: application/json; charset=utf-8'));
    curl_setopt($ch, CURLOPT_POSTFIELDS, $json);
    $result = curl_exec($ch);
    curl_close($ch);
//echo "<pre>";
$string=json_decode($result);
//print_r($string);
//exit;
   $success=$string->success;
//echo "<br>success".$success;

$oauth_key=$string->oauth->oauth_key;
//echo "<br>oauth_key".$oauth_key;

$id=$string->user->_id;
$id=json_encode($id);


 $sql_user = "update dbo.new_customer set oauth='".$oauth_key."',oid='".substr($id,9,24)."' where id='".$_SESSION['Cust_Id']."'";
 $query_user = sqlsrv_query($conn, $sql_user);
//header("Location:bankloginiframe.php?email=".$_GET['email']."&oauth=".$oauth_key."&amount=".$_GET['amount']."");
//echo "JGtrans.php?email=".$_REQUEST['email']."&oauth=".$oauth_key."&amount=".$_REQUEST['amount']."&password=".$_REQUEST['password']."&amount=".$_REQUEST['amount']."&account=".$_REQUEST['account']."&payment_num=".$_REQUEST['payment_num'];
//exit;

header("Location:addkyc.php?oauth=".$oauth_key."&amount=".$_REQUEST['amount']."&password=".$_REQUEST['password']."&account=".$_REQUEST['account']."&payment_num=".$_REQUEST['payment_num']."&cust_id=".$_REQUEST['cust_id']."&job_id=".$_REQUEST['job_id']."&total_price=".$_REQUEST['total_price']."&pay_all=".$_REQUEST['pay_all']."&type=".$_REQUEST['type']."&bank=".$_REQUEST['bank']."&username_pay=".$_REQUEST['username_pay']."&password_pay=".$_REQUEST['password_pay']."&ssn=".$_REQUEST['ssn']."&account_type=".$_REQUEST['account_type']."&account_type_value=".$_REQUEST['account_type_value']."&id=".substr($id,9,24)."&type=".$_REQUEST['type']);

exit;

?>

