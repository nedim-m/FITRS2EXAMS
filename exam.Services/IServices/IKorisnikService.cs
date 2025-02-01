
using exam.Model.Korisnik;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace exam.Services.IServices
{
    public interface IKorisnikService : ICRUDService<Korisnik, KorisnikSearchObject, KorisnikInsertRequest, KorisnikUpdateRequest>
    {
        public Task<Korisnik> Login(string username, string password);
    }
}
