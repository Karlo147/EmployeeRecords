using EmployeeRecords.Info;
using EmployeeRecords.Transformers;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace EmployeeRecords.Services
{
    public class EmployeeServices
    {
        #region Constructors and Destructors
        public EmployeeServices()
        {
            _transformer = new EmployeeTransformer();
        }
        #endregion

        #region Private Properties

        private readonly EmployeeTransformer _transformer;
        #endregion

        //Get All Employees
        public List<EmployeeInfo> Search()
        {
            var items = new List<EmployeeInfo>();

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spGetEmployees", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        var reader = cmd.ExecuteReader();

                        while (reader.Read())
                        {
                            var item = _transformer.Transform(reader);

                            items.Add(item);
                        }
                    }
                    catch (Exception ex)
                    {
                        ex.ToString();
                    }
                }
            }

            return items;
        }

        public List<EmployeeInfo> find(int id)
        {
            var items = new List<EmployeeInfo>();

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spFindInstructor", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("id", id);

                        var reader = cmd.ExecuteReader();

                        while (reader.Read())
                        {
                            var item = _transformer.Transform(reader);

                            items.Add(item);
                        }
                    }
                    catch (Exception ex)
                    {
                        ex.ToString();
                    }
                }
            }

            return items;
        }

        public static int insert(string lname, string fname, string mname,
            string email, string password, string address, string contact, string image, int roleID)
        {
            var item = 0;

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spInsertInstructor", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("lname", lname);
                        cmd.Parameters.AddWithValue("fname", fname);
                        cmd.Parameters.AddWithValue("mname", mname);
                        cmd.Parameters.AddWithValue("email", email);
                        cmd.Parameters.AddWithValue("password", password);
                        cmd.Parameters.AddWithValue("address", address);
                        cmd.Parameters.AddWithValue("contact", contact);
                        cmd.Parameters.AddWithValue("image", image);
                        cmd.Parameters.AddWithValue("roleID", roleID);

                        cmd.ExecuteNonQuery();
                    }
                    catch (Exception ex)
                    {
                        ex.ToString();
                    }
                }
            }

            return item;
        }

        public static int update(int id, string lname, string fname, string mname,
            string email, string address, string contact, string image, int roleID)
        {
            var item = 0;

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spUpdateInstructor", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("id", id);
                        cmd.Parameters.AddWithValue("lname", lname);
                        cmd.Parameters.AddWithValue("fname", fname);
                        cmd.Parameters.AddWithValue("mname", mname);
                        cmd.Parameters.AddWithValue("email", email);
                        cmd.Parameters.AddWithValue("address", address);
                        cmd.Parameters.AddWithValue("contact", contact);
                        cmd.Parameters.AddWithValue("image", image);
                        cmd.Parameters.AddWithValue("roleID", roleID);

                        cmd.ExecuteNonQuery();
                    }
                    catch (Exception ex)
                    {
                        ex.ToString();
                    }
                }
            }

            return item;
        }

        public static int deactivate(int id)
        {
            var item = 0;

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spDeactivateInstructor", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("id", id);

                        cmd.ExecuteNonQuery();
                    }
                    catch (Exception ex)
                    {
                        ex.ToString();
                    }
                }
            }

            return item;
        }

        public static int activate(int id)
        {
            var item = 0;

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spActivateInstructor", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("id", id);

                        cmd.ExecuteNonQuery();
                    }
                    catch (Exception ex)
                    {
                        ex.ToString();
                    }
                }
            }
            return item;
        }
    }
}