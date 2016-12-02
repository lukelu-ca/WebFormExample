using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Profile;
using System.Web.UI.HtmlControls;
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
            if (Request.IsAuthenticated && HttpContext.Current.Profile.GetPropertyValue("Theme").ToString() != "")
            {
                selectedTheme = HttpContext.Current.Profile.GetPropertyValue("Theme").ToString();
            }
            else
            {
                if (Request.Cookies["Theme"] != null) selectedTheme = Request.Cookies["Theme"].Value.ToString();
            }

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
            cookie.Expires = DateTime.Now.AddDays(expireDays);
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


        protected void ShowAlertMessage(HtmlGenericControl div, HtmlGenericControl msgbody = null, string msg = "")
        {
            div.Visible = true;
            div.Attributes.Remove("class");
            div.Attributes.Add("class", "alert alert-success");
            if (msg != "" && msgbody != null) msgbody.InnerText = msg;
        }
        protected void HideAlertMessage(HtmlGenericControl div)
        {
            div.Visible = false;
            div.Attributes.Remove("class");
            div.Attributes.Add("class", "hidden");
        }

        protected bool IsDefaultUser(string username = "")
        {
            if (Request.IsAuthenticated)
            {
                username = User.Identity.Name;
            }
            string defaultuser = ConfigurationManager.AppSettings["DefaultUsers"].ToLower();
            string[] usr = defaultuser.Split(',');
            return usr.Contains(username.ToLower());
        }
    }
}