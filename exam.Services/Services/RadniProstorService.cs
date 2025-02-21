using AutoMapper;
using exam.Model;
using exam.Model.RadniProstor;
using exam.Services.IServices;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace exam.Services.Services
{
    public class RadniProstorService : BaseService<RadniProstor, Database.RadniProstor,  BaseSearchObject>, IRadniProstorService
    {
        public RadniProstorService(Database.ExamContext context, IMapper mapper) : base(context, mapper)
        {
        }

       
    }
}
