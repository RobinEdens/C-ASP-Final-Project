using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Patient_Home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Session[Context.User.Identity.Name.ToString()].Equals("2"))
        {
            Response.Redirect("~/Unauthorized.aspx");
        }
        Label1.Text = Session["FullName"] +".";
    }

    protected void recordsButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Patient/Records.aspx");
    }

    protected void mailButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Patient/Messaging/NewMessage.aspx");
    }

    protected void apptButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Patient/Appointments.aspx");
    }

    protected void inboxButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Patient/Messaging/Inbox.aspx");
    }
}