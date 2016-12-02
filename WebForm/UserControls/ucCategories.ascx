<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucCategories.ascx.cs" Inherits="WebForm.Web.UserControls_ucCategories" %>
<div class="form-inline">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:DropDownList ID="ddlCategory" cssClass="form-control" runat="server" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
            <asp:TextBox ID="txtCategory"  cssClass="form-control"  runat="server" Visible="False"></asp:TextBox>
            <asp:CustomValidator ID="cvTxtCategory" runat="server" ErrorMessage="Category is mandatory and can't be Other." ControlToValidate="txtCategory" ValidateEmptyText="True" ClientValidationFunction="validateTxtCategory" Visible="False"></asp:CustomValidator>
        </ContentTemplate>
    </asp:UpdatePanel>
</div>
