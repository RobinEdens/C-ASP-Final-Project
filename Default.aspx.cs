using Microsoft.AspNet.Identity;
using Microsoft.Owin.Security;
using System;
using System.Web;
using System.Web.UI;
using System.Linq;
using System.Web.Security;
using System.Data.Entity;
using HospitalSite;
using Microsoft.AspNet.Identity.EntityFramework;

public partial class Account_Login : Page
{
    HospitalEntities dbcontext = new HospitalEntities();
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ApplicationDbContext context = new ApplicationDbContext();
            var roleStore = new RoleStore<IdentityRole>(context);
            var roleManager = new RoleManager<IdentityRole>(roleStore);
            roleManager.Create(new IdentityRole("Doctor"));
            roleManager.Create(new IdentityRole("Patient"));
            var userStore = new UserStore<ApplicationUser>(context);
            var manager = new UserManager<ApplicationUser>(userStore);
            foreach (var x in dbcontext.tblUsers)
            {
                var user = new ApplicationUser() { UserName = x.UserName.Trim()};
                IdentityResult result = manager.Create(user, x.Password.Trim());

                if (result.Succeeded)
                {
                    if (x.UserType.Trim().Equals("Doctor"))
                    {
                        manager.AddToRole(user.Id, "Doctor");
                    }
                    if (x.UserType.Trim().Equals("Patient"))
                    {
                        manager.AddToRole(user.Id, "Patient");
                    }
                }

            }
            context.SaveChanges();
        }
    }

    protected void LogIn(object sender, EventArgs e)
    {
        if (IsValid)
        {
            // Validate the user password
            var manager = new UserManager();
            ApplicationUser user = manager.Find(UserName.Text, Password.Text);

            if (user != null)
            {
                
                IdentityHelper.SignIn(manager, user, RememberMe.Checked);
                Session.Add(user.UserName, user.Roles.First().RoleId);
                if (Session[user.UserName].Equals("1"))
                {
                    var info =
                        from x in dbcontext.tblDoctors
                        where user.UserName.Equals(x.UserName)
                        select new { name = x.UserName, id = x.DoctorID };
                    Session.Add("GetID", info.First().id);
                    Session.Add("GetName", info.First().name);
                    Response.Redirect("~/Doctor/Home.aspx");
                }
                if (Session[user.UserName].Equals("2"))
                {
                    var info =
                        from x in dbcontext.tblPatients
                        where user.UserName.Equals(x.UserName)
                        select new { userName = x.UserName, docID = x.DoctorID, selfID = x.PatientID, name = x.Name};

                    Session.Add("Name", info.First().userName);
                    Session.Add("GetDoctor", info.First().docID);
                    Session.Add("PatientID", info.First().selfID);
                    Session.Add("FullName", info.First().name);
                    Response.Redirect("~/Patient/Home.aspx");
                }
            }
            else
            {
                FailureText.Text = "Invalid username or password.";
                ErrorMessage.Visible = true;
            }
        }
    }
}