
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

        public ExamContext()
        {

        }

        public ExamContext(DbContextOptions<ExamContext> options) : base(options)
        {

        }
 public virtual DbSet<Korisnik> Korisniks { get; set; }
  public virtual DbSet<Uloga> Ulogas { get; set; }
    public virtual DbSet<FITPasos> FITPasos { get; set; }

    public virtual DbSet<ToDo4924> ToDo4924s { get; set; }
    public virtual DbSet<MoodTracker> MoodTrackers { get; set; }



        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {

            modelBuilder.Entity<Uloga>().HasData(
            new Uloga { UlogaId = 1, Naziv = "Admin", Opis="Bog i batina." },
            new Uloga { UlogaId = 2, Naziv = "Uposlenik", Opis="Tu i tamo moze nesto." },
            new Uloga { UlogaId = 3, Naziv = "Korisnik", Opis="Obicni smrtnik." }

        );

            modelBuilder.Entity<Korisnik>().HasData(new Korisnik
            {
                KorisnikId = 1,
                Ime = "Admin",
                Prezime = "Admin",
                Email = "admin@admin.com",
                PasswordHash = "C5fuEDcAxNxDuUXqOJCU9DYfLpM=",
                PasswordSalt = "qQ0nSvQ4rOy3pP/Zi95wIw==",
                KorisnickoIme = "admin",
                Telefon = "061399232",

                UlogaId = 1,

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

                UlogaId = 2,

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

                 UlogaId = 3,

             }


            );

        }
    }
}