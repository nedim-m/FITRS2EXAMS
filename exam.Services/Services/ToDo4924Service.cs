using AutoMapper;
using exam.Model.ToDo4924;
using exam.Services.IServices;

using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace exam.Services.Services
{
    public class ToDo4924Service : BaseCRUDService<ToDo4924, Database.ToDo4924, ToDo4924SearchObject, ToDo4924InsertRequest, ToDo4924InsertRequest>, IToDo4924Service
    {
        public ToDo4924Service(Database.ExamContext context, IMapper mapper) : base(context, mapper)
        {
        }

        public override IQueryable<Database.ToDo4924> AddInclude(IQueryable<Database.ToDo4924> query, ToDo4924SearchObject? search = null)
        {
            query=query.Include("Korisnik");

            return base.AddInclude(query, search);
        }

        public override IQueryable<Database.ToDo4924> AddFilter(IQueryable<Database.ToDo4924> query, ToDo4924SearchObject? search = null)
        {
            if(search?.KorisnikId !=null)
            {
                query=query.Where(x=>x.KorisnikId==search.KorisnikId);
            }
            if (search?.PretragaDatum!=null)
            {
                query=query.Where(x => x.KrajnjiRok< search.PretragaDatum.Value.Date);
            }

            if(search?.PretragaStatusAktivnosti != null)
            {
                query=query.Where(x => x.StatusAktivnosti.Equals(search.PretragaStatusAktivnosti.ToString()));
            }

            return base.AddFilter(query, search);
        }

    }
}
