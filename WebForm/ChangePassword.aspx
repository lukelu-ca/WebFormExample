<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="WebForm.Web.ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Change Password</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div class="hidden alert-success" runat="server" id="divMessage">
            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            <span id="divMessageBody" runat="server"></span>
        </div>

        <div class="panel panel-default">
            <div class="panel-heading">
                <h3><span class="glyphicon glyphicon-tasks"></span>&nbsp;Change Password</h3>
            </div>
            <div class="panel-body">
                <div class="form-group row">
                    <div class="col-md-2">
                        <asp:Label ID="CurrentPasswordLabel" runat="server" AssociatedControlID="CurrentPassword">Old Password:</asp:Label>
                    </div>
                    <div class="col-md-3">
                        <asp:TextBox ID="CurrentPassword" runat="server" TextMode="Password"></asp:TextBox>
                    </div>
                    <div class="col-md-4">
                        <asp:RequiredFieldValidator ID="CurrentPasswordRequired" runat="server" ControlToValidate="CurrentPassword" ErrorMessage="Current Password is required." ToolTip="CurrentPassword is required." ValidationGroup="ChangePassword">*</asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-md-2">
                        <asp:Label ID="NewPasswordLabel" runat="server" AssociatedControlID="NewPassword">New Password:</asp:Label>
                    </div>
                    <div class="col-md-3">
                        <asp:TextBox ID="NewPassword" runat="server" TextMode="Password"></asp:TextBox>
                    </div>
                    <div class="col-md-4">
                        <asp:RequiredFieldValidator ID="NewPasswordRequired" runat="server" ControlToValidate="NewPassword" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="ChangePassword">*</asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-md-2">
                        <asp:Label ID="ConfirmPasswordLabel" runat="server" AssociatedControlID="ConfirmPassword">Confirm Password:</asp:Label>
                    </div>
                    <div class="col-md-3">
                        <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                    </div>
                    <div class="col-md-7">
                        <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" ControlToValidate="ConfirmPassword" ErrorMessage="Confirm Password is required." ToolTip="Confirm Password is required." ValidationGroup="ChangePassword">*</asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="The confirm password must match the New Password entry." ValidationGroup="ChangePassword" ControlToCompare="ConfirmPassword" ControlToValidate="NewPassword"></asp:CompareValidator>
                    </div>
                </div>

                <div class="form-group row">
                    <div class="col-md-2"></div>
                    <div class="col-md-3">
                        <asp:Button ID="ChangePasswordPushButton" CssClass="btn btn-primary btn-md" runat="server" OnClick="ChangePasswordPushButton_Click" Text="Change Password" ValidationGroup="ChangePassword" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

