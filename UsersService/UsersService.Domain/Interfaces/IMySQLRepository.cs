using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UsersService.Domain.DTO;
using UsersService.Domain.Responses;

namespace UsersService.Domain.Interfaces
{
    public interface IMySQLRepository
    {
        DbResponse CreateUser(UserDTO userDTO);
        UserDTO GetUserByEmail(string email);
    }
}
