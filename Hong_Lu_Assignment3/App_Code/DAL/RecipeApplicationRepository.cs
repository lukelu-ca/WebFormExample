using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebForm.Model;
/*
 * Author: Luke Lu
 * Student ID: 300804279
 * Course: COMP 229
 */
namespace WebForm.DAL
{
    /// <summary>
    /// RecipeRepository for recipe class
    /// implement IrecipeRepository
    /// </summary>
    public class RecipeApplicationRepository : IRecipeRepository
    {
        HttpApplication webApp;
        public RecipeApplicationRepository()
        {
            webApp = HttpContext.Current.ApplicationInstance;
        }

        public List<Recipe> GetRecipes()
        {
            return (List<Recipe>)webApp.Application["recipes"];
        }

        public void AddRecipe(Recipe r)
        {
            List<Recipe> list = GetRecipes();
            list.Add(r);
            webApp.Application["recipes"] = list;
        }

        public void UpdateRecipe(Recipe r)
        {
            throw new NotImplementedException();
        }

        public void DeleteRecipe(int RecipeID)
        {
            throw new NotImplementedException();
        }

        public List<Recipe> GetRecipes(string submitBy, string category, string ingredientName)
        {
            throw new NotImplementedException();
        }
    }
}