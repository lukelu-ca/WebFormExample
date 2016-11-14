using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebForm.DAL;
using WebForm.Model;
using System.Web.UI.HtmlControls;
/*
 * Author: Luke Lu
 * Student ID: 300804279
 * Course: COMP 229
 */

namespace WebForm.Web
{

    public partial class Details : BasePage
    {
        private int recipeID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null)
            {
                //show Recipe details
                recipeID = int.Parse(Request.QueryString["id"]);
                RecipeDataBaseRepository repo = new RecipeDataBaseRepository();
                Recipe recipe = repo.GetRecipe(recipeID);
                divTitle.InnerText = "Recipe Details: " + recipe.name;
                divCategory.InnerHtml = String.Format("<h5>{0}</h5>", recipe.category);
                divCookingTime.InnerHtml = String.Format("<h5>{0}</h5>", recipe.cookingTime.ToString());
                divNumberOfServings.InnerHtml = String.Format("<h5>{0}</h5>", recipe.numberOfServings.ToString());
                divSubmitBy.InnerHtml = String.Format("<h5>{0}</h5>", recipe.submitBy);
                divDescription.InnerHtml = String.Format("<h5>{0}</h5>", recipe.description);

                //show Ingredients details
                foreach (Ingredient ing in recipe.ingredients)
                {
                    HtmlTableRow row = new HtmlTableRow();
                    HtmlTableCell cell = new HtmlTableCell();
                    cell.InnerText = ing.name;
                    row.Cells.Add(cell);
                    cell = new HtmlTableCell();
                    cell.InnerText = ing.quantity;
                    row.Cells.Add(cell);
                    cell = new HtmlTableCell();
                    cell.InnerText = ing.unit;
                    row.Cells.Add(cell);
                    tbl.Rows.Add(row);
                }
            }
        }
    }
}