using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

namespace Doan_ASPX.HtppCode
{
    public static class DataProviders
    {
        private static string ChuoiKetNoi = @"Data Source=desktop-ttj28qj\mysql;Initial Catalog=Doan_ASPX;Integrated Security=True";
        private static SqlConnection conn = new SqlConnection(ChuoiKetNoi);
        
        //Phuong Thuc Connet ktra ket noi
        //neu ko knoi thi thuc hien ket noi khac
        private static void Connect()
        {
            if(conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
            {
                conn.Open();
            }
        }
        //Co 3 loai cau truy van..
        //Cau 1:Truy Van Xong ko lay ket qa tra ve..Insert Update Del
        //Cau 2:Truy Van Lay Ve DS: select
        //Cau 3:Truy Van Lay Ve Ma Tang tu dong:

        //SqlComment SqlAdapter:Doi So(tham so) goi la parameter  
        public static bool executeNonQuery(string sQuery,SqlParameter[] paras)
        {
            try
            {
                Connect();
                SqlCommand cmd = new SqlCommand(sQuery, conn);
                cmd.Parameters.AddRange(paras);
                cmd.ExecuteNonQuery();
                conn.Close();
                return true;
            }
            catch
            {
                //write_logDB(ex.Message) hien thi thong bao khi loi
                return false;
            }
        }

        //lay cot dau tien va dong dau tien cua dong moi tuong tac
        //lay ve cai id tang tu dong
        public static int executeScalar(string sQuery, SqlParameter[] paras)
        {
            try
            {
                Connect();
                SqlCommand cmd = new SqlCommand(sQuery, conn);
                cmd.Parameters.AddRange(paras);
                cmd.ExecuteNonQuery();
                sQuery = "select @@identity";
                cmd = new SqlCommand(sQuery, conn);
                int id = (int)cmd.ExecuteScalar();
                conn.Close();
                return id;
            }
            catch
            {
                return -1;
            }
        }

        public static DataTable getDataTable(string sQuery)
        {
            try
            {
                Connect();
                SqlDataAdapter da = new SqlDataAdapter(sQuery, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                return dt;
            }
            catch
            {
                return null;
            }
        }

        public static bool ReadDataTable(string sQuerry)
        {
            try
            {
                Connect();
                SqlCommand cm = new SqlCommand(sQuerry,conn);

                SqlDataReader rd = cm.ExecuteReader();

                if (rd.HasRows)
                {
                    return true;
                }
                else return false;

            }
            catch
            {
                return false;
            }
        }

        public static void excute(string sQuerry)
        {
            Connect();
            SqlCommand cmdn = new SqlCommand(sQuerry, conn);
            cmdn.ExecuteNonQuery();
        }

    }
}