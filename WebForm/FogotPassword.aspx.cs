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
namespace WebForm.Web { 
public partial class FogotPassword : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }



        protected void PasswordRecovery1_VerifyingUser(object sender, LoginCancelEventArgs e)
        {
            if (IsDefaultUser(PasswordRecovery1.UserName))
            {
                ShowAlertMessage(divMessage, divMessageBody, "User " + PasswordRecovery1.UserName + " is a default user, the password can not be retrieved.");
                e.Cancel = true;
            }

        }
    }
}