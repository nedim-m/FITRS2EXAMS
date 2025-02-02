using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace exam.Model.Korisnik
{
    public partial class Korisnik
    {
        public int KorisnikId { get; set; }

        public string Ime { get; set; } = null!;

        public string Prezime { get; set; } = null!;

        public string KorisnickoIme { get; set; } = null!;

        public string Email { get; set; } = null!;

        public string Telefon { get; set; } = null!;

   


        public bool Status { get; set; }

        public string Uloga { get; set; } = null!;

        public int UlogaId { get; set; }

     



    }
}
