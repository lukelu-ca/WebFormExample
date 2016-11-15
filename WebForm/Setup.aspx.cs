using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

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

                for (int i = 0; i < ConfigurationManager.ConnectionStrings.Count; i++)
                {
                    if (ConfigurationManager.ConnectionStrings[i].Name.StartsWith("My-"))
                        rblDataServer.Items.Add(new ListItem
                        {

                            Value = ConfigurationManager.ConnectionStrings[i].Name,
                            Text = ConfigurationManager.AppSettings[ConfigurationManager.ConnectionStrings[i].Name]
                        });
                }

                rblDataServer.SelectedValue = GetCookie("CurrentConnectionStringName", ConfigurationManager.AppSettings["DefaultConnectionStringName"]);
                if (Convert.ToBoolean(Request.QueryString["save"]))
                {
                    divMessage.Attributes.Remove("class");
                    divMessage.Attributes.Add("class", "alert alert-success");
                    divMessage.InnerText = "Settings were saved successfully.";
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (rdDark.Checked)
            {
                SetCookie("Theme", "Dark");
            }
            else
            {
                SetCookie("Theme", "Light");
            }
            SetCookie("CurrentConnectionStringName", rblDataServer.SelectedValue);
            Session["CurrentConnectionStringNameChanged"] = true;
            Response.Redirect("~/Setup.aspx?save=true");
        }


    }
}