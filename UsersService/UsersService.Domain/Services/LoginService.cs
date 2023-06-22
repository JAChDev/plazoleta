using AutoMapper;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UsersService.Domain.Entities;
using UsersService.Domain.Interfaces;
using UsersService.Domain.Responses;

namespace UsersService.Domain.Services
{
    public class LoginService : ILoginService
    {
        private readonly IJwtService _jwtService;
        private readonly IMySQLRepository _mysqlRepository;
        private readonly IMapper _mapper;
        public LoginService(IJwtService jwtService, IMySQLRepository mySQLRepository, IMapper mapper)
        {
            _jwtService = jwtService;
            _mysqlRepository = mySQLRepository;
            _mapper = mapper;
        }

        public LoginResponse Login(Login login)
        {
            Users user = _mapper.Map<Users>(_mysqlRepository.GetUserByEmail(login.email));
            if(user != null)
            {
                if(user.CheckPassword(login.password)) 
                {
                    string token = _jwtService.GetToken(user.Correo);
                    LoginResponse loginResponse = new LoginResponse
                    {
                        Token = token,
                        ExpireTime = TimeSpan.FromMinutes(120),
                        Role = user.id_rol,
                        IsAuthenticated = true
                    };
                    return loginResponse;
                }
                else
                {
                    return new LoginResponse { IsAuthenticated = false };
                }
            }
            else
            {
                return new LoginResponse { IsAuthenticated = false};
            }
        }
    }
}
