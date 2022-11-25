using CUD272ClassTutorial.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using CUD272ClassTutorial.OurServices;
using System.Net.Mime;

namespace CUD272ClassTutorial.Controllers
{
    public class HomeController : Controller
    {

        private DataService dataService;
        private FlagService localflagService;
        private FlagService remoteflagService;

        public HomeController(PersistentDataService someMagicService, DemoFlagService onlineFlagService, SQLFlagService dbFlagService)
        {
            dataService = someMagicService;
            localflagService = dbFlagService;
            remoteflagService = onlineFlagService;
        }

        public IActionResult Index()
        {

            List<PersonModel> databaseUsers = dataService.getUsers();
            List<TeamIDCountryCode> teamCountryCodes = dataService.getCountryCodeByTeamIds();

            MainDataViewModel usersViewModel = buildUsersViewModel(databaseUsers, teamCountryCodes);

            return View(usersViewModel);
        }

        private MainDataViewModel buildUsersViewModel(List<PersonModel> databaseUsers, List<TeamIDCountryCode> teamCountryCodes) {

            MainDataViewModel dataViewModel = new MainDataViewModel();

            dataViewModel.Persons = new List<PersonViewModel>();
            dataViewModel.Teams = dataService.getTeams();

            for (int i = 0; i < databaseUsers.Count(); ++i)
            {
                PersonViewModel pvModel = new PersonViewModel();

                //get person
                pvModel.Person = databaseUsers.ElementAt(i);

                //flag url
                //pvModel.TeamCountryFlag = null; //TODO; 

                dataViewModel.Persons.Add(pvModel);
            }
            return dataViewModel;
        }



        [HttpGet]
        public IActionResult Update(int id, String type) {

            EntityUpdateViewModel updateViewModel = new EntityUpdateViewModel();

            switch (type) {
                case "Fan": {
                        updateViewModel.Person = dataService.getUserById(id);
                        break;
                    }
                case "Team": {
                        updateViewModel.Team = dataService.getTeamById(id);
                        break;
                    }
            }

            if (updateViewModel.Person == null && updateViewModel.Team==null) {
                return RedirectToAction("Error");
            }
            return View(updateViewModel);
        }

        [HttpPost]
        public IActionResult UpdatePerson(PersonModel somePerson) {
            dataService.updateUser(somePerson);
            return RedirectToAction("Index");
        }

        [HttpPost]
        public IActionResult UpdateTeam(TeamModel someTeam)
        {
            //TODO: Fix bug in the update the people and teams
            dataService.updateTeam(someTeam);
            return RedirectToAction("Index");
        }

        [HttpGet]
        public IActionResult Add() {
            return View();
        }

        public IActionResult GetImage(String countryCode) {
            byte[] rawImg = ((PersistentDataService)dataService).getFlagFile(countryCode);
            return File(rawImg, "image/png");
        }



        [HttpGet]
        public IActionResult TeamData(int id)
        {
            TeamStatsModel model = dataService.getTeamStats(id);
            return View(model);
        }


        [HttpPost]
        public IActionResult Add(PersonModel somePerson)
        {
            dataService.createUser(somePerson);
            return RedirectToAction("Index");
        }

        public IActionResult Delete(int id, String type)
        {
            switch (type) {
                case "Fan":
                    {
                        dataService.deleteUser(id);
                        break;
                    }
                case "Team": {
                        dataService.deleteTeam(id);
                        break;
                    }
                
            }
            return RedirectToAction("Index");
        }


        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
