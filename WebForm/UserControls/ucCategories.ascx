<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucCategories.ascx.cs" Inherits="WebForm.Web.UserControls_ucCategories" %>

<asp:UpdatePanel class="form-inline text-left" ID="UpdatePanel1" runat="server">
    <ContentTemplate>

        <asp:DropDownList ID="ddlCategory"  runat="server" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
        <asp:TextBox ID="txtCategory"  runat="server" Visible="False"></asp:TextBox>
        <asp:CustomValidator ID="cvTxtCategory" runat="server" ErrorMessage="Category is mandatory and can't be Other." ControlToValidate="txtCategory" ValidateEmptyText="True" ClientValidationFunction="validateTxtCategory" Visible="False"></asp:CustomValidator>
    </ContentTemplate>
</asp:UpdatePanel>

