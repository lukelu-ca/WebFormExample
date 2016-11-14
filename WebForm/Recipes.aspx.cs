using System;
using WebForm.DAL;
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
                divMessage.Attributes.Remove("class");
                divMessage.Attributes.Add("class", "alert alert-success");
                divMessage.InnerText = "Recipe was deleted successfully.";

            }
        }
    }
}