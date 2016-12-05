using System;
using WebForm.Model;
/*
     * Author: Luke Lu
     * Student ID: 300804279
     * Course: COMP 229
     */
namespace WebForm.Web
{
    [Serializable]
    public partial class ucIngredient : System.Web.UI.UserControl
    {
        //The total rows number in the parent control
        public static int TOTAL = 0;

        //current object's index row number
        private int index = 1;


        //Ingredient class object
        private Ingredient itemValue;
        public event EventHandler Item_Add;
        public event EventHandler Item_Delete;

        public int id
        {
            get
            {
                if (hfID.Value == string.Empty)
                    return 0;
                else
                    return Convert.ToInt32(hfID.Value);
            }
            set
            {
                hfID.Value = value.ToString();
            }
        }
        //return txtName
        public string Name
        {
            get
            {
                return txtName.Text;
            }
            set
            {
                txtName.Text = value;
            }
        }

        //the text Quantity value
        //check is a double number
        public string Quantity
        {
            get
            {
                return txtQuantity.Text;
            }

            set
            {
                txtQuantity.Text = value;
            }
        }

        //the txtUnit value
        public string Unit
        {
            get
            {
                return txtUnit.Text;
            }
            set
            {
                txtUnit.Text = value;
            }
        }
        //return or set the object of ingredient
        public Ingredient ItemValue
        {
            get
            {
                if (itemValue == null)
                {
                    itemValue = new Ingredient();
                }
                itemValue.id = id;
                itemValue.name = Name;
                itemValue.quantity = Quantity;
                itemValue.unit = Unit;
                return itemValue;
            }
            set
            {
                itemValue = value;
                id = itemValue.id;
                Name = itemValue.name;
                Quantity = itemValue.quantity;
                Unit = itemValue.unit;
            }
        }

        //the button's index number in the parent control
        public int Index
        {
            get { return index; }
            set { index = value; }
        }

        //page load refresh buttons visibility
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        //when add button is clicked, raise a event
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (Item_Add != null)
            {
                Item_Add(this, EventArgs.Empty);
            }
        }

        //when delete button is clicked, raise a event
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            if (Item_Delete != null) Item_Delete(this, EventArgs.Empty);
        }

        //refresh the buttons visiblity
        public void RefreshButton()
        {
            if (index == 1)
            {
                if (TOTAL == 1)
                {
                    setOnlyOne();
                }
                else
                {
                    setFirst();
                }
            }
            else if (index == TOTAL)
            {
                setLast();
            }
            else
            {
                setMiddle();
            }
        }

        //The first row hide both buttons when Total rows>1
        public void setFirst()
        {
            btnAdd.Visible = false;
            btnDelete.Visible = false;

        }

        //When only one row, show add button, hide delete button
        public void setOnlyOne()
        {
            btnAdd.Visible = true;
            btnDelete.Visible = false;
        }
        //The last row show both buttons when total rows>1
        public void setLast()
        {
            btnAdd.Visible = true;
            btnDelete.Visible = true;
        }

        //The middle row show delete button, hide add button , when total rows>2
        public void setMiddle()
        {
            btnAdd.Visible = false;
            btnDelete.Visible = true;
        }

        //clear 3 textbox content
        public void Clear()
        {
            Name = string.Empty;
            Quantity = string.Empty;
            Unit = string.Empty;
        }

    }
}