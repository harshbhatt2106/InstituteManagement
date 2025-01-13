using InstituteManagement.Class;
using System;
using System.Data.SqlClient;


namespace InstituteManagement.Login
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            otpsuccessmessage.Visible = false;
        }

        protected void GetOpt_Click(object sender, EventArgs e)
        {
            otpsuccessmessage.Visible = true;

            DBhelper db = new DBhelper();

            SqlParameter[] param = new SqlParameter[]
            {
                new SqlParameter("EmailAddress",Emailaddress.Text)
            };
            string query = "Emailvalidation";
            SqlDataReader reder = null;

            reder = db.DataReader(query, param);

            if (reder.Read())
            {
                if (GetOpt.Text == "GetOtp")
                {
                    Emailicon.Visible = false;
                    Emailaddress.Visible = false;
                    EnterOtp.Visible = true;
                    otpsuccessmessage.Visible = true;
                    resendotp.Visible = true;

                    Random random = new Random();
                    int verificationCode = random.Next(100000, 999999);
                    string code = verificationCode.ToString();
                    Session["GeneratedOTP"] = code;
                    Session["EmailAddress"] = Emailaddress.Text;
                    DateTime dateTime = DateTime.Now.AddMinutes(5);
                    Session["otptime"] = dateTime;

                    string body = "To reset your password, please enter the following verification code:" + code;
                    string subject = "Reset Password";
                    string description = "Description:This email contains a verification code that you can use to reset your password. Please enter the code into the password reset form on our website. The code is valid for [5 minit]. If you did not request to reset your password, please ignore this email";
                    try
                    {
                        CommonMethod commonMethod = new CommonMethod();
                        commonMethod.SendMail(Emailaddress.Text, body, subject, description);
                    }
                    catch (Exception Error)
                    {
                        otpsuccessmessage.Text = Error.Message;
                    }

                    otpsuccessmessage.Text = "Check YourEmail For Varification Code";
                    GetOpt.Text = "Verified otp";
                }
                if (GetOpt.Text == "Verified otp")
                {
                    otpsuccessmessage.Visible = true;

                    string otp = Session["GeneratedOTP"].ToString();
                    DateTime time = (DateTime)Session["otptime"];
                    if (DateTime.Now <= time)
                    {

                        if (otp == EnterOtp.Text)
                        {
                            Response.Redirect("Updatepassword.aspx");
                        }
                        else if (EnterOtp.Text != string.Empty)
                        {
                            otpsuccessmessage.Text = "Invalid Otp";
                        }
                    }
                    else
                    {
                        otpsuccessmessage.Text = "Otp is Expiry Please Resend otp";
                    }
                }
            }
            else
            {
                otpsuccessmessage.Text = "EmailAdress Is Not Valid";
            }
        }



        protected void resendotp_Click(object sender, EventArgs e)
        {
            Random random = new Random();
            int verificationCode = random.Next(100000, 999999);
            string code = verificationCode.ToString();
            Session["GeneratedOTP"] = code;
            DateTime dateTime = DateTime.Now.AddMinutes(5);
            Session["otptime"] = dateTime;

            string body = "To reset your password, please enter the following verification code:" + code;
            string subject = "Reset Password";
            string description = "Description:This email contains a verification code that you can use to reset your password. Please enter the code into the password reset form on our website. The code is valid for [5 minit]. If you did not request to reset your password, please ignore this email";
            try
            {
                CommonMethod commonMethod = new CommonMethod();
                commonMethod.SendMail(Session["EmailAddress"].ToString(), body, subject, description);
            }
            catch(Exception Error)
            {
                otpsuccessmessage.Text = Error.Message;
            }
        }
    }
}