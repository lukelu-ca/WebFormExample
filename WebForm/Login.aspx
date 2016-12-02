<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="WebForm.Web.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Login</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <asp:Login ID="Login1" runat="server" OnAuthenticate="Login1_Authenticate" Width="100%">
            <LayoutTemplate>

                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3><span class="glyphicon glyphicon-log-in"></span>&nbsp;Log In</h3>
                    </div>
                    <div class="panel-body form-horizontal">
                        <div class="form-group row">
                            <div class="col-md-2">
                                <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name:</asp:Label>
                            </div>
                            <div class="col-md-3">
                                <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-1">
                                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-md-2">
                                <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                            </div>
                            <div class="col-md-3">
                                <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                            </div>
                            <div class="col-md-1">
                                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>

                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-md-2"></div>
                            <div class="col-md-3">
                                <asp:CheckBox ID="RememberMe" runat="server" Text="Remember me next time." />
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-md-2"></div>
                            <div class="col-md-6">
                                <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-md-2"></div>
                            <div class="col-md-6 text-left">
                                <a href="/Signup.aspx">Create an account</a>
                                &nbsp;
                                <a href="/FogotPassword.aspx">Forgot password</a>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-md-2"></div>
                            <div class="col-md-3">
                                <asp:Button ID="LoginButton" CssClass="btn btn-primary btn-md" runat="server" CommandName="Login" Text="Log In" ValidationGroup="Login1" />
                            </div>
                        </div>

                    </div>
                </div>


            </LayoutTemplate>
        </asp:Login>
        <div class="well">
            There are already two users, <kbd>admin</kbd> is a administrator role, <kbd>test</kbd> is a normal role.
        <ul>

            <li>User Name: <kbd>admin</kbd>, Password: <kbd>Abcd.1234</kbd></li>
            <li>User Name: <kbd>test</kbd>,&nbsp;&nbsp; Password: <kbd>Abcd.1234</kbd></li>

        </ul>
        </div>
    </div>
</asp:Content>

