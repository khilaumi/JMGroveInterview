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
//	$sql1 = "delete  FROM dbo.tblTransactionDetails";
	
//	$query = sqlsrv_query($conn, $sql1);
	
	/*$sql1 = "SELECT * FROM dbo.tblTransactionDetails order by tblSEId DESC";
	$query = sqlsrv_query($conn, $sql1);
	$sql1 ="SELECT sum(TotalPaid) as paid FROM dbo.tblTransactionDetails where tblSEId = '59'";
	
	$query = sqlsrv_query($conn, $sql1);
	$row = sqlsrv_fetch_array($query);
	$paid=$row['paid'];*/
	//Invoice635787366928372459.pdf
echo "here";

	$sql1 ="select * FROM dbo.tblcustomer_followup where CustomerId='170' and ((Status<>'Sold'  and Status<>'Sold In Progress') or Status IS NULL) ";
	
	$sql1 ="update dbo.new_customer set CustomerName='Sandy',lastname='Botson',Email='sandeepp@custom-soft.com',CustomerAddress='Downtown',CellPh='6109092407',City='Florida11',State='Pennsylvania1',BillingAddress='tset1234',AdditionalEmail='nitint@custom-soft.com,chetans@custom-soft.com,vasudevp@custom-soft.com,',AdditionalPhoneNo='312123123412,123445346235,',AdditionalPhoneType='family,alt,',PhoneType='work',Zip='190831' where id='170'";
$sql1 ="select * FROM dbo.new_customer where id='170'";
$sql1 ="SELECT * FROM dbo.tblShuttersEstimate shutter inner join dbo.tblJobSequence quote ON quote.EstimateId=shutter.Id where quote.CustomerId='2578' order by shutter.Id DESC ";


$sql1 ="SELECT * FROM dbo.tblCustom shutter inner join dbo.tblQuoteSequence quote ON quote.EstimateId=shutter.Id where shutter.CustomerId='2576' and ((quote.Status<>'Sold'  and quote.Status<>'Sold In Progress') or quote.Status IS NULL) order by shutter.Id DESC";

$sql1 ="update  dbo.tblcustomer_followup set FileName='test' where Id='9393' ";
 $sql1 ="select top 10 * FROM dbo.tblcustomer_followup  where EstimateId<>'' and FileName<>'' and  CustomerId='2576'order by Id DESC";
 
 $sql1 = "SELECT * FROM dbo.tblShuttersEstimate shutter inner join dbo.tblJobSequence quote ON quote.EstimateId=shutter.Id where quote.CustomerId='2576'  order by shutter.Id DESC";

$sql1 ="select * FROM dbo.tblCustom where Id='369'";

$sql1="SELECT * FROM dbo.tblCustom shutter inner join dbo.tblJobSequence quote ON quote.EstimateId=shutter.Id where quote.CustomerId='2577' order by shutter.Id DESC";



$sql1 ="select * FROM dbo.new_customer where id='170'";
$sql1 ="select * FROM dbo.tblCustom where Id='376'";
$sql1 ="select * FROM dbo.new_customer customer join  dbo.tblJobSequence quote ON quote.CustomerId=customer.Id where quote.CustomerId<>'170'";
$sql1 ="select * FROM dbo.new_customer ";

	$query = sqlsrv_query($conn, $sql1);
	
//	echo "quote sequence<br>";
    if ($query === false){  
    exit("<pre>".print_r(sqlsrv_errors(), true));
    }
	
	   while ($row = sqlsrv_fetch_array($query))
    {  
	
       print_r($row);echo "<br>";
		

    }
	
	

	
	
