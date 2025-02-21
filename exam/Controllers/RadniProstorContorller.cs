using exam.Model;
using exam.Model.RadniProstor;
using exam.Services.IServices;

namespace exam.Controllers
{
    public class RadniProstorContorller : BaseController<RadniProstor, BaseSearchObject>
    {
        public RadniProstorContorller(ILogger<BaseController<RadniProstor, BaseSearchObject>> logger, IRadniProstorService service) : base(logger, service)
        {
        }
    }
}
