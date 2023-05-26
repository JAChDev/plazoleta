using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using PlazoletaService.Domain.Interfaces;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;

namespace PlazoletaService.WebApi.Authorization
{
    public class JwtAuthorizationFilter:IAuthorizationFilter
    {
        private readonly string _role;
        public JwtAuthorizationFilter(string role)
        {
            _role = role;
        }
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

                    //roles
                    var roles = principal.FindAll(ClaimTypes.Role).Select(c => c.Value).ToList();

                    foreach (var role in roles)
                    {
                        if (role == _role) { return; }
                        else { context.Result = new ForbidResult(); }

                    }
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
