using InstituteManagement.Class;
using System;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InstituteManagement.KnowledgeRepository
{
    public partial class ShowRepository : System.Web.UI.Page
    {
        int categoryId;
        int UserId; 

        protected void Page_Load(object sender, EventArgs e)
        {
            if (int.TryParse(Session["UserId"].ToString(), out UserId)) { }
           
            Page.Title = "All Repositories";
            if (!IsPostBack)
            {

                string query = "CategoryList";
                DBhelper dBhelper = new DBhelper();
                DataTable dataTable = new DataTable();
                dataTable = dBhelper.DataTable(query, new SqlParameter[] { });
                CategoryList.DataSource = dataTable;
                CategoryList.DataTextField = "CategoryName";
                CategoryList.DataValueField = "CategoryId";
                CategoryList.DataBind();
                CategoryList.Items.Insert(0, new ListItem("All Category", ""));

                ShowAllRepository();

                #region ButtonName
                string storeprocedure = "ShowFavoriteContent";
                DBhelper dbhelper = new DBhelper();
                SqlParameter[] sqlParameters = new SqlParameter[]
                {
                        new SqlParameter("UserId",UserId)
                };
                SqlDataReader reader = dbhelper.DataReader(storeprocedure, sqlParameters);
                while (reader.Read())
                {
                    int contentid = reader.GetInt32(reader.GetOrdinal("ContentId"));
                    foreach (DataListItem item in ShowRepositories.Items)
                    {
                        Label lable = (Label)item.FindControl("ContentId") as Label;
                        Button btn = item.FindControl("AddToFevorite") as Button;

                        int lablecontentid;
                        if (int.TryParse(lable.Text, out lablecontentid)) { }
                        if (lablecontentid == contentid)
                        {
                            btn.Text = "Remove From Favorite";
                        }
                    }

                }
                #endregion


            }
        }
        public void ShowAllRepository()
        {
            if (CategoryList.SelectedValue == "" || CategoryList.SelectedItem.Text == "All Category")
            {

                string Storeprocedure = "ShowRepository";
                DBhelper DBhelper = new DBhelper();
                DataTable DataTable = new DataTable();

                DataTable = DBhelper.DataTable(Storeprocedure, new SqlParameter[] { });
                ShowRepositories.DataSource = DataTable;
                ShowRepositories.DataBind();

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
            else
            {
                if (int.TryParse(CategoryList.SelectedValue, out categoryId)) { }
                string Storeprocedure = "SelectedShowRepository";
                DBhelper DBhelper = new DBhelper();
                DataTable DataTable = new DataTable();
                SqlParameter[] parameter = new SqlParameter[]
                {
                  new SqlParameter("CategoryId",categoryId)
                };
                DataTable = DBhelper.DataTable(Storeprocedure, parameter);
                ShowRepositories.DataSource = DataTable;
                ShowRepositories.DataBind();

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
        protected void AddToFevorite_Click(object sender, EventArgs e)
        {
            int contentid = 0;

            Button clickedButton = (Button)sender;
            DataListItem items = (DataListItem)clickedButton.NamingContainer;
            Label lable = (Label)items.FindControl("contentid") as Label;

            if (int.TryParse(lable.Text, out contentid)) { };
            Button btn = items.FindControl("AddToFevorite") as Button;

            if (btn.Text == "Add To Favorite")
            {
                string procedure = "AddFevoriteContent";
                DBhelper DBhelper = new DBhelper();
                SqlParameter[] parameter = new SqlParameter[]
                {
                   new SqlParameter("ContentId",contentid),
                   new SqlParameter("UserId",UserId)
                };
                DBhelper.ExecuteNonQuery(procedure, parameter);

                btn.Text = "Remove From Favorite";
            }
            else
            {
                string StoreProcedure = "DeletefavoriteContent";
                DBhelper dBhelper = new DBhelper();
                SqlParameter[] sqlparameter = new SqlParameter[]
                {
                   new SqlParameter("ContentId",contentid),
                   new SqlParameter("UserId",UserId)
                };
                dBhelper.ExecuteNonQuery(StoreProcedure, sqlparameter);
                btn.Text = "Add To Favorite";
            }
        }

        protected void CategoryList_SelectedIndexChanged(object sender, EventArgs e)
        {
            ShowAllRepository();
        }

        protected void ShowFavoriteContent_Click(object sender, EventArgs e)
        {
            Response.Redirect("FavoriteContent.aspx");
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