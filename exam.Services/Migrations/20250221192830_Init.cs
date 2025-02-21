using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

#pragma warning disable CA1814 // Prefer jagged arrays over multidimensional

namespace exam.Services.Migrations
{
    /// <inheritdoc />
    public partial class Init : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "RadniProstors",
                columns: table => new
                {
                    RadniProstorId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Oznaka = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Aktivna = table.Column<bool>(type: "bit", nullable: false),
                    Kapacitet = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_RadniProstors", x => x.RadniProstorId);
                });

            migrationBuilder.CreateTable(
                name: "Ulogas",
                columns: table => new
                {
                    UlogaId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Naziv = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Opis = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Ulogas", x => x.UlogaId);
                });

            migrationBuilder.CreateTable(
                name: "Korisniks",
                columns: table => new
                {
                    KorisnikId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Ime = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Prezime = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    KorisnickoIme = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    PasswordHash = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    PasswordSalt = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Email = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Telefon = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    UlogaId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Korisniks", x => x.KorisnikId);
                    table.ForeignKey(
                        name: "FK_Korisniks_Ulogas_UlogaId",
                        column: x => x.UlogaId,
                        principalTable: "Ulogas",
                        principalColumn: "UlogaId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "FITPasos",
                columns: table => new
                {
                    FITPasosId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Aktivan = table.Column<bool>(type: "bit", nullable: false),
                    DatumVazenja = table.Column<DateTime>(type: "datetime2", nullable: false),
                    KorisnikId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_FITPasos", x => x.FITPasosId);
                    table.ForeignKey(
                        name: "FK_FITPasos_Korisniks_KorisnikId",
                        column: x => x.KorisnikId,
                        principalTable: "Korisniks",
                        principalColumn: "KorisnikId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "MoodTrackers",
                columns: table => new
                {
                    MoodTrackerId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    VrijednostRaspolozenja = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    OpisRaspolozenja = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    DatumEvidencije = table.Column<DateTime>(type: "datetime2", nullable: false),
                    KorisnikId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_MoodTrackers", x => x.MoodTrackerId);
                    table.ForeignKey(
                        name: "FK_MoodTrackers_Korisniks_KorisnikId",
                        column: x => x.KorisnikId,
                        principalTable: "Korisniks",
                        principalColumn: "KorisnikId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "RezervacijaProstora20022025s",
                columns: table => new
                {
                    RezervacijaProstora20022025Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    DatumIVrijemePocetkaRezervacije = table.Column<DateTime>(type: "datetime2", nullable: false),
                    Trajanje = table.Column<int>(type: "int", nullable: false),
                    StatusRezervacije = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Napomena = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    KorisnikId = table.Column<int>(type: "int", nullable: false),
                    RadniProstorId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_RezervacijaProstora20022025s", x => x.RezervacijaProstora20022025Id);
                    table.ForeignKey(
                        name: "FK_RezervacijaProstora20022025s_Korisniks_KorisnikId",
                        column: x => x.KorisnikId,
                        principalTable: "Korisniks",
                        principalColumn: "KorisnikId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_RezervacijaProstora20022025s_RadniProstors_RadniProstorId",
                        column: x => x.RadniProstorId,
                        principalTable: "RadniProstors",
                        principalColumn: "RadniProstorId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "ToDo4924s",
                columns: table => new
                {
                    ToDo4924Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    KorisnikId = table.Column<int>(type: "int", nullable: false),
                    NazivAktivnosti = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    OpisAktivnosti = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    KrajnjiRok = table.Column<DateTime>(type: "datetime2", nullable: true),
                    StatusAktivnosti = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ToDo4924s", x => x.ToDo4924Id);
                    table.ForeignKey(
                        name: "FK_ToDo4924s_Korisniks_KorisnikId",
                        column: x => x.KorisnikId,
                        principalTable: "Korisniks",
                        principalColumn: "KorisnikId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.InsertData(
                table: "RadniProstors",
                columns: new[] { "RadniProstorId", "Aktivna", "Kapacitet", "Oznaka" },
                values: new object[,]
                {
                    { 1, true, 35, "Prostor 1" },
                    { 2, true, 25, "Prostor 2" },
                    { 3, false, 18, "Prostor 3" }
                });

            migrationBuilder.InsertData(
                table: "Ulogas",
                columns: new[] { "UlogaId", "Naziv", "Opis" },
                values: new object[,]
                {
                    { 1, "Admin", "Bog i batina." },
                    { 2, "Uposlenik", "Tu i tamo moze nesto." },
                    { 3, "Korisnik", "Obicni smrtnik." }
                });

            migrationBuilder.InsertData(
                table: "Korisniks",
                columns: new[] { "KorisnikId", "Email", "Ime", "KorisnickoIme", "PasswordHash", "PasswordSalt", "Prezime", "Telefon", "UlogaId" },
                values: new object[,]
                {
                    { 1, "admin@admin.com", "Admin", "admin", "C5fuEDcAxNxDuUXqOJCU9DYfLpM=", "qQ0nSvQ4rOy3pP/Zi95wIw==", "Admin", "061399232", 1 },
                    { 2, "uposlenik@uposlenik.com", "Uposlenik", "uposlenik", "C5fuEDcAxNxDuUXqOJCU9DYfLpM=", "qQ0nSvQ4rOy3pP/Zi95wIw==", "Uposlenik", "061399233", 2 },
                    { 3, "korisnik@korisnik.com", "Korisnik", "korisnik", "C5fuEDcAxNxDuUXqOJCU9DYfLpM=", "qQ0nSvQ4rOy3pP/Zi95wIw==", "Korisnik", "061222333", 3 },
                    { 4, "marko.markovic@example.com", "Marko", "marko", "C5fuEDcAxNxDuUXqOJCU9DYfLpM=", "qQ0nSvQ4rOy3pP/Zi95wIw==", "Marković", "061111111", 3 },
                    { 5, "ivana.ivankovic@example.com", "Ivana", "ivana", "C5fuEDcAxNxDuUXqOJCU9DYfLpM=", "qQ0nSvQ4rOy3pP/Zi95wIw==", "Ivanković", "062222222", 3 },
                    { 6, "petar.petrovic@example.com", "Petar", "petar", "C5fuEDcAxNxDuUXqOJCU9DYfLpM=", "qQ0nSvQ4rOy3pP/Zi95wIw==", "Petrović", "063333333", 3 },
                    { 7, "ana.anic@example.com", "Ana", "ana", "C5fuEDcAxNxDuUXqOJCU9DYfLpM=", "qQ0nSvQ4rOy3pP/Zi95wIw==", "Anić", "064444444", 3 },
                    { 8, "nikola.nikolic@example.com", "Nikola", "nikola", "C5fuEDcAxNxDuUXqOJCU9DYfLpM=", "qQ0nSvQ4rOy3pP/Zi95wIw==", "Nikolić", "065555555", 3 },
                    { 9, "jelena.jelenkovic@example.com", "Jelena", "jelena", "C5fuEDcAxNxDuUXqOJCU9DYfLpM=", "qQ0nSvQ4rOy3pP/Zi95wIw==", "Jelenković", "066666666", 3 }
                });

            migrationBuilder.InsertData(
                table: "FITPasos",
                columns: new[] { "FITPasosId", "Aktivan", "DatumVazenja", "KorisnikId" },
                values: new object[,]
                {
                    { 1, true, new DateTime(2025, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), 5 },
                    { 2, false, new DateTime(2023, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), 6 },
                    { 3, true, new DateTime(2025, 5, 15, 0, 0, 0, 0, DateTimeKind.Unspecified), 7 }
                });

            migrationBuilder.InsertData(
                table: "MoodTrackers",
                columns: new[] { "MoodTrackerId", "DatumEvidencije", "KorisnikId", "OpisRaspolozenja", "VrijednostRaspolozenja" },
                values: new object[,]
                {
                    { 1, new DateTime(2025, 2, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), 7, "Mnogo sretan", "Sretan" },
                    { 2, new DateTime(2024, 5, 10, 0, 0, 0, 0, DateTimeKind.Unspecified), 9, "Mnogo tuzan", "Tuzan" },
                    { 3, new DateTime(2025, 1, 15, 0, 0, 0, 0, DateTimeKind.Unspecified), 5, "Pod velikim stresom", "Pod_Stresom" }
                });

            migrationBuilder.InsertData(
                table: "RezervacijaProstora20022025s",
                columns: new[] { "RezervacijaProstora20022025Id", "DatumIVrijemePocetkaRezervacije", "KorisnikId", "Napomena", "RadniProstorId", "StatusRezervacije", "Trajanje" },
                values: new object[,]
                {
                    { 1, new DateTime(2025, 1, 15, 14, 30, 0, 0, DateTimeKind.Unspecified), 6, "Ovo je neka napomena", 1, "Potvrdjena", 3 },
                    { 2, new DateTime(2025, 2, 10, 9, 15, 0, 0, DateTimeKind.Unspecified), 3, "Rezervacija za sastanak", 2, "Na_cekanju", 2 },
                    { 3, new DateTime(2025, 3, 5, 16, 45, 0, 0, DateTimeKind.Unspecified), 8, "Rad na projektu", 3, "Potvrdjena", 4 },
                    { 4, new DateTime(2025, 4, 20, 11, 0, 0, 0, DateTimeKind.Unspecified), 5, "Prezentacija klijentu", 1, "Otkazana", 1 }
                });

            migrationBuilder.InsertData(
                table: "ToDo4924s",
                columns: new[] { "ToDo4924Id", "KorisnikId", "KrajnjiRok", "NazivAktivnosti", "OpisAktivnosti", "StatusAktivnosti" },
                values: new object[,]
                {
                    { 1, 4, new DateTime(2025, 6, 10, 0, 0, 0, 0, DateTimeKind.Unspecified), "Neka aktivnost", "Opis neke aktivnosti", "U_Toku" },
                    { 2, 5, new DateTime(2023, 12, 25, 0, 0, 0, 0, DateTimeKind.Unspecified), "Neka aktivnost dva", "Opis neke aktivnosti dva", "Istekla" },
                    { 3, 6, new DateTime(2023, 11, 5, 0, 0, 0, 0, DateTimeKind.Unspecified), "Neka aktivnost tri", "Opis neke aktivnosti tri", "Realizovana" }
                });

            migrationBuilder.CreateIndex(
                name: "IX_FITPasos_KorisnikId",
                table: "FITPasos",
                column: "KorisnikId");

            migrationBuilder.CreateIndex(
                name: "IX_Korisniks_UlogaId",
                table: "Korisniks",
                column: "UlogaId");

            migrationBuilder.CreateIndex(
                name: "IX_MoodTrackers_KorisnikId",
                table: "MoodTrackers",
                column: "KorisnikId");

            migrationBuilder.CreateIndex(
                name: "IX_RezervacijaProstora20022025s_KorisnikId",
                table: "RezervacijaProstora20022025s",
                column: "KorisnikId");

            migrationBuilder.CreateIndex(
                name: "IX_RezervacijaProstora20022025s_RadniProstorId",
                table: "RezervacijaProstora20022025s",
                column: "RadniProstorId");

            migrationBuilder.CreateIndex(
                name: "IX_ToDo4924s_KorisnikId",
                table: "ToDo4924s",
                column: "KorisnikId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "FITPasos");

            migrationBuilder.DropTable(
                name: "MoodTrackers");

            migrationBuilder.DropTable(
                name: "RezervacijaProstora20022025s");

            migrationBuilder.DropTable(
                name: "ToDo4924s");

            migrationBuilder.DropTable(
                name: "RadniProstors");

            migrationBuilder.DropTable(
                name: "Korisniks");

            migrationBuilder.DropTable(
                name: "Ulogas");
        }
    }
}
