using InstituteManagement.Class;
using System;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI.WebControls;
using System.IO;

namespace InstituteManagement.Usermanagement
{
    public partial class AddUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string query = "AvailableClass";
                DBhelper dBhelper = new DBhelper();
                SqlParameter[] parameter = new SqlParameter[] { };
                DataTable dataTable = new DataTable();

                dataTable = dBhelper.DataTable(query, parameter);
                SelectClass.DataSource = dataTable;
                SelectClass.DataTextField = "ClassName";
                SelectClass.DataValueField = "ClassId";
                SelectClass.DataBind();
                SelectClass.Items.Insert(0, new ListItem("Select Class", ""));

                string Query = "AvailableUserTypes";
                DBhelper DBhelper = new DBhelper();
                SqlParameter[] Sqlparameter = new SqlParameter[] { };
                DataTable DataTable = new DataTable();

                DataTable = DBhelper.DataTable(Query, Sqlparameter);
                UserTypes.DataSource = DataTable;
                UserTypes.DataTextField = "UserType";
                UserTypes.DataValueField = "UserTypeId";
                UserTypes.DataBind();
                UserTypes.Items.Insert(0, new ListItem("Select UserType", ""));
            }
        }

        protected void UserTypes_SelectedIndexChanged(object sender, EventArgs e)
        {

            if (UserTypes.SelectedItem.Text == "Student")
            {
                SelectClass.Visible = true;
            }
            else
            {
                SelectClass.Visible = false;
            }
        }

        protected void addUser_Click(object sender, EventArgs e)
        {
            CommonMethod commonMethod = new CommonMethod();

            string username = UserName.Text;
            string firstname = FirstName.Text;
            string lastname = LastName.Text;
            string secondname = SecondName.Text;
            string contactnumber = ContactNumber.Text;
            string emailid = EmailAdress.Text;
            string address = Address.Text;
            string passoword = commonMethod.EncreptPassword(Password.Text);

            string gender = SelectGender.SelectedItem.Text;
            string selectclass = SelectClass.SelectedValue;
            string usertypeid = UserTypes.SelectedValue;
            string path;
            bool isactive = true;

            string filename = Path.GetFileName(ProfilePicture.FileName);

            string pathh = Server.MapPath("~/Image/") + filename;
            ProfilePicture.SaveAs(pathh);


            path = "~/Image/" + filename;

            string procedure = "AddUser";
            DBhelper DBhelper = new DBhelper();
            SqlParameter[] Sqlparameter = new SqlParameter[]
            {
                new SqlParameter("UserName",username),
                new SqlParameter("FirstName",firstname),
                new SqlParameter("SecondName",secondname),
                new SqlParameter("LastName",lastname),
                new SqlParameter("ContactNumber",contactnumber),
                new SqlParameter("EmailAddress",emailid),
                new SqlParameter("Address",address),
                new SqlParameter("Gender",gender),
                new SqlParameter("UserTypeId",usertypeid),
                new SqlParameter("Password",passoword),
                new SqlParameter("ProfilePicturePath",path),
                new SqlParameter("IsActive",isactive),
                new SqlParameter("ClassId",selectclass),


            };
            DBhelper.ExecuteNonQuery(procedure, Sqlparameter);

            UserName.Text = string.Empty;
            FirstName.Text = string.Empty;
            LastName.Text = string.Empty;
            SecondName.Text = string.Empty;
            ContactNumber.Text = string.Empty;
            EmailAdress.Text = string.Empty;
            Address.Text = string.Empty;
            UserTypes.SelectedItem.Value = string.Empty;
            SelectClass.SelectedItem.Value = string.Empty;

        }
    }
}