using System;
using WebForm.DAL;
using System.Web;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

/*
* Author: Luke Lu
* Student ID: 300804279
* Course: COMP 229
*/

namespace WebForm.Web

{
    public partial class Recipes : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void ListView1_ItemCommand(object sender, System.Web.UI.WebControls.ListViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteItem")
            {
                RecipeDataBaseRepository repo = new RecipeDataBaseRepository();
                repo.DeleteRecipe(Convert.ToInt32(e.CommandArgument));
                ListView1.DataBind();
                ShowAlertMessage(divMessage);

            }
        }


        protected void ListView1_ItemDataBound(object sender, System.Web.UI.WebControls.ListViewItemEventArgs e)
        {
            if (e.Item.ItemType == System.Web.UI.WebControls.ListViewItemType.DataItem)
            {
                Button btn = (Button)e.Item.FindControl("DeleteItemButton");
                HtmlGenericControl lbl = (HtmlGenericControl)e.Item.FindControl("submitByLabel");

                //if user does not signin, delete button is invisible
                btn.Visible = Request.IsAuthenticated;
                //recipe can only deleted by the submitted user or role adiministrators
                btn.Enabled = User.IsInRole("Administrators") || lbl.InnerText == User.Identity.Name;
            }
        }
    }
}