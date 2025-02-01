using exam.Model.FITpasos;

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace exam.Services.IServices
{
    public interface IFITPasosService:ICRUDService<FITPasos,FITPasosSearchRequest,FITPasosInsertRequest,FITPasosInsertRequest>
    {
    }
}
