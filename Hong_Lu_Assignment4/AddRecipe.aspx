<%@ Page Title="" Language="C#" Debug="true" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddRecipe.aspx.cs" Inherits="WebForm.Web.AddRecipe" %>

<%@ Register Src="~/UserControls/ucListEditIngedient.ascx" TagPrefix="uc1" TagName="ucListEditIngedient" %>
<%@ Register Src="~/UserControls/ucCategories.ascx" TagPrefix="uc1" TagName="ucCategories" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Add Recipe</title>
    <script type="text/javascript">
        function validateTxtCategory(oSrc, args) {
            args.IsValid = (args.Value.toString().trim() != "") && (args.Value.toString().trim().toLowerCase() != "other");
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="container">
        <div class="hidden alert-success" runat="server" id="divMessage">
            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            <span id="divMessageBody" runat="server">Recipe was saved successfully.</span>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3><span class="glyphicon glyphicon-plus"></span>&nbsp;Add Recipe</h3>
            </div>
            <div class="panel-body">
                <div class="form-group">
                    <label for="txtName">Name:</label>
                    &nbsp;<asp:RequiredFieldValidator ID="rvTxtName" runat="server" ControlToValidate="txtName" ErrorMessage="Name is mandatory."></asp:RequiredFieldValidator>
                    <asp:TextBox ID="txtName" runat="server" MaxLength="50"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="txtSubmitBy">Submitted By: </label>
                    &nbsp;<asp:RequiredFieldValidator ID="rvTxtSubmitBy" runat="server" ErrorMessage="Submit by is mandatory." ControlToValidate="txtSubmitBy"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="txtSubmitBy" runat="server" MaxLength="50"></asp:TextBox>
                </div>
                <div class="form-group">

                    <label for="ddlCategory">Category:</label>
                    <uc1:ucCategories runat="server" ID="ucCategories1" />
                </div>
                <div class="form-group">
                    <label for="txtCookingTime">Prepare/Cooking Time (Minutes):</label>
                    <asp:TextBox ID="txtCookingTime" runat="server" TextMode="Number" MaxLength="5"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="txtNumberOfServings">Number of Servings:</label>
                    &nbsp;<asp:RequiredFieldValidator ID="rvTxtNumberOfServings" runat="server" ErrorMessage="Number of Servings is mandatory." ControlToValidate="txtNumberOfServings"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="txtNumberOfServings" runat="server" TextMode="Number" MaxLength="5"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="txtescription">Recipe Description:</label>
                    &nbsp;<asp:RequiredFieldValidator ID="rvTxtDescription" runat="server" ErrorMessage="Description is mandatory." ControlToValidate="txtDescription"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="txtDescription" runat="server" Height="80px" TextMode="MultiLine" MaxLength="2000"></asp:TextBox>
                </div>
                <div class="row">
                    <div class="col-sm-2">
                        <h3>Ingredients:</h3>
                    </div>
                </div>
                <uc1:ucListEditIngedient runat="server" ID="ucListEditIngedient1" />
                <div class="form-inline">
                    <button id="btnAddRecipe" type="submit" class="btn btn-primary" runat="server" onserverclick="btnAddRecipe_Click">&nbsp;&nbsp;<span class="glyphicon glyphicon-ok"></span>&nbsp;&nbsp;Save&nbsp;&nbsp;</button>
                    <button id="btnCancelRecipe" type="reset" class="btn btn-default" runat="server" onserverclick="btnCancelRecipe_Click" causesvalidation="False">&nbsp;&nbsp;<span class="glyphicon glyphicon-remove"></span>&nbsp;&nbsp;Cancel&nbsp;&nbsp;</button>
                </div>
                <div class="hidden alert-success" runat="server" id="divMessage2">
                    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                    <span id="diveMessageBody2" runat="server">Recipe was saved successfully.</span>
                </div>
                <p>
                </p>
            </div>
        </div>
    </div>
    <script src="Scripts/AlterAutoHidden.js"></script>
</asp:Content>

