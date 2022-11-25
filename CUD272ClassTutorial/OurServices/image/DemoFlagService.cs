using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using System.IO;

namespace CUD272ClassTutorial.OurServices
{
	public class DemoFlagService : FlagService
	{

		private string coutryflagsTemplate = "https://www.countryflags.io/{0}/flat/32.png";

		public String getFlagURI(String someCountryCode) {
			String url = String.Format(coutryflagsTemplate, someCountryCode);
			return url;
		}

		public byte[] getFlagFile(String someCountryCode)
		{
			//TODO: ????
			return null;
		}

		public string getMissingFlag() {
			return "https://cdn.iconscout.com/icon/free/png-512/squared-433398.png";
		}
	}
}
