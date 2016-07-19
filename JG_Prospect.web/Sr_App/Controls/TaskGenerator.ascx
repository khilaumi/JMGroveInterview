﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TaskGenerator.ascx.cs" Inherits="JG_Prospect.Sr_App.Controls.TaskGenerator" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TaskGenerator.ascx.cs" Inherits="JG_Prospect.Sr_App.UserControls.TaskGenerator" %>
<link rel="stylesheet" href="css/jquery-ui.css" />
<script>
    $(function () {
        $("#divModal").dialog({
            modal: true,
            autoOpen: false,
            height: 600,
            width: 800,
            buttons: {
                Ok: function () {
                    $(this).dialog("close");
                }
            }
        });
    });
    function EditTask(id) {
        $('#divModal').dialog("open");
    }
</script>
<style>
    table tr th {
        border: 1px solid;
        padding: 0px;
    }

    table.table tr.trHeader {
        background: #000000;
        color: #ffffff;
    }

    .FirstRow {
        background: #f57575;
        padding: 2px;
    }

    .AlternateRow {
        background: #f6f1f3;
        padding: 2px;
    }
</style>
<div class="right_panel" style="color: #000000;">
    <div class="">
        <asp:UpdatePanel ID="upnlTasks" runat="server">
            <ContentTemplate>
                <span>
                    <a id="btnAdd" class="btn btn-primary" onclick="EditTask(0);">Add New</a>
                    <asp:TextBox ID="txtSearch" placeholder="Search" runat="server"></asp:TextBox>
                    <span class="glyphicon glyphicon-search form-control-feedback"></span>
                    Filter by :
                    
                    <asp:DropDownList ID="ddlDesignation" runat="server">
                    </asp:DropDownList>
                    <asp:DropDownList ID="ddlAssignTo" runat="server">
                    </asp:DropDownList>
                    <asp:DropDownList ID="ddlTaskStatus" runat="server">
                        <asp:ListItem Text="--Status--" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Assigned" Value="1"></asp:ListItem>
                        <asp:ListItem Text="In Progress" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Pending" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Re-Opened"></asp:ListItem>
                        <asp:ListItem Text="Closed"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:TextBox ID="txtCreatedDate" runat="server"></asp:TextBox>
                    <asp:Button ID="btnSearch" runat="server" CssClass="ui-button" OnClick="btnSearch_Click" Text="Search" />
                    <br />
                    <div>
                        <asp:GridView ID="gvTasks" runat="server" CssClass="table" CellSpacing="0" CellPadding="0" BorderStyle="Solid" BorderWidth="1" AutoGenerateColumns="False">
                            <HeaderStyle CssClass="trHeader " />
                            <RowStyle CssClass="FirstRow" />
                            <AlternatingRowStyle CssClass="AlternateRow " />
                            <Columns>
                                <asp:BoundField DataField="InstallId" HeaderText="Install ID" />
                                <asp:TemplateField HeaderText="Task Title">
                                    <ItemTemplate>
                                        <asp:HyperLink ID="hypTask" runat="server"><%# Eval("Title") %></asp:HyperLink>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Designation">
                                    <ItemTemplate>
                                        <asp:Label ID="lblUserDesignation" runat="server" Text='<%# Eval("Designation") %>'></asp:Label>
                                        <%-- <asp:DropDownList ID="ddlRole" runat="server">
                                            <asp:ListItem Text="Sr.Developer"></asp:ListItem>
                                            <asp:ListItem Text="Jr.Developer"></asp:ListItem>
                                        </asp:DropDownList>--%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Assigned To">
                                    <ItemTemplate>
                                        <asp:Label ID="lblAssignedUser" runat="server" Text='<%# Eval("FristName") %>'></asp:Label>
                                        <%--<asp:DropDownList ID="ddlRole" runat="server">
                                            <asp:ListItem Text="Sr.Developer"></asp:ListItem>
                                            <asp:ListItem Text="Jr.Developer"></asp:ListItem>
                                        </asp:DropDownList>--%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Status">
                                    <ItemTemplate>
                                        <asp:Label ID="lblTaskStatus" runat="server"></asp:Label>
                                        <%--<asp:DropDownList ID="ddlRole" runat="server">
                                            <asp:ListItem Text="Sr.Developer"></asp:ListItem>
                                            <asp:ListItem Text="Jr.Developer"></asp:ListItem>
                                        </asp:DropDownList>--%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>

                        <%--<table class="table" cellspacing="0" cellpadding="0" border="1" style="border: 1px solid;">
                            <thead>
                                <tr class="trHeader">
                                    <th>Install ID</th>
                                    <th>Task Title</th>
                                    <th>Designation</th>
                                    <th>Assigned</th>
                                    <th>Status</th>
                                    <th>Notes</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr class="FirstRow">
                                    <th>6-16-16_1</th>
                                    <th>
                                        <a href="#" onclick="EditTask(1)">Transfer Order to Approval
                                        </a>
                                    </th>
                                    <th>
                                        
                                    </th>
                                    <th>
                                        <asp:DropDownList ID="ddlAssign" runat="server">
                                            <asp:ListItem Text="Dharmendra"></asp:ListItem>
                                            <asp:ListItem Text="Shabir"></asp:ListItem>
                                        </asp:DropDownList>
                                    </th>
                                    <th>
                                        <asp:DropDownList ID="ddlStatus" runat="server">
                                            <asp:ListItem Text="Pending"></asp:ListItem>
                                            <asp:ListItem Text="Done"></asp:ListItem>
                                        </asp:DropDownList>
                                    </th>
                                    <th>Testing Notes Field</th>
                                </tr>
                                <tr class="AlternateRow">
                                    <th>6-16-16_2</th>
                                    <th>
                                        <a href="#" onclick="EditTask(2)">Assign Task for Dharmendra-Team
                                        </a>
                                    </th>
                                    <th>
                                        <asp:DropDownList ID="DropDownList5" runat="server">
                                            <asp:ListItem Text="Sr.Developer"></asp:ListItem>
                                            <asp:ListItem Text="Jr.Developer"></asp:ListItem>
                                        </asp:DropDownList>
                                    </th>
                                    <th>
                                        <asp:DropDownList ID="DropDownList4" runat="server">
                                            <asp:ListItem Text="Dharmendra"></asp:ListItem>
                                            <asp:ListItem Text="Shabir"></asp:ListItem>
                                        </asp:DropDownList>
                                    </th>
                                    <th>
                                        <asp:DropDownList ID="DropDownList6" runat="server">
                                            <asp:ListItem Text="Pending"></asp:ListItem>
                                            <asp:ListItem Text="Done"></asp:ListItem>
                                        </asp:DropDownList>
                                    </th>
                                    <th>Updated to dharmendra</th>
                                </tr>
                                <tr class="FirstRow">
                                    <th>6-16-16_1</th>
                                    <th>
                                        <a href="#" onclick="EditTask(1)">Transfer Order to Approval
                                        </a>
                                    </th>
                                    <th>
                                        <asp:DropDownList ID="DropDownList8" runat="server">
                                            <asp:ListItem Text="Sr.Developer"></asp:ListItem>
                                            <asp:ListItem Text="Jr.Developer"></asp:ListItem>
                                        </asp:DropDownList>
                                    </th>
                                    <th>
                                        <asp:DropDownList ID="DropDownList7" runat="server">
                                            <asp:ListItem Text="Dharmendra"></asp:ListItem>
                                            <asp:ListItem Text="Shabir"></asp:ListItem>
                                        </asp:DropDownList>
                                    </th>
                                    <th>
                                        <asp:DropDownList ID="DropDownList9" runat="server">
                                            <asp:ListItem Text="Pending"></asp:ListItem>
                                            <asp:ListItem Text="Done"></asp:ListItem>
                                        </asp:DropDownList>
                                    </th>
                                    <th>Testing Notes Field</th>
                                </tr>
                            </tbody>
                        </table>--%>
                    </div>
            </ContentTemplate>
        </asp:UpdatePanel>

    </div>
</div>
<div id="divModal" title="Task : Title">
    <hr />
    <table class="table" style="">
        <tr>
            <td>Task Title:</td>
            <td>
                <asp:TextBox ID="txtTaskTitle" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Task Description:</td>
            <td>
                <asp:TextBox ID="txtDescription" TextMode="MultiLine" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Designation:</td>
            <td>
                <asp:DropDownList ID="DropDownList2" runat="server">
                    <asp:ListItem Text="Sr.Developer"></asp:ListItem>
                    <asp:ListItem Text="Jr.Developer"></asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>Assigned:</td>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server">
                    <asp:ListItem Text="Dharmendra"></asp:ListItem>
                    <asp:ListItem Text="Shabir"></asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>Staus:</td>
            <td>
                <asp:DropDownList ID="DropDownList3" runat="server">
                    <asp:ListItem Text="Pending"></asp:ListItem>
                    <asp:ListItem Text="Started"></asp:ListItem>
                    <asp:ListItem Text="Submitted"></asp:ListItem>
                    <asp:ListItem Text="Approve"></asp:ListItem>
                    <asp:ListItem Text="Reject"></asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>User Acceptance:</td>
            <td>
                <asp:DropDownList ID="ddlUserAcceptance" runat="server">
                    <asp:ListItem Text="Accept"></asp:ListItem>
                    <asp:ListItem Text="Reject"></asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>Due Date:</td>
            <td>
                <asp:TextBox ID="txtDueDate" runat="server">
                </asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Hrs of Task:</td>
            <td>
                <asp:TextBox ID="txtHours" runat="server">
                </asp:TextBox>
            </td>
        </tr>
        <%--            <tr>
                <td></td>
                <td>
                    <asp:Button ID="btnSave" Text="Save" CssClass="ui-button" runat="server"></asp:Button>
                </td>
            </tr>--%>
    </table>
    <div class="grid">

        <table class="table" cellspacing="0" cellpadding="0" style="border: 1px solid; width: 100%">
            <thead class="trHeader">
                <tr>
                    <th>User</th>
                    <th>Status</th>
                    <th>Note</th>
                    <th>Files</th>
                    <th>DateTime</th>
                </tr>
            </thead>
            <tbody style="border: 1px solid; padding: 10px;">
                <tr class="">
                    <td>Justine</td>
                    <td>Started</td>
                    <td>Almost worked</td>
                    <td>0</td>
                    <td>6/12/2016</td>
                </tr>
                <tr class="">
                    <td>Dharmendra</td>
                    <td>Submitted</td>
                    <td>Done all work</td>
                    <td>1</td>
                    <td>6/14/2016</td>
                </tr>
            </tbody>
        </table>
    </div>

    <br />
    <table cellspacing="0" cellpadding="0" width="950px" border="1" style="width: 100%; border-collapse: collapse;">
        <tr>
            <td>Notes:
            </td>
            <td>
                <asp:TextBox ID="txtLog" runat="server" TextMode="MultiLine" Width="400px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Attachment:
            </td>
            <td>
                <asp:FileUpload ID="fuUpload" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <div style="padding-left: 40px; padding-top: 20px;" class="btn_sec">
                    <asp:Button ID="btnNotes" runat="server" Text="Add Notes" CssClass="ui-button" />
                </div>
            </td>
        </tr>
    </table>
</div>
