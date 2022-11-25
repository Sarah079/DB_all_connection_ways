using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using CUD272ClassTutorial.Models;

namespace CUD272ClassTutorial.OurServices
{
    public class NonPersistentDataService : DataService
    {

        List<PersonModel> persons = new List<PersonModel>();
        List<TeamIDCountryCode> codes = new List<TeamIDCountryCode>();

        private NonPersistentDataService()
        {
            //person 1
            persons.Add(
               new PersonModel
               {
                   ID = 1,
                   Name = "Beline",
                   Surname = "Dion",
                   FavTeamId = 1
               }
            );


            //person 2
            persons.Add(
               new PersonModel
               {
                   ID = 10,
                   Name = "Michaem",
                   Surname = "Jackson",
                   FavTeamId = 2
               }
            );

            //person 3
            persons.Add(
               new PersonModel
               {
                   ID = 100,
                   Name = "Alton",
                   Surname = "John",
                   FavTeamId = 3
               }
            );


            //code 1
            codes.Add(
               new TeamIDCountryCode
               {
                   ID = 1,
                   CountryCode = "de"
               }
            );


            //code 2
            codes.Add(
               new TeamIDCountryCode
               {
                   ID = 2,
                   CountryCode = "cn"
               }
            );

            //code 3
            codes.Add(
               new TeamIDCountryCode
               {
                   ID = 3,
                   CountryCode = "ug"
               }
            );

        }

        public bool deleteUser(int id)
        {
            bool status = false;
            if (persons.Any(person => person.ID == id)) {
                persons.RemoveAll(person => person.ID == id);
                status = true;
            }

            return status;
        }

        public PersonModel getUserById(int id) {
            int index = persons.FindIndex(person => person.ID == id);
            PersonModel person = null;
            if (index >= 0) {
                person = persons[index];
            }
            return person;
        }


        public bool updateUser(PersonModel somePerson)
        {
            bool status = false;
            if (persons.Any(person => person.ID == somePerson.ID))
            {
                int index = persons.FindIndex(person => person.ID == somePerson.ID);
                persons[index] = somePerson.deepClone();
            }
            return status;
        }

        public bool createUser(PersonModel somePerson)
        {
            bool status = false;
            int highestId = 0;
            if (persons.Count() > 0) {
                highestId = persons.Max(person => person.ID);
            }
            somePerson.ID = highestId + 1;
            persons.Add(somePerson);
            return status;
        }


        public List<PersonModel> getUsers()
        {
            return persons;
        }

        public List<TeamIDCountryCode> getCountryCodeByTeamIds()
        {
            return codes;
        }

        public List<PersonViewModel> getPersonViewModels() {
            //TODO: implement
            return null;
        }














        public bool deleteTeam(int id) {
            //TODO: implement
            return false;
        }

        public TeamModel getTeamById(int id) {
            //TODO: implement
            return null;
        }

        public bool updateTeam(TeamModel someTeam) {
            //TODO: implement
            return false;
        }

        public bool createTeam(TeamModel somePerson) {
            //TODO: implement
            return false;
        }

        public List<TeamModel> getTeams() {
            //TODO: implement
            return null;
        }

        public TeamStatsModel getTeamStats(int id) {
            //TODO: implement
            return null;        
        }





        public void insertFlag(String countryCode, String filename) {
            //TODO: implement
        }










        //You don't have to worry about this part
        private static NonPersistentDataService instance;
        public static NonPersistentDataService getNonPersistentDataService()
        {
            if (instance == null)
            {
                instance = new NonPersistentDataService();
            }
            return instance;
        }


        public void setImgService(FlagService someFlagService) {
            //TODO; do someting
        }
    }
}
