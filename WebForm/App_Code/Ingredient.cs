using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Ingredient
/// </summary>
public class Ingredient
{
    /// <summary>
    /// Name for the Ingredient class
    /// </summary>
    public String name { get; set; }
    public double quantity { get; set; }
    public String unit { get; set; }

    public Ingredient()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public Ingredient(string name, double quantity, string unit)
    {
        this.name = name;
        this.quantity = quantity;
        this.unit = unit;
    }
}