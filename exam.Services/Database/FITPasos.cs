
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace exam.Services.Database
{
    public class FITPasos
    {
        public int FITPasosId { get; set; }

        public bool Aktivan { get; set; }

        public DateTime DatumVazenja { get; set; }

        public virtual Korisnik Korisnik { get; set; }

        public int KorisnikId { get; set; }

    }
}
