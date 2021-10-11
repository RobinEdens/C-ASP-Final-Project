using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Entity;
using System.Data.Entity.Validation;


public partial class Doctor_Search : System.Web.UI.Page
{
    HospitalEntities dbcon = new HospitalEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Session[Context.User.Identity.Name.ToString()].Equals("1"))
        {
            Response.Redirect("~/Unauthorized.aspx");
        }
        if (!IsPostBack)
        {
            dbcon.tblPatients.Load();
            var patients =
                from x in dbcon.tblPatients.Local
                where x.DoctorID == Convert.ToInt32(Session["GetID"])
                select x;
            GridView1.DataSource = patients;
            GridView1.DataBind();
        }

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        dbcon.tblPatients.Load();
        var patients =
            from x in dbcon.tblPatients.Local
            where x.UserName.ToString().Trim().Equals(TextBox1.Text)
            select x;
        GridView1.DataSource = patients;
        GridView1.DataBind();
    }
}