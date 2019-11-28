using System;
using System.Data.SqlClient;

namespace Doan_ASPX.HtppCode
{
    public class food_types
    {
        private int _typeID;
        private string _typeName;
        private int _typePost;
        private string _typeImg;
        private int _Status;
        private string _userName;
        private DateTime _modified;

        public int TypeID { get => _typeID; set => _typeID = value; }
        public string TypeName { get => _typeName; set => _typeName = value; }
        public int TypePost { get => _typePost; set => _typePost = value; }
        public string TypeImg { get => _typeImg; set => _typeImg = value; }
        public int Status { get => _Status; set => _Status = value; }
        public string UserName { get => _userName; set => _userName = value; }
        public DateTime Modified { get => _modified; set => _modified = value; }

        public food_types(string typeNames, int typePosts, string typeImgs, int status, string usName)
        {
            this._typeName = typeNames;
            this._typePost = typePosts;
            this._typeImg = typeImgs;
            this._Status = status;
            this._userName = usName;
        }

        public bool addFoodType()
        {
            string sQuery = "INSERT INTO [Doan_ASPX].[dbo].[food_type] ([type_name] ,[type_pos] ,[type_img] ,[status] ,[username] ,[modified]) VALUES (@type_name,@type_pos,@type_img,@status,@username,getdate())";

            SqlParameter[] sqlparas = new SqlParameter[5];

            sqlparas[0] = new SqlParameter("@type_name", this._typeName);
            sqlparas[1] = new SqlParameter("@type_pos", this._typePost);
            sqlparas[2] = new SqlParameter("@type_img", this._typeImg);
            sqlparas[3] = new SqlParameter("@status", this._Status);
            sqlparas[4] = new SqlParameter("@username", this._userName);

            return DataProviders.executeNonQuery(sQuery, sqlparas);
        }
    }
}