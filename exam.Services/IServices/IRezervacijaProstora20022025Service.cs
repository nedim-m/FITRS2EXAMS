using exam.Model.MoodTracker;
using exam.Model.RezervacijaProstora20022025;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace exam.Services.IServices
{
    public interface IRezervacijaProstora20022025Service: ICRUDService<RezervacijaProstora20022025,RezervacijaProstora20022025SearchRequest,RezervacijaProstora20022025InsertRequest,RezervacijaProstora20022025InsertRequest>
    {

        public Task<List<RezervacijaProstora20022025Status>> BrojRezervacija();
    }
}
