using InstituteManagement.Class;
using System;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI.WebControls;

namespace InstituteManagement.Usermanagement
{
    public partial class ClassUpdate : System.Web.UI.Page
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
                CurrentClass.DataSource = dataTable;
                CurrentClass.DataTextField = "ClassName";
                CurrentClass.DataValueField = "ClassId";
                CurrentClass.DataBind();
                CurrentClass.Items.Insert(0, new ListItem("Current Class", ""));

                string sqlquery = "AvailableClass";
                DBhelper DBhelper = new DBhelper();
                SqlParameter[] parameters = new SqlParameter[] { };     
                DataTable dataTable1 = new DataTable(); 
                dataTable1 = DBhelper.DataTable(sqlquery, parameters);

                Update.DataSource = dataTable;
                Update.DataTextField = "ClassName";
                Update.DataValueField = "ClassId";
                Update.DataBind();
                Update.Items.Insert(0, new ListItem("Update Class", ""));
            }
        }
    }
}