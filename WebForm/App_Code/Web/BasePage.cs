using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
/*
 * Author: Luke Lu
 * Student ID: 300804279
 * Course: COMP 229
 */
namespace WebForm.Web
{
    /// <summary>
    /// Summary description for BasePage
    /// </summary>
    public class BasePage : System.Web.UI.Page
    {

        protected string selectedTheme;
        public BasePage()
        {
            //
            // TODO: Add constructor logic here
            //
        }


        protected void Page_PreInit(object sender, EventArgs e)
        {
            selectedTheme = (string)Session["Theme"];
            //Load Theme for all pages
            switch (selectedTheme)
            {
                case "Dark":
                    Page.Theme = "Dark";
                    break;
                case "Light":
                    Page.Theme = "Light";
                    break;
                default:
                    Page.Theme = "Dark";
                    break;
            }
        }

    }
}