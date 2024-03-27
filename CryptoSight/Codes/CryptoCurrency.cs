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
        public static string Username;

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
            Debug.WriteLine($"FETCHING DATA FOR {Username}");
            string connectionString = $@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=""{HostingEnvironment.MapPath("/")}App_Data\Database.mdf"";Integrated Security=True";
            using (SqlConnection connection = new SqlConnection(connectionString)) using (SqlCommand command = connection.CreateCommand()) {
                connection.Open();                                                                  //Open Connection
                command.CommandText = $"SELECT * FROM Transactions LEFT JOIN Users ON Users.Username = Transactions.Username WHERE Users.Username = '{Username}' ORDER BY Transactions.CryptoName";             //Command
                SqlDataReader Data = command.ExecuteReader();
                if (Data.HasRows) foreach (IDataRecord crypto in GetFromReader(Data)) {
                    Debug.WriteLine($"FOUND COIN {crypto["CryptoName"]}");
                    Dict[crypto["Crypto"].ToString()].Holding = float.Parse(crypto["Holding"].ToString());
                }
                connection.Close();                                                                 //Close Connection
            }
        }

        public static void UpdateCoin(string coin, int quantity) {
            string connectionString = $@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=""{HostingEnvironment.MapPath("/")}App_Data\Database.mdf"";Integrated Security=True";
            using (SqlConnection connection = new SqlConnection(connectionString)) using (SqlCommand command = connection.CreateCommand()) {
                connection.Open();
                command.CommandText = $"SELECT * FROM Transactions LEFT JOIN Users ON Users.Username = Transactions.Username WHERE Users.Username = '{Username}' AND Transactions.Crypto = '{coin}' ORDER BY Transactions.CryptoName";
                SqlDataReader Data = command.ExecuteReader();
                if (Data.HasRows) command.CommandText = $"UPDATE Transactions SET Holding = Holding + {quantity} WHERE Username = '{Username}' AND Crypto = '{coin}'";
                else command.CommandText = $"INSERT INTO TRANSACTIONS(Username, Crypto, CryptoName, Holding) VALUES ('{Username}', '{coin}', '{Dict[coin].Name}', '{quantity}')";
                Data.Close();
                command.ExecuteNonQuery();
                connection.Close();
            }
        }
    }
}