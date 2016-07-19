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
if($_REQUEST['oauth']=='')
{header("Location:customer_panel.php?no_auth=1");}
else{	
 $customerID=$_SESSION['Cust_Id'];

 $sql_user = "SELECT * FROM dbo.new_customer  where id='".$customerID."'";
 $query_user = sqlsrv_query($conn, $sql_user);
						
//echo $sql_user;					   
 $row_user = sqlsrv_fetch_array($query_user);
 // print_r($row_user);

$url = "https://sandbox.synapsepay.com/api/v3/user/doc/add";

 // KYC Documentation
 
$payload = array(
    "login" => array(
	 "oauth_key" => $_REQUEST['oauth']
    ),
    "user" => array(
		"doc" => array(
             "birth_day" => date("d",strtotime($row_user['DateOfBirth'])),
            "birth_month" => date("m",strtotime($row_user['DateOfBirth'])),
            "birth_year" => date("Y",strtotime($row_user['DateOfBirth'])),
            "name_first" => $row_user['CustomerName'],
            "name_last" => $row_user['lastname'],
            "address_street1" => $row_user['CustomerAddress'],
            "address_postal_code" => $row_user['ZipCode'],
            "address_country_code" => "US",
            "document_value" => $_REQUEST['ssn'],
            "document_type" => "SSN"
        ),
        "fingerprint" => "suasusau21324redakufejfjsf",
    )
);

$json=json_encode($payload);
//echo "<pre>";
//print_r($payload);
//exit;
//$payload=json_encode($json);



$sUrl= "https://sandbox.synapsepay.com/api/v3/user/doc/add";
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
// print_r($string);

//echo "Location:verifykyc.php?email=".$_REQUEST['email']."&oauth=".$_REQUEST['oauth']."&amount=".$_REQUEST['amount']."&password=".$_REQUEST['password']."&amount=".$_REQUEST['amount']."&account=".$_REQUEST['account']."&payment_num=".$_REQUEST['payment_num']."&cust_id=".$_REQUEST['cust_id']."&job_id=".$_REQUEST['job_id']."&total_price=".$_REQUEST['total_price']."&pay_all=".$_REQUEST['pay_all']."&type=".$_REQUEST['type']."&bank=".$_REQUEST['bank']."&username_pay=".$_REQUEST['username_pay']."&password_pay=".$_REQUEST['password_pay'];
//exit; 
    $success=$string->success;
//echo "<br>success".$success;

$oauth_key=$string->oauth->oauth_key;
//echo "<br>oauth_key".$oauth_key;

$id=$string->user->_id;
$id=json_encode($id);
//echo "<br>id";
//echo substr($id,9,24);

 if($string->error_code=='10' || $string->error->en)
{
header("Location:customer_panel.php?add_kyc=1&email=".$_REQUEST['email']."&oauth=".$_REQUEST['oauth']."&amount=".$_REQUEST['amount']."&password=".$_REQUEST['password']."&account=".$_REQUEST['account']."&payment_num=".$_REQUEST['payment_num']."&cust_id=".$_REQUEST['cust_id']."&job_id=".$_REQUEST['job_id']."&total_price=".$_REQUEST['total_price']."&pay_all=".$_REQUEST['pay_all']."&type=".$_REQUEST['type']."&bank=".$_REQUEST['bank']."&username_pay=".$_REQUEST['username_pay']."&password_pay=".$_REQUEST['password_pay']."&ssn=".$_REQUEST['ssn']."&account_type=".$_REQUEST['account_type']."&account_type_value=".$_REQUEST['account_type_value']."&id=".substr($id,9,24)."&type=".$_REQUEST['type']);
}
else
{
header("Location:node.php?&email=".$_REQUEST['email']."&oauth=".$_REQUEST['oauth']."&amount=".$_REQUEST['amount']."&password=".$_REQUEST['password']."&account=".$_REQUEST['account']."&payment_num=".$_REQUEST['payment_num']."&cust_id=".$_REQUEST['cust_id']."&job_id=".$_REQUEST['job_id']."&total_price=".$_REQUEST['total_price']."&pay_all=".$_REQUEST['pay_all']."&type=".$_REQUEST['type']."&bank=".$_REQUEST['bank']."&username_pay=".$_REQUEST['username_pay']."&password_pay=".$_REQUEST['password_pay']."&ssn=".$_REQUEST['ssn']."&account_type=".$_REQUEST['account_type']."&account_type_value=".$_REQUEST['account_type_value']."&id=".substr($id,9,24)."&type=".$_REQUEST['type']);
}

}
?>

