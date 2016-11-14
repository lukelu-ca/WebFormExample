<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Search.aspx.cs" Inherits="WebForm.Web.Search" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Search Recipes</title>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3><span class="glyphicon glyphicon-search"></span>&nbsp;Search Recipe</h3>
            </div>

            <div class="panel-body form-horizontal">
                <div class="form-group">
                    <label class="control-label col-sm-2" for="txtSubmitBy">Submit By:</label>
                    <div class="col-sm-10">
                        <asp:TextBox CssClass="form-control" ID="txtSubmitBy" runat="server" placeholder="All"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="txtCategory">Category:</label>
                    <div class="col-sm-10">
                        <asp:TextBox CssClass="form-control" ID="txtCategory" runat="server" placeholder="All"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="txtIngredient">Ingredient Name:</label>
                    <div class="col-sm-10">
                        <asp:TextBox CssClass="form-control" ID="txtIngredient" runat="server" placeholder="All"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="btnSearch"></label>
                    <div class="col-sm-10">
                        <button id="btnSearch" class="btn btn-primary" onserverclick="btnSearch_ServerClick" runat="server">&nbsp;&nbsp;<span class="glyphicon glyphicon-ok"></span>&nbsp;&nbsp;Search&nbsp;&nbsp;</button>
                    </div>
                </div>
                <asp:ListView ID="ListView1" runat="server"
                    DataKeyNames="id">
                    <EmptyDataTemplate>
                        <table runat="server" class="table">
                            <tr>
                                <td>No data was returned.</td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>

                    <ItemTemplate>
                        <tr>
                            <td>
                                <a href='details.aspx?id=<%# Eval("id") %>' data-target='#myModal<%# Eval("id") %>' data-toggle="modal"><%# Eval("name") %></a>
                                <div class="modal fade" id='myModal<%# Eval("id") %>' role="dialog">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="btn-warning"><span class="glyphicon glyphicon-refresh glyphicon-refresh-animate"></span> Loading...</div>
                                        </div>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <asp:Label ID="submitByLabel" runat="server" Text='<%# Eval("submitBy") %>' />
                            </td>

                            <td>
                                <asp:Label ID="cookingTimeLabel" runat="server" Text='<%# Eval("cookingTime") %>' />
                            </td>
                            <td>
                                <asp:Label ID="numberOfServingsLabel" runat="server" Text='<%# Eval("numberofservings") %>' />
                            </td>

                        </tr>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <table class="table">
                            <tr runat="server">
                                <th runat="server">Name</th>
                                <th runat="server">Submi tBy</th>
                                <th runat="server">Prepare Time</th>
                                <th runat="server">Number Of Servings</th>
                            </tr>
                            <tr id="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </LayoutTemplate>
                </asp:ListView>

            </div>
        </div>
    </div>
</asp:Content>

