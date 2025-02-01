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
            /* za pasos sa dva datuma
 
 
            if (search?.FirstNameLastName != null)
            {
                query = query.Where(x => x.User.FirstName.Contains(search.FirstNameLastName) || x.User.LastName.Contains(search.FirstNameLastName));
            }

            if (search?.DateFrom != null && search?.DateTo != null)
            {
                query = query.Where(x => x.IssueDate >= search.DateFrom.Value.Date && x.IssueDate.Date <= search.DateTo.Value.Date);
            }
            else if (search?.DateFrom != null)
            {
                query = query.Where(x => x.IssueDate.Date >= search.DateFrom.Value.Date);
            }
            else if (search?.DateTo != null)
            {
                query = query.Where(x => x.IssueDate.Date <= search.DateTo.Value.Date);
            }


 
 
 */



            if (search?.ImePrezime != null)
            {
                string searchTerm = search.ImePrezime;
                query = query.Where(x => x.Korisnik.Ime.Contains(searchTerm) || x.Korisnik.Prezime.Contains(searchTerm));
            }
            if (search?.Datum!=null)
            {
                query=query.Where(x => x.DatumVazenja.Date==search.Datum.Value.Date);
            }

            return base.AddFilter(query, search);
        }
    }
}
