using InstituteManagement.Class;
using System;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections.Generic;

namespace InstituteManagement.OnlineExamination
{
    public partial class ShowExam : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Page.Title = "Show Exam";
                bool isactive = true;
                DateTime date = DateTime.Today;
                int StundetID = int.Parse(Session["UserId"].ToString());

                CommonMethod commonMethod = new CommonMethod();
                Dictionary<string, string> UserInformation = commonMethod.GetUserInformation(StundetID);
                string classid = UserInformation["ClassId"].ToString();
                int Classid = int.Parse(classid);

                #region Available Exam
                SqlParameter[] parameter = new SqlParameter[]
                {
                    new SqlParameter("IsActive",isactive),
                    new SqlParameter("StudentId",StundetID),
                    new SqlParameter("TakeDate",date),
                    new SqlParameter("ClassId",Classid)
                };
                string sqlquery = "ExamDetail";
                DBhelper dbhelper = new DBhelper();
                DataTable datatable = new DataTable();
                datatable = dbhelper.DataTable(sqlquery, parameter);
                DataList1.DataSource = datatable;
                DataList1.DataBind();
                #endregion
            }
        }

        protected void StartExam_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            DataListItem item = (DataListItem)btn.NamingContainer;
            Label examid = (Label)item.FindControl("ExamId");
            Label Duration = (Label)item.FindControl("Duration");

            Session["ExamId"] = int.Parse(examid.Text);
            Session["Durationtime"] = int.Parse(Duration.Text);

            Response.Redirect("SubmitExam.aspx");
        }
    }
}