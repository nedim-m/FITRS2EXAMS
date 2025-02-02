using AutoMapper;
using exam.Model.FITpasos;
using exam.Services.IServices;

using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace exam.Services.Services
{
    public class FITPasosService : BaseCRUDService<FITPasos, Database.FITPasos, FITPasosSearchRequest, FITPasosInsertRequest, FITPasosInsertRequest>, IFITPasosService
    {
        public FITPasosService(Database.ExamContext context, IMapper mapper) : base(context, mapper)
        {
        }

        public override IQueryable<Database.FITPasos> AddInclude(IQueryable<Database.FITPasos> query, FITPasosSearchRequest? search = null)
        {
            query=query.Include("Korisnik");
            return base.AddInclude(query, search);
        }

        public override IQueryable<Database.FITPasos> AddFilter(IQueryable<Database.FITPasos> query, FITPasosSearchRequest? search = null)
        {
   



            if (search?.ImePrezime != null)
            {
                string searchTerm = search.ImePrezime;
                query = query.Where(x => x.Korisnik.Ime.Contains(searchTerm) || x.Korisnik.Prezime.Contains(searchTerm));
            }
            if (search?.Datum!=null)
            {
                query=query.Where(x => x.DatumVazenja.Date==search.Datum.Value.Date);
            }


            if (search?.DatumOd != null && search?.DatumDo != null)
            {
                query = query.Where(x => x.DatumVazenja >= search.DatumOd.Value.Date && x.DatumVazenja.Date <= search.DatumDo.Value.Date);
            }
            else if (search?.DatumOd != null)
            {
                query = query.Where(x => x.DatumVazenja.Date >= search.DatumOd.Value.Date);
            }
            else if (search?.DatumDo != null)
            {
                query = query.Where(x => x.DatumVazenja.Date <= search.DatumDo.Value.Date);
            }



            return base.AddFilter(query, search);
        }
    }
}
