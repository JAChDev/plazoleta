using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IdentityModel.Tokens.Jwt;
using UsersService.Domain.Interfaces;
using UsersService.Domain.Entities;
using Microsoft.IdentityModel.Tokens;
using System.Security.Claims;
using AutoMapper;
using UsersService.Domain.DTO;

namespace UsersService.Domain.Services
{
    public class JwtService : IJwtService
    {
        private readonly IConfiguration _configuration;
        private readonly IMySQLRepository _mysqlRepository;
        public JwtService(IConfiguration configuration, IMySQLRepository mySQLRepository)
        {
            _configuration = configuration;
            _mysqlRepository = mySQLRepository;
        }

        public string GetToken(string email)
        {
            try
            {
                JwtSettings jwtSettings = new JwtSettings
                {
                    SecretKey = _configuration.GetSection("Token").Value,
                    TokenLifetime = TimeSpan.FromMinutes(120),
                };
                var token = GenerateJwtToken(email, jwtSettings);
                return token;
            }
            catch
            {
                return null;
            }
        }

        private string GenerateJwtToken(string email, JwtSettings jwtSettings) 
        {
            UserDTO userRol = _mysqlRepository.GetUserByEmail(email);
            var tokenHandler = new JwtSecurityTokenHandler();
            var key = Encoding.ASCII.GetBytes(jwtSettings.SecretKey);
            var tokenDescriptor = new SecurityTokenDescriptor
            {
                Subject = new ClaimsIdentity(new[]
                {
                    new Claim(ClaimTypes.Name, userRol.Id.ToString()),
                    new Claim(ClaimTypes.Role, userRol.id_rol.ToString())
                }),
                Expires = DateTime.UtcNow.Add(jwtSettings.TokenLifetime),
                SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(key), SecurityAlgorithms.HmacSha256Signature)
            };
            var token = tokenHandler.CreateToken(tokenDescriptor);
            return tokenHandler.WriteToken(token);
        }
        
    }
}
