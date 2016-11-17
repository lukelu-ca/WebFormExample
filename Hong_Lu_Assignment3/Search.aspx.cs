using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebForm.DAL;
/*
   * Author: Luke Lu
   * Student ID: 300804279
   * Course: COMP 229
   */
namespace WebForm.Web
{
    public partial class Search : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSearch_ServerClick(object sender, EventArgs e)
        {
            RecipeDataBaseRepository repo = new RecipeDataBaseRepository();
            ListView1.DataSource = repo.GetRecipes(txtSubmitBy.Text, txtCategory.Text, txtIngredient.Text);
            ListView1.DataBind();
        }
    }
}