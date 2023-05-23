using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace UsersService.Domain.Responses
{
    public class LoginResponse
    {
        public string Token { get; set; }
        public TimeSpan ExpireTime { get; set; }
        public int Role { get; set; }
        public bool IsAuthenticated { get; set; }
    }
}
