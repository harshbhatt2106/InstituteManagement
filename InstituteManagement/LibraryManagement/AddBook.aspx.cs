using InstituteManagement.Class;
using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace InstituteManagement.LibraryManagement
{
    public partial class AddBook : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Title = "Add Book";
        }

        protected void Addbook_Click(object sender, EventArgs e)
        {
            int bookid = 0;
            string bookname = BookName.Text;
            string authorname = BookAuthor.Text;
            int numberofbook = int.Parse(TotalNumberofCopy.Text);
            string BookCode = "0";
            bool IsExit = true;


            string procedure = "BookAddOrNot";
            DBhelper DatabaseHelper = new DBhelper();
            SqlParameter[] Sqlparameters = new SqlParameter[]
            {
                new SqlParameter("BookName",bookname),
                new SqlParameter("BookAuthor",authorname),
            };

            SqlDataReader Reader = DatabaseHelper.DataReader(procedure, Sqlparameters);
            if (Reader.Read())
            {
                successmessage.Visible = true;
                successmessage.Text = "This Book Are Already Exits";
            }
            else
            {
                successmessage.Visible = false; 

                string Query = "InsertBookData";
                DBhelper dBhelper = new DBhelper();
                SqlParameter[] parameters = new SqlParameter[]
                {
                  new SqlParameter("BookName",bookname),
                  new SqlParameter("BookAuthor",authorname),
                  new SqlParameter("TotalNumberOfCopy",numberofbook)
                };
                dBhelper.ExecuteNonQuery(Query, parameters);

                string sp = "GetBookInformation";
                DBhelper DBhelper = new DBhelper();
                SqlDataReader dataReader = DBhelper.DataReader(sp, new SqlParameter[] { });
                while (dataReader.Read())
                {
                    bookid = dataReader.GetInt32(dataReader.GetOrdinal("BookId"));
                }

                for (int i = 0; i < numberofbook; i++)
                {
                    BookCode = bookid.ToString() + "0" + (i + 1).ToString();

                    string query = "InsertBookCode";
                    DBhelper dhelper = new DBhelper();
                    SqlParameter[] sqlParameters = new SqlParameter[]
                    {
                        new SqlParameter("BookId",bookid),
                        new SqlParameter("BookCode",BookCode),
                        new SqlParameter("IsExits",IsExit)
                    };
                    dBhelper.ExecuteNonQuery(query, sqlParameters);
                }
                successmessage.Visible = true;
                BookName.Text = string.Empty;
                BookAuthor.Text = string.Empty;
                TotalNumberofCopy.Text = string.Empty;
            }
        }
    }
}