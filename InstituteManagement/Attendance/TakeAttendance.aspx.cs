using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using InstituteManagement.Class;

namespace InstituteManagement.Attendance
{
    public partial class TakeAttendance : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Title = "Take Attendance";
            if (!IsPostBack)
            {
                string query = "AvailableClass";

                DBhelper dBhelper = new DBhelper();
                DataTable dataTable1 = new DataTable();
                dataTable1 = dBhelper.DataTable(query, new SqlParameter[] { });
                SelectClass.DataSource = dataTable1;
                SelectClass.DataTextField = "ClassName";
                SelectClass.DataValueField = "ClassId";
                SelectClass.DataBind();
                SelectClass.Items.Insert(0, new ListItem("Select Class", ""));

            }

        }
        int selectclassvalue = 0;
     
        protected void ShowStudent_Click(object sender, EventArgs e)
        {
            selectclassvalue = Convert.ToInt32(SelectClass.SelectedValue);
            string attendanceDate = AttendanceDate.Text;

            string query = "CheckAttendace";
            DBhelper dBhelper = new DBhelper();
            SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("ClassId",selectclassvalue),
                new SqlParameter("AttendanceDate",attendanceDate)
            };
            SqlDataReader dataReader = dBhelper.DataReader(query, parameter);
            if (dataReader.Read())
            {
                SuccessMessage.Visible = true;
                SuccessMessage.Text = "Attendance Taken Already on This Date ";
                AttendanceGridview.Visible = false;
                Takeattendance.Visible = false;
               
            }
            else
            {
                SuccessMessage.Visible = false;
                AttendanceGridview.Visible = true;
                Takeattendance.Visible = true;
                string sqlquery = "StudentName";
                DBhelper DBhelper = new DBhelper();
                SqlParameter[] sqlParameters = new SqlParameter[]
                {
                  new SqlParameter("ClassId",selectclassvalue)
                };
                DataTable dataTable = new DataTable();
                dataTable = DBhelper.DataTable(sqlquery, sqlParameters);
                AttendanceGridview.DataSource = dataTable;
                AttendanceGridview.DataBind();
            }
        }

        protected void Absent_CheckedChanged(object sender, EventArgs e)
        {
            foreach (GridViewRow row in AttendanceGridview.Rows)
            {
                RadioButton radioButton = (RadioButton)row.FindControl("Absent");
                if (radioButton.Checked)
                {
                    TextBox textBox = (TextBox)row.FindControl("Reason");
                    textBox.Visible = true;
                }
                else
                {
                    TextBox textBox = (TextBox)row.FindControl("Reason");
                    textBox.Visible = false;
                }
            }
        }

        protected void Takeattendance_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow row in AttendanceGridview.Rows)
            {

                bool ispresent;
                int takerid = 1;//int.Parse(Session["UserId"].ToString());
                TextBox Comment = (TextBox)row.FindControl("Reason");
                RadioButton Absent = (RadioButton)row.FindControl("Absent");
                string StudentId = row.Cells[1].Text;

                DateTime attendanceDate = DateTime.Parse(AttendanceDate.Text);
                if (Absent.Checked)
                {
                    ispresent = false;
                }
                else
                {
                    ispresent = true;
                }
                string query = "TakeAttendance";
                DBhelper dBhelper = new DBhelper();
                SqlParameter[] parameter = new SqlParameter[]
                {
                       new SqlParameter("StudentId",StudentId),
                       new SqlParameter("AttendanceDate",attendanceDate),
                       new SqlParameter("IsPresent",ispresent),
                       new SqlParameter("TakerId ",takerid),
                       new SqlParameter("Reason",Comment.Text),
                };
                dBhelper.ExecuteNonQuery(query, parameter);
                Comment.Text = string.Empty;
                SuccessMessage.Visible = true;
                SuccessMessage.Text = "Take Attendance Successfully..";
                Takeattendance.Visible = false;
                AttendanceGridview.Visible = false;
                
            }
        }
        protected void Present_CheckedChanged(object sender, EventArgs e)
        {
            foreach (GridViewRow row in AttendanceGridview.Rows)
            {
                RadioButton radioButton = (RadioButton)row.FindControl("Absent");
                if (radioButton.Checked)
                {
                    TextBox textBox = (TextBox)row.FindControl("Reason");
                    textBox.Visible = true;
                }
                else
                {
                    TextBox textBox = (TextBox)row.FindControl("Reason");
                    textBox.Visible = false;
                }
            }
        }

        protected void AttendanceGridview_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                RadioButton radioButton = e.Row.FindControl("Absent") as RadioButton;
                radioButton.CheckedChanged += this.Absent_CheckedChanged;
                radioButton.CheckedChanged += this.Present_CheckedChanged;
                radioButton.CheckedChanged += this.Takeattendance_Click;
            }
        }
    }
}