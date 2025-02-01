using System.ComponentModel.DataAnnotations;

namespace exam.Model.Korisnik
{
    public class KorisnikInsertRequest
    {
        [Required(AllowEmptyStrings = false, ErrorMessage = "Ime je obavezno polje.")]
        public string Ime { get; set; } = null!;

        [Required(AllowEmptyStrings = false, ErrorMessage = "Prezime je obavezno polje.")]
        public string Prezime { get; set; } = null!;

        [Required(AllowEmptyStrings = false, ErrorMessage = "Korisničko ime je obavezno polje.")]
        public string KorisnickoIme { get; set; } = null!;

        [Required(AllowEmptyStrings = false, ErrorMessage = "Lozinka je obavezno polje.")]
        [MinLength(3, ErrorMessage = "Dužina lozinke mora biti najmanje 3 karaktera.")]
        [MaxLength(20, ErrorMessage = "Dužina lozinke ne smije preći 20 karaktera.")]
        public string Password { get; set; } = "Password123*";

        [Required(AllowEmptyStrings = false, ErrorMessage = "Potvrda lozinke je obavezno polje.")]
        [MinLength(3, ErrorMessage = "Dužina potvrde lozinke mora biti najmanje 3 karaktera.")]
        [MaxLength(20, ErrorMessage = "Dužina potvrde lozinke ne smije preći 20 karaktera.")]
        [Compare("Password", ErrorMessage = "Lozinke moraju biti iste")]
        public string PasswordPotvrda { get; set; }= "Password123*";


        public int? UlogaId { get; set; }

        [EmailAddress(ErrorMessage = "Email adresa nije validna.")]
        public string? Email { get; set; }

        [Phone(ErrorMessage = "Telefon nije validan.")]
        public string? Telefon { get; set; }

        public string? Addresa { get; set; } = string.Empty;

        //public byte[]? Slika { get; set; } = null;
       
        public bool Status { get; set; }
    }
}
