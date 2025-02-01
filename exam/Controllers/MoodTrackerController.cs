
using exam.Model.MoodTracker;
using exam.Services.IServices;
using Microsoft.AspNetCore.Mvc;

namespace exam.Controllers
{
    public class MoodTrackerController : BaseCRUDController<MoodTracker, MoodTrackerSearchRequest, MoodTrackerInsertRequest, MoodTrackerInsertRequest>
    {

        protected new readonly IMoodTrackerService _service;
        public MoodTrackerController(ILogger<BaseController<MoodTracker, MoodTrackerSearchRequest>> logger, IMoodTrackerService service) : base(logger, service)
        {
            _service = service;
        }

        [HttpGet("BrojPonavljanja")]
        public async Task<IActionResult> GetBrojPonavljanja()
        {
            var stats = await _service.BrojPonavljanja();
            return Ok(stats);
        }
    }
}
