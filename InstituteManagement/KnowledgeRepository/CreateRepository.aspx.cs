using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using InstituteManagement.Class;

namespace InstituteManagement.KnowledgeRepository
{
    public partial class CreateRepository : System.Web.UI.Page
    {
        int StudentId;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (int.TryParse(Session["UserId"].ToString(), out StudentId)) { }

            Page.Title = "Create Repository";
            if (!IsPostBack)
            {
                string Procedure = "CategoryList";
                DBhelper dBhelper = new DBhelper();
                DataTable dataTable = new DataTable();
                dataTable = dBhelper.DataTable(Procedure, new SqlParameter[] { });
                CategoryList.DataSource = dataTable;
                CategoryList.DataTextField = "CategoryName";
                CategoryList.DataValueField = "CategoryId";
                CategoryList.DataBind();
                CategoryList.Items.Insert(0, new ListItem("Select Category", ""));
            }
        }
        protected void createRepository_Click(object sender, EventArgs e)
        {

            string title = RepositoryTitle.Text;
            DateTime uploadeddate = DateTime.Now;
            string documenttype = SelectDocument.Text;
            string filepath = "";
            string discription = Description.Text;
            int categoryid = int.Parse(CategoryList.SelectedValue);

            if (FileUpload.HasFile)
            {
                string str = FileUpload.FileName;
                FileUpload.PostedFile.SaveAs(Server.MapPath("~/RepositoryFiles/" + str));
                filepath = "~/RepositoryFiles/" + str.ToString();

                string fileExtension = System.IO.Path.GetExtension(FileUpload.FileName).ToLower();

                if (fileExtension == ".jpg" || fileExtension == ".jpeg" || fileExtension == ".png" || fileExtension==".pdf")
                {
                    string Procedure = "CreateRepository";
                    DBhelper dBhelper = new DBhelper();
                    SqlParameter[] sqlParameters = new SqlParameter[]
                    {
                         new SqlParameter("UserId",StudentId),
                         new SqlParameter("Title",title),
                         new SqlParameter("UploadedDate",uploadeddate),
                         new SqlParameter("DocumentType",documenttype),
                         new SqlParameter("FilePath",filepath),
                         new SqlParameter("Description",discription),
                         new SqlParameter("CategoryId",categoryid)

                    };
                    dBhelper.ExecuteNonQuery(Procedure, sqlParameters);
                    RepositoryTitle.Text = string.Empty;
                    Description.Text = string.Empty;
                    SelectDocument.SelectedValue = string.Empty;
                    CategoryList.SelectedValue= string.Empty;
                    SuccessMessage.Visible = true;
                    SuccessMessage.Text = "Repository Created SuccessFully";
                    
                }
                else
                {
                    SuccessMessage.Visible = true;
                    SuccessMessage.Text = "Invalid Ducument";
                }
            }
            else
            {

                string Procedure = "CreateRepository";
                DBhelper dBhelper = new DBhelper();
                SqlParameter[] sqlParameters = new SqlParameter[]
                {
                         new SqlParameter("UserId",StudentId),
                         new SqlParameter("Title",title),
                         new SqlParameter("UploadedDate",uploadeddate),
                         new SqlParameter("DocumentType",documenttype),
                         new SqlParameter("FilePath",filepath),
                         new SqlParameter("Description",discription),
                         new SqlParameter("CategoryId",categoryid)

                };
                dBhelper.ExecuteNonQuery(Procedure, sqlParameters);
                SuccessMessage.Visible = true;
                SuccessMessage.Text = "Repository Created SuccessFully";

            }

        }
    }
}