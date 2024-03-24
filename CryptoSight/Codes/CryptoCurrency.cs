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
    public class CryptoCurrency {
        public static Dictionary<string, CryptoCurrency> Dict { get; set; } = new Dictionary<string, CryptoCurrency>();
        public static string Username = "Kamachi";

        public string Abbreviation { get; set; } = "<Abbreviation>";
        public string Name { get; set; } = "<Name>";
        public string ImagePath { get; set; } = @"\Assets\Icons\Default.png";
        public float Holding { get; set; } = 0.00f;

        public CryptoCurrency(string Abbreviation, string Name, string ImagePath = @"\Assets\Icons\Default.png") {
            if (Dict.ContainsKey(Abbreviation)) return;
            this.Abbreviation = Abbreviation;
            this.Name = Name;
            this.ImagePath = ImagePath;
            Dict.Add(Abbreviation, this);
        }

        static IEnumerable<IDataRecord> GetFromReader(IDataReader reader) {
            while (reader.Read()) yield return reader;
        }

        public static void Fetch() {
            string connectionString = $@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=""{HostingEnvironment.MapPath("/")}App_Data\Database.mdf"";Integrated Security=True";
            using (SqlConnection connection = new SqlConnection(connectionString)) using (SqlCommand command = connection.CreateCommand()) {
                connection.Open();                                                                  //Open Connection
                command.CommandText = $"SELECT * FROM Transactions RIGHT JOIN Users ON Users.ID = Transactions.UserID WHERE Users.Username = '{Username}' ORDER BY Transactions.CryptoName";             //Command
                SqlDataReader Data = command.ExecuteReader();
                foreach (IDataRecord crypto in GetFromReader(Data)) {
                    Debug.WriteLine(crypto);
                    Dict[crypto["Crypto"].ToString()].Holding = float.Parse(crypto["Holding"].ToString());
                    break;
                }
                connection.Close();                                                                 //Close Connection
            }
        }
    }
}