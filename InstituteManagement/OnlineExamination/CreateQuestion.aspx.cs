using InstituteManagement.Class;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InstituteManagement.OnlineExamination
{
    public partial class CreateQuestion : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Page.Title = "Create Question";

                bool isactive = true;
                string query = "AvailableExam";
                DBhelper db = new DBhelper();
                SqlParameter[] param = new SqlParameter[]
                {
                 new SqlParameter("isactive",isactive)
                };
                DataTable datatable = new DataTable();
                datatable = db.DataTable(query, param);
                ExamList.DataSource = datatable;
                ExamList.DataTextField = "ExamTitle";
                ExamList.DataValueField = "ExamId";
                ExamList.DataBind();
                ExamList.Items.Insert(0, new ListItem("Please select", ""));
            }
        }

        protected void Createquestions_Click(object sender, EventArgs e)
        {
            DBhelper dbhelper = new DBhelper();
            string query = "CreateQuestion";
            string question = Question.Text;
            string option1 = Option1.Text;
            string option2 = Option2.Text;
            string option3 = Option3.Text;
            string option4 = Option4.Text;
            string rightanswer = RightAnswer.SelectedItem.Text;
            DateTime createddate = DateTime.Today;
            int examid = Convert.ToInt32(ExamList.SelectedValue);
            int examtakerid = int.Parse(Session["UserId"].ToString());
            string subject = Subject.Text;

            SqlParameter[] parameter = new SqlParameter[] {
                new SqlParameter("Question",question),
                new SqlParameter("Option1",option1),
                new SqlParameter("Option2",option2),
                new SqlParameter("Option3",option3),
                new SqlParameter("Option4",option4),
                new SqlParameter("RightAnswer",rightanswer),
                new SqlParameter("CreatedDate",createddate),
                new SqlParameter("ExamId",examid),
                new SqlParameter("ExamTakerId",examtakerid),
                new SqlParameter("Subject",subject)
            };
            dbhelper.ExecuteNonQuery(query, parameter);

            Question.Text = string.Empty;
            Option1.Text = string.Empty;
            Option2.Text = string.Empty;
            Option3.Text = string.Empty;
            Option4.Text = string.Empty;
            RightAnswer.Text = string.Empty;
            Subject.Text = string.Empty;
            SuccessMessage.Visible = true;
        }
    }
}



