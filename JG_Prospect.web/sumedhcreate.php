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
	

$sql_user = "SELECT * FROM dbo.new_customer  where id='".$_SESSION['Cust_Id']."'";
$query_user = sqlsrv_query($conn, $sql_user);
						
$row_user = sqlsrv_fetch_array($query_user);
//print_r($row_user);
if($row_user['oauth']!='')
{

header("Location:signin.php?oauth=".$oauth_key."&amount=".$_REQUEST['amount_pay']."&password=".$_REQUEST['password']."&account=".$_REQUEST['account']."&payment_num=".$_REQUEST['payment_num']."&cust_id=".$_REQUEST['cust_id']."&job_id=".$_REQUEST['job_id']."&total_price=".$_REQUEST['total_price']."&pay_all=".$_REQUEST['pay_all']."&type=".$_REQUEST['type']."&bank=".$_REQUEST['bank']."&username_pay=".$_REQUEST['username_pay']."&password_pay=".$_REQUEST['password_pay']."&ssn=".$_REQUEST['ssn']."&account_type=".$_REQUEST['account_type']."&account_type_value=".$_REQUEST['account_type_value']."&id=".substr($id,9,24)."&type=".$_REQUEST['type']);

}
else{
//echo "here";
//exit;
$url = "https://sandbox.synapsepay.com/api/v3/user/create";
/*
$payload = array(
    "client" => array(
        //your client ID and secret
        "client_id" => "zMHiLA2Uyb9o6ydB5uSX",
        "client_secret" =>  "XtbwVbNfrby9QU3B9zS4ltvn9OcCniHQciro8ocC"
    ),
    "logins" => array(
        //email and password of the user.
        array(
            "email" =>  "".$_GET['Email']."",
            "password" =>  "".$_GET['Password']."",
		//  "email" =>  "sumedhd@custom-soft.com",
         //   "password" =>  "test1234",
            "read_only" => False)
    ),
    "phone_numbers" => array(
        //the id of the user who's profile you want to create
        //This is for 2FA in the following calls
        "".$_GET['Email'].""
    ),
    "legal_names" => array(
        //users legal names and business name then toggle is bisiness
        "Justin Grove"
    ),
    "fingerprints" => array(
        array(
            //users device fingerprint passed by dev
            "fingerprint" => "742cd9157720aba071027b9c8051aec8"
        )
    ),
    "ips" => array(
        //users ip passed by dev
        "192.168.0.1"
    ),
    "extra" => array(
        //optional fields
        "note" =>  "First user created in sandbox",
        "supp_id" => "122eddfgbeafrfvbbb",
        //Toggle if it is a business
        "is_business" => False
    )
);
*/

$json1 = '{
  "client": {
    "client_id": "kScn5jUr2RaSO8UWwcQL",  
    "client_secret": "hwDbVVNFBwcHkzvZpiAkMv7gUid2COzEAytcPfHA"
  },
  "logins": [
    {
      "email": "'.$row_user['Email'].'",
      "password": "'.$row_user['Password'].'",
      "read_only":false
    }
  ],
  "phone_numbers": [
    "'.$row_user['Email'].'"
  ],
  "legal_names": [
    "'.$row_user['CustomerName'].' '.$row_user['lastname'].'"
  ],
  "fingerprints": [
    {
      "fingerprint": "suasusau21324redakufejfjsf"
    }
  ],
   "legal_names" => [ {
       
        "'.$row_user['CustomerName'].' '.$row_user['lastname'].'"
     }
  ],
  "ips": [
    "192.168.0.1"
  ],
  "extra": {
    "note": "Interesting user",
    "supp_id": "122eddfgbeafrfvbbb",
    "is_business": false
  }
}';
$payload = array(
    "client" => array(
      
        "client_id" => "kScn5jUr2RaSO8UWwcQL",
        "client_secret" =>  "hwDbVVNFBwcHkzvZpiAkMv7gUid2COzEAytcPfHA"
    ),
    "logins" => array(
      
        array(
            "email" =>  $row_user['Email'],
            "password" =>  $row_user['Password'],
		
            "read_only" => False)
    ),
    "phone_numbers" => array(
     
         $row_user['Email']
    ),
    "legal_names" => array(
     
        $row_user['CustomerName'].' '.$row_user['lastname']
    ),
    "fingerprints" => array(
        array(
          
            "fingerprint" => "suasusau21324redakufejfjsf"
        )
    ),
    "ips" => array(
       
        "192.168.0.1"
    ),

);

 $json=json_encode($payload);
$options = array(
    'http' => array(
        'method'  => 'POST',
        'content' => json_encode( $payload ),
        'header'=>  "Content-Type: application/json\r\n" .
            "Accept: application/json\r\n"
    )
);

//echo $json."<br>";
$sUrl= "https://sandbox.synapsepay.com/api/v3/user/create";
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
//	print_r($result);
//	echo "Location:addkyc.php?email=".$_REQUEST['Email']."&oauth=".$oauth_key."&amount=".$_REQUEST['amount_pay']."&password=".$_REQUEST['password']."&amount=".$_REQUEST['amount_pay']."&account=".$_REQUEST['account']."&payment_num=".$_REQUEST['payment_num']."&cust_id=".$_REQUEST['cust_id']."&job_id=".$_REQUEST['job_id']."&total_price=".$_REQUEST['total_price']."&pay_all=".$_REQUEST['pay_all']."&type=".$_REQUEST['type']."&bank=".$_REQUEST['bank']."&username_pay=".$_REQUEST['username_pay']."&password_pay=".$_REQUEST['password_pay'];
//	exit;
if($result!='')
{
//echo "<br>Login Sccessful<br>";


}
//echo "<pre>";
$string=json_decode($result);
// print_r($string);

   $success=$string->success;
//echo "<br>success".$success;

$oauth_key=$string->oauth->oauth_key;
//echo "<br>oauth_key".$oauth_key;

$id=$string->user->_id;
$id=json_encode($id);
//echo "<br>id";
//echo substr($id,9,24);

 $sql_user = "update dbo.new_customer set oauth='".$oauth_key."',oid='".substr($id,9,24)."' where id='".$_SESSION['Cust_Id']."'";
 $query_user = sqlsrv_query($conn, $sql_user);

//echo "Location:addkyc.php?email=".$_REQUEST['Email']."&oauth=".$oauth_key."&amount=".$_REQUEST['amount_pay']."&password=".$_REQUEST['password']."&amount=".$_REQUEST['amount_pay']."&account=".$_REQUEST['account']."&payment_num=".$_REQUEST['payment_num']."&cust_id=".$_REQUEST['cust_id']."&job_id=".$_REQUEST['job_id']."&total_price=".$_REQUEST['total_price']."&pay_all=".$_REQUEST['pay_all']."&type=".$_REQUEST['type']."&bank=".$_REQUEST['bank']."&username_pay=".$_REQUEST['username_pay']."&password_pay=".$_REQUEST['password_pay']."&ssn=".$_REQUEST['ssn']; 
//exit;
header("Location:addkyc.php?oauth=".$oauth_key."&amount=".$_REQUEST['amount_pay']."&password=".$_REQUEST['password']."&account=".$_REQUEST['account']."&payment_num=".$_REQUEST['payment_num']."&cust_id=".$_REQUEST['cust_id']."&job_id=".$_REQUEST['job_id']."&total_price=".$_REQUEST['total_price']."&pay_all=".$_REQUEST['pay_all']."&type=".$_REQUEST['type']."&bank=".$_REQUEST['bank']."&username_pay=".$_REQUEST['username_pay']."&password_pay=".$_REQUEST['password_pay']."&ssn=".$_REQUEST['ssn']."&account_type=".$_REQUEST['account_type']."&account_type_value=".$_REQUEST['account_type_value']."&id=".substr($id,9,24)."&type=".$_REQUEST['type']);

}

?>
