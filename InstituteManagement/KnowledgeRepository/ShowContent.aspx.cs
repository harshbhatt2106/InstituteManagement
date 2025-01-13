using InstituteManagement.Class;
using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace InstituteManagement.KnowledgeRepository
{
    public partial class SHowContent : System.Web.UI.Page
    {
        string PDFfilepath;
        string Documnetype = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            int contentid = int.Parse(Session["ContentId"].ToString());
            string Category = category.Text;

            Page.Title = "Show Content";

            string StoreProcedure = "ShowContent";
            
            DBhelper dBhelper = new DBhelper();
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("ContentId",contentid)
            };
            SqlDataReader reader = dBhelper.DataReader(StoreProcedure, parameters);
            if (reader.Read())
            {
                title.Text = reader["Title"].ToString();
                username.Text = reader["UserName"].ToString();
                category.Text = reader["CategoryName"].ToString();
                Documnetype = reader["DocumnetType"].ToString();

                PDFfilepath = reader["FilePath"].ToString();
                Label1.Text = reader["Description"].ToString();

                PdfViewer1.Visible = false;
                if (Documnetype == "PlainText")
                {
                    ProfilePicture.Visible = false;
                    Open.Visible = false;
                    Download.Visible = false;

                }
                else if (Documnetype == "PDF")
                {
                    ProfilePicture.Visible = true;
                    ProfilePicture.ImageUrl = "../Image/pdficon.png";
                }
                else
                {
                    ProfilePicture.ImageUrl = reader["FilePath"].ToString();
                }
            }
        }

        protected void Open_Click(object sender, EventArgs e)
        {
            if (Documnetype == "PDF")
            {
                Response.ContentType = "application/pdf";
                Response.TransmitFile(PDFfilepath);
            }
            else
            {
                Response.ContentType = "image/jpeg";
                Response.TransmitFile(PDFfilepath);
            }
        }

        protected void Download_Click(object sender, EventArgs e)
        {
            if (Documnetype == "PDF")
            {
                Response.ContentType = "application/pdf";
                Response.AppendHeader("Content-Disposition", "attachment; filename=" + PDFfilepath);
                Response.WriteFile(PDFfilepath);
                Response.Flush();
                Response.End();
            }
            else
            {
                Response.ContentType = "image/jpeg";
                Response.AppendHeader("Content-Disposition", "attachment; filename=" + PDFfilepath);

                Response.WriteFile(PDFfilepath);
                Response.Flush();

                Response.End();
            }
        }
    }
}