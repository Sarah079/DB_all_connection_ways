using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.IO;

namespace CUD272ClassTutorial.OurServices
{
    public interface FlagService
    {
		public String getFlagURI(String someCountryCode);

		public byte[] getFlagFile(String someCountryCode);

		public string getMissingFlag();
	}
}
