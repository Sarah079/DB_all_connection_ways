using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using CUD272ClassTutorial.Models;

namespace CUD272ClassTutorial.OurServices
{
    public interface DataService
    {

        /// The following methods are dedicated for the users
        /// 
        public bool deleteUser(int id);

        public PersonModel getUserById(int id);

        public abstract bool updateUser(PersonModel somePerson);

        public abstract bool createUser(PersonModel somePerson);

        public List<PersonModel> getUsers();




        /// The following methods sit at the intersection of the person and teams models
        
        public List<TeamIDCountryCode> getCountryCodeByTeamIds();
        public List<PersonViewModel> getPersonViewModels();





        /// The following methods are dedicated for the teams

        public bool deleteTeam(int id);

        public TeamModel getTeamById(int id);

        public bool updateTeam(TeamModel someTeam);

        public bool createTeam(TeamModel somePerson);

        public List<TeamModel> getTeams();

        public TeamStatsModel getTeamStats(int id);



        public void insertFlag(String countryCode, String filename);




        //for demo
        public void setImgService(FlagService someFlagService);
    }
}
