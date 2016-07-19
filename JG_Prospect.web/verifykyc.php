<?php  
ob_start();
session_start();
$url = "https://sandbox.synapsepay.com/api/v3/user/doc/verify";

if($_REQUEST['oauth']=='')
{header("Location:customer_panel.php?no_auth=1");}
else{
 // KYC Documentation
 $payload = array(
    "login" => array(
        //Oauth_key of the user to add KYC doc
        "oauth_key" => $_REQUEST['oauth']
    ),
    "user" => array(
        //doc data
        "doc" => array(
            "question_set_id" => "".$_REQUEST['questions_id']."",
            "answers" => array(
                array("question_id" => 1, "answer_id" => $_REQUEST['answer0']),
                array("question_id" => 2, "answer_id" => $_REQUEST['answer1']),
                array("question_id" => 3, "answer_id" => $_REQUEST['answer2']),
                array("question_id" => 4, "answer_id" => $_REQUEST['answer3']),
                array("question_id" => 5, "answer_id" => $_REQUEST['answer4'])  
            )
        ),
        "fingerprint" => "suasusau21324redakufejfjsf",
    )
);

//$json=json_encode($payload);
//echo "<pre>";
//print_r($payload);
//exit;
//$payload=json_encode($json);



$sUrl= "https://sandbox.synapsepay.com/api/v3/user/doc/verify";
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
header("Location:node.php?oauth=".$_REQUEST['amount']."&amount=".$_REQUEST['amount']."&password=".$_REQUEST['password']."&account=".$_REQUEST['account']."&payment_num=".$_REQUEST['payment_num']."&cust_id=".$_REQUEST['cust_id']."&job_id=".$_REQUEST['job_id']."&total_price=".$_REQUEST['total_price']."&pay_all=".$_REQUEST['pay_all']."&type=".$_REQUEST['type']."&bank=".$_REQUEST['bank']."&username_pay=".$_REQUEST['username_pay']."&password_pay=".$_REQUEST['password_pay']."&ssn=".$_REQUEST['ssn']."&account_type=".$_REQUEST['account_type']."&account_type_value=".$_REQUEST['account_type_value']."&id=".substr($id,9,24)."&type=".$_REQUEST['type']);

}
?>

