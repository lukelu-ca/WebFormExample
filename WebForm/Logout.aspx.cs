﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace WebForm.Web
{ 
public partial class Logout : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
            FormsAuthentication.SignOut();
            Response.Redirect("Login.aspx");
    }
}
}