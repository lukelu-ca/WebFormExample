using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
/*
   * Author: Luke Lu
   * Student ID: 300804279
   * Course: COMP 229
   */
namespace WebForm.Web
{
    public partial class Login : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
        {

            if (e.Authenticated = Membership.ValidateUser(Login1.UserName, Login1.Password))
                FormsAuthentication.RedirectFromLoginPage(Login1.UserName, Login1.RememberMeSet);
        }
    }
}