using System;
using System.Data.SqlClient;
using InstituteManagement.Class;

namespace InstituteManagement.Login
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public static string EncodePasswordToBase64(string password)
        {
            byte[] encData_byte = new byte[password.Length];
            encData_byte = System.Text.Encoding.UTF8.GetBytes(password);
            string encodedData = Convert.ToBase64String(encData_byte);
            return encodedData;
        }
        protected void Signin_Click(object sender, EventArgs e)
        {

            string password = EncodePasswordToBase64(Password.Text);
            string emailAddress = Emailaddress.Text;
            string sp = "UserValidorNot";
            SqlParameter[] param = new SqlParameter[] {
                new SqlParameter("@EmailorUserName",emailAddress),
                new SqlParameter("@Password",password)
            };
            DBhelper db = new DBhelper();
            SqlDataReader reder = null;
            reder = db.DataReader(sp, param);
            if (reder.Read())
            {
                Session["UserId"] = reder["UserId"].ToString();
                Response.Redirect("../Home.aspx");
            }
            else
            {
                Validornot.Visible = true;
                Validornot.Text = "Invalid data....";
            }
        }

    }
}