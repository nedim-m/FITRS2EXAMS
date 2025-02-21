using exam.Model;
using exam.Model.RadniProstor;

using exam.Services.IServices;


namespace exam.Controllers
{
    public class RadniProstorController : BaseController<RadniProstor, BaseSearchObject>
    {
        public RadniProstorController(ILogger<BaseController<RadniProstor, BaseSearchObject>> logger, IRadniProstorService service) : base(logger, service)
        {
        }
    }
}
