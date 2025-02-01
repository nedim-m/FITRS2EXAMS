using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace exam.Model.Korisnik
{
    public class KorisnikUpdateRequest
    {
        public string? Ime { get; set; } = null!;

        public string? Prezime { get; set; } = null!;

        [EmailAddress(ErrorMessage = "Email adresa nije validna.")]
        public string? Email { get; set; }

        [Phone(ErrorMessage = "Telefon nije validan.")]
        public string? Telefon { get; set; }



        public string? Password { get; set; }


        public string? PasswordPotvrda { get; set; }



        public string? Addresa { get; set; }

        public int? UlogaId { get; set; }

        //public byte[]? Slika { get; set; }

        public bool? Status { get; set; }
    }
}
