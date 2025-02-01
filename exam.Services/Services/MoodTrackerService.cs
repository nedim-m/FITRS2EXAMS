using AutoMapper;
using exam.Model.MoodTracker;
using exam.Services.IServices;

using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
namespace exam.Services.Services
{
    public class MoodTrackerService : BaseCRUDService<MoodTracker, Database.MoodTracker, MoodTrackerSearchRequest, MoodTrackerInsertRequest, MoodTrackerInsertRequest>, IMoodTrackerService
    {
        public MoodTrackerService(Database.ExamContext context, IMapper mapper) : base(context, mapper)
        {
        }


        public override IQueryable<Database.MoodTracker> AddInclude(IQueryable<Database.MoodTracker> query, MoodTrackerSearchRequest? search = null)
        {

            query=query.Include("Korisnik");
            return base.AddInclude(query, search);
        }


        public override IQueryable<Database.MoodTracker> AddFilter(IQueryable<Database.MoodTracker> query, MoodTrackerSearchRequest? search = null)
        {

            if (search?.KorisnikId !=null)
            {
                query=query.Where(x => x.KorisnikId==search.KorisnikId);
            }

            if (search?.PretragaDatum!=null)
            {
                query=query.Where(x => x.DatumEvidencije.Date== search.PretragaDatum.Value.Date);
            }


            if (search?.PretragaVrijednostRaspolozenja != null)
            {
                query=query.Where(x => x.VrijednostRaspolozenja.Equals(search.PretragaVrijednostRaspolozenja.ToString()));
            }






            return base.AddFilter(query, search);
        }

        public override async Task BeforeInsert(Database.MoodTracker entity, MoodTrackerInsertRequest insert)
        {

            var brojPostojecihZapisa = await _context.MoodTrackers
        .Where(x => x.KorisnikId == insert.KorisnikId &&
                    x.DatumEvidencije.Date == insert.DatumEvidencije.Date)
        .CountAsync();


            if (brojPostojecihZapisa >= 2)
            {
                throw new Exception("Korisnik već ima unijeta dva raspoloženja za ovaj dan. Nije moguće dodati više od toga.");
            }

            await base.BeforeInsert(entity, insert);
        }

        public async Task<List<MoodTrackerStats>> BrojPonavljanja()
        {
            var groupedData = await _context.MoodTrackers
       .GroupBy(x => new { x.VrijednostRaspolozenja })
       .Select(g => new MoodTrackerStats
       {
           VrijednostRaspolozenja = g.Key.VrijednostRaspolozenja,

           BrojPojavljivanja = g.Count()
       })
       .ToListAsync();

            return groupedData;
        }
    }
}
