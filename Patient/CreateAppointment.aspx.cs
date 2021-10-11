using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Patient_CreateAppointment : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Session[Context.User.Identity.Name.ToString()].Equals("2"))
        {
            Response.Redirect("~/Unauthorized.aspx");
        }
        newAppointment.AppointmentDate = Calendar1.SelectedDate.ToShortDateString();
    }

    HospitalEntities dbcon = new HospitalEntities();

    tblAppointment newAppointment = new tblAppointment();

    protected void Button1_Click(object sender, EventArgs e)
    {
        if(TextBox1.Text == null)
        {
            Label9.Text = "Please select and enter all necessary information to schedule an appointment.";
        }
        string time = TextBox1.Text;
        string description = TextBox3.Text;
        newAppointment.PatientUserName = Context.User.Identity.Name;
        int docID = Convert.ToInt32(Session["GetDoctor"]);

        var docName =
            from x in dbcon.tblDoctors
            where x.DoctorID == docID
            select x;
        newAppointment.DoctorUserName = docName.First().UserName;
        newAppointment.Description = description;
        newAppointment.AppointmentTime = time;
        if (ValidateApt())
        {
            dbcon.tblAppointments.Add(newAppointment);
            dbcon.SaveChanges();
            Label9.Text = "Success!";
        }
        else
        {
            Label9.Text = "Current time already booked or you forgot to select a day. Please select a different time/day and book again.";
        }

    }

    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        newAppointment.AppointmentDate = Calendar1.SelectedDate.ToShortDateString();
    }

    private bool ValidateApt()
    {
        var appointments =
            from x in dbcon.tblAppointments
            where x.DoctorUserName.Equals(newAppointment.DoctorUserName) && x.AppointmentDate.Equals(newAppointment.AppointmentDate) && x.AppointmentTime.Equals(newAppointment.AppointmentTime)
            select x;

        if (appointments.Count() == 0)
        {
            return true;
        }
        return false;
    }
}