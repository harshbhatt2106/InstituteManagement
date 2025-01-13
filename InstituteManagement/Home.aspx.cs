using System;
using System.Collections.Generic;
using System.Web.UI;
using InstituteManagement.Class;

namespace InstituteManagement
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Title="Home Page";  
            if (Session["UserId"] == null)
            {
                Response.Redirect("Authentication/login.aspx");
            }
            int UserId = int.Parse(Session["UserId"].ToString());
            CommonMethod commonMethod = new CommonMethod();
            Dictionary<string, string> UserInformation = commonMethod.GetUserInformation(UserId);
            Username.Text = UserInformation["FirstName"] + UserInformation["LastName"];
            ProfilePicture.ImageUrl = UserInformation["ProfilePicturePath"];
        }


        protected void Logout_Click(object sender, ImageClickEventArgs e)
        {
            if (Session["UserId"] != null)
            {
                Session["UserId"] = null;
                Response.Redirect("Authentication/login.aspx");
            }
        }

        protected void TakeAttendance_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Attendance/TakeAttendance.aspx");
        }

        protected void library_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("LibraryManagement/AddBook.aspx");
        }

        protected void OnlineExamination_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("OnlineExamination/CreateExam.aspx");
        }

        protected void KnowladgeRepository_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("KnowledgeRepository/AddCategory.aspx");
        }

        protected void UserManagement_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Usermanagement/AddUser.aspx");
        }
    }
}