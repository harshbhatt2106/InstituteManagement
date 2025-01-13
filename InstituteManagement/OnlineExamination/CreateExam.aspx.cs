using InstituteManagement.Class;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InstituteManagement.OnlineExamination
{
    public partial class CreateExam : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Title = "Create Exam";
            if (!IsPostBack)
            {
                string query = "AvailableClass";
                DBhelper dBhelper = new DBhelper();
                SqlParameter[] parameter = new SqlParameter[] { };
                DataTable dataTable1 = new DataTable();

                dataTable1 = dBhelper.DataTable(query, parameter);
                SelectClass.DataSource = dataTable1;
                SelectClass.DataTextField = "ClassName";
                SelectClass.DataValueField = "ClassId";
                SelectClass.DataBind();
                SelectClass.Items.Insert(0, new ListItem("Select Class", ""));

            }
        }

        protected void Createexam_Click(object sender, EventArgs e)
        {
            DBhelper dbhelper = new DBhelper();
            string query = "CreateExam";
            string examtitle = Examtitle.Text;
            int selectclass = int.Parse(SelectClass.SelectedValue);
            int totalmark = int.Parse(Totalmarks.Text);
            int passingmark = int.Parse(Passingmark.Text);
            int examcreatedby = int.Parse(Session["UserId"].ToString());
            int duration = int.Parse(Duration.Text);
            DateTime createdate = DateTime.Today;
            DateTime takedate = DateTime.Parse(TakeDate.Text);
            DateTime takentimefrom = Convert.ToDateTime(TakenTimeFrom.Text);
            DateTime takentimeto = Convert.ToDateTime(TakenTimeTo.Text);


            SqlParameter[] parameter = new SqlParameter[] {
                new SqlParameter("ExamTitle",examtitle),
                new SqlParameter("ClassId",selectclass),
                new SqlParameter("TotalMark",totalmark),
                new SqlParameter("PassingMark",passingmark),
                new SqlParameter("ExamCreatedBy",examcreatedby),
                new SqlParameter("CreatedDate",createdate),
                new SqlParameter("TakeDate",takedate),
                new SqlParameter("TakenTimeFrom",takentimefrom),
                new SqlParameter("TakenTimeTo",takentimeto),
                new SqlParameter("IsActive",true),
                new SqlParameter("Duration",duration)
            };
            dbhelper.ExecuteNonQuery(query, parameter);
            SuccessMessage.Visible = true;
            Examtitle.Text = string.Empty;
            SelectClass.Text = string.Empty;
            Totalmarks.Text = string.Empty;
            Passingmark.Text = string.Empty;
            TakeDate.Text = string.Empty;
            TakenTimeFrom.Text = string.Empty;
            TakenTimeTo.Text = string.Empty;
        }
    }
}
