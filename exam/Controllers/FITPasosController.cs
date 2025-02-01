
using exam.Model.FITpasos;
using exam.Services.IServices;
using Microsoft.AspNetCore.Mvc;

namespace exam.Controllers
{
    [ApiController]
    public class FITPasosController : BaseCRUDController<FITPasos, FITPasosSearchRequest, FITPasosInsertRequest, FITPasosInsertRequest>
    {
        public FITPasosController(ILogger<BaseController<FITPasos, FITPasosSearchRequest>> logger, IFITPasosService service) : base(logger, service)
        {
        }
    }
}
