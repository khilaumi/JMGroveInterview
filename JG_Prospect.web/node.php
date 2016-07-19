<?php  
ob_start();
session_start();

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

if($_REQUEST['oauth']=='')
{header("Location:customer_panel.php?no_auth=1");}
else{				
 // Add Node Synapse Account
 
/*$payload = array(
    "login" => array(
        "oauth_key" => "EUfHyZzGNBxUguKupJT4oYi99Z8qMtRsXQOltfBM"
    ),
    "user" => array(
        "fingerprint" => "742cd9157720aba071027b9c8051aec8"
    ),    
    "node" => array(
        //type of the node to add
        "type" => "SYNAPSE-US",
        "info" => array(
            "nickname" => "Savings"
        ),
        "extra" => array(
            "supp_id" => "123sa"
        )
    )
);*/
  /*
  //////////////////
  ADD ACH ACCOUNT WITH BANK LOGIN
  //////////////////
  */
/*$payload = array(
    "login" => array(
        "oauth_key" => "9JVVDpP5fZvfLmg4NwoeMr416rQ2jMp4G42FdNBc"
    ),
    "user" => array(
        "fingerprint" => "suasusau21324redakufejfjsf"
    ),    
    "node" => array(
        //type of the node to add
        "type" => "ACH-US",
        "info" => array(
            "bank_id" => "synapse_nomfa",
            "bank_pw" => "test1234",
            "bank_name" => "citi"
        ),
        "extra" => array(
            "supp_id" => "123sa"
        )
    )
);*/  
  /**/
  //////////////////
  //ADD ACH ACCOUNT WITH ACCOUNT & ROUTING NUMBER
  //////////////////

$payload = array(
    "login" => array(
        "oauth_key" => $_REQUEST['oauth']
    ),
    "user" => array(
        "fingerprint" => "suasusau21324redakufejfjsf"
    ),    
    "node" => array(
       
        "type" => "ACH-US",
        "info" => array(
            "nickname" => "Savings Account",
            "name_on_account" => "".$row_user['CustomerName']." ".$row_user['lastname']."",
            "account_num" => $_REQUEST['username_pay'],
            "routing_num" => $_REQUEST['password_pay'],
            "type" => "PERSONAL",
            "class" => "CHECKING"
        ),
        "extra" => array(
            "supp_id" => "123sa"
        )
    )
);




 $json=json_encode($payload);
//echo "<pre>";
//print_r($json);
//exit;
//$payload=json_encode($json);




$sUrl= "https://sandbox.synapsepay.com/api/v3/node/add";
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

$id=$string->nodes[0]->_id;
$id=json_encode($id);
//echo substr($id,9,24);
$allowed=$string->nodes[0]->allowed;
//echo "here-".$allowed;
//echo "customer_panel.php?micro=1&success=".$success."&oauth=".$_REQUEST['oauth']."&amount=".$_REQUEST['amount']."&password=".$_REQUEST['password']."&account=".$_REQUEST['account']."&payment_num=".$_REQUEST['payment_num']."&cust_id=".$_REQUEST['cust_id']."&job_id=".$_REQUEST['job_id']."&total_price=".$_REQUEST['total_price']."&pay_all=".$_REQUEST['pay_all']."&type=".$_REQUEST['type']."&bank=".$_REQUEST['bank']."&username_pay=".$_REQUEST['username_pay']."&password_pay=".$_REQUEST['password_pay']."&ssn=".$_REQUEST['ssn']."&account_type=".$_REQUEST['account_type']."&account_type_value=".$_REQUEST['account_type_value']."&id=".substr($id,9,24)."&type=".$_REQUEST['type'];
//exit;
if($allowed=='CREDIT-AND-DEBIT')
{
header("Location:JGtrans.php?success=".$success."&oauth=".$_REQUEST['oauth']."&amount=".$_REQUEST['amount']."&password=".$_REQUEST['password']."&account=".$_REQUEST['account']."&payment_num=".$_REQUEST['payment_num']."&cust_id=".$_REQUEST['cust_id']."&job_id=".$_REQUEST['job_id']."&total_price=".$_REQUEST['total_price']."&pay_all=".$_REQUEST['pay_all']."&type=".$_REQUEST['type']."&bank=".$_REQUEST['bank']."&username_pay=".$_REQUEST['username_pay']."&password_pay=".$_REQUEST['password_pay']."&ssn=".$_REQUEST['ssn']."&account_type=".$_REQUEST['account_type']."&account_type_value=".$_REQUEST['account_type_value']."&id=".substr($id,9,24)."&type=".$_REQUEST['type']);
}
else
{

header("Location:customer_panel.php?micro=1&success=".$success."&oauth=".$_REQUEST['oauth']."&amount=".$_REQUEST['amount']."&password=".$_REQUEST['password']."&account=".$_REQUEST['account']."&payment_num=".$_REQUEST['payment_num']."&cust_id=".$_REQUEST['cust_id']."&job_id=".$_REQUEST['job_id']."&total_price=".$_REQUEST['total_price']."&pay_all=".$_REQUEST['pay_all']."&type=".$_REQUEST['type']."&bank=".$_REQUEST['bank']."&username_pay=".$_REQUEST['username_pay']."&password_pay=".$_REQUEST['password_pay']."&ssn=".$_REQUEST['ssn']."&account_type=".$_REQUEST['account_type']."&account_type_value=".$_REQUEST['account_type_value']."&id=".substr($id,9,24)."&type=".$_REQUEST['type']);
}


}
?>

