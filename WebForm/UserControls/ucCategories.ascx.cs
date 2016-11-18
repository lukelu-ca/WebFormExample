using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebForm.Web
{
    public partial class UserControls_ucCategories : System.Web.UI.UserControl
    {

        public string Value
        {
            get
            {
                return ddlCategory.SelectedIndex == ddlCategory.Items.Count - 1 ? txtCategory.Text : ddlCategory.SelectedValue;
            }
            set
            {
                ddlCategory.SelectedValue = value;
            }
        }


        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtCategory.Visible = (ddlCategory.SelectedIndex == ddlCategory.Items.Count - 1);
            cvTxtCategory.Visible = (ddlCategory.SelectedIndex == ddlCategory.Items.Count - 1);
        }

        
        protected void cvTxtCategory_ServerValidate(object source, System.Web.UI.WebControls.ServerValidateEventArgs args)
        {
            if (txtCategory.Text.Trim() == string.Empty)
            {
                args.IsValid = false;
                cvTxtCategory.ErrorMessage = "Category is mandatory.";
            }
            else if (txtCategory.Text.Trim().ToLower() == "other")
            {
                args.IsValid = false;
                cvTxtCategory.ErrorMessage = "Category can not be : \"Other.\"";
            }
            else
            {
                args.IsValid = true;
            }
        }
        public int SelectedIndex
        {
            get
            { return ddlCategory.SelectedIndex; }
            set
            { ddlCategory.SelectedIndex = value; }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindCategory();
            }
        }

        private void BindCategory()
        {
            List<string> list = (new DAL.RecipeDataBaseRepository()).GetCategories();

            list.Add("Other");
            ddlCategory.DataSource = list;
            ddlCategory.DataBind();
        }
    }
}