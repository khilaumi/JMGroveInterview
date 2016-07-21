﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Sr_App/SR_app.Master" AutoEventWireup="true" CodeBehind="InstallCreateUserSuresh.aspx.cs" EnableEventValidation="false" Inherits="JG_Prospect.Sr_App.InstallCreateUserSuresh" %>

<%--<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>--%>
<%--<%@ Register Assembly="TimePicker" Namespace="MKB.TimePicker" TagPrefix="cc1" %>--%>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script src="~/Scripts/jquery.MultiFile.js" type="text/javascript"></script>

    <script type="text/javascript">
        function hidePnl() {
            $("#ContentPlaceHolder1_pnlpopup").hide();
            return true;
        }
    </script>

    <script type="text/javascript">
        //$(function () {
        //    $("#DOBdatepicker").datepicker({
        //        changeMonth: true,
        //        changeYear: true,
        //        yearRange: '1950:2050',
        //        maxDate: 'today'
        //    });
        //});
        //$(function () {
        //    $("#txtStartDateNew").datepicker({
        //        changeMonth: true,
        //        changeYear: true,
        //        yearRange: '1950:2050'
        //    });
        //});
    </script>

    <script type="text/javascript">
        function GetSelectedValue(e) {
            //get selected value and check if subject is selected else show alert box
            var SelectedValue = e.options[e.selectedIndex].value;
            if (SelectedValue > 0) {
                //get selected text and set to label
                var SelectedText = e.options[e.selectedIndex].text;
                if (SelectedText == "Active") {
                    doOpen();
                }
                else {
                    doClose();
                }
                //set selected value to label
            }
        }

        function doOpen() { $find("cpe2")._doOpen(); }
        function doClose() { $find("cpe2")._doClose(); }
    </script>
    <script type="text/javascript">
        function ClosePassword() {
            document.getElementById('litePassword').style.display = 'none';
            document.getElementById('fadePassword').style.display = 'none';
        }

        function overlayPassword() {
            document.getElementById('litePassword').style.display = 'block';
            document.getElementById('fadePassword').style.display = 'block';
        }
        function ClosePS() {
            document.getElementById('divPSlite').style.display = 'none';
            document.getElementById('divPSfade').style.display = 'none';
        }

        function overlayPS() {
            document.getElementById('divPSlite').style.display = 'block';
            document.getElementById('divPSfade').style.display = 'block';
        }

        function ClosePopup() {
            document.getElementById('light').style.display = 'none';
            document.getElementById('fade').style.display = 'none';
        }

        function overlay() {
            document.getElementById('light').style.display = 'block';
            document.getElementById('fade').style.display = 'block';
        }
        $(document).ready(function () {

        });
    </script>
    <script type="text/javascript">
        function ValidateCheckBox() {
            if (document.getElementById("<%=chkboxcondition.ClientID %>").checked == true) {
                return true
            } else {
                alert("Please Accept Term and Conditions")
                return false;
            }
        }

        var validFilesTypes = ["doc", "docs", "pdf", "docx"];
        function ValidateFileOne() {
            var file = document.getElementById("<%=flpResume.ClientID%>");
            var path = file.value;
            var ext = path.substring(path.lastIndexOf(".") + 1, path.length).toLowerCase();
            var isValidFile = false;
            for (var i = 0; i < validFilesTypes.length; i++) {
                if (ext == validFilesTypes[i]) {
                    isValidFile = true;
                    break;
                }
            }
            if (!isValidFile) {
                alert('Select file of type doc,pdf or docx');
                //label.style.color = "red";
                //label.innerHTML = "Invalid File. Please upload a File with" +

                // " extension:\n\n" + validFilesTypes.join(", ");

            }
            return isValidFile;
        }



        function ValidateFileCirtificate() {
            var file = document.getElementById("<%=flpCirtification.ClientID%>");

            var path = file.value;
            var ext = path.substring(path.lastIndexOf(".") + 1, path.length).toLowerCase();
            var isValidFile = false;
            for (var i = 0; i < validFilesTypes.length; i++) {
                if (ext == validFilesTypes[i]) {
                    isValidFile = true;
                    break;
                }
            }
            if (!isValidFile) {
                alert('Select file of type doc,pdf or docx');
                //label.style.color = "red";
                //label.innerHTML = "Invalid File. Please upload a File with" +

                // " extension:\n\n" + validFilesTypes.join(", ");

            }
            return isValidFile;
        }

    </script>
    <script language="javascript" type="text/javascript">
        $(document).ready(function () {


        });

    </script>
    <link rel="stylesheet" href="http://twitter.github.com/bootstrap/1.4.0/bootstrap.min.css" />
    <style type="text/css">
        .modalBackground {
            background-color: Gray;
            filter: alpha(opacity=80);
            opacity: 0.8;
            z-index: 10000;
            display: none;
        }

        .myfont {
            font-family: 'barcode_fontregular';
            font-size: 37px;
        }

        .black_overlay {
            display: none;
            position: fixed;
            top: 0%;
            left: 0%;
            width: 100%;
            height: 100%;
            background-color: black;
            z-index: 1001;
            -moz-opacity: 0.8;
            opacity: .80;
            filter: alpha(opacity=80);
            overflow-y: hidden;
        }

        .white_content {
            display: none;
            position: absolute;
            top: 10%;
            left: 20%;
            width: 60%;
            height: 5%;
            padding: 16px;
            border: 10px solid #327FB5;
            background-color: white;
            z-index: 1002;
            overflow: auto;
        }

        @font-face {
            font-family: 'barcode_fontregular';
            src: url('../fonts/barcodefont-webfont.eot');
            src: url('../fonts//barcodefont-webfont.eot?#iefix') format('embedded-opentype'), url('../fonts/barcodefont-webfont.woff2') format('woff2'), url('../fonts/barcodefont-webfont.woff') format('woff'), url('../fonts/barcodefont-webfont.ttf') format('truetype'), url('../fonts/barcodebarcodefont-webfont.svg#barcode_fontregular') format('svg');
            font-weight: normal;
            font-style: normal;
        }
    </style>
    <script type="text/javascript">
        function uploadComplete2() {

            alert("File uploaded successfully");
            //location.href = "InstallCreateProspect.aspx?ImageUpload=Yes";
            var btnImageUploadClick = document.getElementById("btnUploadSkills");
            btnUploadSkills.click();

        }

        function PrintPanel() {
            var panel = document.getElementById("<%=pnlPrint.ClientID %>");
            var printWindow = window.open('', '', 'height=400,width=500');
            printWindow.document.write('<html><head><title></title>');
            printWindow.document.write('</head><body >');
            printWindow.document.write(panel.innerHTML);
            printWindow.document.write('</body></html>');
            printWindow.document.close();
            setTimeout(function () {
                printWindow.print();
            }, 500);
            return false;
        }
    </script>
    <%-- <script>
        function AssemblyFileUpload_Started(sender, args) {
            var filename = args.get_fileName();
            var ext = filename.substring(filename.lastIndexOf(".") + 1);
            if (ext != 'png' && ext != 'jpg' && ext != 'bmp') {
                throw {
                    name: "Invalid File Type",
                    level: "Error",
                    message: "Invalid File Type (Only .png)",
                    htmlMessage: "Invalid File Type (Only .png,.jpg and bmp)"
                }
                return false;
            }
            return true;
        }

</script>--%>
    <style type="text/css">
        .form_panel_custom ul li {
            /*width: 95% !important;*/
        }

        .form_panel_custom ul {
            margin: 0 0 0px 0;
        }

        .Autocomplete {
            overflow: auto;
            height: 150px;
        }

        .style1 {
            width: 451px;
        }


        .style2 {
            width: 451px;
        }

        .auto-style10 {
            width: 58px;
        }

        .auto-style11 {
            width: 100%;
        }

        .auto-style13 {
        }

        .auto-style14 {
            height: 137px;
            width: 447px;
        }

        .auto-style15 {
            width: 447px;
        }
    </style>
    <script type="text/javascript">
        function Confirm() {
            var confirm_value = document.createElement("INPUT");
            confirm_value.type = "hidden";
            confirm_value.name = "confirm_value";
            if (confirm("User with same Email or phone number already exists. Do you want to edit user?")) {
                confirm_value.value = "Yes";
            } else {
                confirm_value.value = "No";
            }
            document.forms[0].appendChild(confirm_value);
        }
    </script>
    <script type="text/javascript">
        function movetoNext(current, nextFieldID) {
            if (current.value.length >= current.maxLength) {
                document.getElementById(nextFieldID).focus();
            }
        }

        function uploadComplete2() {
            alert("File uploaded successfully");
            var btnImageUploadClick = document.getElementById("btnUploadSkills");
            btn_UploadFiles.click();
        }
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#ddlstatus").click(function () {
                if ($('#ddlstatus').val() == "Active") {
                    $('#pnlcolaps').show(500);
                } else {
                    $("#pnlcolaps").hide(500);
                }
            });

            var des = $("#ddldesignation").val();
            $("#lnkW9").hide();
            $("#lnkw4").hide();
            $("#lnkI9").hide();
            $("#lnkEsrow").hide();
            $("#lnkface").hide();
            if (des == "ForeMan") {
                $("#lnkW9").hide();
                $("#lnkw4").show();
                $("#lnkI9").show();
                $("#lnkEsrow").hide();
                $("#lnkface").hide();
                //Installer();
            }
            else if (des == "Installer") {
                $("#lnkW9").hide();
                $("#lnkw4").show();
                $("#lnkI9").show();
                $("#lnkEsrow").hide();
                $("#lnkface").hide();

            }
            else if (des == "SubContractor") {
                $("#lnkW9").show();
                $("#lnkw4").hide();
                $("#lnkI9").show();
                $("#lnkEsrow").show();
                $("#lnkface").show();

            }

        });

    </script>
    <link href="../Styles/dd.css" rel="stylesheet" />
    <style>
        /* Absolute Center Spinner */
        .loading {
            position: fixed;
            z-index: 999;
            height: 2em;
            width: 2em;
            overflow: show;
            margin: auto;
            top: 0;
            left: 0;
            bottom: 0;
            right: 0;
        }

            /* Transparent Overlay */
            .loading:before {
                content: '';
                display: block;
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0,0,0,0.1);
            }

            /* :not(:required) hides these rules from IE9 and below */
            .loading:not(:required) {
                /* hide "loading..." text */
                font: 0/0 a;
                color: transparent;
                text-shadow: none;
                background-color: transparent;
                border: 0;
            }

                .loading:not(:required):after {
                    content: '';
                    display: block;
                    font-size: 10px;
                    width: 1em;
                    height: 1em;
                    margin-top: -0.5em;
                    -webkit-animation: spinner 1500ms infinite linear;
                    -moz-animation: spinner 1500ms infinite linear;
                    -ms-animation: spinner 1500ms infinite linear;
                    -o-animation: spinner 1500ms infinite linear;
                    animation: spinner 1500ms infinite linear;
                    border-radius: 0.5em;
                    -webkit-box-shadow: rgba(0, 0, 0, 0.75) 1.5em 0 0 0, rgba(0, 0, 0, 0.75) 1.1em 1.1em 0 0, rgba(0, 0, 0, 0.75) 0 1.5em 0 0, rgba(0, 0, 0, 0.75) -1.1em 1.1em 0 0, rgba(0, 0, 0, 0.5) -1.5em 0 0 0, rgba(0, 0, 0, 0.5) -1.1em -1.1em 0 0, rgba(0, 0, 0, 0.75) 0 -1.5em 0 0, rgba(0, 0, 0, 0.75) 1.1em -1.1em 0 0;
                    box-shadow: rgba(0, 0, 0, 0.75) 1.5em 0 0 0, rgba(0, 0, 0, 0.75) 1.1em 1.1em 0 0, rgba(0, 0, 0, 0.75) 0 1.5em 0 0, rgba(0, 0, 0, 0.75) -1.1em 1.1em 0 0, rgba(0, 0, 0, 0.75) -1.5em 0 0 0, rgba(0, 0, 0, 0.75) -1.1em -1.1em 0 0, rgba(0, 0, 0, 0.75) 0 -1.5em 0 0, rgba(0, 0, 0, 0.75) 1.1em -1.1em 0 0;
                }

        /* Animation */

        @-webkit-keyframes spinner {
            0% {
                -webkit-transform: rotate(0deg);
                -moz-transform: rotate(0deg);
                -ms-transform: rotate(0deg);
                -o-transform: rotate(0deg);
                transform: rotate(0deg);
            }

            100% {
                -webkit-transform: rotate(360deg);
                -moz-transform: rotate(360deg);
                -ms-transform: rotate(360deg);
                -o-transform: rotate(360deg);
                transform: rotate(360deg);
            }
        }

        @-moz-keyframes spinner {
            0% {
                -webkit-transform: rotate(0deg);
                -moz-transform: rotate(0deg);
                -ms-transform: rotate(0deg);
                -o-transform: rotate(0deg);
                transform: rotate(0deg);
            }

            100% {
                -webkit-transform: rotate(360deg);
                -moz-transform: rotate(360deg);
                -ms-transform: rotate(360deg);
                -o-transform: rotate(360deg);
                transform: rotate(360deg);
            }
        }

        @-o-keyframes spinner {
            0% {
                -webkit-transform: rotate(0deg);
                -moz-transform: rotate(0deg);
                -ms-transform: rotate(0deg);
                -o-transform: rotate(0deg);
                transform: rotate(0deg);
            }

            100% {
                -webkit-transform: rotate(360deg);
                -moz-transform: rotate(360deg);
                -ms-transform: rotate(360deg);
                -o-transform: rotate(360deg);
                transform: rotate(360deg);
            }
        }

        @keyframes spinner {
            0% {
                -webkit-transform: rotate(0deg);
                -moz-transform: rotate(0deg);
                -ms-transform: rotate(0deg);
                -o-transform: rotate(0deg);
                transform: rotate(0deg);
            }

            100% {
                -webkit-transform: rotate(360deg);
                -moz-transform: rotate(360deg);
                -ms-transform: rotate(360deg);
                -o-transform: rotate(360deg);
                transform: rotate(360deg);
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="loading" style="display: none">Loading&#8230;</div>

    <div class="right_panel">
        <asp:LinkButton ID="lnkDummy" runat="server"></asp:LinkButton>
        <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender2" BehaviorID="mpe" runat="server"
            PopupControlID="pnlMandatoryFields" TargetControlID="lnkDummy" BackgroundCssClass="modalBackground" CancelControlID="btnHide">
        </ajaxToolkit:ModalPopupExtender>
        <asp:Panel ID="pnlMandatoryFields" runat="server" CssClass="modalPopup" BackColor="White" Height="200px" Width="600px" Style="display: none">
            <table width="100%" style="border: Solid 3px #b04547; width: 100%; height: 100%" cellpadding="0" cellspacing="0">
                <tr style="background-color: #b04547">
                    <td colspan="2" style="height: 10%; color: white; font-weight: bold; font-size: larger;">
                        <h2 style="color: white">Following fields are mandatory...</h2>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <ul style="list-style-type: square; font-weight: bold; font-size: larger;">
                            <li>Please enter email address.</li>
                            <li>Please enter password.</li>
                            <li>Please enter confirm password.</li>
                        </ul>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <asp:Button ID="btnHide" runat="server" Text="Cancel" Style="background: url(img/main-header-bg.png) repeat-x; color: #fff;" />
                    </td>
                    <td></td>
                </tr>
            </table>
        </asp:Panel>
        <!-- appointment tabs section start -->
        <ul class="appointment_tab">
            <li><a href="HRReports.aspx">HR Reports</a></li>
            <li><a href="InstallCreateUser.aspx">Create Install User</a></li>
            <li><a href="EditInstallUser.aspx">Edit Install User</a></li>
            <li><a href="CreateSalesUser.aspx">Create Sales User</a></li>
            <li><a href="EditUser.aspx">Edit Sales User</a></li>
        </ul>
        <h1>Install Create Users
        </h1>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" Style="padding: 5px" HeaderText="Following error occurs....." ShowMessageBox="true"
            DisplayMode="BulletList" ShowSummary="true" ValidationGroup="submit" ShowModelStateErrors="true" ShowValidationErrors="true" BackColor="Snow" ForeColor="Red" Font-Size="X-Large" Font-Italic="true" />
        <div class="form_panel_custom">
            <span>
                <%--<asp:Label ID="lblmsg" runat="server" Visible="false"></asp:Label>--%>
            </span>
            <div class="form form-horizontal">
                <asp:Panel ID="PanelPersonal" runat="server">
                    <header>
                        Personal Details
                    </header>
                    <section>
                        <div class="form-group">
                            <div class="col-lg-2">
                                <label>ID</label>
                            </div>
                            <div class="col-lg-2">
                                <label>#001</label>
                            </div>
                            <div class="col-lg-2">
                                <label>
                                    <asp:Label ID="lblUser" runat="server" ForeColor="Black">
                                    User Status</asp:Label><span>*</span></label>
                            </div>
                            <div class="col-lg-2">
                                <asp:DropDownList ID="ddlstatus" runat="server" AutoPostBack="true" Width="249px" TabIndex="214" CssClass="" OnPreRender="ddlstatus_PreRender"
                                    OnSelectedIndexChanged="ddlstatus_SelectedIndexChanged">
                                    <asp:ListItem Text="Install Prospect" Value="InstallProspect"></asp:ListItem>
                                    <asp:ListItem Text="Applicant" Value="Applicant"></asp:ListItem>
                                    <asp:ListItem Text="Phone/Video Screened" Value="PhoneScreened"></asp:ListItem>
                                    <asp:ListItem Text="Rejected" Value="Rejected"></asp:ListItem>
                                    <asp:ListItem Text="Interview Date" Value="InterviewDate"></asp:ListItem>
                                    <asp:ListItem Text="Offer Made" Value="OfferMade"></asp:ListItem>
                                    <asp:ListItem Text="Active" Value="Active"></asp:ListItem>
                                    <asp:ListItem Text="Deactive" Value="Deactive"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="col-lg-2">
                                <label>Date Sourced</label>
                            </div>
                            <div class="col-lg-2">
                                <asp:TextBox ID="txtDateSourced" runat="server" ReadOnly="true" TabIndex="217"></asp:TextBox>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-lg-2">
                                <asp:RequiredFieldValidator ID="rqFirstName" Display="Dynamic" runat="server" ControlToValidate="txtfirstname"
                                    ForeColor="Green" ValidationGroup="submit" ErrorMessage="Please enter the first name."></asp:RequiredFieldValidator>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" Display="Dynamic" runat="server" ControlToValidate="txtfirstname"
                                    ForeColor="Green" ValidationGroup="Image" ErrorMessage="Please enter the first name."></asp:RequiredFieldValidator>
                                <label>
                                    First Name<span><asp:Label ID="lblReqFName" Text="*" ForeColor="Green" runat="server"></asp:Label></span></label>
                            </div>
                            <div class="col-lg-2">
                                <asp:TextBox ID="txtfirstname" runat="server" MaxLength="40" TabIndex="220" autocomplete="off" onkeypress="return lettersOnly(event);"
                                    EnableViewState="false" AutoCompleteType="None" OnTextChanged="txtfirstname_TextChanged" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="col-lg-2">
                                <asp:RequiredFieldValidator ID="rqLastName" runat="server" ControlToValidate="txtlastname"
                                    ForeColor="Green" Display="Dynamic" SetFocusOnError="true" ValidationGroup="submit" ErrorMessage="Please enter the last name.">Enter Last Name</asp:RequiredFieldValidator>
                                <label>
                                    Last Name<span><asp:Label ID="lblReqLastName" Text="*" runat="server" ForeColor="Green"></asp:Label></span></label>
                            </div>
                            <div class="col-lg-2">
                                <asp:TextBox ID="txtlastname" runat="server" MaxLength="40" TabIndex="221" onkeypress="return lettersOnly(event);" autocomplete="off"
                                    OnTextChanged="txtlastname_TextChanged" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="col-lg-2">
                                <label>
                                    Source<asp:Label ID="lblSourceReq" runat="server" Text="*" ForeColor="Green"></asp:Label></label>
                                <asp:TextBox ID="txtSource" runat="server" Width="50px" TabIndex="224" CssClass="form-control"></asp:TextBox>
                                <asp:Button runat="server" ID="btnAddSource" Text="Add" Style="color: #fff;" OnClick="btnAddSource_Click" TabIndex="226" CssClass="btn btn-danger" />
                                <asp:Button runat="server" ID="btnDeleteSource" Style="color: #fff;" Text="Delete" OnClick="btnDeleteSource_Click" Height="30px" TabIndex="227" CssClass="btn btn-danger" />
                            </div>
                            <div class="col-lg-2">
                                <asp:DropDownList ID="ddlSource" runat="server" TabIndex="223">
                                </asp:DropDownList>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-lg-2">
                                <label>
                                    Primary Contact<asp:Label ID="Label2" runat="server" Text="*" ForeColor="Red"></asp:Label></label>
                            </div>
                            <div class="col-lg-4">
                                <asp:TextBox ID="txtPC1" runat="server" MaxLength="3" TabIndex="242"
                                    onkeypress="return isNumericKey(event);" Width="30px" CssClass="form-control"></asp:TextBox>
                                -<asp:TextBox ID="txtPC2" runat="server" MaxLength="3" TabIndex="243"
                                    onkeypress="return isNumericKey(event);"
                                    Width="30px" CssClass="form-control"></asp:TextBox>
                                -<asp:TextBox ID="txtPC3" runat="server" MaxLength="4" TabIndex="244"
                                    onkeypress="return isNumericKey(event);"
                                    Width="30px" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="col-lg-2">
                            </div>
                            <div class="col-lg-2">
                                <label>
                                    Phone Type<asp:Label ID="Label3" runat="server" Text="*" ForeColor="Red"></asp:Label></label>
                            </div>
                            <div class="col-lg-2">
                                <asp:DropDownList ID="ddlPCType" runat="server" TabIndex="223" CssClass="form-control">
                                    <asp:ListItem Text="--Select Phone Type--" Selected="True"></asp:ListItem>
                                    <asp:ListItem Text="Cell Phone #"></asp:ListItem>
                                    <asp:ListItem Text="House Phone #"></asp:ListItem>
                                    <asp:ListItem Text="Work Phone #"></asp:ListItem>
                                    <asp:ListItem Text="Alt Phone #"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-lg-2">
                                <label>
                                    Secondary Contact<asp:Label ID="Label4" runat="server" Text="*" ForeColor="Red"></asp:Label></label>
                            </div>
                            <div class="col-lg-4">
                                <asp:TextBox ID="txtSC1" runat="server" MaxLength="3" TabIndex="242"
                                    onkeypress="return isNumericKey(event);" Width="30px" CssClass="form-control"></asp:TextBox>
                                -<asp:TextBox ID="txtSC2" runat="server" MaxLength="3" TabIndex="243"
                                    onkeypress="return isNumericKey(event);"
                                    Width="30px" CssClass="form-control"></asp:TextBox>
                                -<asp:TextBox ID="txtSC3" runat="server" MaxLength="4" TabIndex="244"
                                    onkeypress="return isNumericKey(event);"
                                    Width="30px" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="col-lg-2">
                            </div>
                            <div class="col-lg-2">
                                <label>
                                    Phone Type<asp:Label ID="Label5" runat="server" Text="*" ForeColor="Red"></asp:Label></label>
                            </div>
                            <div class="col-lg-2">
                                <asp:DropDownList ID="ddlSCType" runat="server" TabIndex="223" CssClass="form-control">
                                    <asp:ListItem Text="--Select Phone Type--" Selected="True"></asp:ListItem>
                                    <asp:ListItem Text="Cell Phone #"></asp:ListItem>
                                    <asp:ListItem Text="House Phone #"></asp:ListItem>
                                    <asp:ListItem Text="Work Phone #"></asp:ListItem>
                                    <asp:ListItem Text="Alt Phone #"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-lg-2">
                                <label>
                                    Phone Type<asp:Label ID="Label6" runat="server" Text="*" ForeColor="Red"></asp:Label></label>
                            </div>
                            <div class="col-lg-2">
                                <asp:TextBox ID="txtCompName" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="col-lg-2">
                                <label>
                                    Primary Trade<span><asp:Label ID="lblReqPtrade" runat="server" Text="*" ForeColor="Green"></asp:Label></span></label>
                            </div>
                            <div class="col-lg-2">
                                <asp:DropDownList ID="ddlPrimaryTrade" runat="server" Width="251px" TabIndex="216" AutoPostBack="true" OnSelectedIndexChanged="ddlPrimaryTrade_SelectedIndexChanged"></asp:DropDownList>
                            </div>
                            <div class="col-lg-2">
                                <label>
                                    Secondary Trade<span><asp:Label ID="lblReqSTrate" runat="server" Text="*" ForeColor="Green"></asp:Label></span></label>
                            </div>
                            <div class="col-lg-2">
                                <asp:DropDownList ID="ddlSecondaryTrade" runat="server" AutoPostBack="true" Width="249px" TabIndex="218" OnSelectedIndexChanged="ddlSecondaryTrade_SelectedIndexChanged"></asp:DropDownList>
                            </div>
                        </div>
                    </section>
                </asp:Panel>
            </div>

            <div class="form form-horizontal">
                <asp:Panel ID="Panel3" runat="server">
                    <header>
                        Phone Skill & Designation Assessment
                    </header>
                    <section>
                        <div class="form-group">
                            <div class="col-lg-6">
                                Are you currently employeed? If yes where & how long?<br />
                                <asp:RadioButton ID="rdoEmploymentYes" runat="server" Text="Yes" GroupName="employment" TabIndex="175" />
                                <asp:RadioButton ID="rdoEmploymentNo" runat="server" Text="No" GroupName="employment" TabIndex="176" />
                                <asp:TextBox ID="txtEmployment" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-lg-6">
                                Reason for leaving your current employer/position if applicable<br />
                                <asp:TextBox runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-lg-6">
                                Do you own unlettered truck, hand tools &amp; power tools?<br />
                                <asp:RadioButton ID="rdoTruckToolsYes" runat="server" Text="Yes" GroupName="truckTools" TabIndex="188" AutoPostBack="True" OnCheckedChanged="rdoTruckToolsYes_CheckedChanged" />
                                <asp:RadioButton ID="rdoTruckToolsNo" runat="server" Text="No" GroupName="truckTools" AutoPostBack="true" TabIndex="189" OnCheckedChanged="rdoTruckToolsNo_CheckedChanged" />
                            </div>
                            <div class="col-lg-6">
                                Valid License and clean driving record?<br />
                                <asp:RadioButton ID="rdoDriveLicenseYes" runat="server" Text="Yes" GroupName="DriverLicense" TabIndex="186" AutoPostBack="True" OnCheckedChanged="rdoDriveLicenseYes_CheckedChanged" />
                                <asp:RadioButton ID="rdoDriveLicenseNo" runat="server" Text="No" GroupName="DriverLicense" TabIndex="187" AutoPostBack="True" OnCheckedChanged="rdoDriveLicenseNo_CheckedChanged" />
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-lg-6">
                                Have you previously worked for or applied at j.m grove construction or supply?<br />
                                <asp:RadioButton ID="rdoJMApplyYes" runat="server" Text="Yes" GroupName="JMApply" TabIndex="190" AutoPostBack="True" OnCheckedChanged="rdoJMApplyYes_CheckedChanged" />
                                <asp:RadioButton ID="rdoJMApplyNo" runat="server" Text="No" GroupName="JMApply" TabIndex="191" AutoPostBack="True" OnCheckedChanged="rdoJMApplyNo_CheckedChanged" />
                            </div>
                            <div class="col-lg-6">
                                Have you ever plead guilty or been convicted of a crime?<br />
                                <asp:RadioButton ID="rdoGuiltyYes" runat="server" Text="Yes" GroupName="Guilty" TabIndex="192" AutoPostBack="True" OnCheckedChanged="rdoGuiltyYes_CheckedChanged" />
                                <asp:RadioButton ID="rdoGuiltyNo" runat="server" Text="No" GroupName="Guilty" TabIndex="193" AutoPostBack="True" OnCheckedChanged="rdoGuiltyNo_CheckedChanged" />
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-lg-6">
                                If selected for position, when will you be available to start?<br />
                                <asp:TextBox ID="txtAvailability" runat="server" Width="150px" TabIndex="195" AutoPostBack="True" OnTextChanged="txtAvailability_TextChanged"></asp:TextBox>
                            </div>
                            <div class="col-lg-6">
                                Would you be able to pass a drug test, background check?<br />
                                <asp:RadioButton ID="rdoDrugtestYes" runat="server" Text="Yes" GroupName="drugTest" TabIndex="184" AutoPostBack="True" OnCheckedChanged="rdoDrugtestYes_CheckedChanged" />
                                <asp:RadioButton ID="rdoDrugtestNo" runat="server" Text="No" GroupName="drugTest" TabIndex="185" AutoPostBack="True" OnCheckedChanged="rdoDrugtestNo_CheckedChanged" />
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-lg-6">
                                What are your salary requirements for the position?<br />
                                <asp:TextBox ID="txtSalRequirement" onkeypress="return isNumericKey(event);" runat="server" Width="150px" TabIndex="197" AutoPostBack="True" OnTextChanged="txtSalRequirement_TextChanged"></asp:TextBox>
                            </div>
                            <div class="col-lg-6">
                                Are you currently working for another company? If yes where & how long?<br />
                                <asp:RadioButton ID="rdoCurrentYes" runat="server" Text="Yes" GroupName="current" TabIndex="175" />
                                <asp:RadioButton ID="rdoCurrentNo" runat="server" Text="No" GroupName="current" TabIndex="176" />
                                <asp:TextBox ID="txtCurrent" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </section>
                </asp:Panel>
            </div>

            <div class="form form-horizontal">
                <asp:Panel ID="Panel1" runat="server">
                    <header>
                        Phone Skill & Designation Assessment
                    </header>
                    <section>
                        <div class="form-group">
                            <div class="col-lg-6">
                                How many full time positions have you had in the last 5 years?<br />
                                <asp:TextBox ID="txtFullTimePos" onkeypress="return IsNumeric(event);" MaxLength="2" runat="server" Width="150px" TabIndex="179" AutoPostBack="true" OnTextChanged="txtFullTimePos_TextChanged"></asp:TextBox>
                            </div>
                            <div class="col-lg-6">
                                Reason for leaving your current employer/position if applicable<br />
                                <asp:TextBox runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-lg-6">
                                List (3)  general contractors, builders &/or home owners for references<br />
                                <asp:TextBox ID="txtContractor1" runat="server" TabIndex="180" AutoPostBack="true" OnTextChanged="txtContractor1_TextChanged"></asp:TextBox><br />
                                <asp:TextBox ID="txtContractor2" runat="server" TabIndex="181" AutoPostBack="true" OnTextChanged="txtContractor2_TextChanged"></asp:TextBox><br />
                                <asp:TextBox ID="txtContractor3" runat="server" AutoPostBack="true" TabIndex="182" OnTextChanged="txtContractor3_TextChanged"></asp:TextBox>
                            </div>
                            <div class="col-lg-6">
                                List (3) home owners name & phone # for references<br />
                                <asp:TextBox ID="txtOwner1" runat="server" TabIndex="180" AutoPostBack="true" OnTextChanged="txtContractor1_TextChanged"></asp:TextBox><br />
                                <asp:TextBox ID="txtOwner2" runat="server" TabIndex="181" AutoPostBack="true" OnTextChanged="txtContractor2_TextChanged"></asp:TextBox><br />
                                <asp:TextBox ID="txtOwner3" runat="server" AutoPostBack="true" TabIndex="182" OnTextChanged="txtContractor3_TextChanged"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-lg-6">
                                Please list major tools you own for your primary trade only!<br />
                                <asp:TextBox ID="txtMajorTools" runat="server" TextMode="MultiLine" Width="230px" Height="33px" TabIndex="183" AutoPostBack="True" OnTextChanged="txtMajorTools_TextChanged"></asp:TextBox>
                            </div>
                            <div class="col-lg-6">
                                <label>
                                    Certification/training
                                </label>
                                <asp:FileUpload ID="flpCirtification" runat="server" Width="150px" TabIndex="200" />
                                <asp:Button ID="btnCirtification" runat="server" CssClass="cancel" Width="10%" Text="Upload" Height="27px" Style="background: url(img/main-header-bg.png) repeat-x; color: #fff;" OnClick="btnCirtification_Click" OnClientClick="return ValidateFileCirtificate()" TabIndex="201" />
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-lg-6">
                                <label>
                                    Resume:</label>
                                <asp:FileUpload ID="flpResume" runat="server" Width="150px" Height="25px" TabIndex="198" />
                                <asp:Button ID="btnResume" runat="server" CssClass="cancel" Width="10%" Text="Upload" Height="25px" Style="background: url(img/main-header-bg.png) repeat-x; color: #fff;" OnClick="btnResume_Click" OnClientClick="return ValidateFileOne()" TabIndex="199" />
                            </div>
                            <div class="col-lg-6">
                                Assessment filled out online or skill assessment attached?
                                        <asp:RadioButton ID="rdoAttchmentYes" runat="server" Text="Yes" GroupName="SkillAssessment" AutoPostBack="True" OnCheckedChanged="rdoAttchmentYes_CheckedChanged" TabIndex="175" />
                                <asp:RadioButton ID="rdoAttchmentNo" runat="server" Text="No" GroupName="SkillAssessment" AutoPostBack="True" OnCheckedChanged="rdoAttchmentNo_CheckedChanged" TabIndex="176" />
                                <asp:FileUpload ID="flpSkillAssessment" runat="server" Width="277px" TabIndex="177" />
                                <asp:Button ID="btnUploadSkills" runat="server" ClientIDMode="Static" CssClass="cancel" Style="background: url(img/main-header-bg.png) repeat-x; color: #fff;" Text="Upload" OnClick="btnUploadSkills_Click" Height="30px" TabIndex="178" />
                            </div>
                        </div>
                    </section>
                </asp:Panel>
            </div>

            <div class="form form-horizontal">
                <asp:Panel ID="Panel7" runat="server">
                    <header>
                        Contact Details
                    </header>
                    <section>
                        <div class="form-group">
                            <div class="col-lg-6">
                            </div>
                            <div class="col-lg-6">
                                <asp:CheckBox ID="chkMaddAdd" runat="server" Text="Is mailing address same as address" AutoPostBack="true" OnCheckedChanged="chkMaddAdd_CheckedChanged" TabIndex="230" />
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-lg-2">
                                <asp:RequiredFieldValidator ID="rqAddress" runat="server" ControlToValidate="txtaddress"
                                    ForeColor="Blue" Display="Dynamic" ValidationGroup="submit" ErrorMessage="Enter Address" SetFocusOnError="true">Enter Home Address</asp:RequiredFieldValidator>
                                <label>
                                    Home Address
                                    <asp:Label ID="lblAddressReq" runat="server" Text="*" ForeColor="Blue"></asp:Label>
                                </label>
                            </div>
                            <div class="col-lg-4">
                                <asp:TextBox ID="txtaddress" runat="server" TabIndex="229" OnTextChanged="txtaddress_TextChanged" AutoPostBack="True"></asp:TextBox>
                            </div>
                            <div class="col-lg-2">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtMailingAddress"
                                    ForeColor="Blue" Display="Dynamic" ValidationGroup="submit" ErrorMessage="Enter Mailing Address" SetFocusOnError="true">Enter Secondary Address</asp:RequiredFieldValidator>
                                <label>
                                    Secondary Address
                                    <asp:Label ID="Label1" runat="server" Text="*" ForeColor="Blue"></asp:Label>
                                </label>
                            </div>
                            <div class="col-lg-4">
                                <asp:TextBox ID="txtMailingAddress" runat="server" TabIndex="233"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-lg-2">
                                <asp:RequiredFieldValidator ID="rqZip" runat="server" ControlToValidate="txtHomeZip" SetFocusOnError="true"
                                    Display="Dynamic" ForeColor="Blue" ValidationGroup="submit" ErrorMessage="Enter Zip">Enter Zip</asp:RequiredFieldValidator>
                                <label>
                                    Zip<span><asp:Label ID="lblReqZip" runat="server" Text="*" ForeColor="Blue"></asp:Label></span></label>
                            </div>
                            <div class="col-lg-2">
                                <asp:TextBox ID="txtHomeZip" runat="server" MaxLength="5" TabIndex="228" onkeypress="return IsNumeric(event);" AutoPostBack="true"
                                    OnTextChanged="txtHomeZip_TextChanged" Width="150px"></asp:TextBox>
                                <ajaxToolkit:AutoCompleteExtender ID="AutoCompleteExtender1" runat="server" CompletionListElementID="auto_complete"
                                    CompletionListCssClass="Autocomplete" UseContextKey="false" CompletionInterval="200"
                                    MinimumPrefixLength="2" ServiceMethod="GetZipcodes" TargetControlID="txtHomeZip"
                                    EnableCaching="False">
                                </ajaxToolkit:AutoCompleteExtender>
                            </div>
                            <div class="col-lg-2"></div>
                            <div class="col-lg-2"></div>
                            <div class="col-lg-2">
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtSecZip" SetFocusOnError="true"
                                    Display="Dynamic" ForeColor="Blue" ValidationGroup="submit" ErrorMessage="Enter Zip">Enter Zip</asp:RequiredFieldValidator>
                                <label>
                                    Zip<span><asp:Label ID="Label7" runat="server" Text="*" ForeColor="Blue"></asp:Label></span></label>
                            </div>
                            <div class="col-lg-2">
                                <asp:TextBox ID="txtSecZip" runat="server" MaxLength="5" TabIndex="228" onkeypress="return IsNumeric(event);" AutoPostBack="true"
                                    OnTextChanged="txtHomeZip_TextChanged" Width="150px"></asp:TextBox>
                                <ajaxToolkit:AutoCompleteExtender ID="AutoCompleteExtender2" runat="server" CompletionListElementID="auto_complete"
                                    CompletionListCssClass="Autocomplete" UseContextKey="false" CompletionInterval="200"
                                    MinimumPrefixLength="2" ServiceMethod="GetZipcodes" TargetControlID="txtSecZip"
                                    EnableCaching="False">
                                </ajaxToolkit:AutoCompleteExtender>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-lg-2">
                                <asp:RequiredFieldValidator ID="rqCity" runat="server" ControlToValidate="txtCity"
                                    Display="Dynamic" ForeColor="Blue" ValidationGroup="submit" ErrorMessage="Enter City" SetFocusOnError="true">Enter City</asp:RequiredFieldValidator>
                                <label>
                                    City
                                    <asp:Label ID="lblCityReq" runat="server" Text="*" ForeColor="Blue"></asp:Label>
                                </label>
                            </div>
                            <div class="col-lg-2">
                                <asp:TextBox ID="txtCity" runat="server" MaxLength="40" TabIndex="232" onkeypress="return lettersOnly(event);" OnTextChanged="txtCity_TextChanged"></asp:TextBox>
                            </div>
                            <div class="col-lg-2"></div>
                            <div class="col-lg-2"></div>
                            <div class="col-lg-2">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtSecCity"
                                    Display="Dynamic" ForeColor="Blue" ValidationGroup="submit" ErrorMessage="Enter City" SetFocusOnError="true">Enter City</asp:RequiredFieldValidator>
                                <label>
                                    City
                                    <asp:Label ID="Label8" runat="server" Text="*" ForeColor="Blue"></asp:Label></label>
                            </div>
                            <div class="col-lg-2">
                                <asp:TextBox ID="txtSecCity" runat="server" MaxLength="40" TabIndex="232" onkeypress="return lettersOnly(event);"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-lg-2">
                                <asp:RequiredFieldValidator ID="rqState" runat="server" ControlToValidate="txtState" SetFocusOnError="true"
                                    Display="Dynamic" ForeColor="Blue" ValidationGroup="submit" ErrorMessage="Enter State">Enter State</asp:RequiredFieldValidator>
                                <label>
                                    State
                                    <asp:Label ID="lblStateReq" runat="server" Text="*" ForeColor="Blue"></asp:Label>
                                </label>
                            </div>
                            <div class="col-lg-2"></div>
                            <div class="col-lg-2">
                                <asp:TextBox ID="txtState" runat="server" MaxLength="40" TabIndex="231" onkeypress="return lettersOnly(event);" OnTextChanged="txtState_TextChanged"></asp:TextBox>
                            </div>
                            <div class="col-lg-2"></div>
                            <div class="col-lg-2">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtSecState" SetFocusOnError="true"
                                    Display="Dynamic" ForeColor="Blue" ValidationGroup="submit" ErrorMessage="Enter State">Enter State</asp:RequiredFieldValidator>
                                <label>
                                    State
                                    <asp:Label ID="Label9" runat="server" Text="*" ForeColor="Blue"></asp:Label>
                                </label>
                            </div>
                            <div class="col-lg-2">
                                <asp:TextBox ID="txtSecState" runat="server" MaxLength="40" TabIndex="231" onkeypress="return lettersOnly(event);"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-lg-2">
                                <label>
                                    Suite/Apt/Room(If applicable)</label>
                            </div>
                            <div class="col-lg-2">
                                <asp:TextBox ID="txtSuiteAptRoom" runat="server" MaxLength="5" TextMode="SingleLine" TabIndex="237"></asp:TextBox>
                            </div>
                            <div class="col-lg-2"></div>
                            <div class="col-lg-2"></div>
                            <div class="col-lg-2">
                                <label>
                                    Suite/Apt/Room(If applicable)</label>
                            </div>
                            <div class="col-lg-2">
                                <asp:TextBox ID="txtSecSuite" runat="server" MaxLength="5" TextMode="SingleLine" TabIndex="237"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-lg-2">
                                <label>
                                    Phone#<asp:Label ID="lblPhoneReq" runat="server" Text="*" ForeColor="Green"></asp:Label></label>
                            </div>
                            <div class="col-lg-2">
                                <asp:TextBox ID="txtPhone" runat="server" MaxLength="12" TabIndex="239" OnTextChanged="txtPhone_TextChanged"
                                    onkeypress="return IsNumeric(event);" Width="242px"></asp:TextBox>
                            </div>
                            <div class="col-lg-2"></div>
                            <div class="col-lg-2"></div>
                            <div class="col-lg-2">
                                <asp:RequiredFieldValidator ID="rqDOB" runat="server" ControlToValidate="DOBdatepicker"
                                    ValidationGroup="submit" ForeColor="Red" Display="Dynamic" ErrorMessage="Enter Date of Birth"></asp:RequiredFieldValidator>
                                <label>
                                    Date of Birth<span>
                                        <asp:Label ID="lblReqDOB" runat="server" ForeColor="Black">
                                        </asp:Label>*</span>
                                </label>
                            </div>
                            <div class="col-lg-2">
                                <asp:TextBox ID="DOBdatepicker" runat="server" Width="242px" ClientIDMode="Static"
                                    TabIndex="245" onkeypress="return false" OnTextChanged="DOBdatepicker_TextChanged"></asp:TextBox>
                                <ajaxToolkit:CalendarExtender ID="CalendarExtender10" TargetControlID="DOBdatepicker" runat="server"></ajaxToolkit:CalendarExtender>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-lg-2">
                                <asp:RequiredFieldValidator ID="rqEmail" Display="Dynamic" runat="server" ControlToValidate="txtemail" SetFocusOnError="true"
                                    ValidationGroup="OfferMade" ForeColor="Red" ErrorMessage="Please enter email address."></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="reEmail" ControlToValidate="txtemail" SetFocusOnError="true" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                    Display="Dynamic" runat="server" ForeColor="Red" ErrorMessage="Please enter a valid email address."
                                    ValidationGroup="OfferMade"></asp:RegularExpressionValidator>
                                <label>
                                    Email<span style="color: darkblue">*<asp:Label ID="lblReqEmail" Text="*" runat="server" ForeColor="Red"></asp:Label></span></label>
                            </div>
                            <div class="col-lg-2">
                                <asp:TextBox ID="txtemail" runat="server" MaxLength="40" TabIndex="222" OnTextChanged="txtemail_TextChanged" Width="242px"></asp:TextBox>
                            </div>
                            <div class="col-lg-2"></div>
                            <div class="col-lg-2"></div>
                            <div class="col-lg-2">
                                <asp:RequiredFieldValidator ID="rqSSN1" runat="server" ControlToValidate="txtssn"
                                    ValidationGroup="submit" ForeColor="Red" Display="Dynamic" ErrorMessage="Enter Complete SSN"></asp:RequiredFieldValidator>
                                <asp:RequiredFieldValidator ID="rqSSN2" runat="server" ControlToValidate="txtssn0"
                                    ValidationGroup="submit" ForeColor="Red" Display="Dynamic" ErrorMessage="Enter Complete SSN"></asp:RequiredFieldValidator>
                                <asp:RequiredFieldValidator ID="rqSSN3" runat="server" ControlToValidate="txtssn1"
                                    ValidationGroup="submit" ForeColor="Red" Display="Dynamic" ErrorMessage="Enter Complete SSN"></asp:RequiredFieldValidator>
                                <label>
                                    SSN<asp:Label ID="lblReqSSN" runat="server" Text="*" ForeColor="Red"></asp:Label></label>
                            </div>
                            <div class="col-lg-2">
                                <asp:TextBox ID="txtssn" runat="server" MaxLength="3" TabIndex="242"
                                    onkeypress="return isNumericKey(event);" OnTextChanged="txtssn_TextChanged" Width="30px"></asp:TextBox>
                                -<asp:TextBox ID="txtssn0" runat="server" MaxLength="2" TabIndex="243"
                                    onkeypress="return isNumericKey(event);" OnTextChanged="txtssn0_TextChanged"
                                    Width="30px"></asp:TextBox>
                                -<asp:TextBox ID="txtssn1" runat="server" MaxLength="4" TabIndex="244"
                                    onkeypress="return isNumericKey(event);" OnTextChanged="txtssn1_TextChanged"
                                    Width="30px"></asp:TextBox>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-lg-2">
                                <asp:CompareValidator ID="password" runat="server" ControlToValidate="txtpassword1"
                                    Display="Dynamic" ControlToCompare="txtpassword" ForeColor="Red" ErrorMessage="Password didn't matched"
                                    ValidationGroup="submit">
                                </asp:CompareValidator>
                                <asp:RequiredFieldValidator ID="rqConPass" runat="server" ControlToValidate="txtpassword1"
                                    ForeColor="Red" ValidationGroup="OfferMade" ErrorMessage="Enter Confirm Password"></asp:RequiredFieldValidator>
                                <label>
                                    Confirm Password<span style="color: darkblue">*</span>
                                    <asp:Label ID="lblConfirmPass" runat="server" Text="*" ForeColor="Red"></asp:Label></label>
                            </div>
                            <div class="col-lg-2">
                                <asp:TextBox ID="txtpassword1" runat="server" TextMode="Password" autocomplete="off"
                                    MaxLength="30" TabIndex="235" EnableViewState="false" AutoCompleteType="None" Width="242px"></asp:TextBox>
                            </div>
                            <div class="col-lg-2"></div>
                            <div class="col-lg-2"></div>
                            <div class="col-lg-2">
                                <asp:RequiredFieldValidator ID="rqPass" runat="server" ControlToValidate="txtpassword"
                                    ValidationGroup="OfferMade" ForeColor="Red" Display="Dynamic" ErrorMessage="Please Enter Password"></asp:RequiredFieldValidator>
                                <label>
                                    Password<span style="color: darkblue">*</span><asp:Label ID="lblPassReq" runat="server" Text="*" ForeColor="Red"></asp:Label></label>
                            </div>
                            <div class="col-lg-2">
                                <asp:TextBox ID="txtpassword" runat="server" TextMode="Password" MaxLength="30" TabIndex="234"
                                    autocomplete="off" Width="242px"></asp:TextBox>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-lg-2">
                                <asp:RequiredFieldValidator ID="rqMaritalStatus" runat="server" ControlToValidate="ddlmaritalstatus"
                                    InitialValue="0" ForeColor="Red" ValidationGroup="submit" ErrorMessage="Please select Marital Status"></asp:RequiredFieldValidator>
                                <label>
                                    <asp:Label runat="server" ForeColor="Black" ID="lblStatus">
                                    Marital Status</asp:Label><asp:Label ID="lblReqMarSt" runat="server" Text="*" ForeColor="Red"></asp:Label>
                                </label>
                            </div>
                            <div class="col-lg-2">
                                <asp:DropDownList ID="ddlmaritalstatus" runat="server" Width="250px" TabIndex="238"
                                    OnSelectedIndexChanged="ddlmaritalstatus_SelectedIndexChanged">
                                    <asp:ListItem Text="Select" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="Married" Value="Married"></asp:ListItem>
                                    <asp:ListItem Text="Single" Value="Single"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="col-lg-2"></div>
                            <div class="col-lg-2"></div>
                            <div class="col-lg-2">
                                <asp:RequiredFieldValidator ID="rqSign" runat="server" ControlToValidate="txtSignature"
                                    ForeColor="Red" ValidationGroup="submit" ErrorMessage="Enter Signature"></asp:RequiredFieldValidator>
                                <label>
                                    <asp:Label ID="lblSignature" ForeColor="Black" runat="server">
                                    Signature</asp:Label><asp:Label ID="lblReqSig" runat="server" Text="*" ForeColor="Red"></asp:Label></label>
                            </div>
                            <div class="col-lg-2">
                                <asp:TextBox ID="txtSignature" runat="server" MaxLength="40" TabIndex="236" autocomplete="off"
                                    EnableViewState="false" AutoCompleteType="None" OnTextChanged="txtSignature_TextChanged" Width="242px"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-lg-2">
                                <label>
                                    <asp:Label runat="server" ForeColor="Black" ID="lblPicture">
                                    Picture<%--<span>--%></asp:Label>
                                    <asp:Label ID="lblReqPicture" runat="server" Text="*" ForeColor="Red" Style="margin-top: -14px; margin-left: 63px"></asp:Label></label>
                            </div>
                            <div class="col-lg-6">
                                <ajaxToolkit:AsyncFileUpload ID="flpUplaodPicture" runat="server" TabIndex="240" ClientIDMode="AutoID"
                                    Width="88%" OnClientUploadStarted="" />
                                <asp:Button ID="btn_UploadPicture" runat="server" Style="background: url(img/main-header-bg.png) repeat-x; color: #fff;" OnClick="btn_UploadPicture_Click"
                                    Width="10%" OnClientClick="return CheckFileExistence()" ValidationGroup="Image" Text="Upload" TabIndex="241" />
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-lg-2">
                                <label>
                                    DL License<span><asp:Label ID="lblReqDL" runat="server" Text="*" ForeColor="Red" Style="margin-top: -14px; margin-left: 63px"></asp:Label></span></label>
                            </div>
                            <div class="col-lg-6">
                                <asp:FileUpload ID="flpPqLicense" MaxLength="40" runat="server" class="multi" Width="50%"
                                    TabIndex="246" />
                                <asp:Button ID="btnPqLicense" Style="background: url(img/main-header-bg.png) repeat-x; color: #fff;" runat="server" CssClass="cancel"
                                    Width="10%" Text="Upload" TabIndex="247" OnClick="btnPqLicense_Click" />
                                <asp:Label ID="lblPL" runat="server"></asp:Label>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-lg-2">
                                <label>
                                    Attachments<span></span></label>
                            </div>
                            <div class="col-lg-8">
                                <asp:FileUpload ID="flpUploadFiles" MaxLength="40" runat="server" class="multi" Width="50%"
                                    TabIndex="249" />
                                <asp:Button ID="btn_UploadFiles" Style="background: url(img/main-header-bg.png) repeat-x; color: #fff;" runat="server" CssClass="cancel"
                                    Width="10%" Text="Upload" TabIndex="250" OnClick="btn_UploadFiles_Click" />
                                <asp:GridView ID="gvUploadedFiles" runat="server" AutoGenerateColumns="False" Width="90%"
                                    DataKeyNames="FileName" EmptyDataText="No files uploaded" OnRowCommand="gvUploadedFiles_RowCommand"
                                    PageSize="5">
                                    <Columns>
                                        <asp:BoundField DataField="FileName" HeaderText="FileName" ControlStyle-Width="60%" />
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lnkDownload" runat="server" CommandArgument='<%#Eval("FileName")%>'
                                                    CommandName="DownloadRecord" Text="Download"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lnkDelete" runat="server" CommandArgument='<%#Eval("FileName")%>'
                                                    CommandName="deleteRecord" OnClientClick="return confirm('Are you sure you want to delete this?');" Text="Delete"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-lg-2">
                            </div>
                            <div class="col-lg-6"></div>
                        </div>
                    </section>
                </asp:Panel>
            </div>

            <div class="form form-horizontal">
                <asp:Panel runat="server" ID="pnlcolaps">
                    <header>
                        <h2>SubContract</h2>
                    </header>
                    <section>

                        <div class="cdata">
                            <asp:Panel ID="pnl4" runat="server" ScrollBars="Auto" Height="250px">
                                1 <b>Introduction</b><br />
                                1.1 General These are the general terms and conditions pursuant to which JMG1 and
                                    J.M. Grove may use Service Provider and its employees and agents (“ Service Provider
                                    Personnel”) to provide services, products and/or materials (collectively, “Services”)
                                    to JMG1 and J.M. Grove retail customers (“Customer(s)”) with whom JMG1 and J.M.
                                    Grove has a separate contractual arrangement(“Customer(s)”), with whom JMG1 and
                                    J.M. Grove has a separate contractual arrangement ( (“Customer Contract”)/ These
                                    General Terms and Conditions are a part of the Service Provider Agreement (“SPA”)
                                    between JMG1 and J.M. Grove and service Provider dated as of the Effective Date
                                    located on the Signature Page. The Service Provider and JMG1 and J.M. Grove will
                                    sometimes be referred to individually as a “Party” or collectively as “Parties”.
                                    These general terms and conditions. These general terms and conditions may only
                                    be amended by an amendment to the SPA executed by the Parties, in the form attached
                                    as Attachment 3. The use of Service Provider by JMG1 and J.M. Grove with respect
                                    to any particular Customer Contract is an ´Assignment The necessary particulars
                                    of each Assignment will be communicated to a Service Provider in the form of a document
                                    referred to as a “Work order”, which may only be amended by a change order prepared
                                    by JMG1 and J.M. Grove and signed by Service Provider (“Change Order”). No adjustments,
                                    including adjustments to compensation due Service Provider, will be made for any
                                    deviations from a Work order that have not been requested or otherwise agreed to
                                    by JMG1 and J.M. Grove pursuant to a Change Order. Work order, and any Change Orders
                                    constitute an integral part of this SPA and are incorporated by reference. Work
                                    order and any Change Orders may be electronically transmitted
                                   
                                       

                                        <br />
                                1.2 Relationship of the Parties Service Provider’s relationship to JMG1 and J.M.
                                    Grove and its affiliated companies for purposes of this SPA is that of an independent
                                    contractor. In no event will JMG1 and J.M. Grove and its affiliated companies be
                                    considered a joint employer of Service Provider or any of its affiliates or their
                                    respective personnel. Service Provider acknowledges that it has sole responsibility
                                    to hire, discipline, terminate, supervise and dictate the daily work of its employees.
                                    Service Provider or Service Provider Personnel do not have an employee status or
                                    any entitlement to participate in any plans, arrangements, or distributions by JMG1
                                    and J.M. Grove or its affiliated companies pertaining to, or in connection with,
                                    any pension, stock, bonus, or similar benefits for JMG1 and J.M. Grove employees.<br />
                                1.3 Reference to Service Provider. Any reference to Service Provider refers to Service
                                    Provider Personnel, the equipment, facilities and resources used by Service Provider,
                                    and its agents or any other third parties that Service Provider engages to fulfill
                                    its obligations in providing the Services, regardless of whether Service Provider
                                    owns, operates or controls said equipment, facilities and/or resources.<br />
                                1.4 No implied or Further Agreement. Nothing in this SPA obligates JMG1 and J.M.
                                    Grove to use the services of Service Provider for any Assignment or to issue Service
                                    Provider any Work order or to enter into any further agreement with Service Provider
                                    whatsoever. Without limiting the generality of the foregoing, Service Provider acknowledges
                                    that JMG1 and J.M. Grove makes no assurance whatsoever that Service Provider will
                                    receive a minimum or particular dollar amount of business under this SPA. In view
                                    of the foregoing, the Parties represent and warrant to on another that any investments
                                    or expenditures a Party has made, or may make, in anticipation of, or following
                                    execution of this SPA, are at such Party’s sole and knowing risk.<br />
                                1.5 Non-Exclusivity This SPA is non-exclusive and JMG1 and J.M. Grove may use other
                                    providers to perform the same or similar services as those under this SPA similarly,
                                    Service Provider may perform like services for others, so long as the performance
                                    of such other services does not impair Service Provider’s ability to fulfill its
                                    obligations under this SPA cause Service Provider to breach this SPA, or result
                                    in an Event of Default as defined in Section 13 of this SPA.<br />
                                2 <b>Term</b> 2.1 Renewals The term of this SPA is one (1) year from the Effective
                                    Date ( the Initial Term”) following which, it will automatically renew for consecutive
                                    one-year periods (“Renewal Term” and together with the initial term, the “Term”)
                                    unless terminated earlier in accordance with Section 15.<br />
                                3 Services; Service Provider Reference Guide.<br />
                                3.1 Services. If any services, functions or tasks to be performed by Service Provider
                                    are not specifically described or included within the definition of “Services” hereunder,
                                    but are required for proper performance, they are implied by, and included within,
                                    the scope of the Services to the same extent as if specifically described in this
                                    SPA. JMG1 and J.M. Grove may order the following types of services from Service
                                    Provider under this SPA as agreed by the Parties on the Face Page (“Program(s)”)’(i)
                                    “Service Only” where Service Provider shall provide property related Services to
                                    the Customer; (ii)”install Only” where JMG1 and J.M. Grove will sell the merchandise
                                    at the Customer’s service location; (iv) “Sell, Furnish and Install” where Service
                                    Provider will sell, furnish and install merchandise and provide the Services to
                                    a Customer of JMG1 and J.M. Grove pursuant to a Customer Contract; and (v) “Furnish
                                    and Deliver” where JMG1 and J.M. Grove will sell the merchandise to the Customer
                                    and the Service Provider will furnish and deliver the merchandise to the Customer.
                                    Pursuant to a written amendment, the Parties may agree to modify the types of Services
                                    provided by Service Provider.<br />
                                3.2 Provision of Services. Service Provider will, at a minimum, provide all Services,
                                    fulfill all Work orders, and complete all Assignments in a timely, workmanlike,
                                    and professional manner in accordance with this SPA, any service level requirements
                                    specified in the SPRG (see 3.3), any applicable manufacturer’s warranty or warranties
                                    and all applicable laws, including business and professional licensing requirements,
                                    building and zoning codes and facilities and conditions standards. Service Provider
                                    will provide Service Provider Personnel who will be present at Customers’ service
                                    addresses with photo identification and uniforms bearing Service Provider’s marks
                                    and such other marks as may be designated by JMG1 and J.M. Grove in accordance with
                                    any further guidelines provided in the SPRG. Service Provider agrees to provide
                                    and will perform the Services described in this SPA in accordance with and subject
                                    to the terms and conditions set forth herein. Service Provider will not offer or
                                    provide any services to a Customer, other than those specifically identified in
                                    a Work order or written Change Order issued by JMG1 and J.M. Grove, while performing
                                    Services for the Customer.<br />
                                3.3 Service Provider Reference Guide (“SPRG”). Service Provider acknowledges and
                                    agrees that additional terms and conditions applicable to these Services will be
                                    set forth by JMG1 and J.M. Grove in its Service Provider Reference Guide (:SPRG”),
                                    which constitutes an integral part of this SPA, is incorporated herein by reference
                                    and will be located on-line at a website established by JMG1 and J.M. Grove for
                                    that purpose The website is: www.JMG1serviceproviders.com<br />
                                Login: Installer Password: JMG1ROVE JMG1 and J.M. Grove reserves the absolute right
                                    to modify the SPRG and JMG1 and J.M. Grove website from time to time in its own
                                    discretion. Service Provider will follow all of the applicable terms and conditions
                                    included in the SPRG. Certain sections of the SPRG may apply specifically to a particular
                                    Program, and Service Provider is responsible for following the guidelines of the
                                    SPRG specific to that Program, in addition to following its general guidelines.
                                    Notwithstanding any other provision herein to the contrary, any revisions made to
                                    the SPRG will be deemed effective immediately upon JMG1 and J.M. Grove posting of
                                    such revisions on JMG1 and J.M. Grove Website. Service Provider is responsible for
                                    checking V Services and the JMG1 and J.M. Grove website to note any changes made.<br />
                                4 General Obligations of Service Provider.<br />
                                4.1 Facilities and Conditions. Service Provider will act at all times with the safety
                                    of JMG1 and J.M. Grove Customers and Service Provider Personnel foremost in mind
                                    and will follow all applicable safety guidelines conforming to (i) those required
                                    or recommended by federal, state, and local governmental or quasi-governmental authorities
                                    with jurisdiction over the activities of Service Provider under this SPA, including,
                                    all applicable guidelines and regulations issued by the federal Occupational Safety
                                    and Health Administration: and (ii) the requirements of this SPA. All waste that
                                    is generated by the Services or residual chemicals that are otherwise used by Service
                                    Provider must be properly managed, stored, transported, and dispersed of in accordance
                                    with applicable local, state, and federal laws, rules, and regulations.<br />
                                4.2 Liens: security Interests. To the extent permissible under applicable law, Service
                                    Provider will not place a lien on, or take any other security interest in, JMG1
                                    and J.M. Grove property or any property of a Customer.<br />
                                Tariffs. The Parties agree that no tariffs, either those that may be maintained
                                    by Service Provider or by any carrier working on behalf of Service Provider, will
                                    apply to any transportation services provided under this SPA, except as may be specifically
                                    agreed to or acknowledged by JMG1 and J.M. Grove in writing. To the extent of any
                                    inconsistency between said tariffs and the terms of the SPA the applicable terms
                                    of this SPA will apply, The terms of the SPA will also apply over the terms of any
                                    bills of lading or any other shipping documents that may be issued by Service Provider
                                    to JMG1 and J.M. Grove in connection with its transportation service.
                                   
                                       

                                        <br />
                                4.4 Permits. Service Provider must follow all legal requirements and obtain all
                                    required building and construction permits. And inceptions necessary to perform
                                    the Services. Service Provider will not request or require Customers to obtain permits
                                    unless permissible under applicable law and requested to do so in writing b\ JMG1
                                    and J.M. Grove Service Provider will maintain auditable records documenting its
                                    compliance with the requirements of this Section 4.4.
                                   
                                       

                                        <br />
                                4.5 Taxes, Service Provider is solely responsible for all taxes related to the Services
                                    and fulfillment of its obligations to JMG1 and J.M. Grove under this SPA, Service
                                    Provider will pay accrue and remit an sales, use, ad valorem, franchise, income,
                                    license, occupation, and any other taxes cl imposts of every nature or description
                                    whatsoever, presently or hereinafter imposed by applicable law upon the operation
                                    of Service Provider's business in relation to its fulfillment of its obligations
                                    to JMG1 and J.M. Grove Provider will file all reports, make all returns and secure
                                    all licenses and permits with rasped to such taxes or imposts JMG1 and J.M. Grove
                                    will issue a resale certificate to Service Provider only if Service Provider is
                                    authorized to request such a certificate under applicable law. Additionally, the
                                    products or materials purchased under this SPA by Service Provide! From JMG1 and
                                    J.M. Grove for services by Service Provider do not qualify under applicable law
                                    as a real property improvement or are otherwise taxable to the property owner under
                                    applicable law. JMG1 and J.M. Grove will coiled all retail sales taxes for Customers
                                    and will remit such taxes to, and file all required reports with, the appropriate
                                    government’s authorities.<br />
                                4.6 Property Losses. Service Provider is solely responsible for the care of, and
                                    for all losses that may occur with respect to any physical damage to the Customer's
                                    service location and/or merchandise, monies, funds negotiable instruments (for example,
                                    checks), valuables or other property of JMG1 and J.M. Grove or any Customer while
                                    in the custody or control of or while Service Provider or any Service Provider Personnel
                                    are present. Any property removed or replaced belonging to the Customer will not
                                    be carried away by the Service Provider unless such removal is provided for in the
                                    Customer Contract or requested in writing by the Customer.<br />
                                4.7 Equipment. Service Provider will, at its own expense, provide all transportation
                                    capacity and provide and maintain all equipment, supplies, tools, uniforms, up-to-date
                                    maps and directional aids, and other resources (collectively, "Equipment"), necessary
                                    to fulfill its' obligations under this SPA. Service Provider will keep Equipment
                                    in good repair and safe operating condition, maintain Equipment according to the
                                    manufacturer’s recommendations, and only use Equipment fit for its intended purpose.
                                    Service Providers vehicular Equipment will be maintained consistent with the requirements
                                    of the Federal Motor Carrier Safety Regulations ("FMCSR") at` all times. Service
                                    Provider will comply with any additional vehicular specifications
                                   
                                       

                                        <br />
                                as provided in the SPRG 4.8 Non-solicitation Service Provider will not use Confidential
                                    Information (defined in Section 8.1); information about Customers obtained as a
                                    consequence of Service Provider’s fulfillment of its obligations under this SPA,
                                    for the purpose of soliciting, directly or indirectly, any business from a Customer
                                    or prospective Customer. Service Provider will not use such information for the
                                    purpose of providing products or services that are the same as, similar to, or competitive
                                    with, Services or other products and services that are sold or provided by JMG1
                                    and J.M. Grove. Service Provider’s acknowledges and agrees that the restrictions
                                    contained in this section 4.8 are fair, reasonable, and necessary to protect JMG1
                                    and J.M. Grove legitimate business interests. The non-solicitation restrictions
                                    set forth in this Section 4.8 will survive for three (3) years upon termination
                                    or expiration of this SPA, provided that protections applicable to JMG1 and J.M.
                                    Grove Confidential information will continue for as long as permitted by applicable
                                    law.<br />
                                4.9 Promotions. JMG1 and J.M. Grove may desire and hereby reserves the right to
                                    implement storewide or targeted promotions or purchase incentives applicable to
                                    Services or certain Programs. Such promotions may apply nationally, regionally,
                                    or only with respect to certain JMG1 and J.M. Grove stores. If such promotions affect
                                    the business of Service Provider JMG1 and J.M. Grove and Service Provider will engage
                                    in good faith discussions about the Parties respective responsibilities and any
                                    adjustments that may be appropriate for the pricing of services or compensation
                                    due Service Provider. Such arrangement regarding-the implementation of a promotion
                                    shall be agreed to by the Parties and reduced to a properly executed writing
                                   
                                       

                                        <br />
                                4.10 Service Warranties. JMG1 and J.M. Grove will warrant to the Customer the workmanship
                                    of the Services pursuant to a Customer Contract. Service Provider will warrant its
                                    workmanship to JMG1 and J.M. Grove in accordance with this Section<br />
                                4.10.If Service Provider breaches its warranty, the Service Provider will JMG1 and
                                    J.M. Grove in accordance with Section 10. Service Provider hereby warrants the workmanship
                                    of each installation to JMG1 and J.M. Grove for the longer of: (i) one (1) year
                                    and five (5)years for roofs from the date of the installation completion and signed
                                    Customer Approval/satisfaction, and collected remaining monies owed by Customer
                                    and installer signed Lien Waiver (as defined below), whichever is later; (ii) the
                                    applicable period specified in the Customer Contract or any warranty supplemental
                                    to such Customer Contract; or (iii) such period as may be required under applicable
                                    law. These warranties are in addition to any other warranties provided by Service
                                    Provider or required by applicable law or this SPA<br />
                                <b>5 Payment and Chargebacks.</b> 5.1 Submission for Payment. Payment processing
                                    will begin upon the completion of an installation pursuant to a Work order Purchase
                                    order. Unless other terms are established in other sections of the SPA for the specific
                                    Program, Service Provider must submit to JMG1 and J.M. Grove a signed Customer Approval/satisfaction,
                                    and collected remaining monies owed by Customer and a signed lien waiver form ("Lien
                                    Waiver') as a condition of payment processing The payment procedures and adjustments
                                    are described in further detail in the SPRG.<br />
                                5.2 Payment. Within ninety (90) days of JMG1 and J.M. Grove receipt of both the
                                    signed Customer Approval/satisfaction, and collected remaining monies owed by Customer
                                    and signed Lien Waiver. Contractor will hold in escrow 10% of money owed per “Work
                                    Order” until account reaches $5,000.00. Money will be held for 16 months past the
                                    date of termination as per this SPA. JMG1 and J.M. Grove will process and make payment
                                    to the Service Provider of any undisputed charges.<br />
                                5.3 Cost Adjustments An undisputed error in the payment made to Service Provider
                                    will be corrected as follows: (i) if the cost adjustment results in a credit to
                                    the Service Provider, the amount will be included in the next scheduled payment
                                    cycle; or (ii) if the cost adjustment results in a debit to the Service Provider,
                                    the Service Provider's account will show a balance due and JMG1 and J.M. Grove will
                                    deduct the amount due from any future payments to the Service Provider.<br />
                                5.4 Chargeback. If JMG1 and J.M. Grove incurs expenses to satisfy a Customer who
                                    is not completely satisfied because of substandard or faulty workmanship of the
                                    Service Provider or to repair damages caused by Service Provider and/or if the Service
                                    Provider has violated any of the requirements of the SPA that are or may be deemed
                                    in the future violations which provide a penalty to be imposed against the Service
                                    Provider, such expenses, regardless of the manner incurred, will be deducted as
                                    a "chargeback" from payments otherwise due the Service Provider from JMG1 and J.M.
                                    Grove. To the extent no further payments are due, JMG1 and J.M. Grove will invoice
                                    Service Provider for such expenses and Service Provider agrees to pay such invoice
                                    within thirty (30) days of the invoice date. JMG1 and J.M. Grove rights under this
                                    Section 5.4 will survive the expiration or termination of this SPA Additional information
                                    with regard to chargeback's is provided in the SPRG. Service Provider will have
                                    three (3) days to schedule re-work for Customer or Company call backs. After (3)
                                    days Company may cure unresolved Contractual obligations to Customer and “back charge”
                                    Service Provider at a time and material rate.<br />
                                6 Background Investigations.<br />
                                6.1 General. Service Provider Personnel must pass background investigations before
                                    the provision of any Services. These investigations will be conducted by a third-party
                                    agency or agencies approved or designated by JMG1 and J.M. Grove as set forth in
                                    the SPRG. Service Provider will be notified of the results, but will not receive
                                    access to or review the report, except to the extent JMG1 and J.M. Grove is required
                                    under applicable law to allow such access or review or unless the Service Provider
                                    is credentialed by the third-party agency. Later background investigations may
                                   
                                       

                                        <br />
                                6.2 Prerequisite to Provision of Services. Until the requirements of this Section
                                    6 are fully satisfied, under no circumstances will Service Provider or its Service
                                    Provider Personnel provide any Services, have contact with any Customers, or have
                                    access to Confidential Information, including Customer information.<br />
                                6.3 Felony Discovery of a felony criminal conviction (no matter the date of such
                                    conviction) of Service Provider or any significant owner, officer or director therof,
                                    or of any CO-Signer with Service Provider, or of any Service Provider Personnel,
                                    will be grounds for immediate termination of this SPA and any Work order purchase
                                    order issued by JMG1 and J.M. Grove.<br />
                                7 Service Provider Personnel.<br />
                                7.1 No Benefits Service Provider acknowledges and agrees that it and its Service
                                    Provider Personnel will have no right to the payment of wages or salary from JMG1
                                    and J.M. Grove or to participate in any employee benefits plans, arrangements, or
                                    distributions by JMG1 and J.M. Grove or its affiliated companies. Such employee
                                    wages, salary, benefits plans, arrangements, or distributions include, without limitation,
                                    those pertaining to, or connected with, any pension, stock, bonus or similar benefits
                                    for JMG1 and J.M. Grove employees. Service Provider will provide a signed benefits
                                    waiver for each of its Service Provider Personnel upon JMG1 and J.M. Grove request.<br />
                                7.2 Tax and Reporting Requirements. Service Provider is exclusively liable for all
                                    tax withholding, deposit, and reporting requirements under federal or state income,
                                    social security, FICA, old age benefit, Medicare, unemployment insurance, or workers’
                                    compensation acts with respect to services provided by its Service Provider Personnel.
                                    Service Provider represents and warrants that it will comply, at its expense, with
                                    the Fair Labor Standards Act, all worker’s compensation, benefits, employment laws
                                    and all other laws applicable to it. JMG1 and J.M. Grove has the right to audit
                                    such records upon request.<br />
                                7.3 Compliance with the immigration Reform and Control ACT. Service Provider is
                                    solely responsible for ensuring that all of its Service Provider Personnel are in
                                    compliance with the Immigration Reform and Control Act of 1986 (“IRCA) and will
                                    perform employment eligibility verifications and maintain I-9 forms for Service
                                    Provider Personnel. Service Provider will comply fully with the record-keeping requirements
                                    of IRCA, and certify its compliance to JMG1 and J.M. Grove upon request. Service
                                    Provider will only use workers for whom it has confirmed legal eligibility to perform
                                    services as employees in the United States and for whom all required record keeping
                                    under IRC has been performed and maintained.<br />
                                7.4 No Sponsorship JMG1 and J.M. Grove is not responsible for sponsorship of, and
                                    will not sponsor, any workers used in fulfillment of Service Provider’s obligations
                                    under this SPA.<br />
                                7.5 Reimbursement. If, for any reason JMG1 and J.M. Grove is required by law or
                                    regulation or the action of any governmental authority, to pay any sum of money
                                    by way of levy, tax, interest, penalty, or otherwise, to Service Provider Personnel,
                                    Service Provider Personnel, Service Provider authorizes JMG1 and J.M. Grove to deduct
                                    such amount from any sums then due or that thereafter become due Service Provider
                                    form JMG1 and J.M. Grove. To the extent no further payments are due Service Provider,
                                    JMG1 and J.M. Grove will invoice Service Provider for such reimbursement and Service
                                    Provider agrees to pay such invoice within thirty (30) days of the invoice date.
                                    This obligation and JMG1 and J.M. Grove rights hereunder will survive the expiration
                                    or termination of this SPA.<br />
                                7.6 Labor Disputes. Service Provider agrees to immediately notify JMG1 and J.M.
                                    Grove in writing of any threatened, impending, or actual labor dispute involving
                                    Service Provider or Service Provider Personnel<br />
                                7.7 Compliance with this SPA. Service Provider will ensure that Service Provider
                                    Personnel comply with the terms of this SPA, and any breach of any term of this
                                    SPA by Service Provider Personnel is a breach by Service Provider for liability,
                                    indemnification and other purposes.<br />
                                8 Confidentiality; Publicity; Ownership of Works. 8.1 Confidential Information.
                                    Service Provider acknowledges that performance under this SPA will give Service
                                    Provider and Service Provider Personnel access to confidential, proprietary, and
                                    trade secret information of JMG1 and J.M. Grove and Customer information (collectively
                                    “Confidential Information”). Service Provider agrees that it will maintain all Confidential
                                    Information in strict confidence and not disclose or use Confidential Information
                                    other than as necessary to fulfill its obligations to JMG1 and J.M. Grove. Service
                                    Provider will inform its Service Provider Personnel about the JMG1 and J.M. Grove.
                                    Service Provider will inform its Service Provider personnel about the confidential
                                    and proprietary nature of the Confidential Information to which they may be exposed
                                    and will
                                   
                                       

                                        <br />
                                8.2-9.1 Ensure that Service Provider Personnel keep Confidential Information strictly
                                    confidential and comply with a terms of this Section 8. "Confidential Information"
                                    means information disclosed to, made available to obtained by Service Provider in
                                    connection with this Agreement, and all material and reports prepared for JMG1 and
                                    J.M. Grove hereunder, including all information (whether or not specifically labeled
                                    or identified as confidential), in any form or medium, that is disclosed to or learned
                                    b_. Service Provider in the performance of Services related to this SPA and that
                                    relates to the business products, services, research or development of JMG1 and
                                    J.M. Grove or its service providers, suppliers, distributors, agents, representatives
                                    or Customers. Specifically, but not limiting the generality of the foregoing, Confidential
                                    Information further includes the following: internal business information (including
                                    information relating to strategic and staffing plans and practices, marketing, promotional
                                    sales plans, practices and programs, training practices and programs, costs, rate
                                    and pricing structures and accounting and business methods); identities of, individual
                                    requirements of, specific contractual arrangements with, and information about,
                                    JMG1 and J.M. Grove service providers, suppliers, distributors and Customers and
                                    their confidential, proprietary or personal information; (c) compilations of data
                                    and analyses, processes, methods, techniques, systems, formulae, research records,
                                    reports, Customer lists, manuals, documentation, models, data and data bases relatin5
                                    thereto; computer software and technology (including operating systems, application
                                    software, interfaces utilities, modifications, macros and their overall organization
                                    and interaction), program listing documentation, data and data bases, and any user
                                    IDs and passwords JMG1 and J.M. Grove provides Service Provider for access to JMG1
                                    and J.M. Grove internal systems; and Trade secrets, trade dress, ideas, inventions,
                                    designs, developments, devices, methods, processes and systems (whether or not patentable
                                    or copyrighted and whether or not reduced to practice of fixed in a tangible medium).
                                    8.2 Required Disclosures. If Service Provider receives a subpoena or other validly
                                    issued administrative of judicial process demanding information about this SPA and/or
                                    Confidential Information, Service Provider must promptly notify and tender the defense
                                    of that demand to JMG1 and J.M. Grove. Unless it has been timely limited, quashed
                                    or extended, Service Provider will thereafter be entitled to comply with such demand
                                    to the extent required by law. If requested, Service Provider will cooperate in
                                    the defense of such demand.<br />
                                8.3 Publicity. Service Provider will not issue any press release or other statement,
                                    or otherwise disclose (in whole or in part) the contents or substance of this SPA
                                    or the Parties' activities under this SPA without first obtaining the express prior
                                    written consent of JMG1 and J.M. Grove. Any such consent must be requested at least
                                    thirty (30) calendar days before the intended date of the release or communication,
                                    Service Provider will immediately inform JMG1 and J.M. Grove if it believes that
                                    the issuance of any press or other media release is required by operation of applicable
                                    law.<br />
                                8.4 Ownership of Works. Except as otherwise agreed by the Parties in writing, JMG1
                                    and J.M. Grove or its assignee own and have all right, title and interest in all
                                    ideas, concepts, plans, processes (including without limitation, sales and marketing
                                    processes) creations, trademarks, logos, intellectual property, displays (whether
                                    such displays are used on an in-store or in-home basis) or other work product (collectively,
                                    the "Works") produced by JMG1 and J.M. Grove, produced at JMG1 and J.M. Grove request,
                                    or produced by Service Provider or any Service Provider Personnel for JMG1 and J.M.
                                    Grove in furtherance of the Parties' obligations under this SPA. Service Provider
                                    will cooperate fully with JMG1 and J.M. Grove and execute documentation as JMG1
                                    and J.M. Grove may request in order to establish, secure, maintain, or protect JMG1
                                    and J.M. Grove rights with respect to the Works,<br />
                                9 Representations and Warranties. 9.1 Mutual Re representations and Warranties.
                                    Each Party represents and warrants that, as of the Effective Date: (a) It is a corporation
                                    duly incorporated (or is any other form of legally recognized entity), validly existing
                                    and in good standing under the laws of the jurisdiction in which it is incorporated
                                    or otherwise formed, and is duly qualified and in good standing in each other jurisdiction
                                    where the failure to be so qualified and in good standing would have an adverse
                                    effect on its ability to perform its obligations under this SPA in accordance with
                                    the terms and conditions here of; and (b) Each Party has all necessary corporate
                                    power to enter into the SPA and to perform its obligations hereunder and the execution,
                                    delivery, and performance of this SPA by each Party has been duty authorized by
                                    all necessary corporate action on the part of each Party. 9.2 Service Provider Representations
                                    and Warranties. Service Provider further represents and warrants to JMG1 that as
                                    of the Effective Date and continuing throughout the Term;<br />
                                (a) Service Provider is duly licensed, authorized and qualified to do business in
                                    each jurisdiction in which a license, authorization, or qualification is required
                                    for the transaction of business in fulfillment of Service Provider’s obligations
                                    under this SPA;<br />
                                (b) there is no outstanding litigation, arbitration, claim, or other dispute to
                                    which Service Provider, [or any Cosigner]is a party that if decided unfavorably
                                    to it, would reasonably be expected to have a material adverse effect on the ability
                                    of any Party to fulfill its obligations under this SPA;<br />
                                (c) neither Service Provider [nor any Cosigner] of Service Provider is a party to
                                    any contract, agreement, mortgage, note, deed, lease or similar understanding with
                                    any third party that would have an adverse effect on the ability of Service Provider
                                    to fulfill its obligations under this SPA;<br />
                                (d) to Service Provider’s knowledge, no non-public fact or circumstance exists that
                                    would have, or potentially could result in an adverse effect on Service Provider’s
                                    or JMG1 and J.M. Grove public image or the public’s perception of any of Service
                                    Provider’s or JMG1 and the J.M. Grove brands or marks that may be used under this
                                    SPA;<br />
                                (e) Service Provider will properly render the Services in accordance with this SPA
                                    and any Work order and will execute each in accordance with the practices and commercially
                                    and reasonable standards used in well-managed operations performing services similar
                                    to the Services, with an adequate number of qualified individuals with suitable
                                    training, experience and sill to perform the Services;<br />
                                (f) Service Provider will maintain insurance coverage’s in amounts and as required
                                    in this SPA and the SPRG<br />
                                (g) Service Provider will perform its obligations in a manner that complies with
                                    all laws applicable to Service Provider and its business, activities, facilities
                                    and the provision of Services hereunder ,including laws of any country or jurisdiction
                                    from which or through which Service Provider provides the Services or obtains resources
                                    or personnel to do so.<br />
                                10 Indemnifications.<br />
                                10.1 Mutual Indemnification JMG1 and J.M. Grove and Service Provider and its affiliates,
                                    will indemnify, defend, and gold one another and their respective owners, officers,
                                    shareholders, partners, members, parent, affiliates, subsidiaries, associates, directors,
                                    employees, subcontractors and agents harmless from and against any third party losses
                                    liabilities, claims, causes of action, lawsuits, judgments, civil penalties, damages
                                    and expenses suffered, incurred, or sustained by the indemnified Party or any of
                                    its owners, officers, shareholders, partners, members, parent, affiliates, subsidiaries,
                                    associates, directors, employees, subcontractors and agents to the extent resulting
                                    from, arising out of, or relating to, any claim that;<br />
                                (a) the indemnifying Party or any owner, officer, shareholder, parent, affiliate,
                                    subsidiary, associate, director, employee, subcontractor and agent thereof is non-compliant
                                    with any applicable law or regulations, or;<br />
                                (b) A Party’s intellectual property infringes upon the proprietary or other rights
                                    of any third party.<br />
                                10.2 Service Provider Indemnification. Service Provider will further indemnify defend
                                    and hold harmless JMG1 and J.M. Grove and its owners, officers, shareholders, affiliates
                                    subsidiaries, associates, directors, employees, subcontractors and agents a from
                                    and against, any losses, liabilities, claims causes of action, lawsuits, judgments,
                                    civil penalties, damages and expenses suffered, incurred, or sustained by JMG1 and
                                    J.M. Grove or its owners, officers, shareholders, affiliates, subsidiaries, associates,
                                    directors, employees, subcontractors and agents, to the extent resulting from, arising
                                    out of, or relating to the following acts or failure to act of Service Provider
                                    and/or Service Provider Personnel;<br />
                                (a) Any Services and/or work performed and/or products supplied by Service Provider
                                    and/or Service Provider Personnel;<br />
                                (b) The inaccuracy, untruthfulness or breach of any representation, covenant, warranty,
                                    or any other agreement set forth in this SPA;<br />
                                (c) Actual or alleged personal injury (including death);<br />
                                (d) Actual or alleged property loss or damage;<br />
                                (e) the marketing or sale of any products, materials or services under this SPA
                                    to any Customer; or (by agreement, plan, statute or otherwise), pension benefits,
                                    or severance or termination pay, by or on behalf of Service Provider or any owner,
                                    officer, shareholder, partner, member, parent or Service Provider Personnel, claiming
                                    an employment or other relationship with Service Provider and/or JMG1 and J.M. Grove<br />
                                10.3 JMG1 and J.M. Grove Right to Assume Defense Notwithstanding anything else provided
                                    herein, and without limiting Service Provider’s obligation to fully indemnify JMG1
                                    and J.M. Grove under this SPA, and with respect to any claims for which JMG1 and
                                    J.M.Grove is entitled to indemnification from Service Provider hereunder. JMG1 and
                                    J.M Grove reserves the absolute right to assume the defense of any claim and JMG1
                                    and J.M. Grove may thereafter require from Service Provider reimbursement of any
                                    and all costs and expenses (including reasonable attorney’s fees). 10.4 Defense
                                    of Claims Subject to Section 10.3 above, the indemnified Party shall cooperate in
                                    the defense of any claim for which indemnification is sought under this Section
                                    10. The indemnifying Party agrees to do the following in connection with the conduct
                                    of the defense of any claim in which the indemnified Party has been named a party.<br />
                                (a) Inform the indemnified Party or its agents about all material information pertaining
                                    to a claim;<br />
                                (b) Inform the indemnified Party of the date of any mediation, arbitration, trial,
                                    or settlement conference as soon as possible after it receives such information;<br />
                                (c) Choose defense counsel that is reasonably satisfactory to the indemnified Party;<br />
                                (d) Use all reasonable efforts to promptly provide indemnified Party with copies
                                    of all discovery requests as soon as they are available to indemnifying Party;<br />
                                (e) provide the indemnified Party with copies of all defensive pleadings in advance
                                    of filing to allow the indemnified Party the opportunity to provide comments; and<br />
                                (f) Inform the indemnified Party of the outcome of any mediation, arbitration, motion,
                                    trial, or settlement or any other matter from which appeal rights could arise.<br />
                                10.5 No Settlement Without Consent. The indemnifying Party will not enter into any
                                    settlement or compromise of the claim that would result in the admission of any
                                    liability, create any financial liability, or that would subject the indemnified
                                    Party to injunctive relief or otherwise bind, restrict or commit the indemnified
                                    Party without first obtaining the indemnified Party’s prior written consent<br />
                                10.6 Participating in the Defense JMG1 and J.M. Grove have the right, but not the
                                    obligation, to participate, as it deems necessary, in the handling, adjustment,
                                    or defense of any claim. If JMG1 and J.M. Grove reasonably determines that defenses
                                    are available to it that are not available to Service Provider, and if raising such
                                    defenses would create a conflict of interest for the counsel defending the claim,
                                    JMG1 and J.M. Grove will be entitled to retain separate counsel, at Service Provider’s
                                    expense, to raise such defenses.<br />
                                10.7 Assumption of Defense Should the indemnifying Party fail to assume its obligations,
                                    including its obligation to diligently pursue and pay for the defense of the indemnified
                                    Party under this Section 10, the indemnifying Party agrees that the indemnified
                                    Party will have the right but not the obligation, to proceed on its own behalf to
                                    so defend itself. The indemnified Party may require from the indemnifying Party
                                    reimbursement of any and all costs and expenses (including reasonable attorney’s
                                    fees) and amounts paid by the indemnified Party on behalf of the indemnifying Party.<br />
                                10.8 Indemnification in Addition to Insurance Service Providers agreement to indemnify,
                                    defend and hold harmless JMG1 and J.M. Grove under the terms of this Section 10
                                    is in addition to Service Provider’s agreement to procure insurance as required
                                    under this SPA. Any losses, damages and expenses incurred by JMG1 and J.M. Grove
                                    will be covered, to the extent permissible by Service Provider’s insurer. Service
                                    Provider’s insurance coverage does not in any way limit Service Provider’s obligations
                                    to indemnify, defend and gold harmless JMG1 and J.M. Grove<br />
                                10.9 Other Indemnification Obligations The foregoing obligations are in addition
                                    to any other indemnification obligations that may be seen forth elsewhere in this
                                    SPA or in any attachment to this SPA or which may arise by operation of law.<br />
                                11 Insurance; Risk of Loss.<br />
                                11.1 Licensing and Insuring of Employees. Service Provider will ensure that Service
                                    Provider Personnel performing work under this SPA are fully licensed as required
                                    by law with respect to all activities undertaken in fulfillment of Service Provider’s
                                    obligations under this SPA and insured consistent with JMG1 and J.M. Grove requirements
                                    as provided in the SPRG<br />
                                11.2 Insurance Certificate All insurance certificates must list JMG1 and J.M. Grove
                                    LLC as the certificate holder. Additionally all insurance certificates, except for
                                    the Auto and Workers Compensation Certificate of Insurance must contain the following
                                    language exactly as provided; “ JMG1 and J.M. Grove LLC, its parents, affiliates,
                                    and subsidiaries are added as additional insured<br />
                                11.3 Risk of Loss As of the Effective Date and continuing throughout the Term, each
                                    Party will be responsible for risk of physical or actual loss of, and damage to,
                                    any property, equipment, merchandise or any other items or information in its possession
                                    or under its control.<br />
                                11.4 Insurance Coverage Service Provider will procure and maintain at all times
                                    Commercial General Liability Auto Liability and Workers Compensation Insurance with
                                    coverage amounts on an occurrence basis containing limits of no less than the amounts
                                    specified for the Services on the Insurance Requirements described in the SPRG.
                                    This insurance will not include any exceptions and/or exclusion that limit or minimize
                                    the coverage’s for the Services. Additional Insured and Products-Completed Operations
                                    Endorsements are required.<br />
                                11.5 Insurance Proceeds For the avoidance of doubt, insurance proceeds received
                                    or owed to Service Provider for any Services provided under this SPA, will be paid
                                    or assigned, as necessary, to JMG1 and J.M. Grove to cover any costs or fees incurred
                                    by JMG1 and J.M. Grove as a result of the circumstances leading to the payment of
                                    any such insurance proceeds.<br />
                                12 Limitations of Liability<br />
                                12.1 LIABILITY FOR ACTIAL DAMAGES ONLY EXCEPT IN CONNECTION WITH SERVICE PROVIDER’S
                                    BREACH OF CONFIDENTIALITY, FRAUD, GROSS NEGLIGENCE, WILLFUL MISCONDUCT OR INDEMNIFICATION
                                    OBLIGATION TO JMG1 AND J.M. GROVE FOR INTELLECTUAL PROPERTY INFRINGEMENT CLAIMS,
                                    NO PARTY WILL BE LIABLE TO ANOTHERPARTY FOR, NOR WILL THE MEASURE OF DAMAGES INCLUDE,
                                    ANY CONSEQUENTIAL, ORINCIDENTAL, INDIRECT, EXEMPLARY, PUNITIVE, OR SPECIAL DAMAGES
                                    ARISING OUR OF OR RELATING TO ITS ACTS OR OMISSIONS UNDER RHIS SPA, REGARDLESS OF
                                    THE FORM OF ACTION, WHETHER IN CONTRACT, NEGLIGENCE, TORT STRICT LIABILITY, PRODUCTS
                                    LIABILITY OR OTHERWISE, AND EVEN IF FORESEEABLE OR IF SUCH PARTY HAS BEEN ADVISED
                                    OF THE POSSIBILITY OF SUCH DAMAGES. A PARTY WILL ONLY BE LIABLE TO THE OTHER PARTY
                                    FORDAMAGES ACTUALLY INCURRED BY A BREACHING PARTY.<br />
                                12.2JMG1 AND J.M. GROVE MAXIMUM LIABILITY JMG1 AND J.M. GROVE MAXIMUM LIABILITY
                                    TO SERVICE PROVIDER UNDER THIS SPA (REGARDLESS OF CUASE OR FORM OF ACTION, WHETHER
                                    IN CONTRACT, TORT, OR OTHERWISE) WILL BE LIMITED TO THE TOTAL UNDISPUTED AMOUNT
                                    OWED SERVICE PROVIDER BY JMG1 AND J.M.GROVE IN PAYMENT FOR SERVICE PROVIDER’SFULFILLMENTOF
                                    ITS OBLIGATIONS UNDER THIS SPA<br />
                                12.3 CLAIMS ONLY AGAINST JMG1 AND J.M. GROVE SERVICE PROVIDER AGREES THAT ITS SOLE
                                    RECOURSE FOR CLAIMS ARISING BETWEEN OR AMONG THE PARTIES WILL BE AGAINST JMG1 AND
                                    NOT J.M.GROVE OR J.M. GROVE’S SUCCESSORS AND ASSIGNS. IN NO EVENT WILL THE SHAREHOLDERS,
                                    DIREDTORS, OFFICERS, EMPLOYEES, AND AGENTS OF JMG1 AND J.M. GROVE AND ITS AFFILIATES
                                    BE PERSONALLY LIABLE OR BE NAMED AS PARTIES IN ANY ACTIONBETWEEN OR AMONG THE PARTIES.<br />
                                12.4 Third party Liabilities. Nothing in this Section 12 will be construed to limit
                                    a Party’s right to recover any damages that such Party is obligated to pay to any
                                    third party. Nor will anything I this section 12 preclude any remedies available
                                    to a Party in the case of fraud by the other Party provided such fraud has been
                                    established by the finding (even if appealable) of a court of competent jurisdiction<br />
                                12.5 Mutual Understanding Service Provider and JMG1 and J.M. Grove agree that the
                                    allocation of liability set forth I this Section 12 represents the mutually agreed
                                    upon and bargained-for understanding of the Parties and further agree that the compensation
                                    exchanged by the Parties under this SPA reflects such allocation.<br />
                                13 Events of Default. The occurrence of any of the following will be deemed an “Event
                                    of Default”<br />
                                13.1 Compliance The failure of Service Provider to: (i) comply with any term or
                                    condition of this SPA (ii) to make payment or reimbursement of funds owed JMG1 and
                                    J.M. Grove, (iii) cease conduct that JMG1 and J.M Grove reasonably deems harmful
                                    to its general business interests or public images even if unrelated to Service
                                    Provider’s obligations under the SPA, or(iv) complete an Assignment, which failure
                                    continues in effect or has otherwise not been remedied to JMG1 and J.M. Grove satisfaction
                                    within thirty (30) calendar days of JMG1 and J.M. Grove written notice thereof to
                                    Service Provider.<br />
                                13.2 Corrections The failure to (i) correct rejected, defective or nonconforming
                                    workmanship, or (ii) repair or replace defective or nonconforming products or materials
                                    sourced, furnish, manufactured or fabricated by Service Provider within a commercially
                                    reasonable time, of thirty (30) calendar days or less, unless JMG1 and J.M. Grove
                                    provides a written extension of time<br />
                                13.3 Payment to Others The failure of Service Provider to timely pay any Service
                                    Provider Personnel which failure results, or could result, in the placement of a
                                    lien, writ of execution or attachment, or other claim or security interest on or
                                    against any property of JMG1 and J.M. Grove or any property of JMG1 or J.M. Grove.
                                    Customer.<br />
                                13.4 Liens The failure of Service Provider to satisfy, discharge, or release any
                                    lien, writ of execution or attachment, or other claim or security interest against
                                    the property of JMG1 and J.M. Grove or a customer filed in connection with the Services
                                    within ten (10) business days of the date that Service Provider was first made aware
                                    of such security interest.<br />
                                13.5 Creditors and Bankruptcy (i) The making by Service by service Provider of an
                                    assignment for the benefit of creditors (ii) the institution of a judicial proceeding
                                    for the reorganization, liquidation, or involuntary dissolution of Service Provider
                                    or for its adjudication as bankrupt or insolvent, (iii) the appointment of receiver
                                    , trustee or liquidator of or for the property of Service Provider whereupon the
                                    receiver, trustee, or liquidator is not removed within thirty (30) calendar days
                                    of JMG1 and J.M.Grove written request or (iv) the taking advantage by Service Provider
                                    of any debtor relief proceedings, whereby the liabilities or obligations of Service
                                    Provider are, or are proposed to be, reduced, or payment therof deferred.<br />
                                14 Remedies for Breach or Events of default.<br />
                                14.1 Opportunity to Cure If Service Provider breaches any obligation under this
                                    SPA, or upon an Event of Default, JMG1 and J.M. Grove will provide written notice
                                    of the breach or event of default and an opportunity to cure. Unless a different
                                    period is specified in the written notice, Service Provider must cure the breach
                                    within thirty (30) calendar days of the date of the written notice. If Service Provider
                                    fails to cure within the applicable period, JMG1 and J.M. Grove may exercise an
                                    or more of the following remedies without any liability to Service Provider:<br />
                                (a) Reject, in whole or in part, Service Provider’s submission for payment with
                                    respect to an Assignment under this SPA or, as the case may be, nullify, in whole
                                    or in part, a previously approved submission for payment;<br />
                                (b) withhold from any sums due or that thereafter become due Service Provider the
                                    amount deemed necessary by JMG1 and J.M. Grove to protect JMG1 and J.M. Grove from
                                    actual or reasonably foreseeable direct damages resulting from the breach or Event
                                    of Default;<br />
                                (c) Remove Service Provider from any or all Markets until Service Provider is no
                                    longer in breach of this SPA, or the Event of Default is ended:<br />
                                (d) retain a third party to cure the breach or end the event of Default, at Service
                                    Provider’s sole expense which expense JMG1 and J.M. Grove may offset against any
                                    sums due or that there after become due Service Provider; or<br />
                                (e) Terminate this SPA immediately upon written notice to Service Provider.<br />
                                14.2 Cure of Remedies Service Provider’s cure of any breach or Event of Default
                                    under this SPA must be done in a manner satisfactory to both JMG1 and J.M. grove
                                    and the impacted Customer(s)<br />
                                15 Termination<br />
                                15.1 Breach of Default This Agreement may be terminated for cause (i.e. for breach
                                    or for the occurrence of an Event of Default) by JMG1 and J.M. Grove immediately
                                    upon expiration of the applicable cur period. If Service Provider commits the same
                                    or a substantially similar breach of this SPA, or if there is an occurrence of the
                                    same or a substantially similar Event of Default within six (6) months following
                                    the date that JMG1 and J.M. Grove became aware of the previous breach or Event of
                                    Default, JMG1 and J.M. Grove will have the right to immediately terminate this Spa.
                                    This right will not be waived if JMG1 and J.M. Grove permits the Service Provider
                                    to cure such subsequent breach or Event of Default within a reasonable amount of
                                    time.<br />
                                15.2 Services Provider’s Obligations upon Termination Upon termination or expiration
                                    of this SPA, Service Provider must:<br />
                                (a) Timely complete all Assignments;<br />
                                (b) Pay to JMG1 and J.M. Grove all sums then due within thirty (30) calendar days
                                    after termination;<br />
                                (c) Pay to JMG1 and J.M. Grove any sum that becomes due after termination within
                                    thirty (30) calendar days after the date it accrues<br />
                                (d) return any and all property, including any confidential information, of JMG1
                                    and J.M. Grove and/or customer information in Service Provider’s possession or control
                                    within thirty (30) calendar days after termination;<br />
                                (e) stop representing that Service Provider is or at any time was in a business
                                    relationship with JMG1 and J.M. Grove, except as necessary to fulfill any surviving
                                    obligations under this SPA; and<br />
                                (f) Timely satisfy all obligations under this SPA still in effect.<br />
                                15.4 JMG1 and J.M. Grove Obligations upon Termination. Upon termination of this
                                    Spa for any reason, JMG1 and J.M. Grove must:<br />
                                (a) Pay all undisputed sums due Service Provider;<br />
                                (b) Pay all undisputed sums that become due after termination;<br />
                                (c) return Service Provider any and all property of Service Provider in JMG1 and
                                    J.M. Grove possession or control within thirty days after termination; and<br />
                                (d) Satisfy any obligations remaining under this SPA.<br />
                                15.5 Retainage JMG1 and J.M. Grove may withhold any payments due Service<br />
                                16 Dispute Resolution.<br />
                                16.1 Choice of Law. The laws of the State of Pennsylvania govern and control this
                                    SPA, and any disputes arising out or relating to it.<br />
                                16.2 Non-Binding Mediation. All disputes by Service Provider shall first be referred
                                    to JMG1 and J.M. Grove Service Director and/or Installation Merchant and the Parties
                                    shall use good faith efforts to resolve such dispute. Before commencing legal or
                                    equitable action under Section 15.3 of this SPA. The mediation will, unless otherwise
                                    agreed in writing by the parties, be held in King of Russia, Pennsylvania, and will
                                    be conducted over a period of time not to exceed three (3) business days over a
                                    ten (10) business day period. The Parties will share equally the costs of any such
                                    mediation. If the Party that receives the request for mediation is not agreeable
                                    to pursuing mediation as a means of resolving the dispute, or if the Parties cannot
                                    agree upon a professional mediator, or if mediation fails to result In a resolution
                                    of the dispute then any Party may elect to proceed with further legal or equitable
                                    action under Section 16.3 of this SPA unless JMG1 and J.M. Grove elects binding
                                    arbitration under Section 16.4 of this Spa. Notwithstanding the foregoing, either
                                    party at any time may seek specific performance or injunctive relief if monetary
                                    damages or the ordinary forms of redress at law or as provided under this SPA would
                                    be inadequate.<br />
                                17.9-17.15 Designated agent(s) may during the term and for a period of three (3)
                                    years following the terminate or expiration of this SPA, audit during normal business
                                    hours and upon not less than five (5) business days advance written notice to Service
                                    Provider, all books and records of Service Provider that are of direct relevance
                                    to Service Providers fulfillment of its obligations under this SPA. Service Provider’s
                                    authorized representative(s) or designated agent(s) may be present during such audit.<br />
                                17.10 Notices" Any notices or other communication required to be in writing under
                                    this SPA must be either personally delivered; (2) sent by Certified mail, postage
                                    prepaid or (3) delivered by overnight courier,<br />
                                addresses of the other Party set forth on the Face Page of this SPA- Notices are
                                    deemed to be served given upon receipt.<br />
                                17.11 Survival. Termination of this SPA, alt provisions continue in effect as to
                                    disputed matters until resolved, as well as all provisions that survive termination
                                    of-this SPA, including without limitation, Service<br />
                                Provider s various warranty obligations under this SPA, and Sections 3.2, 4,1, 4.2,
                                    4,4, 4,5, 4.8, 4.8, 5 7.57,k, 8, 9, 10, 11,5, 12, 14.l(d), 15,3, 15.5, 15, 17.5,
                                    17,8, 17.9 and 17,10.<br />
                                17.12 Force Majeure. No Party will be in breach of this SPA if performance of its
                                    obligations or attempts to cure any breach or end an Event of default are delayed
                                    Of prevented by reason of any act of nature, fire,<br />
                                disaster, failure of electrical power systems, or any other act or condition beyond
                                    the reasonable control of the Party affected ("_Event of Force Ma}aura"), provided
                                    that the affected Party makes commercially reasonable efforts to avoid or eliminate
                                    the causes of its nonperformance and continues performance immediately after such
                                    causes are eliminated. Notwithstanding this Section 17.12, any delay that exceeds
                                    sixty (60) calendar days will entitle the Party whose performance is not affected
                                    by the relevant Event of Force Majeure to terminate this SPA upon not less than
                                    thirty (30) calendar days' advance written notice to the other Party.<br />
                                17.13 Entire Agreement. This SPA, together with the Face Page, exhibits, annexes,
                                    the SPRG and other duly incorporated attachments, constitutes the entire agreement
                                    and understanding between the parties. Any<br />
                                previous negotiations, agreements or representations that have been made or retied
                                    upon that are not expressly set forth will have no force or effect.<br />
                                17.14 Counterparts This SPA may be executed in one or more counterparts, each of
                                    which will be deemed an original, but all of which together will constitute one
                                    and the same instrument. 17.15 Other Provisions. Except where the context requires
                                    otherwise, whenever used, the singular includes the plural, the plural includes
                                    the singular, the word "or"' means "and/or, and the term "including" or "includes"<br />
                                means "including without limitation," and without limiting the generality of any
                                    description preceding that term. When this SPA refers to a number of days, unless
                                    otherwise specified as business days, that reference is to calendar days, The headings
                                    in this SPA are provided for convenience only and do not affect its meaning. The
                                    wording of this SPA shall be deemed wording mutually chosen by the parties and no
                                    rule of strict construction shall be applied against either party. Any reference
                                    in this SPA to a Section, Annex, JMG, LLC AT JM Grove LLC HOLD HARMLESS AGREEMENT<br />
                                I, the undersigned (“Subcontractor”) do not currently have Workers Compensation
                                    Insurance because I qualify for one or more of the allowable exemptions/exclusions
                                    listed below. I understand that Workers Compensation Insurance is mandatory in Hawaii,
                                    Idaho and New York.<br />
                                In consideration of the Subcontractors engagement as detailed in the Independent
                                    Contractor Agreement and the services provided hereunder, the additional services
                                    that may be requested by JMG, LLC and other valuable consideration, the receipt
                                    and sufficiency of which are expressly acknowledged. JMG and Subcontractor hereby
                                    agree as follows:<br />
                                If at any point in the future I am no longer exempt from obtaining Worker’s Compensation
                                    insurance, I will acquire the necessary Workers Compensation insurance before any
                                    of my employees are allowed to work on a job for which I have sub-contracted for
                                    JMG. A certificate of insurance will be provided to JMG at such time.<br />
                                Sole Proprietorship/Partnership with no employees, that have rejected coverage and
                                    submitted the appropriate form and received the attached verification from the State
                                    Workers Compensation Agency that I am exempt and I have no employees and operate
                                    in:<br />
                                Termination<br />
                                Attachment 1 : TERM AND TERMINATION – ALTERNATE PROVISIONS Completion and execution
                                    of any of the provisions below requires the JMGrove legal department’s prior review
                                    and written approval. Absent such review and approval, the Effective Date of the
                                    SPA shall be deemed to be the date as of which the service provider affixed its
                                    signature to the Signature Page of the SPA; the initial term of the SPA shall be
                                    deemed to be one (1) year unless/until earlier terminated consistent with the SPA;
                                    the SPA shall continue in effect following the initial term, unless/until terminated
                                    consistent with the SPA; and the sections 2.1 of the SPA shall not be deemed modified
                                    or superseded. TERM OF AGREEMENT:<br />
                            The following language supersedes the language in section 2.1 of the General Terms
                                    and Conditions if signed where indicated by an authorized representative(s) of both
                                    Parties: Beginning on the Effective Date, the SPA shall continue in effect for ______
                                    (______) year(s) (the “initial term”) unless/until earlier terminated consistent
                                    with the pertinent provisions of the SPA. Following the initial term, the SPA shall
                                    automatically renew for consecutive one year periods unless terminated pursuant
                                    to section 15 of the General Terms and Conditions of the SPA. ______________________________________________________Approval
                                    of The JMGrove Legal Department (required)______________________________________________________
                                    Signature of Service Providers Authorized Representative/Date______________________________________________________Signature
                                    of JMGrove’s Authorized Representative/Date TERMINATION FOR CONVENIENCE The following
                                    language supersedes the language in section 15.2 of the SPA if signed where indicated
                                    by an authorized representative of both Parties. Service Provider of JMGrove may,
                                    upon not less than _____ (_____) calendar days prior written notice to the other
                                    party, terminate the SPA at any time. _____________________________________________
                                    Approval of The JMGrove Legal Department.
                                           
                        </div>
                    </section>

                </asp:Panel>
            </div>

            <div class="form form-horizontal">
                <asp:CheckBox ID="chkboxcondition" runat="server" TabIndex="252" />
                <asp:Label ID="lblTerms" runat="server" Text="I accept Term and Conditions of the above mentioned Subcontract"></asp:Label>
            </div>
        </div>
        <div class="btn_sec">
            <asp:LinkButton ID="lnkSubmit" runat="server" Text="Create User" ValidationGroup="submit" OnClick="btncreate_Click" TabIndex="209">
                </asp:LinkButton>
            <asp:Button ID="btnreset" Text="Reset" runat="server" OnClick="btnreset_Click" TabIndex="210" />
            <asp:Button ID="btnUpdate" Text="Update" runat="server" TabIndex="211" OnClick="btnUpdate_Click" />
        </div>
    </div>

    <asp:Panel ID="panelPopup" runat="server">
        <div id="light" class="white_content" style="margin-top">
            <h3></h3>
            <%--<a href="javascript:void(0)" onclick="document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none'">
                Close</a>--%>
            <table width="100%" style="border: Solid 3px #b04547; width: 100%; height: 100%"
                cellpadding="0" cellspacing="0">
                <tr style="background-color: #b04547">
                    <td colspan="2" style="color: White; font-weight: bold; font-size: larger"
                        align="center"></td>
                </tr>
                <tr>
                    <td align="left" colspan="2">Email or Phone number already exists,do you want to update the existing record?
                        </td>
                </tr>
                <tr>
                    <td align="left" colspan="2" style="height: 15px;"></td>
                </tr>
                <tr>
                    <td align="center">
                        <asp:Button ID="btnYesEdit" runat="server" BackColor="#327FB5" ForeColor="White" Height="32px"
                            Style="height: 26px; font-weight: 700; line-height: 1em;" Text="Yes" Width="100px"
                            ValidationGroup="IndiCred" TabIndex="119" OnClick="Yes_Click" />
                    </td>
                    <td align="center">
                        <asp:Button ID="Button2" runat="server" BackColor="#327FB5" ForeColor="White" Height="32px"
                            Style="height: 26px; font-weight: 700; line-height: 1em;" Text="No" Width="100px"
                            ValidationGroup="IndiCred" TabIndex="119" OnClick="No_Click" />
                    </td>
                </tr>
            </table>
        </div>
    </asp:Panel>
    <div id="fade" class="black_overlay">
    </div>


    <asp:Panel ID="panel6" runat="server">
        <div id="divPSlite" class="white_content">
            <h3></h3>
            <a href="javascript:void(0)" onclick="document.getElementById('divPSlite').style.display='none';document.getElementById('divPSfade').style.display='none'">Close</a>
            <table width="100%" style="border: Solid 3px #b04547; width: 100%; height: 100%"
                cellpadding="0" cellspacing="0">
                <tr style="background-color: #b04547">
                    <td colspan="2" style="color: White; font-weight: bold; font-size: larger"
                        align="center"></td>
                </tr>
                <tr>
                    <td align="left" colspan="2">Do you want to change the status to phone screened?
                        </td>
                </tr>
                <tr>
                    <td align="left" colspan="2" style="height: 15px;"></td>
                </tr>
                <tr>
                    <td align="center">
                        <asp:Button ID="btnPSYes" runat="server" BackColor="#327FB5" ForeColor="White" Height="32px"
                            Style="height: 26px; font-weight: 700; line-height: 1em;" Text="Yes" Width="100px"
                            ValidationGroup="IndiCred" TabIndex="119" OnClick="btnPSYes_Click" />
                    </td>
                    <td align="center">
                        <asp:Button ID="btnPSNo" runat="server" BackColor="#327FB5" ForeColor="White" Height="32px"
                            Style="height: 26px; font-weight: 700; line-height: 1em;" Text="No" Width="100px"
                            ValidationGroup="IndiCred" TabIndex="119" OnClick="btnPSNo_Click" />
                    </td>
                </tr>
            </table>
        </div>
    </asp:Panel>
    <div id="divPSfade" class="black_overlay">
    </div>

    <asp:Panel ID="panel5" runat="server">
        <div id="litePassword" class="white_content">
            <%--<div id="litePassword" class="left"> --%>
            <h3>Password
                </h3>
            <a href="javascript:void(0)" onclick="document.getElementById('litePassword').style.display='none';document.getElementById('fadePassword').style.display='none'">Close</a>
            <table width="100%" style="border: Solid 3px #b04547; width: 100%; height: 70%"
                cellpadding="0" cellspacing="0">
                <tr>
                    <td align="center" style="height: 54px; width: 200px;">Enter Password To Change Status
                        </td>
                    <td align="center" style="height: 54px;">
                        <asp:TextBox ID="txtUserPassword" runat="server" placeholder="Enter Password" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Password" ControlToValidate="txtPassword" ValidationGroup="Password"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="2" style="height: 54px;">
                        <asp:Button ID="btnPassword" runat="server" BackColor="#327FB5" ForeColor="White" Height="32px"
                            Style="height: 26px; font-weight: 700; line-height: 1em;" Text="Save" Width="100px" ValidationGroup="Password"
                            TabIndex="119" OnClick="btnPassword_Click" />
                    </td>
                </tr>
            </table>
        </div>
    </asp:Panel>
    <div id="fadePassword" class="black_overlay">
    </div>
    <%--      </ContentTemplate>
    </asp:UpdatePanel>--%>
    <script src="../js/jquery.dd.min.js"></script>
    <script type="text/javascript">
        try {
            $("#<%=ddlstatus.ClientID%>").msDropDown();
        } catch (e) {
            alert(e.message);
        }

        //On UpdatePanel Refresh
        //debugger;
        var prm = Sys.WebForms.PageRequestManager.getInstance();
        if (prm != null) {
            // debugger;
            prm.add_beginRequest(function (sender, e) {
                if (sender._postBackSettings.panelsToUpdate != null) {
                    $(".loading").show();
                }
            });
            prm.add_endRequest(function (sender, e) {
                if (sender._postBackSettings.panelsToUpdate != null) {
                    $(".loading").hide();
                    try {
                        $("#<%=ddlstatus.ClientID%>").msDropDown();
                    } catch (e) {
                        alert(e.message);
                    }

                    alert('hi3');
                }
            });
        }
    </script>
    </label>
    </div>
</asp:Content>
