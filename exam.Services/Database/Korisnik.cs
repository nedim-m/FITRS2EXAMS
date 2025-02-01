using System;
using System.Collections.Generic;


namespace exam.Services.Database
{

    public partial class Korisnik
    {
        public int KorisnikId { get; set; }

        public string Ime { get; set; } = null!;

        public string Prezime { get; set; } = null!;

        public string KorisnickoIme { get; set; } = null!;

        public string PasswordHash { get; set; } = null!;

        public string PasswordSalt { get; set; } = null!;

        public string Email { get; set; } = null!;

        public string Telefon { get; set; } = null!;


        public int UlogaId { get; set; }



        public virtual Uloga Uloga { get; set; }
    }
}