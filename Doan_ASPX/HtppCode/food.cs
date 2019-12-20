using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Doan_ASPX.HtppCode
{
    public class food
    {
        private int _Id;
        private string _Name;
        private string _Desciption;
        private int _Price;
        private int _Price_promo;
        private string _Thumb;
        private string _Img;
        private string _Unit;
        private int _Percent_promo;
        private int _Rating;
        private int _Sold;
        private int _Point;
        private int _Type;
        private int _Status;
        private DateTime _Modified;

        public int Id { get => _Id; set => _Id = value; }
        public string Name { get => _Name; set => _Name = value; }
        public string Desciption { get => _Desciption; set => _Desciption = value; }
        public int Price { get => _Price; set => _Price = value; }
        public int Price_promo { get => _Price_promo; set => _Price_promo = value; }
        public string Thumb { get => _Thumb; set => _Thumb = value; }
        public string Img { get => _Img; set => _Img = value; }
        public string Unit { get => _Unit; set => _Unit = value; }
        public int Percent_promo { get => _Percent_promo; set => _Percent_promo = value; }
        public int Rating { get => _Rating; set => _Rating = value; }
        public int Sold { get => _Sold; set => _Sold = value; }
        public int Point { get => _Point; set => _Point = value; }
        public int Type { get => _Type; set => _Type = value; }
        public int Status { get => _Status; set => _Status = value; }
        public DateTime Modified { get => _Modified; set => _Modified = value; }

        public food(string sName, string sDesciption, int sPrice, int sPrice_promo, string sThumb, string sImg, string sUnit, int sPrecent_promo, int sRating, int sSold, int sPoint, int sType, int stt)
        {
            this._Name = sName;
            this._Desciption = sDesciption;
            this._Price = sPrice;
            this._Price_promo = sPrice_promo;
            this._Thumb = sThumb;
            this._Img = sImg;
            this._Unit = sUnit;
            this._Percent_promo = sPrecent_promo;
            this._Rating = sRating;
            this._Sold = sSold;
            this._Point = sPoint;
            this._Type = sType;
            this._Status = stt;
        }

        public bool addSanPham()
        {
            string sQuery = "INSERT INTO [Doan_ASPX].[dbo].[food] ([name] ,[description] ,[price] ,[price_promo] ,[thumb] ,[img] ,[unit] ,[percent_promo] ,[rating] ,[sold] ,[point] ,[type] ,[status] ,[modified]) VALUES (@name ,@description ,@price ,@price_promo ,@thumb ,@img ,@unit ,@percent_promo,@rating,@sold,@point ,@type,@status,GETDATE())";

            SqlParameter[] sqlparas = new SqlParameter[13];

            sqlparas[0] = new SqlParameter("@name", this._Name);
            sqlparas[1] = new SqlParameter("@description", this._Desciption);
            sqlparas[2] = new SqlParameter("@price", this._Price);
            sqlparas[3] = new SqlParameter("@price_promo", this._Price_promo);
            sqlparas[4] = new SqlParameter("@thumb", this._Thumb);
            sqlparas[5] = new SqlParameter("@img", this._Img);
            sqlparas[6] = new SqlParameter("@unit", this._Unit);
            sqlparas[7] = new SqlParameter("@percent_promo", this._Percent_promo);
            sqlparas[8] = new SqlParameter("@rating", this._Rating);
            sqlparas[9] = new SqlParameter("@sold", this._Sold);
            sqlparas[10] = new SqlParameter("@point", this._Point);
            sqlparas[11] = new SqlParameter("@type", this._Type);
            sqlparas[12] = new SqlParameter("@status", this._Status);

            return DataProviders.executeNonQuery(sQuery, sqlparas);
        }
    }
}