using InstituteManagement.Class;
using System;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InstituteManagement.LibraryManagement
{
    public partial class BookTransaction : System.Web.UI.Page
    {
        string ClassId = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Title = "Book Transcation";

            if (!IsPostBack)
            {
                string query = "AvailableClass";
                DBhelper dBhelper = new DBhelper();
                DataTable dataTable = new DataTable();
                dataTable = dBhelper.DataTable(query, new SqlParameter[] { });
                SelectClass.DataSource = dataTable;
                SelectClass.DataTextField = "ClassName";
                SelectClass.DataValueField = "ClassId";
                SelectClass.DataBind();
                SelectClass.Items.Insert(0, new ListItem("Select Class", ""));
            }
        }

        protected void SelectClass_SelectedIndexChanged(object sender, EventArgs e)
        {
            ClassId = SelectClass.SelectedValue;
            string query = "StudentNameList";
            DBhelper DBhelper = new DBhelper();
            DataTable DataTable = new DataTable();
            SqlParameter[] parameters = new SqlParameter[]
            {
               new SqlParameter("ClassId",ClassId)
            };
            DataTable = DBhelper.DataTable(query, parameters);
            StudentList.DataSource = DataTable;
            StudentList.DataTextField = "FullName";
            StudentList.DataValueField = "UserId";
            StudentList.DataBind();
            StudentList.Items.Insert(0, new ListItem("Select Student", ""));
            StudentList.Visible = true;
        }

        protected void GaveBook_Click(object sender, EventArgs e)
        {
            int bookid = 0;
            int bookcode = int.Parse(Bookcode.Text);
            int studentid = 0;
            DateTime giveDate = DateTime.Parse(GiveDate.Text);
            DateTime returndate = DateTime.Parse(ReturnDate.Text);
            bool IsReturn = false;
            int.TryParse(StudentList.SelectedValue, out int test);
            {
                studentid = test;
            }

            string query = "GetBookId";
            SqlParameter[] parameters = new SqlParameter[]
            {
               new SqlParameter("BookCode",bookcode)
            };
            DBhelper dBhelper = new DBhelper();
            SqlDataReader reader = dBhelper.DataReader(query, parameters);
            if (reader.Read())
            {
                bookid = reader.GetInt32(reader.GetOrdinal("BookId"));

                string procedure = "BookTransaction";
                DBhelper DBhelper = new DBhelper();
                SqlParameter[] sqlParameters = new SqlParameter[]
                {
                  new SqlParameter("BookId",bookid),
                  new SqlParameter("StudentId",studentid),
                  new SqlParameter("GiveDate",giveDate),
                  new SqlParameter("ReturnDate",returndate),
                  new SqlParameter("IsReturn",IsReturn),
                  new SqlParameter("BookCode",bookcode)
                };
                DBhelper.ExecuteNonQuery(procedure, sqlParameters);
                SuccessMessage.Text = "Book Gave SuccessFully";
            }
            else
            {
                SuccessMessage.Text = "Invalid Book Code";
            }
            
            SelectClass.SelectedValue = string.Empty;
            Bookcode.Text = string.Empty;
            GiveDate.Text = string.Empty;   
            ReturnDate.Text = string.Empty; 
            StudentList.Text = string.Empty;    

        }
    }
}