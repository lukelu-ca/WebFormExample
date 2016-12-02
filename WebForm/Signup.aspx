<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Signup.aspx.cs" Inherits="WebForm.Web.Signup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Sign Up</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div class="hidden alert-success" runat="server" id="divMessage">
            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            <span id="divMessageBody" runat="server"></span>
        </div>
        <div class="panel panel-default" runat="server" id="plSignUp">
            <div class="panel-heading">
                <h3><span class="glyphicon glyphicon-user"></span>&nbsp;Sign Up</h3>
            </div>
            <div class="panel-body form-horizontal">
                <div class="form-group row">
                    <div class="col-md-2">
                        <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name:</asp:Label>
                    </div>
                    <div class="col-md-3">
                        <asp:TextBox ID="UserName"  runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-1">
                        <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="SignUp">*</asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-md-2">
                        <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email">Email:</asp:Label>
                    </div>
                    <div class="col-md-3">
                        <asp:TextBox ID="Email"  runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-4">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Email" ErrorMessage="Email is required." ToolTip="Email is required." ValidationGroup="SignUp">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Email is invalid." ValidationExpression="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?" ControlToValidate="Email"></asp:RegularExpressionValidator>
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-md-2">
                        <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                    </div>
                    <div class="col-md-3">
                        <asp:TextBox ID="Password"  runat="server" TextMode="Password"></asp:TextBox>
                    </div>
                    <div class="col-md-4">
                        <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="SignUp">*</asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-md-2">
                        <asp:Label ID="ConfirmPasswordLabel" runat="server" AssociatedControlID="ConfirmPassword">Confirm Password:</asp:Label>
                    </div>
                    <div class="col-md-3">
                        <asp:TextBox ID="ConfirmPassword"  runat="server" TextMode="Password"></asp:TextBox>
                    </div>
                    <div class="col-md-4">
                        <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" ControlToValidate="ConfirmPassword" ErrorMessage="ConfirmPassword is required." ToolTip="ConfirmPassword is required." ValidationGroup="SignUp">*</asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Confirm Password must match the Password entry." ValidationGroup="SignUp" ControlToCompare="Password" ControlToValidate="ConfirmPassword"></asp:CompareValidator>
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-md-2"></div>
                    <div class="col-md-3">
                        <asp:Button ID="SignUpButton" CssClass="btn btn-primary" runat="server" OnClick="SignUpButton_Click" Text="Sign Up" ValidationGroup="SignUp" />
                    </div>
                </div>
            </div>
        </div>

        <div class="well" runat="server" id="plSuccess" visible="false">
            SignUp was successful.
            <a href="Login.aspx">Click here to login</a>

        </div>
    </div>
</asp:Content>

