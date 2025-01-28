using AutoMapper;
using Azure.Core;
using exam.Model.User;
using exam.Models.User;
using exam.Models.UserPostRequest;
using exam.Service.IServices;
using exam.Service.Services;
using exam.Services.Database;

using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;

using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

using static Microsoft.EntityFrameworkCore.DbLoggerCategory;

namespace exam.Service.Services
{
    public class UserService : CrudService<exam.Models.User.User, exam.Service.Database.User, UserSearchObj, UserPostRequest, UserUpdateRequest>, IUserService
    {
        public UserService(IMapper mapper, ExamContext context) : base(mapper, context)
        {
        }

        public override async Task BeforeInsert(Database.User entity, UserPostRequest insert)
        {
            entity.PasswordSalt = GenerateSalt();
            entity.PasswordHash = GenerateHash(entity.PasswordSalt, insert.Password);
            entity.RoleId=3;
        }
        public override IQueryable<Database.User> AddInclude(IQueryable<Database.User> query, UserSearchObj? search = null)
        {
            query=query.Include("Role");
            return base.AddInclude(query, search);
        }


        public async Task<User> Login(string username, string password)
        {
            var entity = await _context.Users.Include(x => x.Role).FirstOrDefaultAsync(x => x.UserName == username);


            if (entity != null)
            {
                var hash = GenerateHash(entity.PasswordSalt, password);

                if (hash == entity.PasswordHash)
                {
                    return _mapper.Map<User>(entity); ;
                }
            }

            return null;
        }


        public static string GenerateSalt()
        {
            RNGCryptoServiceProvider provider = new RNGCryptoServiceProvider();
            var byteArray = new byte[16];
            provider.GetBytes(byteArray);

            return Convert.ToBase64String(byteArray);
        }

        public static string GenerateHash(string salt, string password)
        {
            byte[] src = Convert.FromBase64String(salt);
            byte[] bytes = Encoding.Unicode.GetBytes(password);
            byte[] dst = new byte[src.Length + bytes.Length];

            System.Buffer.BlockCopy(src, 0, dst, 0, src.Length);
            System.Buffer.BlockCopy(bytes, 0, dst, src.Length, bytes.Length);

            HashAlgorithm algorithm = HashAlgorithm.Create("SHA1");
            byte[] inArray = algorithm.ComputeHash(dst);
            return Convert.ToBase64String(inArray);
        }

       
    }
}
