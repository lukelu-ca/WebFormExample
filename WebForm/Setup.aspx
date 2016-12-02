<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Setup.aspx.cs" Inherits="WebForm.Web.Setup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Settings</title>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div class="hidden alert-success" runat="server" id="divMessage">
            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            <span id="divMessageBody" runat="server">Settings were saved successfully.</span>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3><span class="glyphicon glyphicon-cog"></span>&nbsp;Select a theme</h3>
            </div>
            <div class="panel-body">


                <div class="radio">
                    <asp:RadioButton ID="rdDefault" runat="server" GroupName="rdTheme" Text="Default" /> <br />
                    <asp:RadioButton ID="rdDark" runat="server" GroupName="rdTheme" Text="Dark" /><br />
                    <asp:RadioButton ID="rdLight" runat="server" GroupName="rdTheme" Text="Light" />
                </div>

            </div>
        </div>

        <div class="panel panel-default">
            <div class="panel-heading">
                <h3><span class="glyphicon glyphicon-cloud"></span>&nbsp;Select Database Source</h3>
            </div>
            <div class="panel-body">
                <div class="radio">
                    <asp:RadioButtonList ID="rblDataServer" runat="server"></asp:RadioButtonList>
                </div>
            </div>
        </div>



        <p>
            <button id="btbSave" runat="server" onserverclick="btnSave_Click" class='btn btn-primary'>&nbsp;&nbsp;<span class="glyphicon glyphicon-ok"></span>&nbsp;Save&nbsp;&nbsp;</button>
        </p>


    </div>
</asp:Content>

