using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebForm.DAL;
using WebForm.Model;
using System.Web.UI.HtmlControls;


namespace WebForm.Web
{

    public partial class UserControls_ucListEditIngedient : System.Web.UI.UserControl
    {
        public List<Ingredient> ingredients
        {
            get
            {
                List<Ingredient> list = new List<Ingredient>();
                foreach (ucIngredient uc in plIngredients.Controls)
                {
                    if (uc.Visible)
                        list.Add(uc.ItemValue);
                }
                return list;
            }
        }

        public void Initialize(List<Ingredient> listOfIngredients)
        {
            setIndex(listOfIngredients.Count + 1);
            setTotalControls(listOfIngredients.Count + 1);

            int index = 1;
            foreach (Ingredient ing in listOfIngredients)
            {
                AddIngredient(index, ing, true);
                index++;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack)
            { LoadIngredient(); }
         
        }

        /*
          * Load ucIngredient UserControls Again
          * When postback
          */
        public void LoadIngredient()
        {

            for (int i = 1; i < getTotalControls(); i++)
            {
                AddIngredient(i);
            }
        }
        //After delete a control from placeholder
        //Recount all controls index number from 1 to index.
        private void RefreshIngredientsIndex()
        {
            int i = 1;
            ucIngredient.TOTAL = getVisibleControlsCount();
            foreach (ucIngredient uc in plIngredients.Controls)
            {
                if (uc.Visible)
                {
                    uc.Index = i++;
                    uc.RefreshButton();
                }
            }
        }

        public void Clear()
        {
            foreach (ucIngredient control in plIngredients.Controls)
            {
                control.Clear();
            }
        }

        private int getVisibleControlsCount()
        {
            int count = 0;
            foreach (Control c in plIngredients.Controls)
            {
                if (c.Visible) count++;
            }
            return count;
        }

        //add a ucIngredient usercontrol to placeholder
        private void AddIngredient(int index, Ingredient ingredient = null, bool forceVisible = false)
        {

            ucIngredient uc = LoadControl("~/UserControls/ucIngredient.ascx") as ucIngredient;
            uc.Item_Add += new EventHandler(Ingredient_Add);
            uc.Item_Delete += new EventHandler(Ingredient_Delete);
            if (ingredient != null) uc.ItemValue = ingredient;
            uc.Index = index;
            if (forceVisible) uc.Visible = true;

            uc.RefreshButton();
            plIngredients.Controls.Add(uc);
            RefreshIngredientsIndex();
        }

        //When a ucIngredient Add Button is clicked
        private void Ingredient_Add(object sender, EventArgs e)
        {
            //add a usercontrol
            AddIngredient(getTotalControls() + 1);
            //add 1 for viewstate value
            addIndex();
            AddTotalControls();
        }

        //When a ucIngredient control delete button is clicked
        private void Ingredient_Delete(object sender, EventArgs e)
        {
            //remove a usercontrol
            //foreach (ucIngredient ing in plIngredients.Controls)
            //{
            //    if (ing.ClientID == ((ucIngredient)sender).ClientID)
            //    {
            //        ing.Visible=false;
            //         break;
            //    }
            //}
            ((Control)sender).Visible = false;
            //minus 1 for viewstate value
            minusIndex();

            //reset all user controls index value
            RefreshIngredientsIndex();

        }

        private int getTotalControls()
        {
            if (ViewState["TotalControls"] == null)
                return 0;
            else
                return (int)ViewState["TotalControls"];
        }
        private void setTotalControls(int value)
        {
            ViewState["TotalControls"] = value;
        }

        private void AddTotalControls()
        {
            setTotalControls(getTotalControls() + 1);
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
}