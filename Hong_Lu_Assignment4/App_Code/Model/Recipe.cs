using System;
using System.Collections.Generic;

/*
 * Author: Luke Lu
 * Student ID: 300804279
 * Course: COMP 229
 */
namespace WebForm.Model
{
    [Serializable]
    /// <summary>
    /// Summary description for Recipe
    /// </summary>
    public class Recipe
    {
        public int id { get; set; }
        public string name { get; set; }
        public string submitBy { get; set; }
        public string category { get; set; }
        public int cookingTime { get; set; }
        public int numberOfServings { get; set; }
        public string description { get; set; }

        /// <summary>
        /// Store the recipe's ingredients
        /// </summary>
        public List<Ingredient> ingredients { get; set; }


        public Recipe()
        {
            //initialize the value
            this.ingredients = new List<Ingredient>();
        }


    }
}