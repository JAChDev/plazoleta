﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace UsersService.Domain.Interfaces
{
    public interface IJwtService
    {
        public string GetToken(string email);
    }
}
