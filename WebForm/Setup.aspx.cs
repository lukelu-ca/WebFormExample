using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Web.Security;
using System.Web.Profile;


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
                    default:
                        rdDefault.Checked = true;
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

                //if loginuser get connectionstring from profile
                if (Request.IsAuthenticated && Profile.GetPropertyValue("CurrentConnectionStringName").ToString() != "")
                {
                    rblDataServer.SelectedValue = Profile.GetPropertyValue("CurrentConnectionStringName").ToString();
                }
                else
                {
                    //if anonyouse user get form cookie or default value
                    rblDataServer.SelectedValue = GetCookie("CurrentConnectionStringName", ConfigurationManager.AppSettings["DefaultConnectionStringName"]);
                }
                if (Convert.ToBoolean(Request.QueryString["save"]))
                {
                    ShowAlertMessage(divMessage);
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string theme;
            if (rdDark.Checked)
            {
                theme = "Dark";
            }
            else if (rdLight.Checked)
            {
                theme = "Light";
            }
            else
            {
                theme = "Default";
            }

            //if use logged in, save setting value to profile
            if (Request.IsAuthenticated)
            {
                HttpContext.Current.Profile.SetPropertyValue("CurrentConnectionStringName", rblDataServer.SelectedValue);
                HttpContext.Current.Profile.SetPropertyValue("Theme", theme);
            }
            else
            {
                SetCookie("Theme", theme);
                SetCookie("CurrentConnectionStringName", rblDataServer.SelectedValue);
            }
            Session["CurrentConnectionStringNameChanged"] = true;
            Response.Redirect("~/Setup.aspx?save=true");
        }


    }
}