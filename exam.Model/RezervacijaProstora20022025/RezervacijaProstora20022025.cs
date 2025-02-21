using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace exam.Model.RezervacijaProstora20022025
{
    public class RezervacijaProstora20022025
    {
        public string Ime { get; set; } = string.Empty;
        public string Prezime { get; set; } = string.Empty;

        public string Oznaka { get; set; }

        public int Kapacitet { get; set; }

        public DateTime DatumIVrijemePocetkaRezervacije { get; set; }
        public int Trajanje { get; set; }

        public string StatusRezervacije { get; set; }
    }
}
