<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="WebForm.Web._Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
        <title>Home</title>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="jumbotron">
        <h2>Luke's Recipe Book</h2>
    </div>
    <div class="row">
          <div class="col-md-4">
            <h3>About Luke</h3>
            <p>I am Luke. I like cooking, therefor I searched and kept many recipes from magazine, online and other place. Here I share my recipe book to everyone.<br /><br /></p>
            <img src="images/luke.jpg" class="img-circle" alt="Cinque Terre" width="304" height="236" />
        </div>
        <div class="col-md-4">
            <h3>My Recipe Book</h3>
            <p>My Recipe Book is ONE place to store and organize the recipes Luke find and tear out of magazines, bookmark online, store on faded recipe cards – in a format that can be carried & used directly in the kitchen. </p>
            <img src="images/books.jpg" class="img-circle" alt="Cinque Terre" width="304" height="236" />
        </div>
          <div class="col-md-4">
            <h3>Setup</h3>
            <p><a href="setup.aspx">Click here to setup a theme and database</a> <br /><br /><br /><br /></p>
            <img src="images/theme.png" class="img-circle" alt="Cinque Terre" width="304" height="236" />
        </div>
    

    </div>
</asp:Content>

