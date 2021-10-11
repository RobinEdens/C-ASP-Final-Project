using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Entity;

public partial class Doctor_Messaging_Inbox : System.Web.UI.Page
{
    HospitalEntities dbcontext = new HospitalEntities();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Session[Context.User.Identity.Name.ToString()].Equals("2"))
            Response.Redirect("~/Unauthorized.aspx");

        dbcontext.tblEmails.Load();
    }

    protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
    {
        if (IsPostBack)
        {

            var msgToDisplay =
                from x in dbcontext.tblEmails.Local
                where x.EmailID.Equals(Convert.ToInt32(GridView1.SelectedDataKey.Value))
                select new { sender = x.UserNameFrom, message = x.EmailText };

            TextBox1.Text = msgToDisplay.First().sender;
            TextBox2.Text = msgToDisplay.First().message;

            //tblEmail msg = (tblEmail)(GridView1.SelectedRow.DataItem);
            //TextBox1.Text = msg.UserNameFrom;
            //TextBox2.Text = msg.EmailText;
        }
    }
}