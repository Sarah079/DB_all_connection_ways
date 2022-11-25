using System;
using System.Collections.Generic;
using System.Linq;
using System.Diagnostics;
using System.Threading.Tasks;
using Microsoft.Extensions.Logging;
using CUD272ClassTutorial.Controllers;
using CUD272ClassTutorial.OurServices;

namespace CUD272ClassTutorial.Models
{
    public class MainDataViewModel
    {
		public List<PersonViewModel> Persons { get; set; }

        public List<TeamModel> Teams { get; set; }

        public bool AreFlagsStoredLocally { get; set; }

        public FlagService SomeFlagService { get; set; }
    }
}
