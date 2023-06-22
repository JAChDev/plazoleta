using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using PlazoletaService.Domain.Interfaces;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;

namespace PlazoletaService.Domain.Servicios
{
    
    public class AuthService : IAuthService
    {
        private readonly IConfiguration _config;
        public AuthService(IConfiguration config) 
        {
            _config = config;
        }
        public Task<IEnumerable<string>> GetRoles(string Id)
        {
            throw new NotImplementedException();
        }

        public TokenValidationParameters GetTokenValidationParameters()
        {
            byte[] secretKeyBytes = Encoding.UTF8.GetBytes(_config.GetSection("Token").Value);
            var validationParameters = new TokenValidationParameters
            {
                ValidateIssuerSigningKey = true,
                IssuerSigningKey = new SymmetricSecurityKey(secretKeyBytes),
                ValidateIssuer = false,
                ValidateAudience = false,
                ValidateLifetime = false
            };
            return validationParameters;
        }

        public Task<bool> ValidateToken(string token)
        {
            try
            {
                var tokenHandler = new JwtSecurityTokenHandler();
                byte[] secretKeyBytes = Encoding.UTF8.GetBytes(_config.GetSection("Token").Value);
                var validationParameters = new TokenValidationParameters
                {
                    ValidateIssuerSigningKey = true,
                    IssuerSigningKey = new SymmetricSecurityKey(secretKeyBytes),
                    ValidateIssuer = false,
                    ValidateAudience = false,
                    ValidateLifetime = false
                };
                var principal = tokenHandler.ValidateToken(token, validationParameters, out _);
                if (principal.Identity is not ClaimsIdentity identity || !identity.IsAuthenticated)
                    return Task.FromResult(false);

                // Verificar cualquier otra validación adicional que necesites
                // Puede ser verificar roles, permisos, fechas de expiración, etc.

                return Task.FromResult(true);
            }
            catch (Exception)
            {
                return Task.FromResult(false);
            }
        }
    }
}
