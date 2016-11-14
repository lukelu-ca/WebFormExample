<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Recipes.aspx.cs" Inherits="WebForm.Web.Recipes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>All Recipes</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div class=" hidden alert-success" runat="server" id="divMessage"></div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3><span class="glyphicon glyphicon-book"></span>&nbsp;List of Recipes </h3>
            </div>
            <div class="panel-body">
                <asp:ListView ID="ListView1" runat="server"
                    DataSourceID="RecipeDataSource"
                    DataKeyNames="id"
                    OnItemCommand="ListView1_ItemCommand">
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
                                            <div class="alert alert-warning"><span class="glyphicon glyphicon-refresh glyphicon-refresh-animate"></span> Loading...</div>
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
                                <asp:Button ID="DeleteItemButton" runat="server" CommandName="DeleteItem" CommandArgument='<%# Eval("id") %>' Text="Delete" />
                            </td>
                        </tr>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <table class="table">
                            <tr runat="server">
                                <th runat="server">Name</th>
                                <th runat="server">Submi tBy</th>
                                <th runat="server">Prepare Time</th>
                                <th runat="server"></th>
                            </tr>
                            <tr id="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </LayoutTemplate>
                </asp:ListView>
            </div>

            <asp:ObjectDataSource ID="RecipeDataSource" runat="server" SelectMethod="GetRecipes" TypeName="WebForm.DAL.RecipeDataBaseRepository" DataObjectTypeName="WebForm.Model.Recipe"></asp:ObjectDataSource>
        </div>
    </div>

</asp:Content>

