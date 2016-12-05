using System;
using System.Web.UI;
using System.Data;
using WebForm.Model;
using WebForm.DAL;
using System.Collections.Generic;

/*
 * Author: Luke Lu
 * Student ID: 300804279
 * Course: COMP 229
 */
namespace WebForm.Web
{

    public partial class AddRecipe : BasePage

    {

        protected void Page_Load(object sender, EventArgs e)
        {
            Page.MaintainScrollPositionOnPostBack = true;

            if (!Page.IsPostBack)
            {
                //When load page
                //Bind Cateory Dropdown list
                ucListEditIngedient1.Initialize(new List<Ingredient>() { new Ingredient { name = string.Empty, quantity = string.Empty, unit = string.Empty } });
                if (Request.QueryString["success"] == "true")
                {
                    ShowAlertMessage(divMessage);
                }
                else
                {
                    HideAlertMessage(divMessage);
                }
                txtSubmitBy.Text = User.Identity.Name;
                txtSubmitBy.ReadOnly = true;
            }

        }
        

        //Save Recipe button is clicked
        protected void btnAddRecipe_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Recipe r = new Recipe
                {
                    name = txtName.Text,
                    submitBy = User.Identity.Name,  //txtSubmitBy.Text,
                    category = ucCategories1.Value,
                    cookingTime = Convert.ToInt32(txtCookingTime.Text),
                    numberOfServings = Convert.ToInt32(txtNumberOfServings.Text),
                    description = txtDescription.Text
                };
                r.ingredients = ucListEditIngedient1.ingredients;
                new RecipeDataBaseRepository().AddRecipe(r);
                Response.Redirect("AddRecipe.aspx?success=true");
            }

        }

        //Cancel recipe button is clicked
        protected void btnCancelRecipe_Click(object sender, EventArgs e)
        {
            Response.Redirect(Request.Url.ToString());
        }

    }
}