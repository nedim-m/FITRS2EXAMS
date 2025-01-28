using exam.Model.User;
using exam.Models.User;
using exam.Models.UserPostRequest;
using exam.Service.IServices;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace exam.Controllers
{
    public class UserController : CrudController<User, UserSearchObj, UserPostRequest, UserUpdateRequest>
    {
        private readonly IUserService _userService; 
        public UserController(ILogger<BaseController<User, UserSearchObj>> logger, IUserService service) : base(logger, service)
        {
            _userService=service;
        }


        [HttpPost("login")]
        [AllowAnonymous]
        public virtual async Task<User> Login(string username, string password)
        {
            return await _userService.Login(username, password);
        }
    }
}
