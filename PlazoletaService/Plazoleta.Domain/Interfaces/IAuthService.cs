using Microsoft.IdentityModel.Tokens;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PlazoletaService.Domain.Interfaces
{
    public interface IAuthService
    {
        public Task<bool> ValidateToken(string token);
        public Task<IEnumerable<string>> GetRoles(string Id);
        public TokenValidationParameters GetTokenValidationParameters();
    }
}
