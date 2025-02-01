using AutoMapper;
using exam.Model.FITpasos;
using exam.Model.Korisnik;
using exam.Model.MoodTracker;
using exam.Model.ToDo4924;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace exam.Services.Services
{
    public class MappingProfile : Profile
    {
        public MappingProfile() 
        {



            CreateMap<Database.Korisnik, Korisnik>()
    .ForMember(dest => dest.Uloga, opt => opt.MapFrom(src => src.Uloga.Naziv));
   
   


           
            CreateMap<KorisnikInsertRequest, Database.Korisnik>();
            CreateMap<KorisnikUpdateRequest, Database.Korisnik>()
                .ForAllMembers(opts => opts.Condition((src, dest, srcMember) => srcMember != null));

          
           


            CreateMap<Database.FITPasos, FITPasos>()
               .ForMember(dest => dest.Ime, opt => opt.MapFrom(src => src.Korisnik.Ime)).ForMember(dest => dest.Prezime, opt => opt.MapFrom(src => src.Korisnik.Prezime));
            CreateMap<FITPasosInsertRequest, Database.FITPasos>();


            CreateMap<Database.ToDo4924, ToDo4924>()
               .ForMember(dest => dest.Ime, opt => opt.MapFrom(src => src.Korisnik.Ime)).ForMember(dest => dest.Prezime, opt => opt.MapFrom(src => src.Korisnik.Prezime));
            CreateMap<ToDo4924InsertRequest, Database.ToDo4924>();



            CreateMap<Database.MoodTracker, MoodTracker>()
                .ForMember(dest => dest.Ime, opt => opt.MapFrom(src => src.Korisnik.Ime)).ForMember(dest => dest.Prezime, opt => opt.MapFrom(src => src.Korisnik.Prezime));
            CreateMap<MoodTrackerInsertRequest, Database.MoodTracker>().ForMember(dest=>dest.VrijednostRaspolozenja,opt=>opt.MapFrom(src=>src.VrijednostRaspolozenja.ToString()));




        }
    }
}
