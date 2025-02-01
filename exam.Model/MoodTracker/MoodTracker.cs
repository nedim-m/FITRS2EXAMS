using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace exam.Model.MoodTracker
{
    public class MoodTracker
    {
        public int MoodTrackerId { get; set; }


        public string VrijednostRaspolozenja { get; set; }

        public string OpisRaspolozenja { get; set; }

        public DateTime DatumEvidencije { get; set; }

        public string Ime { get; set; } = string.Empty;
        public string Prezime { get; set; } = string.Empty;
    }
}
