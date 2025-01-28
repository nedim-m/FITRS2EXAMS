using AutoMapper;

using exam.Models.UserPostRequest;
using exam.Service.Database;

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace exam.Services.Services
{
    public class MappingProfile:Profile
    {

        public MappingProfile()
        {
            CreateMap<User, Models.User.User>().ForMember(dest => dest.Role, opt => opt.MapFrom(src => src.Role.Name));
            CreateMap<UserPostRequest, User>();
            CreateMap<Models.User.UserUpdateRequest, User>();
        }

    }
}
