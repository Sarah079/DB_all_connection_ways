using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CUD272ClassTutorial.Models
{
    public class PersonModel
    {
        public int ID { get; set; }

        public String  Name { get; set; }

        public String Surname { get; set; }

        public int FavTeamId { get; set; }

        public PersonModel deepClone() {

            return new PersonModel
            {
                ID = ID,
                Name = Name,
                Surname = Surname,
                FavTeamId = FavTeamId
            };

        }
    }
}
