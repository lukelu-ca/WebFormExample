<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DetailsModal.aspx.cs" Inherits="WebForm.Web.DetailsModal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h2 class="modal-title" runat="server" id="divTitle"></h2>
        </div>
        <div class="modal-body">
            <div class="row">
                <div class="col-sm-3"><h5>Submitted By: </h5></div>
                <div class="col-sm-2" runat="server" id="divSubmitBy"></div>
                <div class="col-sm-5"><h5>Category:</h5> </div>
                <div class="col-sm-2" runat="server" id="divCategory"></div>
            </div>
            <div class="row">
                <div class="col-sm-3"><h5>Prepare Time:</h5></div>
                <div class="col-sm-2" runat="server" id="divCookingTime"></div>
                <div class="col-sm-5"><h5>Number of Servings:</h5></div>
                <div class="col-sm-2" runat="server" id="divNumberOfServings"></div>
            </div>
            <div class="row">
                <div class="col-sm-3"><h4>Description:</h4></div>
            </div>
            <div class="row">
                <div class="col-sm-12" runat="server" id="divDescription"></div>
            </div>
            <div class="row">
                <div class="col-sm-3"><h3>Ingredients:</h3></div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <table class="table  table-striped table-hover" runat="server" id="tbl">
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
