using System;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI;
using InstituteManagement.Class;
using System.Web.UI.WebControls;

namespace InstituteManagement.Attendance
{
    public partial class ViewAttendnace : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Title = "View Attendance";
            if (!IsPostBack)
            {
                string sp = "AvailableClass";
                DBhelper dBhelper = new DBhelper();
                SqlParameter[] parameter = new SqlParameter[] { };
                DataTable tb = new DataTable();
                tb = dBhelper.DataTable(sp, parameter);
                SelectClass.DataSource = tb;
                SelectClass.DataTextField = "ClassName";
                SelectClass.DataValueField = "ClassId";
                SelectClass.DataBind();
                SelectClass.Items.Insert(0, new ListItem("Please select", ""));
            }
        }

        protected void ShowStudent_Click(object sender, EventArgs e)
        {
            ViewAttendanceGridview.Visible = true;
            string date = Date.Text;
            int classid = int.Parse(SelectClass.SelectedValue);
            string query = "ViewAttendance";
            DBhelper db = new DBhelper();
            SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("ClassId", classid),
                new SqlParameter("AttendanceDate",date)
            };
            DataTable dataTable = new DataTable();
            dataTable = db.DataTable(query, parameter);
            ViewAttendanceGridview.DataSource = dataTable;
            ViewAttendanceGridview.DataBind();

            #region Count Student
            string sp = "CountStudent";
            SqlParameter[] param = new SqlParameter[]
            {
                new SqlParameter("@ClassId",classid),
                new SqlParameter("@AttendanceDate",date)
            };
            DBhelper dbHelper = new DBhelper();
            SqlDataReader reader = null;
            reader = dbHelper.DataReader(sp, param);
            if (reader.Read())
            {
                PresentStudent.Text = reader["Present"].ToString();
                TotalStudent.Text = reader["Total"].ToString();
                AbsentStudent.Text = reader["Absent"].ToString();
            }
            else
            {
                TotalStudent.Text = "0";
                PresentStudent.Text = "No Studnet Present Available";
                AbsentStudent.Text = "No Stundet Absent Available";
            }
            #endregion
        }

    }
}