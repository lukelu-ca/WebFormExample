<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucListEditIngedient.ascx.cs" Inherits="WebForm.Web.UserControls_ucListEditIngedient" %>
<%@ Register Src="~/UserControls/ucIngredient.ascx" TagPrefix="uc1" TagName="ucIngredient" %>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <asp:PlaceHolder ID="plIngredients" runat="server"></asp:PlaceHolder>
    </ContentTemplate>
</asp:UpdatePanel>
