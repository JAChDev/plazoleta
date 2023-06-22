using AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UsersService.Domain.DTO;
using UsersService.Domain.Entities;

namespace UsersService.Domain
{
    public class MappingProfile:Profile
    {
        public MappingProfile() {
            CreateMap<Users, UserDTO>();
            CreateMap<UserDTO, Users>();
        }
    }
}
