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
                if (!Page.IsPostBack)
                {
                    LoadDeitals();
                }
            }
        }

        private void LoadDeitals()
        {
            //show Recipe details
            plDetails.Visible = true;
            plUpdate.Visible = false;

            if (Request.QueryString["success"] == "true")
            {
                ShowAlertMessage(divMessage);
            }
            else
            {
                HideAlertMessage(divMessage);
            }

            recipeID = int.Parse(Request.QueryString["id"]);
            RecipeDataBaseRepository repo = new RecipeDataBaseRepository();
            Recipe recipe = repo.GetRecipe(recipeID);
            divTitle.InnerText = recipe.name;
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
            //if user does not login, can not modify the data
            btnModify.Visible = isAuthenticated(recipe.submitBy);
        }


        private bool isAuthenticated(string submitBy)
        {
            return (User.IsInRole("Administrators") || submitBy == User.Identity.Name);
        }

        protected void btnModify_ServerClick(object sender, EventArgs e)
        {
            if (Request.IsAuthenticated)
                LoadUpdate();
        }

        private void LoadUpdate()
        {
            HideAlertMessage(divMessage);
            recipeID = int.Parse(Request.QueryString["id"]);
            RecipeDataBaseRepository repo = new RecipeDataBaseRepository();
            Recipe recipe = repo.GetRecipe(recipeID);

            //check Authenticate
            if (isAuthenticated(recipe.submitBy))
            {
                plDetails.Visible = false;
                plUpdate.Visible = true;
               // ShowAlertMessage(divMessage);

                txtName.Text = recipe.name;
                txtSubmitBy.Text = recipe.submitBy;
                txtSubmitBy.ReadOnly = true;
                txtSubmitBy.CssClass = "form-control";
                txtCookingTime.Text = recipe.cookingTime.ToString();
                txtNumberOfServings.Text = recipe.numberOfServings.ToString();
                txtDescription.Text = recipe.description;
                ucCategories1.Value = recipe.category;

                ucListEditIngedient1.Initialize(recipe.ingredients);
            }

        }

        protected void btnUdate_ServerClick(object sender, EventArgs e)
        {
            //check Authenticate
            if (Page.IsValid && isAuthenticated(txtSubmitBy.Text))
            {
                Recipe r = new Recipe
                {
                    id = Convert.ToInt32(Request.QueryString["id"]),
                    name = txtName.Text,
                    // submitBy = txtSubmitBy.Text,
                    category = ucCategories1.Value,
                    cookingTime = Convert.ToInt32(txtCookingTime.Text),
                    numberOfServings = Convert.ToInt32(txtNumberOfServings.Text),
                    description = txtDescription.Text
                };
                r.ingredients = ucListEditIngedient1.ingredients;
                new RecipeDataBaseRepository().UpdateRecipe(r);
                Response.Redirect("Details.aspx?id=" + Request.QueryString["id"] + "&success=true");

            }

        }

        protected void btnCancel_ServerClick(object sender, EventArgs e)
        {
            Response.Redirect("Details.aspx?id=" + Request.QueryString["id"]);
        }
    }
}