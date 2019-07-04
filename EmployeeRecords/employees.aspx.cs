using System;
using System.Data.SqlClient;
using System.Web.Services;
using System.Configuration;
using System.Data;
using System.Diagnostics;
using EmployeeRecords.Info;
using System.Collections.Generic;
using EmployeeRecords.Services;

namespace EmployeeRecords
{
    public partial class employees : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        [WebMethod]
        public static List<EmployeeInfo> get()
        {
            var service = new EmployeeServices();

            var items = service.Search();

            return items;
        }

    }
}