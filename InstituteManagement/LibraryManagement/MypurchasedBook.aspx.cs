using System;
using System.Web.UI;
using System.Data.SqlClient;
using System.Data;
using InstituteManagement.Class;

namespace InstituteManagement.LibraryManagement
{
    public partial class MypurchasedBook : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Title = "My Purchased Book";

            int StudentId = int.Parse(Session["ContentId"].ToString());

            string query = "ShowmyPurchasedBook";
            DBhelper dBhelper = new DBhelper();
            DataTable datatable = new DataTable();
            SqlParameter[] Parameters = new SqlParameter[]
            {
                new SqlParameter("StudentId",StudentId)
            };
            datatable = dBhelper.DataTable(query, Parameters);
            ShowMyPrchasedBook.DataSource = datatable;
            ShowMyPrchasedBook.DataBind();
        }
    }
}