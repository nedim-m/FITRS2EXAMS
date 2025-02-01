
using exam.Model.Korisnik;
using exam.Services.IServices;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace exam.Controllers
{
    [ApiController]
    public class KorisnikController : BaseCRUDController<Korisnik, KorisnikSearchObject, KorisnikInsertRequest, KorisnikUpdateRequest>
    {
        private  readonly new IKorisnikService _service;

        public KorisnikController(ILogger<BaseController<Korisnik, KorisnikSearchObject>> logger, IKorisnikService service)
            : base(logger, service)
        {
            _service = service;
        }

       

     

        [HttpPost("login")]
        [AllowAnonymous]
        public virtual  async Task<Korisnik> Login(string username, string password)
        {
            return  await _service.Login(username,password);
        }
    }
}
