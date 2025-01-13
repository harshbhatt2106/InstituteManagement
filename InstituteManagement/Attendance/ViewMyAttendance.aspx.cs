using InstituteManagement.Class;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace InstituteManagement.Attendance
{
    public partial class ViewMyAttendance : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            Page.Title = "View MyAttendnace";
            var currentYear = DateTime.Today.Year;
            if (!IsPostBack)
            {
                for (int i = 1; i >= 0; i--)
                {
                    SelectYear.Items.Add((currentYear - i).ToString());
                }
            }

        }

        protected void ViewmyAttendance_Click(object sender, EventArgs e)
        {
            int Month = Convert.ToInt32(SelectMonth.SelectedValue);
            int Year = Convert.ToInt32(SelectYear.SelectedItem.Text);
            int StundetId = 1;

            #region Check And ShowAttendance
            string query1 = "ChekMyAttendance";
            DBhelper dBhelper1 = new DBhelper();
            SqlParameter[] param = new SqlParameter[]
            {
                new SqlParameter("@Month",Month),
                new SqlParameter("@Year",Year),
                new SqlParameter("@StudentId",StundetId)
            };
            SqlDataReader reader = dBhelper1.DataReader(query1, param);
            if (reader.Read())
            {
                ViewMyattendanceGridview.Visible = true;
                DBhelper dBhelper = new DBhelper();
                string query = "ShowMyAttendance";
                SqlParameter[] parameter = new SqlParameter[]
                {
                    new SqlParameter("@Month",Month),
                    new SqlParameter("@Year",Year),
                    new SqlParameter("@StudentId",StundetId)
                };
                DataTable dataTable = dBhelper.DataTable(query, parameter);
                ViewMyattendanceGridview.DataSource = dataTable;
                ViewMyattendanceGridview.DataBind();
                Message.Visible = false;
            }
            else
            {
                ViewMyattendanceGridview.Visible = false;
                Message.Visible = true;
                Message.Text = "Attendance Not Found";
            }
            #endregion


            string SqlQuery = "CountMyAttendance";
            DBhelper Dhelper = new DBhelper();
            SqlParameter[] sqlParameters = new SqlParameter[]
            {
                new SqlParameter("Month",Month),
                new SqlParameter("Year",Year),
                new SqlParameter("StudentId",StundetId)
            };
           
            SqlDataReader sqlDataReader = Dhelper.DataReader(SqlQuery, sqlParameters);
            if(sqlDataReader.Read())
            {
                TotaDays.Text = sqlDataReader["Total"].ToString();
                AbsentDays.Text = sqlDataReader["Absent"].ToString();
                PresentDays.Text = sqlDataReader["Present"].ToString();
            }
        }
    }
}