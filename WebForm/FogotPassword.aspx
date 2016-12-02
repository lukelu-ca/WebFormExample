<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="FogotPassword.aspx.cs" Inherits="WebForm.Web.FogotPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Reset Password</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div class="hidden alert-success" runat="server" id="divMessage">
            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            <span id="divMessageBody" runat="server"></span>
        </div>
        <div class="panel panel-default" runat="server" id="plSignUp">
            <div class="panel-heading">
                <h3><span class="glyphicon glyphicon-tasks"></span>&nbsp;Reset Password</h3>
            </div>
            <div class="panel-body form-horizontal text-left">
                <asp:PasswordRecovery ID="PasswordRecovery1"
                    runat="server" Width="100%"
                    MailDefinition-BodyFileName="~/EmailTemplates/ChangePassword.html"
                    MailDefinition-IsBodyHtml="true"
                    MailDefinition-Subject="Password Reset for http://luke-webform.azurewebsites.net"
                    OnVerifyingUser="PasswordRecovery1_VerifyingUser">

                    <UserNameTemplate>

                        <div class="form-group row">
                            <div class="col-md-2">
                                <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name:</asp:Label>
                            </div>
                            <div class="col-md-3">
                                <asp:TextBox ID="UserName" runat="server" ToolTip="Enter your User Name to receive your password."></asp:TextBox>

                            </div>
                            <div class="col-md-1">
                                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="PasswordRecovery1">*</asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-md-2"></div>
                            <div class="col-md-3">
                                <asp:Button ID="SubmitButton" CssClass="btn btn-primary btn-md" runat="server" CommandName="Submit" Text="Submit" ValidationGroup="PasswordRecovery1" />
                            </div>
                        </div>
                        <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>

                    </UserNameTemplate>
                    <SuccessTemplate>
                        <div class="well">
                            Your password has been sent to you, please check your email.
                            <a href="Login.aspx">Click here to login</a>

                        </div>
                    </SuccessTemplate>

                </asp:PasswordRecovery>

            </div>
        </div>


    </div>
</asp:Content>

