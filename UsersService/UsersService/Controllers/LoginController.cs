using Microsoft.AspNetCore.Mvc;
using UsersService.Domain.Entities;
using UsersService.Domain.Interfaces;
using UsersService.Domain.Responses;
using UsersService.WebApi.Models;

namespace UsersService.WebApi.Controllers
{
    [ApiController]
    [Route("api/login")]
    public class LoginController:ControllerBase
    {
        private readonly ILoginService _loginService;
        public LoginController(ILoginService loginService)
        {
            _loginService = loginService;
        }

        [HttpPost]
        public IActionResult Login([FromBody] LoginModel loginModel)
        {
            Login login = new Login { email = loginModel.email, password = loginModel.password };
            LoginResponse response = _loginService.Login(login);
            if(!response.IsAuthenticated) 
            {
                return Unauthorized();
            }
            return Ok(response);
        }
    }
}
