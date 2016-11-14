using System;
using System.Collections.Generic;
using WebForm.Model;
using System.Configuration;
using System.Data;
using System.Data.Common;
/*
 * Author: Luke Lu
 * Student ID: 300804279
 * Course: COMP 229
 */
namespace WebForm.DAL
{
    /// <summary>
    /// Summary description for RecipeDataBaseRepository
    /// </summary>
    public class RecipeDataBaseRepository : IRecipeRepository
    {
        //factory object
        private DbProviderFactory factory;
        private DbConnection conn;
        public RecipeDataBaseRepository()
        {
            //
            // use factory mod to build ADO.NET
            //
            //Get Provider: which is one of Oracle.ManagedAccess.Client and System.Data.SQLClient
            factory = DbProviderFactories.GetFactory(ConfigurationManager.ConnectionStrings["ConnectionString"].ProviderName);
        }

        /// <summary>
        /// private function to get a DbConnection string
        /// if private variable conn is null create a connection from factory
        /// if conn is not null, return conn
        /// </summary>
        /// <returns></returns>
        private DbConnection getConnection()
        {
            //connection object
            if (conn == null)
            {
                //Create a conncetion
                conn = factory.CreateConnection();
                //Get Connection string from web.config
                conn.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

                //Open Connection
                conn.Open();
            }
            return conn;
        }




        /// <summary>
        /// insert a recipe record to database
        /// </summary>
        /// <param name="r"></param>
        public void AddRecipe(Recipe r)
        {
            DbCommand cmd = factory.CreateCommand();
            cmd.Connection = getConnection();

            //execute procedure
            /*  PROCDUE CONTENT:
             *  
                create or replace procedure 
                INSERT_RECIPE_SP
                (v_recipeid out number,
                 v_name in  nvarchar2,
                 v_submitby in  nvarchar2,
                  v_category in  nvarchar2,
                  v_cookingtime in number,
                  v_numberOfServings in number,
                  v_description in nvarchar2
                )
                IS
                BEGIN
                  INSERT INTO RR_RECIPE VALUES (sq_recipe_id.nextval,v_name,v_submitby,v_category,v_cookingtime,v_numberOfServings,v_description);
                  select sq_recipe_id.currval into v_recipeid from dual;
                END INSERT_RECIPE_SP;
            */
            cmd.CommandText = "INSERT_RECIPE_SP";
            cmd.CommandType = CommandType.StoredProcedure;

            //start create recipe recorder

            DbParameter para = factory.CreateParameter();
            para.ParameterName = "v_recipeid";
            para.DbType = DbType.Int32;
            para.Direction = ParameterDirection.Output;
            cmd.Parameters.Add(para);

            para = factory.CreateParameter();
            para.ParameterName = "v_name";
            para.DbType = DbType.String;
            para.Value = r.name;
            cmd.Parameters.Add(para);

            para = factory.CreateParameter();
            para.ParameterName = "v_submitby";
            para.DbType = DbType.String;
            para.Value = r.submitBy;
            cmd.Parameters.Add(para);

            para = factory.CreateParameter();
            para.ParameterName = "v_category";
            para.DbType = DbType.String;
            para.Value = r.category;
            cmd.Parameters.Add(para);

            para = factory.CreateParameter();
            para.ParameterName = "v_cookingTime";
            para.DbType = DbType.Int32;
            para.Value = r.cookingTime;
            cmd.Parameters.Add(para);

            para = factory.CreateParameter();
            para.ParameterName = "v_numberOfServings";
            para.DbType = DbType.Int32;
            para.Value = r.numberOfServings;
            cmd.Parameters.Add(para);

            para = factory.CreateParameter();
            para.ParameterName = "v_description";
            para.Value = r.description;
            para.DbType = DbType.String;
            cmd.Parameters.Add(para);



            cmd.ExecuteNonQuery();

            //end of create recipe record

            //get recipeid from  sequence currval
            int recipeID = int.Parse(cmd.Parameters["v_recipeid"].Value.ToString());

            //start create ingredients recorders

            foreach (Ingredient ing in r.ingredients)
            {
                cmd = factory.CreateCommand();
                cmd.Connection = getConnection();
                cmd.CommandType = CommandType.Text;
                /*
                 * INSERT Statement
                 */
                cmd.CommandText = "INSERT INTO RR_INGREDIENT (id,name,quantity,unit,recipeid) VALUES (SQ_INGREDIENT_ID.NEXTVAL, :name, :quantity, :unit, :recipeid)";

                para = factory.CreateParameter();
                para.ParameterName = "name";
                para.Value = ing.name;
                para.DbType = DbType.String;
                cmd.Parameters.Add(para);

                para = factory.CreateParameter();
                para.ParameterName = "quantity";
                para.DbType = DbType.String;
                para.Value = ing.quantity;
                cmd.Parameters.Add(para);

                para = factory.CreateParameter();
                para.ParameterName = "unit";
                para.DbType = DbType.String;
                para.Value = ing.unit;
                cmd.Parameters.Add(para);

                para = factory.CreateParameter();
                para.ParameterName = "recipeid";
                para.DbType = DbType.Int32;
                para.Value = recipeID;
                cmd.Parameters.Add(para);

                cmd.ExecuteNonQuery();
            }

        }


        /// <summary>
        /// delete a recipe record base on recipeID
        /// </summary>
        /// <param name="id"></param>
        public void DeleteRecipe(int id)
        {
            DbCommand cmd = factory.CreateCommand();
            cmd.CommandText = "DELETE FROM rr_ingredient WHERE recipeid= :recipeid";
            cmd.Connection = getConnection();
            cmd.CommandType = CommandType.Text;

            DbParameter para = factory.CreateParameter();
            para.ParameterName = "recipeid";
            para.DbType = DbType.Int32;
            para.Value = id;
            cmd.Parameters.Add(para);

            cmd.ExecuteNonQuery();

            cmd = factory.CreateCommand();
            cmd.Connection = getConnection();
            cmd.CommandText = "DELETE FROM rr_recipe WHERE id= :rid";
            para = factory.CreateParameter();
            para.ParameterName = "rid";
            para.DbType = DbType.Int32;
            para.Value = id;
            cmd.Parameters.Add(para);
            cmd.ExecuteNonQuery();


        }

        /// <summary>
        ///  get a recipe by recipeID
        /// </summary>
        /// <param name="recipeId"></param>
        /// <returns></returns>
        public Recipe GetRecipe(int recipeId)
        {
            DbCommand cmd = factory.CreateCommand();
            cmd.CommandText = "Select * from RR_RECIPE WHERE id= :rid";
            cmd.Connection = getConnection();
            cmd.CommandType = CommandType.Text;

            DbParameter para = factory.CreateParameter();
            para.ParameterName = "rid";
            para.DbType = DbType.Int32;
            para.Value = recipeId;
            cmd.Parameters.Add(para);

            DbDataReader reader = cmd.ExecuteReader();
            Recipe r = null;
            if (reader != null && reader.Read())
            {
                r = GetRecipe(reader);
            }
            return r;

        }
        /// <summary>
        /// return a recipe object from a reader recorder
        /// </summary>
        /// <param name="reader"></param>
        /// <returns></returns>
        private Recipe GetRecipe(DbDataReader reader)
        {
            return new Recipe
            {
                name = reader["name"].ToString(),
                category = reader["category"].ToString(),
                description = reader["description"].ToString(),
                cookingTime = int.Parse(reader["cookingtime"].ToString()),
                submitBy = reader["submitby"].ToString(),
                id = int.Parse(reader["id"].ToString()),
                numberOfServings = int.Parse(reader["numberofservings"].ToString()),
                ingredients = GetIngredients(int.Parse(reader["id"].ToString()))
            };
        }

        /// <summary>
        /// Get all recipes
        /// </summary>
        /// <returns></returns>
        public List<Recipe> GetRecipes()
        {
            DbCommand cmd = factory.CreateCommand();
            cmd.CommandText = "Select * from RR_RECIPE";
            cmd.Connection = getConnection();
            cmd.CommandType = CommandType.Text;
            return GetRecipes(cmd);
        }

        //get all Recipes recorder from a DbCommand
        public List<Recipe> GetRecipes(DbCommand cmd)
        {

            DbDataReader reader = cmd.ExecuteReader();
            List<Recipe> recipes = new List<Recipe>();
            while (reader.Read())
            {
                recipes.Add(GetRecipe(reader));
            }
            reader.Close();
            return recipes;
        }

        /// <summary>
        /// get all Ingredients by RecipeID
        /// </summary>
        /// <param name="recipeId"></param>
        /// <returns></returns>
        private List<Ingredient> GetIngredients(int recipeId)
        {
            List<Ingredient> Ingredients = new List<Ingredient>();

            DbCommand cmd = factory.CreateCommand();
            cmd.CommandText = "Select * from rr_ingredient where recipeid= :recipeid";
            cmd.Connection = getConnection();

            DbParameter para = factory.CreateParameter();
            para.ParameterName = "recipeid";
            para.DbType = DbType.Int32;
            para.Value = recipeId;
            cmd.Parameters.Add(para);

            DbDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                Ingredients.Add(new Ingredient
                {
                    
                    id = Convert.ToInt32(reader["id"].ToString()),
                    name = reader["name"].ToString(),
                    quantity = reader["quantity"].ToString(),
                    unit = reader["unit"].ToString(),
                    recipeid = Convert.ToInt32(reader["recipeid"].ToString())
                });
            }
            reader.Close();
            return Ingredients;
        }

        /// <summary>
        /// search recipe by three conditions
        /// </summary>
        /// <param name="submitBy"></param>
        /// <param name="category"></param>
        /// <param name="ingredientName"></param>
        /// <returns></returns>
        public List<Recipe> GetRecipes(string submitBy, string category, string ingredientName)
        {
            string sql = "Select * from RR_RECIPE";
            DbCommand cmd = factory.CreateCommand();

            DbParameter parasSubmitby = factory.CreateParameter();
            parasSubmitby.ParameterName = "submitby";
            parasSubmitby.Value = submitBy;

            DbParameter parasCategory = factory.CreateParameter();
            parasCategory.ParameterName = "category";
            parasCategory.Value = category;

            DbParameter parasIngredientName = factory.CreateParameter();
            parasIngredientName.ParameterName = "ingredientName";
            parasIngredientName.Value = ingredientName;

            if (submitBy != null)
            {
                cmd.Parameters.Add(parasSubmitby);
                sql += " WHERE submitby like '%' || :submitby || '%'";
                if (category != null)
                {
                    sql += "  AND category like '%' || :category || '%'";

                    cmd.Parameters.Add(parasCategory);
                }
            }
            else
            {
                if (category != null)
                {
                    sql += " WHERE category like '%' || :category || '%'";
                    cmd.Parameters.Add(parasCategory);
                }
            }
            if (ingredientName != null)
            {

                if (sql.Contains("WHERE"))
                {
                    sql += " AND ";
                }
                else
                {
                    sql += " WHERE ";
                }
                cmd.Parameters.Add(parasIngredientName);
                sql += "id in (SELECT recipeid from rr_ingredient where name like '%' || :ingredientname || '%')";
            }
            cmd.CommandText = sql;
            cmd.Connection = getConnection();
            cmd.CommandType = CommandType.Text;
            return GetRecipes(cmd);
        }

        /// <summary>
        /// update a recipe recorder by recipe model object
        /// </summary>
        /// <param name="r"></param>
        public void UpdateRecipe(Recipe r)
        {
            throw new NotImplementedException();
        }

    }
}
