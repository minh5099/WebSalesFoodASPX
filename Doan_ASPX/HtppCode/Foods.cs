using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

namespace Doan_ASPX.HtppCode
{
    public class Foods
    {
        private int _ID;
        private string _Name;
        private string _Description;
        private double _Price;
        private double _Price_Promo;
        private string _Thumb;
        private string _img;
        private string _Unit;
        private double _Percent_Promo;
        private int _Rating;
        private int _Sold;
        private double _Point;
        private int _Type;
        private int _Status;
        private DateTime _Modified;

        public int ID { get => _ID; set => _ID = value; }
        public string Name { get => _Name; set => _Name = value; }
        public string Description { get => _Description; set => _Description = value; }
        public double Price { get => _Price; set => _Price = value; }
        public double Price_Promo { get => _Price_Promo; set => _Price_Promo = value; }
        public string Thumb { get => _Thumb; set => _Thumb = value; }
        public string Img { get => _img; set => _img = value; }
        public string Unit { get => _Unit; set => _Unit = value; }
        public double Percent_Promo { get => _Percent_Promo; set => _Percent_Promo = value; }
        public int Rating { get => _Rating; set => _Rating = value; }
        public int Sold { get => _Sold; set => _Sold = value; }
        public double Point { get => _Point; set => _Point = value; }
        public int Type { get => _Type; set => _Type = value; }
        public int Status { get => _Status; set => _Status = value; }
        public DateTime Modified { get => _Modified; set => _Modified = value; }

        public Foods(string Name,string Des,double price,double price_promo,string thumb,string img,string unit,double percent_promo,int rating,int sold,double point,int type,int status)
        {
            _Name = Name;
            _Description = Des;
            _Price = price;
            _Price_Promo = price_promo;
            _Thumb = thumb;
            _img = img;
            _Unit = unit;
            _Percent_Promo = percent_promo;
            _Rating = rating;
            _Sold = sold;
            _Point = point;
            _Type = type;
            _Status = status;
        }

        public bool adFood()
        {
            string sQuery = "INSERT INTO [Doan_ASPX].[dbo].[food] ([name] ,[description] ,[price] ,[price_promo] ,[thumb] ,[img] ,[unit] ,[percent_promo] ,[rating] ,[sold] ,[point] ,[type] ,[status] ,[modified]) VALUES (@name,@description,@price,@price_promo,@thumb,@img,@unit,@percent_promo,@rating,@sold,@point,@type,@status,getdate())";

            SqlParameter[] paras = new SqlParameter[13];
            paras[0] = new SqlParameter("@name", this._Name);
            paras[1] = new SqlParameter("@description",this._Description);
            paras[2] = new SqlParameter("@price",this._Price);
            paras[3] = new SqlParameter("@price_promo",this._Price_Promo);
            paras[4] = new SqlParameter("@thumb",this._Thumb);
            paras[5] = new SqlParameter("@img",this._img);
            paras[6] = new SqlParameter("@unit",this._Unit);
            paras[7] = new SqlParameter("@percent_promo",this._Percent_Promo);
            paras[8] = new SqlParameter("@rating",this._Rating);
            paras[9] = new SqlParameter("@sold",this._Sold);
            paras[10] = new SqlParameter("@point",this._Point);
            paras[11] = new SqlParameter("@type",this._Type);
            paras[12] = new SqlParameter("@status",this._Status);


            return DataProviders.executeNonQuery(sQuery,paras);
        }
    }
}