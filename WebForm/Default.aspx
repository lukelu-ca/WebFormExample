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
        <p>Download assignment instructions: <a href='documents/Assignment1.pdf'>#1</a>, <a href='documents/Assignment2.pdf'>#2</a>, <a href='documents/Assignment3.pdf'>#3</a>, <a href='documents/Assignment4.pdf'>#4</a>, <a href='documents/Assignment5.pdf'>#5</a></p>
        <p>According to the instructions, this project is developed by ASP.NET and HTML features. </p>
        <ul>
            <li>Create ASP.NET FORM Application</li>
            <li>Build Master Page, Theme, Skin File</li>
            <li>Realize to Changing Theme programmably</li>
            <li>Using ASP.NET Ajax, Custom Client and Server Validattion</li>
            <li>Loading Users Webcontrol dynamicly</li>
            <li>Implement CRUD operation by ADO.NET for Oracle and SQL Server</li>
            <li>Excuting stored procedure, function by ADO.NET in Oracle and SQL Server</li>
            <li>Changing database connectionstring dynamicly and save in users cookies</li>
            <li>Develop productive web design page by Bootstrap</li>
            <li>Opening Bootstrap remote modal window</li>
            <li>Implement ASPNET Membership by OracleProvider and SQLServerProvider</li>
            <li>Connecting to Amazon Web Service Cloud RDS Oracle Database</li>
            <li>Connecting to Microsoft Azure SQL Server Database</li>
            <li>Deploy application to Microsoft Azure</li>
            <li>Controlling Source Code through Github</li>
        </ul>
        <a class="btn btn-primary btn-lg pull-right" href="https://github.com/lukelu6666/WebFormExample" target="_blank">Get Source Code >>> </a>
    </div>

    <div class="row">
        <div class="col-md-4">
            <h3>About Luke</h3>
            <p>
                I am Luke.
                <br />
                I am an ASP.NET web developer.
               Through this project, I demostrate my skills in <code>C#</code>, <code>ASP.NET WebForm</code>, <code>Bootstrap CSS</code>, <code>Oracle</code>, <code>SQL Server</code>, etc.
                <br />

            </p>
            <img src="images/luke.jpg" class="img-circle" alt="Cinque Terre" width="304" height="236" />
        </div>
        <div class="col-md-4">
            <h3>Recipe Book</h3>
            <p>
                Anonymous user can read all recipes.
                <br />
                After signed up, you can share your recipe to all others.
             For demostration, you can try to use <code>admin</code> and <code>test</code> user to <a href="Login.aspx">Login</a> the system.
            </p>
            <img src="images/books.jpg" class="img-circle" alt="Cinque Terre" width="304" height="236" />
        </div>
        <div class="col-md-4">
            <h3>Setup</h3>
            <p>
                The settings of anonymous user are saved in <code>cookies</code>.<br />
                The settings of login user are saved in <code>profile</code>.<br />
                <a href="setup.aspx">Click here to setup a theme and database</a><br />
                <br />
            </p>
            <img src="images/theme.png" class="img-circle" alt="Cinque Terre" width="304" height="236" />
        </div>


    </div>
</asp:Content>

