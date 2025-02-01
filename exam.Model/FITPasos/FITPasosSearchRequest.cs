using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace exam.Model.FITpasos
{
    public class FITPasosSearchRequest:BaseSearchObject
    {
        public string? ImePrezime { get; set; }
        public DateTime? Datum { get; set; }
    }
}
