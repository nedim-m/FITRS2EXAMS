using exam.Model.RezervacijaProstora20022025;
using exam.Services.IServices;
using Microsoft.AspNetCore.Mvc;

namespace exam.Controllers
{
    public class RezervacijaProstora20022025Controller : BaseCRUDController<RezervacijaProstora20022025, RezervacijaProstora20022025SearchRequest, RezervacijaProstora20022025InsertRequest, RezervacijaProstora20022025InsertRequest>
    {

        protected new readonly IRezervacijaProstora20022025Service _service;
        public RezervacijaProstora20022025Controller(ILogger<BaseController<RezervacijaProstora20022025, RezervacijaProstora20022025SearchRequest>> logger, IRezervacijaProstora20022025Service service) : base(logger, service)
        {
            _service=service;
        }



        [HttpGet("BrojRezervacija")]
        public async Task<IActionResult> GetBrojRezervacija()
        {
            var stats = await _service.BrojRezervacija();
            return Ok(stats);
        }
    }
}
