<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Setup.aspx.cs" Inherits="WebForm.Web.Setup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
        <title>Settings</title>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3><span class="glyphicon glyphicon-cog"></span> Select a theme</h3>
            </div>
            <div class="panel-body">
                <p>
                    There are two themes of this application, please select one from below:
                </p>

                <div class="radio">
                    <asp:RadioButton ID="rdDark" runat="server" GroupName="rdTheme" Text="Dark" />
                </div>
                <div class="radio">
                    <asp:RadioButton ID="rdLight" runat="server" GroupName="rdTheme" Text="Light" />
                </div>

                <p>
                    <button id="btbSave" runat="server" onserverclick="btnSave_Click" class='btn btn-primary'>&nbsp;&nbsp;<span class="glyphicon glyphicon-ok"></span>&nbsp;Save&nbsp;&nbsp;</button>
                </p>
            </div>
        </div>


    </div>



</asp:Content>

