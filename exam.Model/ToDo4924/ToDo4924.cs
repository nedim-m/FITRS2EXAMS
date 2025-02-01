using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace exam.Model.ToDo4924
{
    public partial class ToDo4924
    {
        public int ToDo4924Id { get; set; }
        public string Ime { get; set; } = string.Empty;
        public string Prezime { get; set; } = string.Empty;
        public string NazivAktivnosti { get; set; } = string.Empty;
        public string OpisAktivnosti { get; set; } = string.Empty;
        public DateTime KrajnjiRok { get; set; }
        public string StatusAktivnosti { get; set; } = string.Empty;
    }
}
