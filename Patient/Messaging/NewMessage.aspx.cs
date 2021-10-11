using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Entity;
using System.Data.Entity.Validation;

public partial class Patient_Messaging_NewMessage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Session[Context.User.Identity.Name.ToString()].Equals("2"))
            Response.Redirect("~/Unauthorized.aspx");

        dbcontext.tblEmails.Load();
        dbcontext.tblDoctors.Load();
    }

    HospitalEntities dbcontext = new HospitalEntities();

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (IsPostBack && ValidateMessage())
        {
            tblEmail msg = new tblEmail()
            {
                UserNameFrom = Session["Name"].ToString(),
                UserNameTO = TextBox1.Text,
                EmailText = TextBox3.Text
            };

            dbcontext.tblEmails.Add(msg);

            try
            {
                dbcontext.SaveChanges();
            }
            catch (DbEntityValidationException)
            {
                Label5.Text = "Failed to send message";
            }

            MessageSent();
        }
    }

    private bool ValidateMessage()
    {
        bool returnValue = true;
        if (TextBox1.Text == "")
        {
            Label4.Text = "Please specify recipient";
            Label5.Text = "";
            returnValue = false;
        }
        else Label4.Text = "";

        if (TextBox3.Text.Length > 1000)
        {
            Label6.Text = "Message cannot exceed 1000 characters";
            Label5.Text = "";
            returnValue = false;
        }
        else Label6.Text = "";

        return returnValue;
    }

    private void MessageSent()
    {
        Label5.Text = "Message sent";
        Label4.Text = "";
        Label6.Text = "";
        TextBox1.Text = "";
        TextBox3.Text = "";
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            var recipient =
                from x in dbcontext.tblDoctors.Local
                where x.DoctorID.Equals(Convert.ToInt32(GridView1.SelectedDataKey.Value))
                select new { name = x.UserName };

            TextBox1.Text = recipient.First().name;
        }
    }
}