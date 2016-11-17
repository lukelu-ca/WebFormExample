<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Details.aspx.cs" Inherits="WebForm.Web.Details" %>

<%@ Register Src="~/UserControls/ucListEditIngedient.ascx" TagPrefix="uc1" TagName="ucListEditIngedient" %>
<%@ Register Src="~/UserControls/ucCategories.ascx" TagPrefix="uc1" TagName="ucCategories" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Recipe Details</title>

    <script type="text/javascript">
        function validateTxtCategory(oSrc, args) {
            args.IsValid = (args.Value.toString().trim() != "") && (args.Value.toString().trim().toLowerCase() != "other");
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="container">
        <div class="hidden alert-success" runat="server" id="divMessage">
            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            <span id="divMessageBody" runat="server">Recipe was updated successfully.</span>
        </div>

        <div runat="server" id="plDetails" visible="false">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3><span class="glyphicon glyphicon-list-alt"></span>&nbsp;Recipe Name: <span runat="server" id="divTitle"></span></h3>
                </div>
                <div class="panel-body">

                    <div class="row">
                        <div class="col-sm-3">
                            <h5>Submit By: </h5>
                        </div>
                        <div class="col-sm-2" runat="server" id="divSubmitBy"></div>
                        <div class="col-sm-5">
                            <h5>Category:</h5>
                        </div>
                        <div class="col-sm-2" runat="server" id="divCategory"></div>
                    </div>
                    <div class="row">
                        <div class="col-sm-3">
                            <h5>Prepare Time:</h5>
                        </div>
                        <div class="col-sm-2" runat="server" id="divCookingTime"></div>
                        <div class="col-sm-5">
                            <h5>Number of Servings:</h5>
                        </div>
                        <div class="col-sm-2" runat="server" id="divNumberOfServings"></div>
                    </div>
                    <div class="row">
                        <div class="col-sm-3">
                            <h5><strong>Description:</strong></h5>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12" runat="server" id="divDescription"></div>
                    </div>
                </div>
                <div class="panel-footer">

                    <div class="row">
                        <div class="col-sm-3">
                            <h3>Ingredients:</h3>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <table class="table" runat="server" id="tbl">
                                <tr>
                                    <th>Name</th>
                                    <th>Quantity</th>
                                    <th>Unit</th>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <div class="pull-right">
                <button id="btnModify" class="btn btn-lg btn-primary" runat="server" onserverclick="btnModify_ServerClick">Modify</button>
            </div>
        </div>


        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <div runat="server" id="plUpdate" visible="false">
            <div class="panel panel-default">
                <div class="panel-heading form-inline">
                    <h3><span class="glyphicon glyphicon-edit"></span>&nbsp;Recipe Name:                    
                    <asp:TextBox ID="txtName" runat="server" MaxLength="50"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rvTxtName" runat="server" ControlToValidate="txtName" ErrorMessage="*"></asp:RequiredFieldValidator>
                    </h3>
                </div>
                <div class="panel-body">

                    <div class="row form-inline">
                        <div class="col-md-2">
                            <h5>Submit By: </h5>
                        </div>
                        <div class="col-md-3">

                            <asp:TextBox ID="txtSubmitBy" runat="server" MaxLength="50" CssClass="form-control"></asp:TextBox><br />
                            <asp:RequiredFieldValidator ID="rvTxtSubmitBy" runat="server" ErrorMessage="*" ControlToValidate="txtSubmitBy"></asp:RequiredFieldValidator>

                        </div>
                        <div class="col-md-2">
                            <h5>Category:</h5>
                        </div>
                        <div class="col-lg-5">
                            <uc1:ucCategories runat="server" ID="ucCategories1" />
                        </div>
                    </div>
                    <div class="row form-inline">
                        <div class="col-md-2">
                            <h5>Prepare Time:</h5>
                        </div>
                        <div class="col-md-3">
                            <asp:TextBox ID="txtCookingTime" runat="server" TextMode="Number" MaxLength="5"></asp:TextBox>
                        </div>
                        <div class="col-md-2">
                            <h5>Number of Servings:</h5>
                        </div>
                        <div class="col-md-5">
                            <asp:TextBox ID="txtNumberOfServings" runat="server" TextMode="Number" MaxLength="5"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rvTxtNumberOfServings" runat="server" ErrorMessage="*" ControlToValidate="txtNumberOfServings"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3">
                            <h5><strong>Description:</strong></h5>
                        </div>
                    </div>
                    <div class="row">
                        <asp:TextBox ID="txtDescription" runat="server" Height="120px" TextMode="MultiLine" MaxLength="2000"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rvTxtDescription" runat="server" ErrorMessage="*" ControlToValidate="txtDescription"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="panel-footer">

                    <div class="row">
                        <div class="col-sm-3">
                            <h3>Ingredients:</h3>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <uc1:ucListEditIngedient runat="server" ID="ucListEditIngedient1" />
                        </div>
                    </div>
                </div>
            </div>
            <div class="pull-right">
                <button id="btnUdate" class="btn btn-lg btn-primary" runat="server" onserverclick="btnUdate_ServerClick">Update</button>
                <button id="btnCancel" class="btn btn-lg btn-default" runat="server" onserverclick="btnCancel_ServerClick" causesvalidation="False">Cancel</button>
            </div>
        </div>

    </div>
</asp:Content>

