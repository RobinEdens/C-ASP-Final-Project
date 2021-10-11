using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Entity;

public partial class Doctor_ViewAppointments : System.Web.UI.Page
{
    HospitalEntities dbcontext = new HospitalEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Session[Context.User.Identity.Name.ToString()].Equals("1"))
        {
            Response.Redirect("~/Unauthorized.aspx");
        }
    }
}