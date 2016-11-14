using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
/*
   * Author: Luke Lu
   * Student ID: 300804279
   * Course: COMP 229
   */
namespace WebForm.Web
{ 
    public partial class Setup : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                switch (Page.Theme)
                {
                    case "Dark":
                        rdDark.Checked = true;
                        break;
                    case "Light":
                        rdLight.Checked = true;
                        break;
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (rdDark.Checked)
            { Session["Theme"] = "Dark"; }
            else
            { Session["Theme"] = "Light"; }
            Response.Redirect("~/Setup.aspx");
        }


    }
}