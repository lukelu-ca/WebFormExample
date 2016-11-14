using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Recipe
/// </summary>
public class Recipe
{
    public String name { get; set; }
    public String submitBy { get; set; }
    public String category { get; set; }
    public int cookingTime { get; set; }
    public int numberOfServings { get; set; }
    public String description {get;set;}

    /// <summary>
    /// Store the recipe's ingredients
    /// </summary>
    public List<Ingredient> ingredients { get; set; }


    public Recipe()
    {
        //initialize the value
        this.ingredients = new List<Ingredient>();
    }

    public Recipe(String name, String submitBy, String category, 
                   int cookingTime, int numberofServings, 
                   String description) : base()
    {
        this.name = name;
        this.submitBy = submitBy;
        this.category = category;
        this.cookingTime = cookingTime;
        this.category = category;
        this.numberOfServings = numberOfServings;
        this.description = description;
    }

    public void addIngredients(Ingredient ing)
    {
        ingredients.Add(ing);
    }
}