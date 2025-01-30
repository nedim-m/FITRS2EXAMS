using exam.Service.Database;
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

        public virtual DbSet<User> Users { get; set; }
        public virtual DbSet<Role> Roles { get; set; }



        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {

            modelBuilder.Entity<Role>().HasData(
            new Role { Id = 1, Name = "Admin", Description="Bog i batina." },
            new Role { Id = 2, Name = "Uposlenik", Description="Tu i tamo moze nesto." },
            new Role { Id = 3, Name = "Korisnik", Description="Obicni smrtnik." }

        );

            modelBuilder.Entity<User>().HasData(new User
            {
                Id = 1,
                FirstName = "Admin",
                LastName = "Admin",
                Email = "admin@admin.com",
                PasswordHash = "C5fuEDcAxNxDuUXqOJCU9DYfLpM=",
                PasswordSalt = "qQ0nSvQ4rOy3pP/Zi95wIw==",
                UserName = "admin",
                Phone = "061399232",
               
                RoleId = 1,

            },
            new User
            {
                Id = 2,
                FirstName = "Uposlenik",
                LastName = "Uposlenik",
                Email = "uposlenik@uposlenik.com",
                PasswordHash = "C5fuEDcAxNxDuUXqOJCU9DYfLpM=",
                PasswordSalt = "qQ0nSvQ4rOy3pP/Zi95wIw==",
                UserName = "uposlenik",
                Phone = "061399233",
          
                RoleId = 2,

            },
             new User
             {
                 Id = 3,
                 FirstName = "Korisnik",
                 LastName = "Korisnik",
                 Email = "korisnik@korisnik.com",
                 PasswordHash = "C5fuEDcAxNxDuUXqOJCU9DYfLpM=",
                 PasswordSalt = "qQ0nSvQ4rOy3pP/Zi95wIw==",
                 UserName = "korisnik",
                 Phone = "061222333",
               
                 RoleId = 3,

             }


            );

        }
    }
}