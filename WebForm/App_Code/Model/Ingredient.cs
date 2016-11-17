/*
 * Author: Luke Lu
 * Student ID: 300804279
 * Course: COMP 229
 */
using System;

namespace WebForm.Model
{
    [Serializable]
    /// <summary>
    /// Summary description for Ingredient
    /// </summary>
    public class Ingredient
    {
        /// <summary>
        /// Name for the Ingredient class
        /// </summary>
        /// 
        public int id { get; set; }
        public string name { get; set; }
        public string quantity { get; set; }
        public string unit { get; set; }
        public int recipeid { get; set; }

    }
}