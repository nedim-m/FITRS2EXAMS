using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace exam.Services.Database
{
    public class MoodTracker
    {
        public int MoodTrackerId { get; set; }


        public string VrijednostRaspolozenja { get; set; }

        public string OpisRaspolozenja { get; set; }

        public DateTime DatumEvidencije { get; set; }

        public virtual Korisnik Korisnik { get; set; }

        public int KorisnikId { get; set; }


    }
}
