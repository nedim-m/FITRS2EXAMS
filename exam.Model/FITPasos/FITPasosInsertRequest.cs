using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace exam.Model.FITpasos
{
    public class FITPasosInsertRequest
    {
        public int KorisnikId { get; set; }
        public bool Aktivan { get; set; }

        public DateTime DatumVazenja { get; set; }
    }
}
