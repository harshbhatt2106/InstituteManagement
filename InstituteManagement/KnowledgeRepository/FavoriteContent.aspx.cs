using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using InstituteManagement.Class;

namespace InstituteManagement.KnowledgeRepository
{
    public partial class FavoriteContent : System.Web.UI.Page
    {
        int UserId;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (int.TryParse(Session["UserId"].ToString(), out UserId)) { }
            if (!IsPostBack)
            {
                string Storeprocedure = "ShowFavoriteContent";
                DBhelper DBhelper = new DBhelper();
                DataTable DataTable = new DataTable();
                SqlParameter[] sqlParameters = new SqlParameter[]
                {
                    new SqlParameter("UserId",UserId)
                };
                DataTable = DBhelper.DataTable(Storeprocedure, sqlParameters);
                if (DataTable.Rows.Count > 0)
                {
                    ShowRepositories.DataSource = DataTable;
                    ShowRepositories.DataBind();
                }
                else
                {
                    message.Visible = true;
                    message.Text = "No Favorite Content Available";
                }

                foreach (DataListItem item in ShowRepositories.Items)
                {
                    Label label = item.FindControl("Title") as Label;
                    string Title = label.Text;
                    int length = Title.Length;
                    if (length >= 8)
                    {
                        string FirstEightCharcter = Title.Substring(0, 8);
                        label.Text = FirstEightCharcter + "......";
                    }
                }
            }
        }

        protected void Remove_Click(object sender, EventArgs e)
        {
            int contentid = 0;

            Button clickedButton = (Button)sender;
            DataListItem items = (DataListItem)clickedButton.NamingContainer;
            Label lable = (Label)items.FindControl("contentid") as Label;

            if (int.TryParse(lable.Text, out contentid)) { };
            Button btn = items.FindControl("AddToFevorite") as Button;

            string StoreProcedure = "DeletefavoriteContent";
            DBhelper dBhelper = new DBhelper();
            SqlParameter[] sqlparameter = new SqlParameter[]
            {
                   new SqlParameter("ContentId",contentid),
                   new SqlParameter("UserId",UserId)
            };
            dBhelper.ExecuteNonQuery(StoreProcedure, sqlparameter);
            Response.Redirect(Request.RawUrl);
        }

        protected void ShowContent_Click(object sender, EventArgs e)
        {
            int contentid = 0;

            Button clickedButton = (Button)sender;
            DataListItem items = (DataListItem)clickedButton.NamingContainer;
            Label lable = (Label)items.FindControl("contentid") as Label;

            if (int.TryParse(lable.Text, out contentid))
            {
                Session["ContentId"] = contentid;
            };
            Button btn = items.FindControl("AddToFevorite") as Button;
            Response.Redirect("ShowContent.aspx");
        }
    }
}