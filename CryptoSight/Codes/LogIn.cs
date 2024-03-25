namespace CryptoSight.AppCode {
    public static class LogIn {
        public class Users {
            public string Username;
            public string Password;
        }
        
        static IEnumerable<IDataRecord> GetFromReader(IDataReader reader) {
            while (reader.Read()) yield return reader;
        }

        public static bool Fetch() {
            string connectionString = $@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=""{HostingEnvironment.MapPath("/")}App_Data\Database.mdf"";Integrated Security=True";
            using (SqlConnection connection = new SqlConnection(connectionString)) using (SqlCommand command = connection.CreateCommand()) {
                connection.Open();                                                                  //Open Connection
                command.CommandText = $"SELECT * FROM Users";                                       //Command
                SqlDataReader Data = command.ExecuteReader();
                //CHECK IF EMPTY, IF EMPTY RETURN NULL IF NOT RETURN USERNAME
                /*
                if (GetFromReader(Data) > 0) {
                    connection.Close();
                    return GetFromReader(Data)[0];
                }
                else {
                    Debug.WriteLine(crypto);
                    Dict[crypto["Crypto"].ToString()].Holding = float.Parse(crypto["Holding"].ToString());
                    connection.Close();
                }
                connection.Close();
                return false;                                                     //Close Connection
                */
            }
        }
        public static void Register() {
            
        }
    }
}