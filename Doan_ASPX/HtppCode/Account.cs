using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

namespace Doan_ASPX.HtppCode
{
    public class Account
    {
        //Phuong Thuc Khoi tao
        private string _UserName;
        private string _Password;
        private string _Name;
        private string _Phone;
        private int _Role;
        private int _Status;
        private string _Email;

        public string UserName
        {
            get { return _UserName; }
            set { _UserName = value; }
        }

        public string Password
        {
            get { return _Password; }
            set { _Password = value; }
        }

        public string Name
        {
            get { return _Name; }
            set { _Name = value; }
        }
        public string Phone
        {
            get { return _Phone; }
            set { _Phone = value; }
        }
        public int Role
        {
            get { return _Role; }
            set { _Role = value; }
        }
        public int Status
        {
            get { return _Status; }
            set { _Status = value; }
        }

        public string Email
        {
            get { return _Email; }
            set { _Email = value; }
        }
        //--------------------------------------------


        public Account(string sUs, string sEmail, string sPass, string sName, string sPhone, int sRole, int sStatus)
        {
            _UserName = sUs;
            _Password = sPass;
            _Name = sName;
            _Phone = sPhone;
            _Role = sRole;
            _Status = sStatus;
            _Email = sEmail;
        }

        public bool adMember()
        {
            string sQuery = "INSERT INTO [Doan_ASPX].[dbo].[member] ([username] ,[email] ,[pass] ,[name] ,[phone] ,[role] ,[status]) VALUES (@username,@email,@pass,@name,@phone,@role,@status)";

            SqlParameter[] sqlParas = new SqlParameter[7];
            sqlParas[0] = new SqlParameter("@username", this._UserName);
            sqlParas[1] = new SqlParameter("@email", this._Email);
            sqlParas[2] = new SqlParameter("@pass", this._Password);
            sqlParas[3] = new SqlParameter("@name", this._Name);
            sqlParas[4] = new SqlParameter("@phone", this._Phone);
            sqlParas[5] = new SqlParameter("@role", this._Role);
            sqlParas[6] = new SqlParameter("@status", this._Status);
            

            //cach 2
            //sqlParas[0] = new SqlParameter();
            //sqlParas[0].Value = this._UserName;
            //sqlParas[1] = new SqlParameter();
            //sqlParas[1].Value = this._Email;
            //sqlParas[2] = new SqlParameter();
            //sqlParas[2].Value = this._Password;
            //sqlParas[3] = new SqlParameter();
            //sqlParas[3].Value = this._Name;
            //sqlParas[4] = new SqlParameter();
            //sqlParas[4].Value = this._Phone;
            //sqlParas[5] = new SqlParameter();
            //sqlParas[5].Value = this._Role;
            //sqlParas[6] = new SqlParameter();
            //sqlParas[6].Value = this._Status;


            return DataProviders.executeNonQuery(sQuery, sqlParas);

        }
    }
}