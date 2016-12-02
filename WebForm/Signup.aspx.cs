using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace WebForm.Web
{
    public partial class Signup : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SignUpButton_Click(object sender, EventArgs e)
        {
            if (!IsValid) return;

            try
            {
                string existUserName = Membership.GetUserNameByEmail(Email.Text);
                if (existUserName != null && existUserName != "")
                {
                    ShowAlertMessage(divMessage, divMessageBody, "This email address was already signed up.");
                    return;
                }
                MembershipUser usr = Membership.CreateUser(UserName.Text, Password.Text, Email.Text);
                Roles.AddUserToRole(usr.UserName, "Normal");
                //Membership.ValidateUser(UserName.Text, Password.Text);
                // Response.Redirect("/login.aspx");
                HideAlertMessage(divMessage);
                plSignUp.Visible = false;
                plSuccess.Visible = true;
            }
            catch (Exception ex)
            {
                ShowAlertMessage(divMessage, divMessageBody, ex.Message);
            }
        }
    }
}