using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Data.SqlClient;
using CUD272ClassTutorial.Models;
using System.Configuration;
using Microsoft.Extensions.Configuration;
using System.Data;
using System.IO;

namespace CUD272ClassTutorial.OurServices
{
    public class PersistentDataService : DataService
    {

        private FlagService currService;
        private IConfiguration appConfig;
        private SqlConnectionStringBuilder stringBuilder = new SqlConnectionStringBuilder();
        private SqlConnection currConnection;

        public PersistentDataService(IConfiguration config) {
            appConfig = config;
        }


        public void setImgService(FlagService someFlagService)
        {
            currService = someFlagService;
        }

        public String getConnectionByHand() {
            String connectionString = "Data Source=UP949045\\SQLEXPRESS;"
                + "Integrated Security=true;"
                + "Initial Catalog=272Demo18;";
            return connectionString;
        }

        public String getConnectionStringViaBuilder() {
            stringBuilder["Data Source"] = "UP949045\\SQLEXPRESS";
            stringBuilder["Integrated Security"] = "true";
            stringBuilder["Initial Catalog"] = "272Demo18";
            return stringBuilder.ToString();
        }


        public String getConnectionViaXML()
        {
            string connectionString = appConfig.GetConnectionString("OfficeMachine");
            stringBuilder = new SqlConnectionStringBuilder(connectionString);
            //add properties, if needed
            stringBuilder["Initial Catalog"] = "272Demo18";

            return stringBuilder.ToString();
        }


        public bool naiveOpenConnection()
        {
            String conString = getConnectionViaXML();
            currConnection = new SqlConnection(conString);
            currConnection.Open();
            return true;
        }

        public bool openConnection() {
            bool status = true;
            try
            {
                String conString = getConnectionViaXML();
                currConnection = new SqlConnection(conString);
                currConnection.Open();
            } catch (Exception exc) {
                status = false;
                Console.WriteLine(exc.ToString());
            }
            return status;
        }

        public bool closeConnection()
        {
            if (currConnection != null)
            {
                currConnection.Close();
            }
            return true;
        }



        //=============================================================================



        public bool deleteUserV1(int id)
        {
            bool status = false;
            try
            {
                openConnection();
                SqlCommand command = new SqlCommand("delete from SportsFans where id = " + id + ";", currConnection);
                command.ExecuteNonQuery();
                closeConnection();
                status = true;
            }
            catch (Exception e)
            {
                status = false;
            }
            finally
            {
                closeConnection();
            }
            return status;
        }

        //DeleteUserV2
        public bool deleteUser(int id)
        {
            bool status = false;
            openConnection();
            using (currConnection)
            {
                String sqlQuery = "delete from SportsFans where id = @PersonID;";
                using (SqlCommand command = new SqlCommand(sqlQuery, currConnection)) {

                    command.Parameters.Add("@PersonId", SqlDbType.Int);
                    command.Parameters["@PersonId"].Value = id;

                    try
                    {
                        command.ExecuteNonQuery();
                        status = true;
                    }
                    catch (Exception err)
                    {
                        //TODO: do something
                    }
                }
            }

            return status;
        }

        public bool updateUserV1(PersonModel somePerson) {
            openConnection();
            String cmd = "update SportsFans set Name = '" + somePerson.Name + "', Surname = '" + somePerson.Surname + "' where id = " + somePerson.ID + ";";
            SqlCommand command = new SqlCommand(cmd, currConnection);
            command.ExecuteNonQuery();
            closeConnection();
            return true;
        }


        //UpdateUserV2
        public bool updateUser(PersonModel somePerson)
        {
            bool status = false;
            openConnection();
            using (currConnection) {
                String cmd = "update SportsFans set Name = @PersonName, Surname = @PersonSurname where id = @PersonId ;";
                using (SqlCommand command = new SqlCommand(cmd, currConnection)) {

                    command.Parameters.Add("@PersonName", SqlDbType.NVarChar);
                    command.Parameters["@PersonName"].Value = somePerson.Name;

                    command.Parameters.Add("@PersonSurname", SqlDbType.NVarChar);
                    command.Parameters["@PersonSurname"].Value = somePerson.Surname;

                    command.Parameters.Add("@PersonId", SqlDbType.Int);
                    command.Parameters["@PersonId"].Value = somePerson.ID;

                    try
                    {
                        command.ExecuteNonQuery();
                        status = true;
                    }
                    catch (Exception e) {
                        //TODO: do something
                    }
                }
            }
            return status;
        }

        public bool createUserV1(PersonModel somePerson) {
            openConnection();
            String cmd = "INSERT INTO SportsFans(Name, Surname, favSoccerTeam) VALUES('" + somePerson.Name + "', '" + somePerson.Surname + "', '" + somePerson.FavTeamId + "');";
            SqlCommand command = new SqlCommand(cmd, currConnection);
            command.ExecuteNonQuery();
            closeConnection();
            return true;
        }

        //CreateUserV2
        public bool createUser(PersonModel somePerson)
        {
            bool status = false;
            openConnection();
            using (currConnection)
            {
                String cmd = "INSERT INTO SportsFans(Name, Surname, favSoccerTeam) VALUES(@PersonName, @PersonSurname, @PersonFavTeamID)";
                using (SqlCommand command = new SqlCommand(cmd, currConnection))
                {
                    command.Parameters.Add("@PersonName", SqlDbType.NVarChar);
                    command.Parameters["@PersonName"].Value = somePerson.Name;


                    command.Parameters.Add("@PersonSurname", SqlDbType.NVarChar);
                    command.Parameters["@PersonSurname"].Value = somePerson.Surname;


                    command.Parameters.Add("@PersonFavTeamID", SqlDbType.Int);
                    command.Parameters["@PersonFavTeamID"].Value = somePerson.FavTeamId;

                    try
                    {
                        command.ExecuteNonQuery();
                        status = true;
                    }
                    catch (Exception err)
                    {
                        //TODO: do something (e.g., logging the exception)
                    }

                }
            }
            return status;
        }

        public void createUserGeneral(PersonModel somePerson)
        {
            String tableName = "SportsFans";
            List<String> cols = new List<String>
            {
                "Name", "Surname"
            };

            List<String> vals = new List<String>
            {
                somePerson.Name, somePerson.Surname
            };

            createRecords(tableName, cols, vals);
        }

        public void createRecords(String tableName, List<String> cols, List<String> vals)
        {
            openConnection();
            String cmd = "INSERT INTO " +
                tableName +
                String.Join(", ", cols.ToArray()) +
                "VALUES('" +
                String.Join(", ", vals.ToArray()) +
                 "');";
            SqlCommand command = new SqlCommand(cmd, currConnection);
            command.ExecuteNonQuery();
            closeConnection();
        }


















        /// //////////////////////////////////////////////////////////////////


        public PersonModel getUserByIdV1(int id)
        {
            PersonModel person = null;

            bool connected = openConnection();
            if (connected)
            {
                String sqlQuery = "select * from SportsFans where id = @PersonId";
                SqlCommand cmd = new SqlCommand(sqlQuery, currConnection);

                cmd.Parameters.Add("@PersonId", SqlDbType.Int);
                cmd.Parameters["@PersonId"].Value = id;
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    person = new PersonModel();
                    reader.Read();
                    person.Name = reader["Name"].ToString();
                    person.Surname = reader["Surname"].ToString();
                    person.ID = Convert.ToInt32(reader["id"]);
                    person.FavTeamId = Convert.ToInt32(reader["favSoccerTeam"]);
                }
                reader.Close();
                closeConnection();
            }

            return person;
        }



        //getUserByIdV2
        public PersonModel getUserById(int id)
        {
            PersonModel person = null;

            bool connected = openConnection();
            if (connected) {
                using (currConnection) {
                    String sqlQuery = "select * from SportsFans where id = @PersonId";
                    using (SqlCommand cmd = new SqlCommand(sqlQuery, currConnection)) {

                        cmd.Parameters.Add("@PersonId", SqlDbType.Int);
                        cmd.Parameters["@PersonId"].Value = id;


                        try {
                            using (SqlDataReader reader = cmd.ExecuteReader())
                            {
                                if (reader.HasRows) {

                                    person = new PersonModel();
                                    reader.Read();
                                    person.Name = reader["Name"].ToString();
                                    person.Surname = reader["Surname"].ToString();
                                    person.ID = Convert.ToInt32(reader["id"]);
                                    person.FavTeamId = Convert.ToInt32(reader["favSoccerTeam"]);
                                }
                            }
                        }
                        catch (Exception e) {
                            //TODO: do something
                        }

                    }
                }
            }

            return person;
        }

        public List<PersonModel> getUsersV1()
        {
            List<PersonModel> persons = new List<PersonModel>();
            bool connected = openConnection();

            if (connected) {
                SqlCommand command = new SqlCommand("select * from SportsFans", currConnection);
                SqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    PersonModel tmpPerson = new PersonModel();
                    tmpPerson.Name = reader["Name"].ToString();
                    tmpPerson.Surname = reader["Surname"].ToString();
                    tmpPerson.ID = Convert.ToInt32(reader["id"]);
                    if (reader["favSoccerTeam"] != DBNull.Value)
                    {
                        tmpPerson.FavTeamId = Convert.ToInt32(reader["favSoccerTeam"]);
                    }
                    else
                    {
                        tmpPerson.FavTeamId = -1;
                    }
                    persons.Add(tmpPerson);
                }
                reader.Close();
                closeConnection();
            }

            return persons;
        }



        //GetUsersV2
        public List<PersonModel> getUsers()
        {
            List<PersonModel> persons = new List<PersonModel>();
            if (openConnection()) {
                String sqlQuery = "select * from SportsFans";
                using (SqlCommand cmd = new SqlCommand(sqlQuery, currConnection)) {
                    try {
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                PersonModel tmpPerson = new PersonModel();
                                tmpPerson.Name = reader["Name"].ToString();
                                tmpPerson.Surname = reader["Surname"].ToString();
                                tmpPerson.ID = Convert.ToInt32(reader["id"]);
                                if (reader["favSoccerTeam"] != DBNull.Value)
                                {
                                    tmpPerson.FavTeamId = Convert.ToInt32(reader["favSoccerTeam"]);
                                }
                                persons.Add(tmpPerson);
                            }
                        }
                    }
                    catch (Exception e) {
                        //TODO: do something
                    }
                }
            }


            return persons;
        }



        public List<PersonModel> getUsersV3()
        {
            List<PersonModel> persons = new List<PersonModel>();
            if (openConnection())
            {
                String sqlQuery = "select * from SportsFans where Name like 'J%' and favSoccerTeam = 2";
                using (SqlCommand cmd = new SqlCommand(sqlQuery, currConnection))
                {
                    try
                    {
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                PersonModel tmpPerson = new PersonModel();
                                tmpPerson.Name = reader["Name"].ToString();
                                tmpPerson.Surname = reader["Surname"].ToString();
                                tmpPerson.ID = Convert.ToInt32(reader["id"]);
                                if (reader["favSoccerTeam"] != DBNull.Value)
                                {
                                    tmpPerson.FavTeamId = Convert.ToInt32(reader["favSoccerTeam"]);
                                }
                                persons.Add(tmpPerson);
                            }
                        }
                    }
                    catch (Exception e)
                    {
                        //TODO: do something
                    }
                }
            }


            return persons;
        }




        public List<TeamIDCountryCode> getCountryCodeByTeamIdsV1() {
            List<TeamIDCountryCode> codes = new List<TeamIDCountryCode>();
            if (openConnection())
            {
                SqlCommand command = new SqlCommand("select id, CountryCode from SoccerTeam;", currConnection);
                    
                SqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    TeamIDCountryCode tmpIDCodeMap = new TeamIDCountryCode();
                    tmpIDCodeMap.CountryCode = reader["CountryCode"].ToString();
                    tmpIDCodeMap.ID = Convert.ToInt32(reader["id"]);
                    codes.Add(tmpIDCodeMap);
                }
                reader.Close();
                currConnection.Close();
                    
            }
            return codes;
        }

        //GetCountryCodeByTeamIdsV2
        public List<TeamIDCountryCode> getCountryCodeByTeamIds()
        {
            List<TeamIDCountryCode> codes = new List<TeamIDCountryCode>();
            if (openConnection()) {
                using (currConnection) {
                    using (SqlCommand command = new SqlCommand("select id, CountryCode from SoccerTeam;", currConnection)) {
                        try {
                            using (SqlDataReader reader = command.ExecuteReader())
                            {
                                while (reader.Read())
                                {
                                    TeamIDCountryCode tmpIDCodeMap = new TeamIDCountryCode();
                                    tmpIDCodeMap.CountryCode = reader["CountryCode"].ToString();
                                    tmpIDCodeMap.ID = Convert.ToInt32(reader["id"]);
                                    codes.Add(tmpIDCodeMap);
                                }
                            }
                        }
                        catch (Exception e) {
                               //TODO: do something
                        }
                    }
                }
            }
            return codes;
        }



        //GetCountryCodeByTeamIdsV2
        public List<TeamIDCountryCode> getCountryCodeByTeamIdsDisconnected()
        {
            List<TeamIDCountryCode> codes = new List<TeamIDCountryCode>();
            DataTable dataTable = new DataTable();

            if (openConnection())
            {
                using (currConnection)
                {
                    using (SqlCommand command = new SqlCommand("select id, CountryCode from SoccerTeam;", currConnection))
                    {
                        try
                        {
                            using (SqlDataAdapter adapter = new SqlDataAdapter(command)) {
                                adapter.Fill(dataTable);
                            }

                        }
                        catch (Exception e)
                        {
                            //TODO: do something
                        }
                    }
                }
            }


            return codes;
        }
















        public List<PersonViewModel> getPersonViewModels()
        {

            List<PersonViewModel> data = new List<PersonViewModel>();

            //TODO:

            return data;
        }

        public List<TeamModel> getTeamsV3()
        {
            List<TeamModel> teams = new List<TeamModel>();

            if (openConnection()) {

                try {
                    String q = "select * from SoccerTeam";

                    using (SqlCommand cmd = new SqlCommand(q, currConnection)) {
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                TeamModel tmpTeam = new TeamModel();

                                tmpTeam.Name = reader["Name"].ToString();
                                tmpTeam.CountryCode = reader["CountryCode"].ToString();
                                tmpTeam.ID = Convert.ToInt32(reader["id"]);
                                if (reader["Website"] != DBNull.Value)
                                {
                                    tmpTeam.Website = reader["Website"].ToString();
                                }
                                teams.Add(tmpTeam);
                            }

                        }
                    }

                }
                catch (Exception e) { 
                
                }

            }


            return teams;
        }


        public List<TeamModel> getTeams() {
            List<TeamModel> teams = new List<TeamModel>();

            if (openConnection()) {

                using(currConnection) {
                    try {
                        String q = "GetTeams";
                        using (SqlCommand cmd = new SqlCommand(q, currConnection))
                        {
                            using (SqlDataReader reader = cmd.ExecuteReader())
                            {
                                while (reader.Read())
                                {
                                    TeamModel tmpTeam = new TeamModel();

                                    tmpTeam.Name = reader["Name"].ToString();
                                    tmpTeam.CountryCode = reader["CountryCode"].ToString();
                                    tmpTeam.ID = Convert.ToInt32(reader["id"]);
                                    if (reader["Website"] != DBNull.Value)
                                    {
                                        tmpTeam.Website = reader["Website"].ToString();
                                    }
                                    teams.Add(tmpTeam);
                                }

                            }
                        }
                    }
                    catch (Exception e) { 
                    
                    }
                
                }

            }
            return teams;
        }





        public TeamStatsModel getTeamStats(int id)
        {

            TeamStatsModel model = new TeamStatsModel();

            if (openConnection()) {
                using (currConnection) {
                    String q = "select avg(scoreH) from MatchScores where teamH=@teamId";
                    using (SqlCommand cmd = new SqlCommand(q, currConnection)) {
                        cmd.Parameters.Add("@teamId", SqlDbType.Int);
                        cmd.Parameters["@teamId"].Value = id;

                        model.HomeAvgGoals = Convert.ToInt32(cmd.ExecuteScalar());
                    }
                }
            }



            return model;
        }


        public void insertFlag(String countryCode, String filename)
        {

            if (openConnection()) {
                using (currConnection) {
                    String q = "Insert into Images (CountryCode, IMG) Values (@Code, @Img)";
                    using (SqlCommand cmd = new SqlCommand(q, currConnection)) {
                        cmd.Parameters.Add("@Code", SqlDbType.NVarChar);
                        cmd.Parameters["@Code"].Value = countryCode;

                        cmd.Parameters.Add("@Img", SqlDbType.Image);
                        cmd.Parameters["@Img"].Value = File.ReadAllBytes(filename);

                        cmd.ExecuteNonQuery();
                    }
                }
            }

        }


        public byte[] getFlagFile(String countryCode) {
            byte[] data = null; 
            if (openConnection()) {
                using (currConnection)
                {
                    String q = "select IMG from Images where CountryCode = @Code";
                    using (SqlCommand cmd = new SqlCommand(q, currConnection))
                    {
                        cmd.Parameters.Add("@Code", SqlDbType.NVarChar);
                        cmd.Parameters["@Code"].Value = countryCode;


                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            reader.Read();
                            data = (byte[])reader["IMG"];
                        }
                    }
                }
            }

            return data;
        }















        /// The following methods are dedicated to the teams

        public bool deleteTeam(int ID)
        {
            bool status = false;
            openConnection();
            using (currConnection)
            {
                String sqlQuery = "delete from SoccerTeam where id = @TeamId;";
                using (SqlCommand command = new SqlCommand(sqlQuery, currConnection))
                {

                    command.Parameters.Add("@TeamId", SqlDbType.Int);
                    command.Parameters["@TeamId"].Value = ID;

                    try
                    {
                        command.ExecuteNonQuery();
                        status = true;
                    }
                    catch (Exception err)
                    {
                        //TODO: do something
                    }
                }
            }

            return status;
        }

        public TeamModel getTeamById(int id)
        {
            TeamModel team = null;

            bool connected = openConnection();
            if (connected)
            {
                using (currConnection)
                {
                    String sqlQuery = "select * from SoccerTeam where id = @TeamID";
                    using (SqlCommand cmd = new SqlCommand(sqlQuery, currConnection))
                    {

                        cmd.Parameters.Add("@TeamID", SqlDbType.Int);
                        cmd.Parameters["@TeamID"].Value = id;

                        try
                        {
                            using (SqlDataReader reader = cmd.ExecuteReader())
                            {
                                if (reader.HasRows)
                                {

                                    team = new TeamModel();
                                    reader.Read();
                                    team.Name = reader["Name"].ToString();
                                    team.ID = Convert.ToInt32(reader["id"]);
                                    team.CountryCode = reader["CountryCode"].ToString();
                                    team.Website = reader["Website"].ToString();
                                }
                            }
                        }
                        catch (Exception e)
                        {
                            //TODO: do something
                        }

                    }
                }
            }

            return team;
        }

        public bool updateTeam(TeamModel someTeam)
        {
            bool status = false;
            openConnection();
            using (currConnection)
            {
                String cmd = "update SoccerTeam set Name = @TeamName, CountryCode = @TeamCountryCode, Website = @TeamWebsite where id = @TeamID ;";
                using (SqlCommand command = new SqlCommand(cmd, currConnection))
                {

                    command.Parameters.Add("@TeamName", SqlDbType.NVarChar);
                    command.Parameters["@TeamName"].Value = someTeam.Name;

                    command.Parameters.Add("@TeamCountryCode", SqlDbType.NVarChar);
                    command.Parameters["@TeamCountryCode"].Value = someTeam.CountryCode;

                    command.Parameters.Add("@TeamWebsite", SqlDbType.NVarChar);
                    command.Parameters["@TeamWebsite"].Value = someTeam.Website;

                    command.Parameters.Add("@TeamID", SqlDbType.Int);
                    command.Parameters["@TeamID"].Value = someTeam.ID;

                    try
                    {
                        command.ExecuteNonQuery();
                        status = true;
                    }
                    catch (Exception e)
                    {
                        //TODO: do something
                    }
                }
            }
            return status;
        }

        public bool createTeam(TeamModel someTeam)
        {
            bool status = false;
            openConnection();
            using (currConnection)
            {
                String cmd = "INSERT INTO SoccerTeam (Name, CountryCode, Website) VALUES(@TeamName, @TeamCountryCode, @Website)";
                using (SqlCommand command = new SqlCommand(cmd, currConnection))
                {
                    command.Parameters.Add("@TeamName", SqlDbType.NVarChar);
                    command.Parameters["@TeamName"].Value = someTeam.Name;


                    command.Parameters.Add("@TeamCountryCode", SqlDbType.NVarChar);
                    command.Parameters["@TeamCountryCode"].Value = someTeam.CountryCode;


                    command.Parameters.Add("@Website", SqlDbType.NVarChar);
                    command.Parameters["@Website"].Value = someTeam.Website;

                    try
                    {
                        command.ExecuteNonQuery();
                        status = true;
                    }
                    catch (Exception err)
                    {
                        //TODO: do something (e.g., logging the exception)
                    }

                }
            }
            return status;
        }




        public List<TeamModel> getTeamsV1()
        {
            List<TeamModel> teams = new List<TeamModel>();
            if (openConnection())
            {
                String sqlQuery = "select * from SoccerTeam";
                using (SqlCommand cmd = new SqlCommand(sqlQuery, currConnection))
                {
                    try
                    {
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                TeamModel tmpTeam = new TeamModel();

                                tmpTeam.Name = reader["Name"].ToString();
                                tmpTeam.CountryCode = reader["CountryCode"].ToString();
                                tmpTeam.ID = Convert.ToInt32(reader["id"]);
                                if (reader["Website"] != DBNull.Value)
                                {
                                    tmpTeam.Website = reader["Website"].ToString();
                                }
                                teams.Add(tmpTeam);
                            }
                        }
                    }
                    catch (Exception e)
                    {
                        //TODO: do something
                    }
                }
            }


            return teams;
        }




        public List<TeamModel> getTeamsV2()
        {
            List<TeamModel> teams = new List<TeamModel>();
            if (openConnection())
            {
                String sqlQuery = @"select SoccerTeam.id, SoccerTeam.Name, SoccerTeam.CountryCode, SoccerTeam.Website from SoccerTeam
INNER JOIN SportsFans ON SportsFans.favSoccerTeam=SoccerTeam.id;";
                using (SqlCommand cmd = new SqlCommand(sqlQuery, currConnection))
                {
                    try
                    {
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                TeamModel tmpTeam = new TeamModel();

                                tmpTeam.Name = reader["Name"].ToString();
                                tmpTeam.CountryCode = reader["CountryCode"].ToString();
                                tmpTeam.ID = Convert.ToInt32(reader["id"]);
                                if (reader["Website"] != DBNull.Value)
                                {
                                    tmpTeam.Website = reader["Website"].ToString();
                                }
                                teams.Add(tmpTeam);
                            }
                        }
                    }
                    catch (Exception e)
                    {
                        //TODO: do something
                    }
                }
            }


            return teams;
        }

    }
}
























