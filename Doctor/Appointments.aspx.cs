using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Doctor_Appointments : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Session[Context.User.Identity.Name.ToString()].Equals("1"))
        {
            Response.Redirect("~/Unauthorized.aspx");
        }
    }
}