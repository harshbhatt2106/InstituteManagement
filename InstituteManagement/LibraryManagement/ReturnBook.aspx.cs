using InstituteManagement.Class;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InstituteManagement.LibraryManagement
{
    public partial class ReturnBook : System.Web.UI.Page
    {
        string ClassId = "";
        int stundetid = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Title = "Return Book";
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

        protected void StudentList_SelectedIndexChanged(object sender, EventArgs e)
        {
            BookCodeList.Visible = true;
            stundetid = int.Parse(StudentList.SelectedValue);
            string query = "TransactionalBookCode";
            DBhelper DBhelper = new DBhelper();
            DataTable DataTable = new DataTable();
            SqlParameter[] parameters = new SqlParameter[]
            {
               new SqlParameter("StudentId",stundetid)
            };
            DataTable = DBhelper.DataTable(query, parameters);
            BookCodeList.DataSource = DataTable;
            BookCodeList.DataTextField = "BookCode";
            BookCodeList.DataValueField = "BookCode";
            BookCodeList.DataBind();
            BookCodeList.Items.Insert(0, new ListItem("Select BookCode", ""));
        }

        protected void GaveBook_Click(object sender, EventArgs e)
        {
            int bookcode = int.Parse(BookCodeList.SelectedValue);
            stundetid = int.Parse(StudentList.SelectedValue);
            string query = "ReturnBook";

            DBhelper DBhelper = new DBhelper();
            SqlParameter[] parameters = new SqlParameter[]
            {
               new SqlParameter("StudentId",stundetid),
               new SqlParameter("BookCode",bookcode)
            };
            DBhelper.ExecuteNonQuery(query, parameters);
            BookCodeList.SelectedValue = string.Empty;
            SelectClass.SelectedValue = string.Empty;
            StudentList.SelectedValue = string.Empty;

        }
    }
}