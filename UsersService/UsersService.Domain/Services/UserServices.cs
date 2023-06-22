using AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using UsersService.Domain.DTO;
using UsersService.Domain.Entities;
using UsersService.Domain.Interfaces;
using UsersService.Domain.Responses;

namespace UsersService.Domain.Services
{
    public class UserServices : IUserServices
    {
        private readonly IMySQLRepository _mysqlRepository;
        private readonly IMapper _mapper;
        public UserServices(IMySQLRepository mysqlRepository, IMapper mapper)
        {
            _mysqlRepository = mysqlRepository;
            _mapper = mapper;
        }
        public GeneralResponse CreateAccount(Users user, int role)
        {
            try
            {
                UserDTO userDTO = _mapper.Map<UserDTO>(user);
                userDTO.id_rol = role;
                DbResponse createUser = _mysqlRepository.CreateUser(userDTO);
                if (createUser.Success == true) 
                {
                    return new GeneralResponse { StatusCode = HttpStatusCode.OK, Description = "Usuario creado" };
                }
                else 
                {
                    return new GeneralResponse { StatusCode = HttpStatusCode.BadRequest, Description = $"Error creando usuario, error : {createUser.Message}" }; 
                }
            }
            catch (Exception ex)
            {
                return new GeneralResponse { StatusCode = HttpStatusCode.BadRequest, Description = ex.Message };
            }
        }
    }
}
