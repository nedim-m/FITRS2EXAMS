using exam.Model.Status;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace exam.Model.RezervacijaProstora20022025
{
    public class RezervacijaProstora20022025SearchRequest: BaseSearchObject
    {
        public int? KorisnikId { get; set; }
        public int? RadniProstorId { get; set; }

        public StatusRezervacije? PretragaStatusRezervacije { get; set; }
    }
}
