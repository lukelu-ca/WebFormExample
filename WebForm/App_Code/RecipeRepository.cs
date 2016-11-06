using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// RecipeRepository for recipe class
/// </summary>
public class RecipeRepository
{
    HttpApplication webApp;
    public RecipeRepository()
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
}