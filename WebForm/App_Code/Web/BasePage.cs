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

        protected string selectedTheme = null;
        public BasePage()
        {
            //
            // TODO: Add constructor logic here
            //
        }


        protected void Page_PreInit(object sender, EventArgs e)
        {
            if (Request.Cookies["Theme"] != null) selectedTheme = Request.Cookies["Theme"].Value.ToString();
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
                    Page.Theme = "Default";
                    break;
            }
        }



        public void SetCookie(string name, string value, int expireDays = 15)
        {
            HttpCookie cookie = new HttpCookie(name, value);
            cookie.Expires= DateTime.Now.AddDays(expireDays);
            Response.SetCookie(cookie);
        }


        public string GetCookie(string name, string defaultValue = null)
        {
            if (Request.Cookies[name] != null)
            {
                return Request.Cookies[name].Value.ToString();
            }
            else
            {
                return defaultValue;
            }
        }

    }
}