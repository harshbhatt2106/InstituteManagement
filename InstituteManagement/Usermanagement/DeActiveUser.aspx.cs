using InstituteManagement.Class;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI.WebControls;

namespace InstituteManagement.Usermanagement
{
    public partial class DeactiveUser : System.Web.UI.Page
    {
        string ClassId = "";
        int stundetid = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
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

        protected void deactivatuser_Click(object sender, EventArgs e)
        {

        }
    }
}