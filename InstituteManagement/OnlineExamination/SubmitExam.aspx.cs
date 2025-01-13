using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using InstituteManagement.Class;
using System.Drawing;
using System.Collections.Generic;
using System.Web.UI;

namespace InstituteManagement.OnlineExamination
{
    public partial class SubmitExam : System.Web.UI.Page
    {
        int ExamId;
        int StudentId;
        protected void Page_Load(object sender, EventArgs e)
        {
            StudentId = int.Parse(Session["UserId"].ToString());
            Page.Title = "SubmitExam";

            if (Session["refreshpage"] == null)
            {
                if (!IsPostBack)
                {
                    minite.Text = Session["Durationtime"].ToString();
                    second.Text = "60";
                }
                Session["refreshpage"] = true;
            }

            int TotalQuestion = 0;
            ExamId = int.Parse(Session["ExamId"].ToString());

            #region CountQuestion And Show FirstQuestion show
            string sp = "CountQuestion";
            SqlParameter[] prameters = new SqlParameter[]
            {
                 new SqlParameter("ExamId",ExamId)
            };
            DBhelper dBhelper = new DBhelper();
            SqlDataReader reader = null;
            reader = dBhelper.DataReader(sp, prameters);
            if (reader.Read())
            {
                TotalQuestion = int.Parse(reader["TotalQuestion"].ToString());
                if (QuestionId.Text == "")
                {
                    Question.Text = reader["Question"].ToString();
                    string option1 = reader["Option1"].ToString();
                    string option2 = reader["Option2"].ToString();
                    string option3 = reader["Option3"].ToString();
                    string option4 = reader["Option4"].ToString();
                    QuestionId.Text = reader["QuestionId"].ToString();
                    OptionsRadioButtonList.Items.Add(new ListItem(option1, "Option1"));
                    OptionsRadioButtonList.Items.Add(new ListItem(option2, "Option2"));
                    OptionsRadioButtonList.Items.Add(new ListItem(option3, "Option3"));
                    OptionsRadioButtonList.Items.Add(new ListItem(option4, "Option4"));
                }

            }
            #endregion

            #region Create Dynamically button
            string query = "CountQuestion";
            SqlParameter[] sqlParameters = new SqlParameter[]
            {
                 new SqlParameter("ExamId",ExamId)
            };
            DBhelper dhelper = new DBhelper();
            SqlDataReader dataReader = null;
            dataReader = dhelper.DataReader(query, sqlParameters);
            for (int i = 0; i < TotalQuestion; i++)
            {
                if (dataReader.Read())
                {
                    string question_id = dataReader["QuestionId"].ToString();
                    Button button = new Button();
                    button.Text = (i + 1).ToString();
                    button.ID = question_id;
                    button.Click += new EventHandler(DynamicaButton_Click);
                    button.Attributes.Add("runat", "server");
                    button.Attributes.Add("AutoPostback", "true");
                    button.Attributes.Add("class", "DynmicButton");

                    DynamicaButton.Controls.Add(button);
                }
            }
            #endregion

        }
        public void QuestionUpdateOrInsert()
        {
            int Questionid = 0;

            string RightAnswer = "";

            string chosenOption = OptionsRadioButtonList.SelectedValue;

            int TotalRightAnswer = 0;

            if (int.TryParse(QuestionId.Text, out int Qid))
            {
                Questionid = Qid;
            }
            #region Get RightAnswer
                string _sp = "ShowQuestion";
                SqlParameter[] sqlparameters = new SqlParameter[]
                {
                   new SqlParameter("ExamId",ExamId),
                   new SqlParameter("QuestionId",Questionid)
                };
                DBhelper _dBhelper = new DBhelper();
                SqlDataReader Reader = null;
                Reader = _dBhelper.DataReader(_sp, sqlparameters);
                if (Reader.Read())
                {
                    RightAnswer = Reader["RightAnswer"].ToString();
                }
            #endregion

            bool IsRight;
            if (chosenOption == RightAnswer)
            {
                TotalRightAnswer += 1;
                IsRight = true;
            }
            else
            {
                IsRight = false;
            }
            OptionsRadioButtonList.Items.Clear();

            #region Update Or Insert

            string _sqlquery = "QuestionSelectedOrNot";
            DBhelper DatabaseHelper = new DBhelper();
            SqlParameter[] param = new SqlParameter[]
            {
                 new SqlParameter("QuestionId",Questionid),
                 new SqlParameter("StudentId",StudentId)
            };
            SqlDataReader sqlDataReader = DatabaseHelper.DataReader(_sqlquery, param);
            if (sqlDataReader.Read())
            {
                selectedvalue = sqlDataReader["ChooseOption"].ToString();

                if (chosenOption == "")
                {
                    chosenOption = selectedvalue;
                }

                if (chosenOption == RightAnswer)
                {
                    IsRight = true;
                }
                else
                {
                    IsRight = false;
                }
                string query = "UpdateSubmitedQuestion";
                DBhelper dBhelper = new DBhelper();
                SqlParameter[] parameters = new SqlParameter[]
                {
                      new SqlParameter("QuestionId",Questionid),
                      new SqlParameter("StudentId",StudentId),
                      new SqlParameter("Chooseoption",chosenOption),
                      new SqlParameter("IsRight",IsRight)
                };
                dBhelper.ExecuteNonQuery(query, parameters);
            }
            else
            {

                string Query = "TakeExam";
                DBhelper DBHelper = new DBhelper();
                SqlParameter[] parameters = new SqlParameter[]
                {
                        new SqlParameter("QuestionId",Questionid),
                        new SqlParameter("StudentId",StudentId),
                        new SqlParameter("IsRight",IsRight),
                        new SqlParameter("ChooseOption",chosenOption)
                };
                DBHelper.ExecuteNonQuery(Query, parameters);

            }

            #endregion
        }

        string selectedvalue = "";
        protected void NextButton_Click(object sender, EventArgs e)
        {
            QuestionUpdateOrInsert();

            #region Next Button

            int questionid = 0;

            if (int.TryParse(QuestionId.Text, out int _questionid))
            {
                questionid = _questionid;
            }

            string sqlquery = "NextButton";
            SqlParameter[] sqlparameter = new SqlParameter[]
            {
                 new SqlParameter("ExamId",ExamId),
                 new SqlParameter("QuestionId",questionid)
            };
            DBhelper DBhelper = new DBhelper();
            SqlDataReader reader = null;
            reader = DBhelper.DataReader(sqlquery, sqlparameter);
            if (reader.Read())
            {
                Question.Text = reader["Question"].ToString();
                string option1 = reader["Option1"].ToString();
                string option2 = reader["Option2"].ToString();
                string option3 = reader["Option3"].ToString();
                string option4 = reader["Option4"].ToString();
                OptionsRadioButtonList.Items.Add(new ListItem(option1, "Option1"));
                OptionsRadioButtonList.Items.Add(new ListItem(option2, "Option2"));
                OptionsRadioButtonList.Items.Add(new ListItem(option3, "Option3"));
                OptionsRadioButtonList.Items.Add(new ListItem(option4, "Option4"));
                QuestionId.Text = reader["QuestionId"].ToString();
                if (selectedvalue != "")
                {
                    OptionsRadioButtonList.Items.FindByValue(selectedvalue).Selected = true;
                }
            }
            else
            {
                Question.Text = "Question Complete";
            }
            #endregion

        }

        private void DynamicaButton_Click(object sender, EventArgs e)
        {
            QuestionUpdateOrInsert();

            #region Show Quesiton

            Button Clickbutton = (Button)sender;
            string question_id = Clickbutton.ID;

            OptionsRadioButtonList.Items.Clear();
            string sqlquery = "ShowQuestion";
            SqlParameter[] sqlparameter = new SqlParameter[]
            {
                 new SqlParameter("ExamId",ExamId),
                 new SqlParameter("QuestionId",question_id)
            };
            DBhelper DBhelper = new DBhelper();
            SqlDataReader reader = null;
            reader = DBhelper.DataReader(sqlquery, sqlparameter);
            if (reader.Read())
            {
                Button dynamicButton = (Button)DynamicaButton.FindControl(question_id);

                Question.Text = reader["Question"].ToString();
                string option1 = reader["Option1"].ToString();
                string option2 = reader["Option2"].ToString();
                string option3 = reader["Option3"].ToString();
                string option4 = reader["Option4"].ToString();
                QuestionId.Text = reader["QuestionId"].ToString();

                OptionsRadioButtonList.Items.Add(new ListItem(option1, "Option1"));
                OptionsRadioButtonList.Items.Add(new ListItem(option2, "Option2"));
                OptionsRadioButtonList.Items.Add(new ListItem(option3, "Option3"));
                OptionsRadioButtonList.Items.Add(new ListItem(option4, "Option4"));
                if (OptionsRadioButtonList.SelectedValue == "")
                {
                    dynamicButton.BackColor = Color.Red;
                }
            }
            if (selectedvalue != "")
            {
                OptionsRadioButtonList.Items.FindByValue(selectedvalue).Selected = true;
            }
            #endregion
        }
        protected void submitExam_Click(object sender, EventArgs e)
        {
            string value = ConfromationforExamSubmission.Value;

            string ExamTitle = "";
            int TotalMark = 0;
            DateTime TakeDate = DateTime.Now;
            int PassingMark = 0;
            string PassOrFail = "";
            string ExamTakerName = "";
            string StudentName = "";
            string Emailaddress = "";
            int ObtainMark = 0;

            if (value == "Yes")
            {
                QuestionUpdateOrInsert();

                string query = "ExamSubmitedHistory";
                DBhelper dBhelper = new DBhelper();
                SqlParameter[] sqlParameter = new SqlParameter[]
                {
                    new SqlParameter("ExamId",ExamId),
                    new SqlParameter("StudentId",StudentId)
                };
                dBhelper.ExecuteNonQuery(query, sqlParameter);
               
                Question.Text = string.Empty;

                string sqlquery = "CreateResult";
                SqlParameter[] parameter = new SqlParameter[]
                {
                  new SqlParameter("ExamId",ExamId),
                  new SqlParameter("StudentId",StudentId)
                };
                DBhelper dbhelper = new DBhelper();
                SqlDataReader reader = dbhelper.DataReader(sqlquery, parameter);
                if (reader.Read())
                {
                    PassingMark = reader.GetInt32(reader.GetOrdinal("PassingMark"));
                    ObtainMark = reader.GetInt32(reader.GetOrdinal("Mark"));
                    TotalMark = reader.GetInt32(reader.GetOrdinal("TotalMark"));
                    ExamTakerName = reader["ExamCreatedBy"].ToString();
                    TakeDate = Convert.ToDateTime(reader["TakeDate"]);
                    ExamTitle = reader["ExamTitle"].ToString();
                    if (PassingMark < ObtainMark)
                    {
                        PassOrFail = "Pass";
                    }
                    else
                    {
                        PassOrFail = "Fail";
                    }
                }

                CommonMethod commonMethod = new CommonMethod();
                Dictionary<string, string> UserInfromation = commonMethod.GetUserInformation(1);
                StudentName = UserInfromation["FirstName"] + UserInfromation["LastName"];
                Emailaddress = UserInfromation["EmailAddress"];

                string emailBody = $@"
    <html>
        <head>
            <style>
                table {{
                    font-family: Arial, sans-serif;
                    border-collapse: collapse;
                    width: 100%;
                }}
                th, td {{
                    border: 1px solid #dddddd;
                    text-align: left;
                    padding: 8px;
                }}
                th {{
                    background-color: #f2f2f2;
                }}
            </style>
        </head>
        <body>
            <h2>Exam Details</h2>
            <table>
                <tr>
                    <th>Exam Title</th>
                    <th>Total Mark</th>
                    <th>Take Date</th>
                    <th>ObtainMark</th>
                    <th>Passing Mark</th>
                    <th>Pass or Fail</th>
                    <th>Exam Taker Name</th>
                    <th>Student Name</th>
                </tr>
                <tr>
                    <td>{ExamTitle}</td>
                    <td>{TotalMark}</td>
                    <td>{TakeDate}</td>
                    <td>{ObtainMark}</td>
                    <td>{PassingMark}</td>
                    <td>{PassOrFail}</td>
                    <td>{ExamTakerName}</td>
                    <td>{StudentName}</td>
                </tr>
            </table>
        </body>
    </html>
";
                string description = "Your Exam Result Details";

                commonMethod.SendMail(Emailaddress, emailBody, "Exam Result", description);
                Response.Redirect("ShowExam.aspx");
            }
        }
        protected void OptionsRadioButtonList_SelectedIndexChanged(object sender, EventArgs e)
        {
            Button dynamicbutton = (Button)DynamicaButton.FindControl(QuestionId.Text);
            if (OptionsRadioButtonList.SelectedValue != "")
            {
                dynamicbutton.BackColor = Color.Green;
            }
        }

        protected void CountDuration_Tick1(object sender, EventArgs e)
        {
            int intitialminite = int.Parse(minite.Text);
            int intilizationSecond = int.Parse(second.Text);

            intilizationSecond--;
            second.Text = intilizationSecond.ToString();

            if (second.Text == "0")
            {
                intitialminite--;
                minite.Text = intitialminite.ToString();
                second.Text = "60";
            }

            if (intitialminite == 0)
            {
                QuestionUpdateOrInsert();

                ScriptManager.RegisterStartupScript(this, this.GetType(), "TimeOutScript", "alert('Your Time is Over And Exam is Loss.');", true);

                string query = "ExamSubmitedHistory";
                DBhelper dBhelper = new DBhelper();
                SqlParameter[] sqlParameter = new SqlParameter[]
                {
                    new SqlParameter("ExamId",ExamId),
                    new SqlParameter("StudentId",StudentId)
                };
                dBhelper.ExecuteNonQuery(query, sqlParameter);

                Response.Redirect("ShowExam.aspx");
            }
        }
    }
}