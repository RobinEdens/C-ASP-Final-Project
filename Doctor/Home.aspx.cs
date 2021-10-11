using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Doctor_Home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Session[Context.User.Identity.Name.ToString()].Equals("1"))
        {
            Response.Redirect("~/Unauthorized.aspx");
        }
    }

    protected void patientsButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Doctor/Search.aspx");
    }

    protected void mailButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Doctor/Messaging/NewMessage.aspx");
    }

    protected void apptButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Doctor/Appointments.aspx");
    }

    protected void emailButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Doctor/Messaging/Inbox.aspx");
    }
}