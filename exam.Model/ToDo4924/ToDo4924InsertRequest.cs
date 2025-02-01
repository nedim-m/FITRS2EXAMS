
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace exam.Model.ToDo4924
{
    public class ToDo4924InsertRequest
    {
        public int KorisnikId { get; set; }

        public string? StatusAktivnosti { get; set; }

        public string? NazivAktivnosti { get; set; }
        public string? OpisAktivnosti { get; set; }
        public DateTime? KrajnjiRok { get; set; }


    }
}
