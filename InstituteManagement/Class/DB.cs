using System.Data;
using System.Data.SqlClient;

namespace InstituteManagement.Class
{
    class DBhelper
    {
        SqlConnection sqlConnection = null;
        string connnectionString = "Data Source=DESKTOP-LCMNUM6\\SQLEXPRESS;Initial Catalog=InstituteManagement;Integrated Security=True";
        public DBhelper()
        {
            sqlConnection = new SqlConnection(connnectionString);
        }
        public bool ExecuteNonQuery(string query, SqlParameter[] parameter)
        {
            sqlConnection.Open();
            SqlCommand sqlCommand = new SqlCommand(query, sqlConnection);
            sqlCommand.CommandType = CommandType.StoredProcedure;
            sqlCommand.Parameters.AddRange(parameter);
            sqlCommand.ExecuteNonQuery();
            sqlConnection.Close();
            return true;
        }
        public DataTable DataTable(string query, SqlParameter[] param)
        {
            DataTable resultTable = new DataTable();
            sqlConnection.Open();
            SqlCommand sqlCommand = new SqlCommand(query, sqlConnection);
            sqlCommand.CommandType = CommandType.StoredProcedure;
            sqlCommand.Parameters.AddRange(param);
            SqlDataAdapter adapter = new SqlDataAdapter(sqlCommand);
            adapter.Fill(resultTable);

            return resultTable;
        }

        public SqlDataReader DataReader(string query, SqlParameter[] param)
        {
            sqlConnection.Open();
            SqlDataReader sqlDataReader = null;
            SqlCommand sqlCommand = new SqlCommand(query, sqlConnection);
            sqlCommand.CommandType = CommandType.StoredProcedure;
            sqlCommand.Parameters.AddRange(param);
            sqlDataReader = sqlCommand.ExecuteReader();
            return sqlDataReader;
        }

    }
}