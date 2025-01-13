using InstituteManagement.Class;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InstituteManagement.LibraryManagement
{
    public partial class AvailableBook : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Title = "Available Book";
            if (!IsPostBack)
            {

                string query = "ListBookName";
                DBhelper dBhelper = new DBhelper();
                DataTable dataTable = new DataTable();
                dataTable = dBhelper.DataTable(query, new SqlParameter[] { });
                SelectBookList.DataSource = dataTable;
                SelectBookList.DataTextField = "BookName";
                SelectBookList.DataValueField = "BookName";
                SelectBookList.DataBind();
                SelectBookList.Items.Insert(0, new ListItem("Select Book", ""));

                string Query = "ListBookAuthor";
                DBhelper DBhelper = new DBhelper();
                DataTable DataTable = new DataTable();
                DataTable = DBhelper.DataTable(Query, new SqlParameter[] { });
                SelectAuthor.DataSource = DataTable;
                SelectAuthor.DataTextField = "BookAuthor";
                SelectAuthor.DataValueField = "BookAuthor";
                SelectAuthor.DataBind();
                SelectAuthor.Items.Insert(0, new ListItem("Select Author", ""));
            }


        }

        protected void availablebook_Click(object sender, EventArgs e)
        {
            string selectedauthor = SelectAuthor.SelectedValue;
            string selctedbookname = SelectBookList.SelectedValue;
            int BookId = 0;

            string storeprtocedure = "GetBookIdOnBookName";

            DBhelper DBHelper = new DBhelper();
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("BookAuthor",selectedauthor),
                new SqlParameter("BookName",selctedbookname)
            };
            SqlDataReader sqlDataReader = DBHelper.DataReader(storeprtocedure, parameters);
            if (sqlDataReader.Read())
            {
                BookId = sqlDataReader.GetInt32(sqlDataReader.GetOrdinal("BookId"));
            }

            string Procedure = "CountBook";
            DBhelper DatabaseHelper = new DBhelper();
            SqlParameter[] sqlParameters = new SqlParameter[]
            {
                new SqlParameter("BookId",BookId),
            };
            SqlDataReader reader = DatabaseHelper.DataReader(Procedure, sqlParameters);
            if (reader.Read())
            {
                CountBook.Text = reader["TotalNumberOfBook"].ToString();
            }
            else
            {
                CountBook.Text = "No Books Are Available";
            }
        }
    }
}