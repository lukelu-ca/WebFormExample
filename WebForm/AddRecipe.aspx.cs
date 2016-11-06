using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


public partial class AddRecipe : BasePage
{

    protected void Page_Load(object sender, EventArgs e)
    {
        Page.MaintainScrollPositionOnPostBack = true;

        if (!Page.IsPostBack)
        {
            //When load page
            //Bind Cateory Dropdown list
            BindXml();
            //Add one ucIngredient UserControl
            AddIngredient();
            //Save the index value in viewstate for the page visit
            addIndex();
        }
        else
        {
            LoadIngredient();
        }
    }

    /*
     * Load ucIngredient UserControls Again
     * When postback
     */
    private void LoadIngredient()
    {

        for (int i = 1; i < getIndex(); i++)
        {
            AddIngredient();
        }
    }
    //After delete a control from placeholder
    //Recount all controls index number from 1 to index.
    private void RefreshIngredientsIndex()
    {
        int i = 1;
        ucIngredient.TOTAL = plIngredients.Controls.Count;
        foreach (ucIngredient uc in plIngredients.Controls)
        {
            uc.Index = i++;
        
            uc.RefreshButton();
        }
    }

    //add a ucIngredient usercontrol to placeholder
    private void AddIngredient()
    {
        ucIngredient uc = LoadControl("~/UserControls/ucIngredient.ascx") as ucIngredient;
        uc.Item_Add += new EventHandler(Ingredient_Add);
        uc.Item_Delete += new EventHandler(Ingredient_Delete);
        plIngredients.Controls.Add(uc);
        RefreshIngredientsIndex();
    }

    //When a ucIngredient Add Button is clicked
    private void Ingredient_Add(object sender, EventArgs e)
    {
        //add a usercontrol
        AddIngredient();
        //add 1 for viewstate value
        addIndex();

    }

    //When a ucIngredient control delete button is clicked
    private void Ingredient_Delete(object sender, EventArgs e)
    {
        minusIndex();
        //remove a usercontrol
        plIngredients.Controls.Remove((Control)sender);
        //minus 1 for viewstate value

        //reset all user controls index value 
        RefreshIngredientsIndex();

    }

    //Load xml file to ddlCategories
    private void BindXml()
    {
        string filePath = Server.MapPath("~/xml/categories.xml");
        using (DataSet ds = new DataSet())
        {
            ds.ReadXml(filePath);
            ddlCategory.DataSource = ds;
            ddlCategory.DataTextField = "Name";
            ddlCategory.DataValueField = "Name";
            ddlCategory.DataBind();
        }
    }

    //Save Recipe button is clicked
    protected void btnAddRecipe_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            Recipe r = new Recipe();
            r.name = txtName.Text;
            r.submitBy = txtSubmitBy.Text;
            r.category = ddlCategory.SelectedValue;
            r.cookingTime = Convert.ToInt32(txtCookingTime.Text);
            r.numberOfServings = Convert.ToInt32(txtNumberOfServings.Text);
            r.description = txtDescription.Text;

            foreach (ucIngredient uc in plIngredients.Controls)
            {
                r.ingredients.Add(uc.ItemValue);
            }
            new RecipeRepository().AddRecipe(r);
            resetForm();
            lblMessage.Text = "Recipe is saved successfully.";
        }

    }

    //Cancel recipe button is clicked
    protected void btnCancelRecipe_Click(object sender, EventArgs e)
    {
        resetForm();
    }

    //clear all form controls value
    private void resetForm()
    {
        txtName.Text = string.Empty;
        txtDescription.Text = string.Empty;
        txtNumberOfServings.Text = string.Empty;
        txtCookingTime.Text = string.Empty;
        txtSubmitBy.Text = string.Empty;
        ddlCategory.SelectedIndex = 0;
        foreach (ucIngredient uc in plIngredients.Controls)
        {
            uc.Clear();
        }
    }

    //Add 1 for index value of viewstate 
    private void addIndex()
    {
        setIndex(getIndex() + 1);
    }
    //Minus 1 for index value of viewstate 
    private void minusIndex()
    {
        setIndex(getIndex() - 1);
    }

    //set viewstate value of index to i
    private void setIndex(int index)
    {
        ViewState["IngredientsControlIndex"] = index;
    }

    //get viewstate value of index
    //if is null, initialize value is 1
    private int getIndex()
    {
        if (ViewState["IngredientsControlIndex"] == null)
        {
            ViewState["IngredientsControlIndex"] = 1;
        }
        return (int)ViewState["IngredientsControlIndex"];
    }
}