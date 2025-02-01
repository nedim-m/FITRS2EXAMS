using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace exam.Services.Database
{
    public class ToDo4924
    {
        public int ToDo4924Id { get; set; }
        public virtual Korisnik Korisnik { get; set; }
        public int KorisnikId { get; set; }
        public string? NazivAktivnosti { get; set; }
        public string? OpisAktivnosti { get; set; }
        public DateTime? KrajnjiRok { get; set; }

        public string StatusAktivnosti { get; set; }

    }
}
