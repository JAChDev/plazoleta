using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace UsersService.Domain.Entities
{
    public class JwtSettings
    {
        public string SecretKey { get; set; }
        public TimeSpan TokenLifetime { get; set; }
    }
}
