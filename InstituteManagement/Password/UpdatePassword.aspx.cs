using System;
using InstituteManagement.Class;
using System.Data.SqlClient;
namespace Institute_priject_new_try
{
    public partial class password : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Paasoword_Click(object sender, EventArgs e)
        {
            CommonMethod cmd = new CommonMethod();
            var password = cmd.EncreptPassword(ConfromPaasword.Text); 
           
            string query = "UpdatePasword";
            string emailaddress = Session["EmailAddress"].ToString();

            SqlParameter[] parameter = new SqlParameter[] {
               new SqlParameter("@EmailAddress",emailaddress),
               new SqlParameter("@Password",password)
            };
            DBhelper db = new DBhelper();
            if (db.ExecuteNonQuery(query, parameter))
            {
                Response.Redirect("../Authentication/Login.aspx");
            }
            else
            {
                Paasoword.Text = " ";
                ConfromPaasword.Text = " ";
                PasswordMessage.Text = "Password did not update. Please check your email and re-verify";
            }
        }

    }
}