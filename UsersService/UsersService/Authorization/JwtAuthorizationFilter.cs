using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using UsersService.Domain.Interfaces;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;

namespace UsersService.WebApi.Authorization
{
    public class JwtAuthorizationFilter:IAuthorizationFilter
    {
        public void OnAuthorization(AuthorizationFilterContext context)
        {
            var authService = context.HttpContext.RequestServices.GetRequiredService<IAuthService>();

            // Obtener el token de la cabecera de autorización
            var token = context.HttpContext.Request.Headers["Authorization"].FirstOrDefault()?.Split(" ").Last();

            if (!string.IsNullOrEmpty(token))
            {
                try
                {
                    // Validar y decodificar el token JWT
                    var tokenHandler = new JwtSecurityTokenHandler();
                    var tokenValidationParameters = authService.GetTokenValidationParameters();
                    ClaimsPrincipal principal = tokenHandler.ValidateToken(token, tokenValidationParameters, out _);

                    // Establecer el principal de seguridad en el contexto
                    context.HttpContext.User = principal;
                    
                    
                }
                catch (Exception)
                {
                    context.Result = new UnauthorizedResult();
                }
            }
            else
            {
                context.Result = new UnauthorizedResult();
            }
        }
    }
}
