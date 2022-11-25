using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CUD272ClassTutorial.Models
{
	public class PersonViewModel
	{
		public PersonModel Person { get; set; }

		public TeamIDCountryCode teamIdAndCode { get; set; }
    }
}
