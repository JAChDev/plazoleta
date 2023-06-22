using Microsoft.AspNetCore.Authorization;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace UsersService.Domain.Attributes
{
    public class RoleAttribute:Attribute
    {
        public int Role { get; set; }
    }
}
