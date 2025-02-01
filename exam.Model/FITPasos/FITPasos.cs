using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace exam.Model.FITpasos
{
    public partial class FITPasos
    {
        public int FITPasosId { get; set; }

        public bool Aktivan { get; set; }

        public DateTime DatumVazenja { get; set; }

        public string Ime { get; set; } = string.Empty;
        public string Prezime { get; set; } = string.Empty;
    }
}
