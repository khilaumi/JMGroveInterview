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
  $url = 'https://sandbox.synapsepay.com/api/v3/trans/add';

  $payload = array(
    'login' => array(
      'oauth_key' => ''.$_REQUEST['oauth'].''
    ),
    'user' => array(
      'fingerprint' => 'suasusau21324redakufejfjsf'
    ),
    'trans' => array(
        //where you wish to debit funds from. This should belong to the user who's OAUTH key you have supplied in login
        'from' => array(
          'type' => 'ACH-US',
          'id' => ''.$_REQUEST['id'].''
      ),
      //where you wish to send funds to
      'to' => array(
        'type' => 'SYNAPSE-US',
        'id' => '55b7164b86c2731665229478'
      ),
      'amount' => array(
        'amount' => $_REQUEST['amount'],
        'currency' => 'USD'
      ),
      //this is all optional stuff.
      //supp_id lets you add your own DB's ID for the transaction
      //Note lets you attach a memo to the transaction
      //Webhook URL lets you establish a webhook update line
      //process on lets you supply the date when you wish to process this transaction. This is delta time, meaning 1 is tomorrow, 2 is day after, and so on
      //Finally the IP address of the transaction
      'extra' => array(
        'supp_id' => '1283764wqwsdd34wd13212',
        'note' => 'Deposit to bank account',
        'webhook' => 'http://requestb.in/1acojwy1',
        'process_on' => 1,
        'ip' => '192.168.0.1',
      ),
      //this lets you add a facilitator fee to the transaction, once the transaction settles, you will get a part of the transaction
      'fees' => array(array(
        'fee' => "0.01",
        'note' => 'Facilitator Fee',
        'to' => array(
          //SYNAPSE-US node ID where you want us to send the facilitator fee to once the transaction is settled
          'id' => '55b7164b86c2731665229478'
         )
      ))
    )
  );
  
  $json=json_encode($payload);
// echo "<pre>";
// print_r($json);
 //exit;

  $options = array(
    'http' => array(
      'method'  => 'POST',
      'content' => json_encode( $payload ),
      'header'=>  "Content-Type: application/json\r\n" .
                  "Accept: application/json\r\n"
      )
  );

 


$sUrl= "https://sandbox.synapsepay.com/api/v3/trans/add";
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
	//exit;
	//echo "<pre>";
$string=json_decode($result);
//print_r($string);
//exit;
	$success=$string->success;
	//echo "<br>success".$success;
	
	$client_name=$string->trans->client->name;
	//echo "<br>client_name".$client_name;
	
	$legal_names=$string->trans->from->user->legal_names[0];
//	echo "<br>legal_names".$legal_names;
	
	$legal_names1=$string->trans->to->user->legal_names[0];
	//echo "<br>legal_names".$legal_names1;
	
	$id=$string->trans->_id;

	$id=json_encode($id);
	$last=strlen($id)-2;
	//echo "<br>las".$last;
	//echo "<br>";
	$id= substr($id,9,24);
	$now=date("Y-m-d H:i:s");
	$OneTimePayment=0;
	
	{$OneTimePayment=$_REQUEST['pay_all'];}
	//$sql_check_quote ="SELECT * FROM dbo.tblJobSequence where EstimateId = '".$_REQUEST['payment_num']."'";
//							$query_check_quote = sqlsrv_query($conn, $sql_check_quote);
//							$row_check_quote = sqlsrv_fetch_array($query_check_quote);
							//print_r($row_check_quote);
	$sql = "insert into jgrov_User.tblTransactionDetails (CustId,tblSEId,Totalamt,TotalPaid,TransDate,TrasnId,OneTimePayment) values ('".$_SESSION['Cust_Id']."','".$_REQUEST['payment_num']."','".$_REQUEST['total_price']."','".$_REQUEST['payment_num']."','".$now."','".$id."','".$OneTimePayment."')";
//	echo "insert into jgrov_User.tblTransactionDetails (CustId,tblSEId,Totalamt,TotalPaid,TransDate,TrasnId,OneTimePayment) values ('".$_SESSION['Cust_Id']."','".$_REQUEST['payment_num']."','".$_REQUEST['total_price']."','".$_REQUEST['amount']."','".$now."','".$id."','".$OneTimePayment."')";
	$query = sqlsrv_query($conn, $sql);

    if ($query === true){  
    exit("<pre>".print_r(sqlsrv_errors(), true));
    }
	else
	{
	echo "Record Inserted Successfully";
	$sql_paid ="SELECT sum(TotalPaid) as paid FROM jgrov_User.tblTransactionDetails where tblSEId = '".$_REQUEST['payment_num']."'";
	
							$query_paid = sqlsrv_query($conn, $sql_paid);
							$row_paid = sqlsrv_fetch_array($query_paid);
							$paid=$row_paid['paid'];
							
							$sql_total ="SELECT Totalamt as total FROM jgrov_User.tblTransactionDetails where tblSEId = '".$_REQUEST['payment_num']."'";
							$query_total = sqlsrv_query($conn, $sql_total);
							$row_total = sqlsrv_fetch_array($query_total);
							$total=$row_total['total'];
							
							
							
	if($_REQUEST['type']=='quote')
	{
	
	if($total>1000)
	{
	$sql = "update dbo.tblShuttersEstimate set Status='sold>$1000' where Id='".$_REQUEST['payment_num']."' ";
	}
	else
	{
	$sql = "update dbo.tblShuttersEstimate set Status='sold<$1000' where Id='".$_REQUEST['payment_num']."' ";
	}
	
	$query = sqlsrv_query($conn, $sql);
	
	$sql = "update dbo.tblQuoteSequence set Status='Sold' where EstimateId='".$_REQUEST['payment_num']."' ";
	$query = sqlsrv_query($conn, $sql);
	
	$sql1 ="SELECT * from dbo.tblJobSequence where CustomerId='".$_SESSION['Cust_Id']."'";
	$query = sqlsrv_query($conn, $sql1);
	$a=array();
	 while ($row = sqlsrv_fetch_array($query))
    {  

	//$newDate = strtotime($row['FMDate']);
// date_default_timezone_set("Asia/Kolkata");
//	$timestamp = new DateTime();
//echo $timestamp->format('Y-m-d H:i:s');
	//$newDate = $newDate->format('d/m/Y');
		//echo $row['SoldJobId']."here-";
		$pos=strpos($row['SoldJobId'],"SJ");
		$num=substr($row['SoldJobId'],$pos+2,strlen($row['SoldJobId']));
		array_push($a,$num);
		//echo "<Br>pos".$pos."nm-".$num;
		//$num++;
		//echo "<br>num+".$num;
       //print_r($row);echo "<br>";
		

    }
	//print_r($a);
	$num=(max($a));
	
	//$pos=strpos($row['max'],"SJ");
		//$num=substr($row['max'],$pos+2,strlen($row['max']));
		//echo "<Br>pos".$pos."nm-".$num;
		$num++;
	//echo "insert into dbo.tblJobSequence (CustomerId,EstimateId,SoldJobId,StatusId,CreatedOn,ProductId) values ('".$_SESSION['Cust_Id']."','".$_REQUEST['payment_num']."','C".$_SESSION['Cust_Id']."-SJ".$num."','9','".$now."','1')";
	//exit;
	$sql = "insert into dbo.tblJobSequence (CustomerId,EstimateId,SoldJobId,StatusId,CreatedOn,ProductId) values ('".$_SESSION['Cust_Id']."','".$_REQUEST['payment_num']."','C".$_SESSION['Cust_Id']."-SJ".$num."','9','".$now."','1')";
	
	$query = sqlsrv_query($conn, $sql);
	 if ($query === false){  
    exit("<pre>".print_r(sqlsrv_errors(), true));
    }
	}
	else
	{/*
	if($total>1000)
	{
	$sql = "update dbo.tblShuttersEstimate set Status='sold>$1000' where Id='".$_REQUEST['payment_num']."' ";
	}
	else
	{
	$sql = "update dbo.tblShuttersEstimate set Status='sold<$1000' where Id='".$_REQUEST['payment_num']."' ";
	}
	
	$query = sqlsrv_query($conn, $sql);
	
	$sql = "update dbo.tblQuoteSequence set Status='Sold' where EstimateId='".$_REQUEST['payment_num']."' ";
	$query = sqlsrv_query($conn, $sql);
	
	*/}
	
	
	
	}
	//exit;
	
	//$insert=mysql_query("insert into payments(amount,datetime,job_id) values ('12','".$now."','".$_REQUEST['payment_num']."')");

header("Location:customer_panel.php?email=".$_GET['Email']."&success=".$success."&UserId=".$_GET['UserId']."&CustomerId=".$_GET['CustomerId']."&EstId=".$_GET['EstId']."&paymentMode=".$_GET['paymentMode']."&amount=".$_GET['amount']."&checkNo=".$_GET['checkNo']."&creditCardDetails=".$_GET['creditCardDetails']."&IsEmail=".$_GET['IsEmail']."&payment_num=".$payment_num."&to=".$legal_names."&type=".$type."&trans=1&id=".$id."");


}

?>