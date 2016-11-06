<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Recipes.aspx.cs" Inherits="Recipes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">

        <h3><span class="glyphicon glyphicon-book"></span> List of Recipes</h3>

        <asp:ListView ID="lvRecipes" runat="server" DataSourceID="RecipeDataSource">
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
                        <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
                    </td>
                    <td>
                        <asp:Label ID="submitByLabel" runat="server" Text='<%# Eval("submitBy") %>' />
                    </td>
                    <td>
                        <asp:Label ID="cookingTimeLabel" runat="server" Text='<%# Eval("cookingTime") %>' />
                    </td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table id="itemPlaceholderContainer" runat="server" class="table table-striped">
                    <thead>
                        <tr runat="server">
                            <th runat="server">Name</th>
                            <th runat="server">Submit By</th>
                            <th runat="server">Prepare Time</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr id="itemPlaceholder" runat="server">
                        </tr>
                    </tbody>
                </table>
            </LayoutTemplate>
        </asp:ListView>
        <asp:ObjectDataSource ID="RecipeDataSource" runat="server" SelectMethod="GetRecipes" TypeName="RecipeRepository"></asp:ObjectDataSource>
    </div>

</asp:Content>

