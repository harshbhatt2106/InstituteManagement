using InstituteManagement.Class;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InstituteManagement.Attendance
{
    public partial class EditAttendance : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Title = "Edit Attendance";
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
                SelectClass.Items.Insert(0, new ListItem("Select Class", ""));

         
            }
        }

        protected void ShowStudent_Click(object sender, EventArgs e)
        {
            string classid = SelectClass.SelectedValue;

            string query1 = "CheckAttendace";
            string attendanceDate = AttendanceDate.Text;
            DBhelper dBhelper1 = new DBhelper();
            SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("ClassId",classid),
                new SqlParameter("AttendanceDate",attendanceDate)
            };
            SqlDataReader dataReader = dBhelper1.DataReader(query1, parameter);
            if (dataReader.Read())
            {
                editAttendance.Visible = true;
                EditattendanceGridview.Visible = true;
                DBhelper dBhelper = new DBhelper();
                string query = "ViewAttendance";
                string date = AttendanceDate.Text;
                SqlParameter[] param = new SqlParameter[]
                {
                    new SqlParameter("ClassId",classid),
                    new SqlParameter("AttendanceDate",date)
                };
                DataTable dataTable = new DataTable();
                dataTable = dBhelper.DataTable(query, param);
                EditattendanceGridview.DataSource = dataTable;
                EditattendanceGridview.DataBind();
                SuccessMessage.Visible = false;
                foreach (GridViewRow row in EditattendanceGridview.Rows)
                {
                    DropDownList UpdateStatus = row.FindControl("UpdateStatus") as DropDownList;
                    string attendacestatus = row.Cells[1].Text;
                    if(attendacestatus=="Present")
                    {
                        UpdateStatus.Items.Add(new ListItem("Present", "1"));
                        UpdateStatus.Items.Add(new ListItem("Absent", "0"));

                    }
                    else
                    {
                        UpdateStatus.Items.Add(new ListItem("Absent", "0"));
                        UpdateStatus.Items.Add(new ListItem("Present", "1"));

                    }
                }
            }
            else
            {
                editAttendance.Visible = false;
                EditattendanceGridview.Visible = false;
                SuccessMessage.Visible = true;
                SuccessMessage.Text = "Attendance Not Take";
            }
        }



        protected void EditAttendance_Click(object sender, EventArgs e)
        {

            foreach (GridViewRow row in EditattendanceGridview.Rows)
            {
                string query = "UpdateAttendnace";
                DropDownList dropDownList = (DropDownList)row.FindControl("UpdateStatus");

                int updatedBy = 1;//int.Parse(Session["UserId"].ToString());
                string  updatestatus = dropDownList.SelectedValue;
                int studentId = int.Parse(row.Cells[2].Text);
                DateTime updateDate = DateTime.Today;

                TextBox Comment = (TextBox)row.FindControl("Comment");
                DateTime attendanceDate = DateTime.Parse(AttendanceDate.Text);

                string reason = Comment.Text;
                SqlParameter[] param = new SqlParameter[]
                {
                    new SqlParameter("StudentId", studentId),
                    new SqlParameter("AttendanceDate", attendanceDate),
                    new SqlParameter("IsPresent", updatestatus),
                    new SqlParameter("Reason", reason),
                    new SqlParameter("UpdatedBy",updatedBy),
                    new SqlParameter("UpdatedDate",updateDate)
                };
                DBhelper dBhelper = new DBhelper();
                dBhelper.ExecuteNonQuery(query, param);
                SuccessMessage.Visible = true;
                SuccessMessage.Text = "Attendance Updated Successfully";
            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DropDownList dropDownList = e.Row.FindControl("UpdateStatus") as DropDownList;
                dropDownList.SelectedIndexChanged += this.UpdateStatus_SelectedIndexChanged;
            }
        }

        protected void UpdateStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            foreach (GridViewRow row in EditattendanceGridview.Rows)
            {
                DropDownList dropDownList = (DropDownList)row.FindControl("UpdateStatus");

                if (dropDownList.SelectedItem.Text == "Absent")
                {
                    TextBox textBox = (TextBox)row.FindControl("Comment");
                    textBox.Visible = true;
                }
                else
                {
                    TextBox textBox = (TextBox)row.FindControl("Comment");
                    textBox.Visible = false;
                }
            }
        }
    }
}