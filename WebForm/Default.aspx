<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="WebForm.Web._Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Home</title>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="jumbotron">
        <h2>Luke's Recipe Book</h2>
        <p>
            This is an assignment project for the course COMP229 Advance Web Application Develop.<br />
        </p>
        <p>Click to download Assignment instructions: <a href='~/documents/Assignment1.pdf'>#1</a>, <a href='~/documents/Assignment1.pdf'>#2</a>, <a href='~/documents/Assignment1.pdf'>#3</a></p>
        <p>According the instructions, this project is using the below ASP.NET features. </p>
        <ul>
            <li>ASP.NET FORM Application</li>
            <li>Master Page</li>
            <li>Theme, Skin file</li>
            <li>Change theme programmably</li>
            <li>Users webcontrol</li>
            <li>ADO.NET for Oracle</li>
            <li>ADO.NET for SQL Server</li>
            <li>Setting database server dynamicly</li>
            <li>Bootstrap Css</li>
            <li>Bootstrap remote modal method</li>
        </ul>

    </div>
    <div class="row">
        <div class="col-md-4">
            <h3>About Luke</h3>
            <p>
                I am Luke. I like cooking, therefor I searched and kept many recipes from magazine, online and other place. Here I share my recipe book to everyone.<br />
                <br />
            </p>
            <img src="images/luke.jpg" class="img-circle" alt="Cinque Terre" width="304" height="236" />
        </div>
        <div class="col-md-4">
            <h3>My Recipe Book</h3>
            <p>My Recipe Book is ONE place to store and organize the recipes Luke find and tear out of magazines, bookmark online, store on faded recipe cards – in a format that can be carried & used directly in the kitchen. </p>
            <img src="images/books.jpg" class="img-circle" alt="Cinque Terre" width="304" height="236" />
        </div>
        <div class="col-md-4">
            <h3>Setup</h3>
            <p>
                <a href="setup.aspx">Click here to setup a theme and database</a>
                <br />
                <br />
                <br />
                <br />
            </p>
            <img src="images/theme.png" class="img-circle" alt="Cinque Terre" width="304" height="236" />
        </div>


    </div>
</asp:Content>

