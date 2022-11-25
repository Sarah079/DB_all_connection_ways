
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;

namespace CUD272ClassTutorial.OurServices
{
    public class SQLFlagService: FlagService
    {

        public String getFlagURI(String someCountryCode) {
            return null;
        }

        public byte[] getFlagFile(String someCountryCode) {
            byte[] data = null;

            String connectionString = "Data Source=UP949045\\SQLEXPRESS;"
                + "Integrated Security=true;"
                + "Initial Catalog=272Demo18;";
            using (SqlConnection con = new SqlConnection(connectionString)) {
                con.Open();
                String q = "select IMG from Images where CountryCode = @Code";
                using (SqlCommand cmd = new SqlCommand(q, con)) {
                    try {

                        cmd.Parameters.Add("@Code", SqlDbType.NVarChar);
                        cmd.Parameters["@Code"].Value = someCountryCode;

                        using (SqlDataReader reader = cmd.ExecuteReader()) {
                            reader.Read();
                            data = (byte[]) reader["IMG"];
                        }
                    }
                    catch (Exception e) {
                    
                    }
                }
            }
            return data;
        }

        public string getMissingFlag() {
            return null;
        }
    }
}
