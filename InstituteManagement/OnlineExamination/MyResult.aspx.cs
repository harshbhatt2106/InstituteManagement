using InstituteManagement.Class;
using System;
using System.Data;
using System.Data.SqlClient;

namespace InstituteManagement.OnlineExamination
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int stundetid = int.Parse(Session["UserId"].ToString());
            string query = "ShowMyResult";
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("StudentId",stundetid)
            };
            DBhelper dBhelper = new DBhelper();
            DataTable dataTable = new DataTable();
            dataTable = dBhelper.DataTable(query, parameters);
            DataList1.DataSource = dataTable;
            DataList1.DataBind();   
        }
    }
}