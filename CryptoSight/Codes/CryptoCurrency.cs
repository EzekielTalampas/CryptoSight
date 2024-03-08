using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CryptoSight.AppCode {
    public class CryptoCurrency {
        public static List<CryptoCurrency> List { get; set; } = new List<CryptoCurrency>();
        public string Abbreviation { get; set; } = "<Abbreviation>";
        public string Name { get; set; } = "<Name>";
        public float Value { get; set; } = 0.00f;
        public string ImagePath { get; set; } = @"\Assets\Icons\Default.png";

        public CryptoCurrency(string Abbreviation, string Name, float Value, string ImagePath = @"\Assets\Icons\Default.png") {
            this.Abbreviation = Abbreviation;
            this.Name = Name;
            this.Value = Value;
            this.ImagePath = ImagePath;
            List.Add(this);
        }
    }
}