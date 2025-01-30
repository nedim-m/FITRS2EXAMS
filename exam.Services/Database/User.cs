using System;
using System.Collections.Generic;

namespace exam.Service.Database;

public partial class User
{
    public int Id { get; set; }
    public string FirstName { get; set; } = null!;
    public string LastName { get; set; } = null!;
    public string Email { get; set; } = null!;
    public string PasswordHash { get; set; } = null!;
    public string PasswordSalt { get; set; } = null!;
    public string UserName { get; set; } = null!;
    public string? Phone { get; set; }



    public int RoleId { get; set; }
    public virtual Role Role { get; set; } = null!;

}
