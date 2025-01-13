using InstituteManagement.Class;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InstituteManagement.KnowledgeRepository
{
    public partial class AddCategory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Title = "Add Category";
        }

        protected void addcategory_Click(object sender, EventArgs e)
        {

            string categoryname = CategoryName.Text;

            string storeprocedure = "CategoryExitsOrNot";
            DBhelper DBhelper = new DBhelper();
            SqlParameter[] Parameters = new SqlParameter[]
            {
                new SqlParameter("CategoryName",categoryname)
            };
            SqlDataReader reader = DBhelper.DataReader(storeprocedure, Parameters);
            if (reader.Read())
            {
                successmessage.Visible = true;
                successmessage.ForeColor = System.Drawing.Color.Red;
                successmessage.Text = "This Category Are Already Exits";
            }
            else
            {
                successmessage.Visible = true;
                successmessage.ForeColor = System.Drawing.Color.Green;

                string procedure = "AddCategory";
                DBhelper dBhelper = new DBhelper();
                SqlParameter[] sqlParameters = new SqlParameter[]
                {
                new SqlParameter("CategoryName",categoryname)
                };
                dBhelper.ExecuteNonQuery(procedure, sqlParameters);
                successmessage.Text = "Category Added Successfully";
                CategoryName.Text = string.Empty;
            }
        }
    }
}