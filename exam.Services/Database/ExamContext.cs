using exam.Model.Status;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace exam.Services.Database
{
    public class ExamContext : DbContext
    {
        public ExamContext() { }

        public ExamContext(DbContextOptions<ExamContext> options) : base(options) { }

        public virtual DbSet<Korisnik> Korisniks { get; set; }
        public virtual DbSet<Uloga> Ulogas { get; set; }
        public virtual DbSet<FITPasos> FITPasos { get; set; }
        public virtual DbSet<ToDo4924> ToDo4924s { get; set; }
        public virtual DbSet<MoodTracker> MoodTrackers { get; set; }
        public virtual DbSet<RadniProstor> RadniProstors { get; set; }
        public virtual DbSet<RezervacijaProstora20022025> RezervacijaProstora20022025s { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Uloga>().HasData(
                new Uloga { UlogaId = 1, Naziv = "Admin", Opis = "Bog i batina." },
                new Uloga { UlogaId = 2, Naziv = "Uposlenik", Opis = "Tu i tamo moze nesto." },
                new Uloga { UlogaId = 3, Naziv = "Korisnik", Opis = "Obicni smrtnik." }
            );

            modelBuilder.Entity<FITPasos>().HasData(
                new FITPasos { FITPasosId = 1, Aktivan = true, DatumVazenja = new DateTime(2025, 1, 1), KorisnikId = 5 },
                new FITPasos { FITPasosId = 2, Aktivan = false, DatumVazenja = new DateTime(2023, 1, 1), KorisnikId = 6 },
                new FITPasos { FITPasosId = 3, Aktivan = true, DatumVazenja = new DateTime(2025, 5, 15), KorisnikId = 7 }
            );

            modelBuilder.Entity<ToDo4924>().HasData(
                new ToDo4924 { ToDo4924Id = 1, NazivAktivnosti = "Neka aktivnost", OpisAktivnosti = "Opis neke aktivnosti", StatusAktivnosti = StatusAktivnosti.U_Toku.ToString(), KorisnikId = 4, KrajnjiRok = new DateTime(2025, 6, 10) },
                new ToDo4924 { ToDo4924Id = 2, NazivAktivnosti = "Neka aktivnost dva", OpisAktivnosti = "Opis neke aktivnosti dva", StatusAktivnosti = StatusAktivnosti.Istekla.ToString(), KorisnikId = 5, KrajnjiRok = new DateTime(2023, 12, 25) },
                new ToDo4924 { ToDo4924Id = 3, NazivAktivnosti = "Neka aktivnost tri", OpisAktivnosti = "Opis neke aktivnosti tri", StatusAktivnosti = StatusAktivnosti.Realizovana.ToString(), KorisnikId = 6, KrajnjiRok = new DateTime(2023, 11, 5) }
            );

            modelBuilder.Entity<MoodTracker>().HasData(
                new MoodTracker { MoodTrackerId = 1, KorisnikId = 7, DatumEvidencije = new DateTime(2025, 2, 1), OpisRaspolozenja = "Mnogo sretan", VrijednostRaspolozenja = VrijednostRaspolozenja.Sretan.ToString() },
                new MoodTracker { MoodTrackerId = 2, KorisnikId = 9, DatumEvidencije = new DateTime(2024, 5, 10), OpisRaspolozenja = "Mnogo tuzan", VrijednostRaspolozenja = VrijednostRaspolozenja.Tuzan.ToString() },
                new MoodTracker { MoodTrackerId = 3, KorisnikId = 5, DatumEvidencije = new DateTime(2025, 1, 15), OpisRaspolozenja = "Pod velikim stresom", VrijednostRaspolozenja = VrijednostRaspolozenja.Pod_Stresom.ToString() }
            );

            modelBuilder.Entity<RadniProstor>().HasData(
                new RadniProstor { RadniProstorId = 1, Aktivna = true, Kapacitet = 35, Oznaka = "Prostor 1" },
                new RadniProstor { RadniProstorId = 2, Aktivna = true, Kapacitet = 25, Oznaka = "Prostor 2" },
                new RadniProstor { RadniProstorId = 3, Aktivna = false, Kapacitet = 18, Oznaka = "Prostor 3" }
            );

            modelBuilder.Entity<RezervacijaProstora20022025>().HasData(
                new RezervacijaProstora20022025 { RezervacijaProstora20022025Id = 1, DatumIVrijemePocetkaRezervacije = new DateTime(2025, 1, 15, 14, 30, 0), KorisnikId = 6, Napomena = "Ovo je neka napomena", RadniProstorId = 1, StatusRezervacije = StatusRezervacije.Potvrdjena.ToString(), Trajanje = 3 },
                new RezervacijaProstora20022025 { RezervacijaProstora20022025Id = 2, DatumIVrijemePocetkaRezervacije = new DateTime(2025, 2, 10, 9, 15, 0), KorisnikId = 3, Napomena = "Rezervacija za sastanak", RadniProstorId = 2, StatusRezervacije = StatusRezervacije.Na_cekanju.ToString(), Trajanje = 2 },
                new RezervacijaProstora20022025 { RezervacijaProstora20022025Id = 3, DatumIVrijemePocetkaRezervacije = new DateTime(2025, 3, 5, 16, 45, 0), KorisnikId = 8, Napomena = "Rad na projektu", RadniProstorId = 3, StatusRezervacije = StatusRezervacije.Potvrdjena.ToString(), Trajanje = 4 },
                new RezervacijaProstora20022025 { RezervacijaProstora20022025Id = 4, DatumIVrijemePocetkaRezervacije = new DateTime(2025, 4, 20, 11, 00, 0), KorisnikId = 5, Napomena = "Prezentacija klijentu", RadniProstorId = 1, StatusRezervacije = StatusRezervacije.Otkazana.ToString(), Trajanje = 1 }
            );


            modelBuilder.Entity<Korisnik>().HasData(
    new Korisnik
    {
        KorisnikId = 1,
        Ime = "Admin",
        Prezime = "Admin",
        Email = "admin@admin.com",
        PasswordHash = "C5fuEDcAxNxDuUXqOJCU9DYfLpM=",
        PasswordSalt = "qQ0nSvQ4rOy3pP/Zi95wIw==",
        KorisnickoIme = "admin",
        Telefon = "061399232",
        UlogaId = 1
    },
    new Korisnik
    {
        KorisnikId = 2,
        Ime = "Uposlenik",
        Prezime = "Uposlenik",
        Email = "uposlenik@uposlenik.com",
        PasswordHash = "C5fuEDcAxNxDuUXqOJCU9DYfLpM=",
        PasswordSalt = "qQ0nSvQ4rOy3pP/Zi95wIw==",
        KorisnickoIme = "uposlenik",
        Telefon = "061399233",
        UlogaId = 2
    },
    new Korisnik
    {
        KorisnikId = 3,
        Ime = "Korisnik",
        Prezime = "Korisnik",
        Email = "korisnik@korisnik.com",
        PasswordHash = "C5fuEDcAxNxDuUXqOJCU9DYfLpM=",
        PasswordSalt = "qQ0nSvQ4rOy3pP/Zi95wIw==",
        KorisnickoIme = "korisnik",
        Telefon = "061222333",
        UlogaId = 3
    },
    new Korisnik
    {
        KorisnikId = 4,
        Ime = "Marko",
        Prezime = "Marković",
        Email = "marko.markovic@example.com",
        PasswordHash = "C5fuEDcAxNxDuUXqOJCU9DYfLpM=",
        PasswordSalt = "qQ0nSvQ4rOy3pP/Zi95wIw==",
        KorisnickoIme = "marko",
        Telefon = "061111111",
        UlogaId = 3
    },
    new Korisnik
    {
        KorisnikId = 5,
        Ime = "Ivana",
        Prezime = "Ivanković",
        Email = "ivana.ivankovic@example.com",
        PasswordHash = "C5fuEDcAxNxDuUXqOJCU9DYfLpM=",
        PasswordSalt = "qQ0nSvQ4rOy3pP/Zi95wIw==",
        KorisnickoIme = "ivana",
        Telefon = "062222222",
        UlogaId = 3
    },
    new Korisnik
    {
        KorisnikId = 6,
        Ime = "Petar",
        Prezime = "Petrović",
        Email = "petar.petrovic@example.com",
        PasswordHash = "C5fuEDcAxNxDuUXqOJCU9DYfLpM=",
        PasswordSalt = "qQ0nSvQ4rOy3pP/Zi95wIw==",
        KorisnickoIme = "petar",
        Telefon = "063333333",
        UlogaId = 3
    },
    new Korisnik
    {
        KorisnikId = 7,
        Ime = "Ana",
        Prezime = "Anić",
        Email = "ana.anic@example.com",
        PasswordHash = "C5fuEDcAxNxDuUXqOJCU9DYfLpM=",
        PasswordSalt = "qQ0nSvQ4rOy3pP/Zi95wIw==",
        KorisnickoIme = "ana",
        Telefon = "064444444",
        UlogaId = 3
    },
    new Korisnik
    {
        KorisnikId = 8,
        Ime = "Nikola",
        Prezime = "Nikolić",
        Email = "nikola.nikolic@example.com",
        PasswordHash = "C5fuEDcAxNxDuUXqOJCU9DYfLpM=",
        PasswordSalt = "qQ0nSvQ4rOy3pP/Zi95wIw==",
        KorisnickoIme = "nikola",
        Telefon = "065555555",
        UlogaId = 3
    },
    new Korisnik
    {
        KorisnikId = 9,
        Ime = "Jelena",
        Prezime = "Jelenković",
        Email = "jelena.jelenkovic@example.com",
        PasswordHash = "C5fuEDcAxNxDuUXqOJCU9DYfLpM=",
        PasswordSalt = "qQ0nSvQ4rOy3pP/Zi95wIw==",
        KorisnickoIme = "jelena",
        Telefon = "066666666",
        UlogaId = 3
    }
);


        }
    }
}
