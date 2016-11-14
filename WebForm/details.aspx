<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Details.aspx.cs" Inherits="WebForm.Web.Details" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h3 class="modal-title" runat="server" id="divTitle"></h3>
        </div>
        <div class="modal-body">
            <div class="row">
                <div class="col-sm-3"><strong>Submit By: </strong></div>
                <div class="col-sm-3" runat="server" id="divSubmitBy"></div>
                <div class="col-sm-3"><strong>Category:</strong> </div>
                <div class="col-sm-3" runat="server" id="divCategory"></div>
            </div>
            <div class="row">
                <div class="col-sm-3"><strong>Prepare Time:</strong></div>
                <div class="col-sm-3" runat="server" id="divCookingTime"></div>
                <div class="col-sm-3"><strong>Number of Servings:</strong></div>
                <div class="col-sm-3" runat="server" id="divNumberOfServings"></div>
            </div>
            <div class="row">
                <div class="col-sm-3"><strong>Description:</strong></div>
            </div>
            <div class="row">
                <div class="col-sm-12" runat="server" id="divDescription"></div>
            </div>
            <div class="row">
                <div class="col-sm-3"><strong>Ingredients:</strong></div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <table class="table" runat="server" id="tbl">
                        <tr>
                            <th>Name</th>
                            <th>Quantity</th>
                            <th>Unit</th>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
    </div>
</body>
</html>
