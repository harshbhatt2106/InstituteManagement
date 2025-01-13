using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using InstituteManagement.Class;

namespace InstituteManagement.LibraryManagement
{
    public partial class RemoveBook : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Title = "Remove Book";
            if (!IsPostBack)
            {
                string query = "ListBookName";
                DBhelper dBhelper = new DBhelper();
                DataTable datatable = new DataTable();
                datatable = dBhelper.DataTable(query, new SqlParameter[] { });
                SelectBookList.DataSource = datatable;
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

        private int GetBookId(string selectedAuthor, string selectedBookName)
        {
            int BookId = 0;

            string storeprtocedure = "GetBookIdOnBookName";

            DBhelper DBHelper = new DBhelper();
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("BookAuthor",selectedAuthor),
                new SqlParameter("BookName",selectedBookName)
            };
            SqlDataReader sqlDataReader = DBHelper.DataReader(storeprtocedure, parameters);
            if (sqlDataReader.Read())
            {
                BookId = sqlDataReader.GetInt32(sqlDataReader.GetOrdinal("BookId"));
            }
            return BookId;
        }

        protected void removebook_Click(object sender, EventArgs e)
        {
            int BookCode = int.Parse(BookCodeList.SelectedValue);

            string selctedbookname = SelectBookList.SelectedValue;
            string selectedauthor = SelectAuthor.SelectedValue;

            int BookId = GetBookId(selectedauthor, selctedbookname);

            string Procedure = "RemoveBookFromBookRecord";
            SqlParameter[] sqlparameter = new SqlParameter[]
            {
                new SqlParameter("BookId",BookId),
            };
            DBhelper dbHelper = new DBhelper();
            dbHelper.ExecuteNonQuery(Procedure, sqlparameter);

            string Storeprocedure = "RemoveBookFromBookCode";
            SqlParameter[] Sqlparameters = new SqlParameter[]
            {
                new SqlParameter("BookCode",BookCode),
            };
            DBhelper dBHelper = new DBhelper();
            dBHelper.ExecuteNonQuery(Storeprocedure, Sqlparameters);

            SelectBookList.SelectedValue = string.Empty;
            SelectAuthor.SelectedValue = string.Empty;
            BookCodeList.SelectedValue = string.Empty;
        }


        protected void SelectBookList_SelectedIndexChanged(object sender, EventArgs e)
        {
            string storeprtocedure = "GetBookIdOnBookName";

            string selctedbookname = SelectBookList.SelectedValue;
            string selectedauthor = SelectAuthor.SelectedValue;
            int BookId = GetBookId(selectedauthor, selctedbookname);

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

            #region BookCodeList

            BookCodeList.Visible = true;
            string Query = "BookCodeList";
            DBhelper DBhelper = new DBhelper();
            DataTable DataTable = new DataTable();
            SqlParameter[] sqlParameters = new SqlParameter[]
            {
                    new SqlParameter("BookId",BookId)
            };
            DataTable = DBhelper.DataTable(Query, sqlParameters);
            BookCodeList.DataSource = DataTable;
            BookCodeList.DataTextField = "BookCode";
            BookCodeList.DataValueField = "BookCode";
            BookCodeList.DataBind();
            BookCodeList.Items.Insert(0, new ListItem("Select BookCode", ""));

            #endregion

        }
    }
}