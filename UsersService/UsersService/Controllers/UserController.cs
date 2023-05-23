using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using UsersService.Domain.Entities;
using UsersService.Domain.Interfaces;
using UsersService.Domain.Responses;
using UsersService.WebApi.Authorization;
using UsersService.WebApi.Models;

namespace UsersService.WebApi.Controllers
{
    [ApiController]
    [Route("api/user")]
    public class UserController:ControllerBase
    {
        private readonly IUserServices _service;
        public UserController(IUserServices service)
        {
            _service = service;
        }


        [HttpPost("newOwner")]
        public IActionResult createOwner(UserModel user)
        {
            Users users = new Users();
            users.Nombre = user.Nombre;
            users.Apellido = user.Apellido;
            users.Correo = user.Correo;
            users.Id = user.Id;
            users.SetPassword(user.Clave);
            users.Celular = user.Celular;
            GeneralResponse response = _service.CreateAccount(users, 1);

            return response.StatusCode == System.Net.HttpStatusCode.OK ? Ok(response):BadRequest(response);
        }


        [HttpPost("newEmployee")]
        public IActionResult createEmployee(UserModel user)
        {
            Users users = new Users();
            users.Nombre = user.Nombre;
            users.Apellido = user.Apellido;
            users.Correo = user.Correo;
            users.Id = user.Id;
            users.SetPassword(user.Clave);
            users.Celular = user.Celular;
            GeneralResponse response = _service.CreateAccount(users, 2);

            return response.StatusCode == System.Net.HttpStatusCode.OK ? Ok(response) : BadRequest(response);
        }

        [HttpPost("newClient")]
        public IActionResult createClient(UserModel user)
        {
            Users users = new Users();
            users.Nombre = user.Nombre;
            users.Apellido = user.Apellido;
            users.Correo = user.Correo;
            users.Id = user.Id;
            users.SetPassword(user.Clave);
            users.Celular = user.Celular;
            GeneralResponse response = _service.CreateAccount(users, 3);

            return response.StatusCode == System.Net.HttpStatusCode.OK ? Ok(response) : BadRequest(response);
        }
    }
}
