
using exam.Model;
using exam.Model.Status;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
namespace exam.Model.MoodTracker
{
    public class MoodTrackerSearchRequest:BaseSearchObject
    {
        public int? KorisnikId { get; set; }
        public DateTime? PretragaDatum { get; set; }

        public VrijednostRaspolozenja? PretragaVrijednostRaspolozenja { get; set; }
    }
}
