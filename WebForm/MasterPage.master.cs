using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    public String[] Active = new String[4];
    protected void Page_Load(object sender, EventArgs e)
    {
        const String classActive= "class=\"active\"";
        String Url = Request.Url.ToString().ToLower();
        if (Url.IndexOf("/default.aspx") > 0) Active[0] = classActive;
        if (Url.IndexOf("/recipes.aspx") > 0) Active[1] = classActive;
        if (Url.IndexOf("/addrecipe.aspx") > 0) Active[2] = classActive;
        if (Url.IndexOf("/search.aspx") > 0) Active[3] = classActive;


    }

}
