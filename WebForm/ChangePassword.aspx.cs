using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
/*
   * Author: Luke Lu
   * Student ID: 300804279
   * Course: COMP 229
   */
namespace WebForm.Web
{
    public partial class ChangePassword : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void ChangePasswordPushButton_Click(object sender, EventArgs e)
        {
            if (!IsValid) return;
            //can't change password for default users, admin, test
            if (IsDefaultUser())
            {
                ShowAlertMessage(divMessage, divMessageBody, "User " + User.Identity.Name + " is a default user, the password can not be changed.");
                return;
            }
            MembershipUser usr = Membership.GetUser(User.Identity.Name);
            
            try
            {
                if (usr.ChangePassword(CurrentPassword.Text, NewPassword.Text))
                {
                    ShowAlertMessage(divMessage, divMessageBody, "Password changed.");
                }
                else
                {
                    ShowAlertMessage(divMessage, divMessageBody, "Password change failed. Please re-enter your values and try again.");
                }
            }
            catch (Exception ex)
            {
                ShowAlertMessage(divMessage, divMessageBody, "An exception occurred: " + Server.HtmlEncode(ex.Message) + ". Please re-enter your values and try again.");
            }
        }
    }
}