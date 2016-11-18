<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucIngredient.ascx.cs" Inherits="WebForm.Web.ucIngredient" %>
<div class="row">
    <div class="col-sm-1 text-right"><%= Index %><asp:HiddenField ID="hfID" runat="server" /></div>
    <div class="col-sm-3">
        <asp:TextBox ID="txtName" runat="server" placeholder="Name"></asp:TextBox><asp:RequiredFieldValidator ID="rvTxtName" runat="server" ControlToValidate="txtName" ErrorMessage="Name is mandatory."></asp:RequiredFieldValidator>
    </div>
    <div class="col-sm-2">
        <asp:TextBox ID="txtQuantity" runat="server" placeholder="Quantity" ></asp:TextBox>
    </div>
    <div class="col-sm-2">
        <asp:TextBox ID="txtUnit" runat="server" placeholder="Unit"></asp:TextBox>
    </div>
    
    <div class="col-sm-2">
        <button id="btnDelete" runat="server" causesvalidation="False" onserverclick="btnDelete_Click" visible="True"><span class="glyphicon glyphicon-minus"></span></button>
        <button id="btnAdd" runat="server" causesvalidation="False" onserverclick="btnAdd_Click" visible="False"><span class="glyphicon glyphicon-plus"></span></button>
    </div>
</div>
