
using exam.Model.Status;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace exam.Model.ToDo4924
{
    public class ToDo4924SearchObject:BaseSearchObject
    {
        public int? KorisnikId { get; set; }

        public DateTime? PretragaDatum{ get; set; }

        public StatusAktivnosti? PretragaStatusAktivnosti { get; set; }



    }
}
