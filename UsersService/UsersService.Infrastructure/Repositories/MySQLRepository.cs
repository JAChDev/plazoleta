using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UsersService.Domain.DTO;
using UsersService.Domain.Interfaces;
using UsersService.Domain.Responses;
using UsersService.Infrastructure.Database;

namespace UsersService.Infrastructure.Repositories
{
    public class MySQLRepository : IMySQLRepository
    {
        private readonly SQLDbContext _dbContext;
        public MySQLRepository(SQLDbContext dbContext)
        {
            _dbContext = dbContext;
        }

        public DbResponse CreateUser(UserDTO userDTO)
        {
            try
            {
                _dbContext.usuarios.Add(userDTO);
                _dbContext.SaveChanges();
                return new DbResponse { Success=true,Message="Inserción realizada"};
            }
            catch(Exception ex)
            {
                return new DbResponse { Success=false,Message=ex.Message};
            }
            
        }

        public UserDTO GetUserByEmail(string email)
        {
            try
            {
                var user = _dbContext.usuarios.FirstOrDefault(x => x.Correo == email);
                return user != null ? user : null;
            }
            catch
            {
                return null;
            }
        }
    }
}
