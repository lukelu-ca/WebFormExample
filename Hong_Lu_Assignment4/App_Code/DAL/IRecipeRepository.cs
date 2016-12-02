using System.Collections.Generic;
using WebForm.Model;
/*
 * Author: Luke Lu
 * Student ID: 300804279
 * Course: COMP 229
 */
namespace WebForm.DAL
{

    /// <summary>
    /// Summary description for IRecipeRepository
    /// </summary>
    public interface IRecipeRepository
    {
        List<Recipe> GetRecipes();
        void AddRecipe(Recipe r);
        void UpdateRecipe(Recipe r);
        void DeleteRecipe(int RecipeID);

        List<Recipe> GetRecipes(string submitBy, string category, string ingredientName);
    }
}