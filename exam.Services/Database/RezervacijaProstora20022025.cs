using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace exam.Services.Database
{
    public class RezervacijaProstora20022025
    {
        public int RezervacijaProstora20022025Id { get; set; }
        public DateTime DatumIVrijemePocetkaRezervacije { get; set; }
        public int Trajanje { get; set; }

        public string StatusRezervacije { get; set; }

        public string Napomena { get; set; }

        public virtual Korisnik Korisnik { get; set; }

        public int KorisnikId { get; set; }


        public virtual RadniProstor RadniProstor { get; set; }

        public int RadniProstorId { get; set; }
    }
}
