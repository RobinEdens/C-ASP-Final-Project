using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Account_Unauthorized : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session[Context.User.Identity.Name.ToString()] != null) 
        {
            if (!Session[Context.User.Identity.Name.ToString()].Equals("1"))
            {
                Response.Redirect("~/Doctor/Home.aspx");
            }

            if (!Session[Context.User.Identity.Name.ToString()].Equals("2"))
            {
                Response.Redirect("~/Patient/Home.aspx");
            }
        }
        else
        {
            Response.Redirect("~/Default.aspx");
        }
    }
}