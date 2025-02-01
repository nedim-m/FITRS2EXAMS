using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace exam.Model.Korisnik
{
    public class KorisnikSearchObject : BaseSearchObject
    {
        public string? ImePrezime { get; set; }
        public int? UlogaId { get; set; }
    }
}
