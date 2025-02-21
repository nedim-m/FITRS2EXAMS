using AutoMapper;
using exam.Model.MoodTracker;
using exam.Model.RezervacijaProstora20022025;
using exam.Model.Status;
using exam.Services.IServices;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace exam.Services.Services
{
    public class RezervacijaProstora20022025Service : BaseCRUDService<RezervacijaProstora20022025, Database.RezervacijaProstora20022025, RezervacijaProstora20022025SearchRequest, RezervacijaProstora20022025InsertRequest, RezervacijaProstora20022025InsertRequest>, IRezervacijaProstora20022025Service
    {
        public RezervacijaProstora20022025Service(Database.ExamContext context, IMapper mapper) : base(context, mapper)
        {
        }

        public override IQueryable<Database.RezervacijaProstora20022025> AddInclude(IQueryable<Database.RezervacijaProstora20022025> query, RezervacijaProstora20022025SearchRequest? search = null)
        {
            query=query.Include("Korisnik").Include("RadniProstor");
            return base.AddInclude(query, search);
        }


        public override IQueryable<Database.RezervacijaProstora20022025> AddFilter(IQueryable<Database.RezervacijaProstora20022025> query, RezervacijaProstora20022025SearchRequest? search = null)
        {
            if (search?.KorisnikId !=null)
            {
                query=query.Where(x => x.KorisnikId==search.KorisnikId);
            }

            if (search?.RadniProstorId!=null)
            {
                query=query.Where(x => x.RadniProstorId== search.RadniProstorId);
            }


            if (search?.PretragaStatusRezervacije != null)
            {
                query=query.Where(x => x.StatusRezervacije.Equals(search.PretragaStatusRezervacije.ToString()));
            }


            return base.AddFilter(query, search);
        }

        public override Task BeforeInsert(Database.RezervacijaProstora20022025 entity, RezervacijaProstora20022025InsertRequest insert)
        {
            if (insert?.Trajanje>6)
            {
                entity.StatusRezervacije=StatusRezervacije.Na_cekanju.ToString();
            }
            else
            {
                entity.StatusRezervacije=StatusRezervacije.Potvrdjena.ToString();
            }
            return base.BeforeInsert(entity, insert);
        }

        public async Task<List<RezervacijaProstora20022025Status>> BrojRezervacija()
        {
            var groupedData = await _context.RezervacijaProstora20022025s
       .GroupBy(x => new { x.StatusRezervacije })
       .Select(g => new RezervacijaProstora20022025Status
       {
           StatusRezervacije = g.Key.StatusRezervacije,

           BrojPojavljivanja = g.Count()
       })
       .ToListAsync();

            return groupedData;
        }
    }

}
