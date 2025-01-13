using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Net;
using System.Net.Mail;


namespace InstituteManagement.Class
{
    public class CommonMethod
    {
        public Dictionary<string, string> GetUserInformation(int userId)
        {
            Dictionary<string, string> userInformations = new Dictionary<string, string>();

            DBhelper dBhelper = new DBhelper();
                
            SqlDataReader sqlDataReader = null;
            string query = "GetUserInformation";

            SqlParameter[] param = new SqlParameter[]
            {
                new SqlParameter("UserId",userId)
            };

            sqlDataReader = dBhelper.DataReader(query, param);
            while (sqlDataReader.Read())
            {
                userInformations.Add("FirstName", sqlDataReader["FirstName"].ToString());
                userInformations.Add("LastName", sqlDataReader["LastName"].ToString());
                userInformations.Add("ProfilePicturePath", sqlDataReader["ProfilePicturePath"].ToString());
                userInformations.Add("EmailAddress", sqlDataReader["EmailAddress"].ToString());
                userInformations.Add("ClassId", sqlDataReader["ClassId"].ToString());
            }
            sqlDataReader.Close();
            return userInformations;
        }


        public string EncreptPassword(string password)
        {
            byte[] encData_byte = new byte[password.Length];
            encData_byte = System.Text.Encoding.UTF8.GetBytes(password);
            string encodedData = Convert.ToBase64String(encData_byte);
            return encodedData;
        }
        public void SendMail(string toEmail, string body, string subject, string description)
        {
            string fromEmail = "harshbhatt932@gmail.com";
            string _subject = subject;
            string _body = body;
            string _description = description;

            MailMessage message = new MailMessage();
            message.From = new MailAddress(fromEmail);
            message.To.Add(new MailAddress(toEmail));
            message.Subject = subject;
            message.Body = _body + "<br>" + description;
            message.IsBodyHtml = true;

            SmtpClient smtp = new SmtpClient("smtp.gmail.com");
            smtp.Port = 587;
            smtp.EnableSsl = true;
            smtp.Credentials = new NetworkCredential("harshbhatt932@gmail.com", "lbmc vdvp jkex kjia");
           
            smtp.Send(message);

        }

    }
}