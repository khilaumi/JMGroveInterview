<?php  
ob_start();
session_start();

if($_REQUEST['oauth']=='')
{header("Location:customer_panel.php?no_auth=1");}
else{


  $json ='{
  "login":{
    "oauth_key":"'. $_REQUEST['oauth'].'"
  },
  "user":{
    "fingerprint":"suasusau21324redakufejfjsf"
  },
  "node":{
    "_id":{
      "$oid":"'.$_REQUEST['id'].'"
    },
    "verify":{
      "micro":['.$_REQUEST['micro1'].','.$_REQUEST['micro2'].']
    }
  }
}';
//echo "<pre>";
//print_r($json);
//exit;
//$payload=json_encode($json);




$sUrl= "https://sandbox.synapsepay.com/api/v3/node/verify";
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
//exit;
   $success=$string->success;
//echo "<br>success".$success;

$oauth_key=$string->oauth->oauth_key;
//echo "<br>oauth_key".$oauth_key;

$id=$string->nodes[0]->_id;
$id=json_encode($id);
//echo substr($id,9,24);
//echo "Location:JGtrans.php?success=".$success."&email=".$_REQUEST['email']."&oauth=".$_REQUEST['oauth']."&amount=".$_REQUEST['amount']."&password=".$_REQUEST['password']."&amount=".$_REQUEST['amount']."&account=".$_REQUEST['account']."&payment_num=".$_REQUEST['payment_num']."&cust_id=".$_REQUEST['cust_id']."&job_id=".$_REQUEST['job_id']."&total_price=".$_REQUEST['total_price']."&pay_all=".$_REQUEST['pay_all']."&type=".$_REQUEST['type']."&id=".substr($id,9,24);
//exit;

if($string->error->en)
{
header("Location:customer_panel.php?micro=1&err=".$string->error->en."&success=".$success."&oauth=".$_REQUEST['oauth']."&amount=".$_REQUEST['amount']."&password=".$_REQUEST['password']."&account=".$_REQUEST['account']."&payment_num=".$_REQUEST['payment_num']."&cust_id=".$_REQUEST['cust_id']."&job_id=".$_REQUEST['job_id']."&total_price=".$_REQUEST['total_price']."&pay_all=".$_REQUEST['pay_all']."&type=".$_REQUEST['type']."&bank=".$_REQUEST['bank']."&username_pay=".$_REQUEST['username_pay']."&password_pay=".$_REQUEST['password_pay']."&ssn=".$_REQUEST['ssn']."&account_type=".$_REQUEST['account_type']."&account_type_value=".$_REQUEST['account_type_value']."&id=".substr($id,9,24)."&type=".$_REQUEST['type']);
}
else
{
header("Location:JGtrans.php?oauth=".$_REQUEST['oauth']."&amount=".$_REQUEST['amount']."&password=".$_REQUEST['password']."&account=".$_REQUEST['account']."&payment_num=".$_REQUEST['payment_num']."&cust_id=".$_REQUEST['cust_id']."&job_id=".$_REQUEST['job_id']."&total_price=".$_REQUEST['total_price']."&pay_all=".$_REQUEST['pay_all']."&type=".$_REQUEST['type']."&bank=".$_REQUEST['bank']."&username_pay=".$_REQUEST['username_pay']."&password_pay=".$_REQUEST['password_pay']."&ssn=".$_REQUEST['ssn']."&account_type=".$_REQUEST['account_type']."&account_type_value=".$_REQUEST['account_type_value']."&id=".substr($id,9,24)."&type=".$_REQUEST['type']);
}
}

?>

