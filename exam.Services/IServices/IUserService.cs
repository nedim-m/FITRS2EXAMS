using exam.Model.User;
using exam.Models.User;
using exam.Models.UserPostRequest;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace exam.Service.IServices
{
    public interface IUserService : ICrudService<User, UserSearchObj, UserPostRequest, UserUpdateRequest>
    {

        public Task<User> Login(string username, string password);

    }
}
