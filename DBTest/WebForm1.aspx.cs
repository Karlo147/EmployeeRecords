using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DBTest
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static void InsertData(string Name, string Address, int age)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_person_insert", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@name", Name);
            cmd.Parameters.AddWithValue("@address", Address);
            cmd.Parameters.AddWithValue("@age", age);
            cmd.ExecuteNonQuery();
            con.Close();
        }
    }
}