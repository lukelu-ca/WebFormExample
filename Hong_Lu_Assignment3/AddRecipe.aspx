<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddRecipe.aspx.cs" Inherits="WebForm.Web.AddRecipe" %>

<%@ Register Src="~/UserControls/ucIngredient.ascx" TagName="ucIngredient" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Add Recipe</title>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

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
                    <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="txtSubmitBy">Submit By: </label>
                    &nbsp;<asp:RequiredFieldValidator ID="rvTxtSubmitBy" runat="server" ErrorMessage="Submit by is mandatory." ControlToValidate="txtSubmitBy"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="txtSubmitBy" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="ddlCategory">Category:</label>
                    <asp:DropDownList ID="ddlCategory" runat="server"></asp:DropDownList>
                </div>
                <div class="form-group">
                    <label for="txtCookingTime">Prepare/Cooking Time (Minutes):</label>
                    <asp:TextBox ID="txtCookingTime" runat="server" TextMode="Number"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="txtNumberOfServings">Number of Servings:</label>
                    &nbsp;<asp:RequiredFieldValidator ID="rvTxtNumberOfServings" runat="server" ErrorMessage="Number of Servings is mandatory." ControlToValidate="txtNumberOfServings"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="txtNumberOfServings" runat="server" TextMode="Number"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="txtescription">Recipe Description:</label>
                    &nbsp;<asp:RequiredFieldValidator ID="rvTxtDescription" runat="server" ErrorMessage="Description is mandatory." ControlToValidate="txtDescription"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="txtDescription" runat="server" Height="80px" TextMode="MultiLine"></asp:TextBox>
                </div>
                <div class="row">
                    <div class="col-sm-2">
                        <h3>Ingredients:</h3>
                    </div>
                </div>
                <asp:PlaceHolder ID="plIngredients" runat="server"></asp:PlaceHolder>
                <div class="form-inline">
                    <button id="btnAddRecipe" class="btn btn-primary" runat="server" onserverclick="btnAddRecipe_Click">&nbsp;&nbsp;<span class="glyphicon glyphicon-ok"></span>&nbsp;&nbsp;Save&nbsp;&nbsp;</button>
                    <button id="btnCancelRecipe" class="btn btn-default" runat="server" onserverclick="btnCancelRecipe_Click" causesvalidation="False">&nbsp;&nbsp;<span class="glyphicon glyphicon-remove"></span>&nbsp;&nbsp;Cancel&nbsp;&nbsp;</button>
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
</asp:Content>

