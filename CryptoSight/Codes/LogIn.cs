using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Hosting;
using System.Drawing.Printing;
using System.Diagnostics;
using System.Runtime.Remoting.Messaging;
using System.Web.UI.WebControls;

namespace CryptoSight.AppCode {
    public static class LogIn {

        public static string[] GetUsers(string username) {
            string connectionString = $@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=""{HostingEnvironment.MapPath("/")}App_Data\Database.mdf"";Integrated Security=True";
            using (SqlConnection connection = new SqlConnection(connectionString)) using (SqlCommand command = connection.CreateCommand()) {
                connection.Open();                                                                  //Open Connection
                command.CommandText = $"SELECT * FROM Users WHERE Username = '{username}'";          //Command
                SqlDataReader Data = command.ExecuteReader();
                if (Data.HasRows) {
                    Data.Read();
                    string outputUsername = Data["Username"].ToString();
                    string outputPassword = Data["Pass"].ToString();
                    connection.Close();
                    return new string[] { outputUsername, outputPassword };
                } else return null;
            }
        }
        public static void RegisterUser(string username, string password) {
            string connectionString = $@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=""{HostingEnvironment.MapPath("/")}App_Data\Database.mdf"";Integrated Security=True";
            using (SqlConnection connection = new SqlConnection(connectionString)) using (SqlCommand command = connection.CreateCommand()) {
                connection.Open();                                                                                      //Open Connection
                command.CommandText = $"INSERT INTO Users(Username, Pass) VALUES ('{username}', '{password}')";          //Command
                command.ExecuteNonQuery();
                connection.Close();
            }
        }
    }
}