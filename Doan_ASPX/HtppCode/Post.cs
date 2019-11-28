using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Doan_ASPX.HtppCode
{
    public class Post
    {
        private int _Post_ID;
        private string _Title;
        private string _Short_Des;
        private string _Des;
        private string _Img;
        private string _Status;
        private int _UserName;
        private DateTime _Modified;
        private DateTime _Created;

        public string Title{
            get { return _Title; }
            set { _Title = value; }
        }       
        public string Short_Des{
            get { return _Short_Des; }
            set { _Short_Des = value; }
        }       
        public string Des{
            get { return _Des; }
            set { _Des = value; }
        }         
        public string Img{
            get { return _Img; }
            set { _Img = value; }
        }    
        public string Status{
            get { return _Status; }
            set { _Status = value; }
        }            
        public int UserName{
            get { return _UserName; }
            set { _UserName = value; }
        }             
        public DateTime Modified{
            get { return _Modified; }
            set { _Modified = value; }
        }      
        public DateTime Created{
            get { return _Created; }
            set { _Created = value; }
        }       
        public int Post_ID{
            get { return _Post_ID; }
            set { _Post_ID = value; }
        }
        


    }
}