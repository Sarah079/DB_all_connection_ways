using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using CUD272ClassTutorial.OurServices;

namespace CUD272ClassTutorial.Controllers
{
    public class FlagController : Controller
    {


        private DataService dataService;

        public FlagController(PersistentDataService someMagicService)
        {
            dataService = someMagicService;
        }

        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Add()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Add(String Code, String FlagFile) {
            String baseFlagPath = "C:\\Users\\U11186438\\Downloads\\Flags\\";
            String filename = baseFlagPath + FlagFile;

            dataService.insertFlag(Code, filename);

            return RedirectToAction("Index", "Home");
        }

    }
}
