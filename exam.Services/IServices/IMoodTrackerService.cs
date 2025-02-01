
using exam.Model.MoodTracker;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
namespace exam.Services.IServices
{
    public interface IMoodTrackerService : ICRUDService<MoodTracker, MoodTrackerSearchRequest, MoodTrackerInsertRequest, MoodTrackerInsertRequest>
    {

        public Task<List<MoodTrackerStats>> BrojPonavljanja();
    }
}
