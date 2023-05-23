using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UsersService.Domain.Entities;
using UsersService.Domain.Responses;

namespace UsersService.Domain.Interfaces
{
    public interface ILoginService
    {
        public LoginResponse Login(Login login);
    }
}
