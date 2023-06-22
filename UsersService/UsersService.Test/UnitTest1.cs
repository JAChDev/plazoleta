using Xunit;
using Moq;
using UsersService.WebApi.Controllers;
using UsersService.WebApi.Models;
using Microsoft.AspNetCore.Mvc;
using System.Net;
using System;
using UsersService.Domain.Entities;
using UsersService.Domain.Interfaces;
using UsersService.Domain.Responses;

namespace UsersService.Tests.Unit
{
    public class UserControllerTests
    {
        [Fact]
        public void CreateOwner_ReturnsOkResult_WhenUserServiceReturnsOk()
        {
            // Arrange
            var mockUserService = new Mock<IUserServices>();
            var user = new UserModel
            {
                Nombre = "John",
                Apellido = "Doe",
                Correo = "john.doe@example.com",
                Id = 1,
                Clave = "password",
                Celular = "123456789"
            };

            var expectedResponse = new GeneralResponse
            {
                StatusCode = HttpStatusCode.OK,
                Description = "Usuario creado"
            };

            mockUserService.Setup(service => service.CreateAccount(It.IsAny<Users>(), 1))
                .Returns(expectedResponse);

            var controller = new UserController(mockUserService.Object);

            // Act
            var result = controller.createOwner(user);

            // Assert
            Assert.IsType<OkObjectResult>(result);
            var okResult = (OkObjectResult)result;
            var response = (GeneralResponse)okResult.Value;
            Assert.Equal(expectedResponse, response);
        }

        [Fact]
        public void CreateOwner_ReturnsBadRequest_WhenUserServiceReturnsBadRequest()
        {
            // Arrange
            var mockUserService = new Mock<IUserServices>();
            var user = new UserModel
            {
                Nombre = "John",
                Apellido = "Doe",
                Correo = "john.doe@example.com",
                Id = 1,
                Clave = "password",
                Celular = "123456789"
            };

            var expectedResponse = new GeneralResponse
            {
                StatusCode = HttpStatusCode.BadRequest,
                Description = "Error creando usuario, error: Some error message"
            };

            mockUserService.Setup(service => service.CreateAccount(It.IsAny<Users>(), 1))
                .Returns(expectedResponse);

            var controller = new UserController(mockUserService.Object);

            // Act
            var result = controller.createOwner(user);

            // Assert
            Assert.IsType<BadRequestObjectResult>(result);
            var badRequestResult = (BadRequestObjectResult)result;
            var response = (GeneralResponse)badRequestResult.Value;
            Assert.Equal(expectedResponse, response);
        }

        [Fact]
        public void CreateEmployee_ReturnsOkResult_WhenUserServiceReturnsOk()
        {
            // Arrange
            var mockUserService = new Mock<IUserServices>();
            var user = new UserModel
            {
                Nombre = "Jane",
                Apellido = "Doe",
                Correo = "jane.doe@example.com",
                Id = 2,
                Clave = "password",
                Celular = "987654321"
            };

            var expectedResponse = new GeneralResponse
            {
                StatusCode = HttpStatusCode.OK,
                Description = "Usuario creado"
            };

            mockUserService.Setup(service => service.CreateAccount(It.IsAny<Users>(), 2))
                .Returns(expectedResponse);

            var controller = new UserController(mockUserService.Object);

            // Act
            var result = controller.createEmployee(user);

            // Assert
            Assert.IsType<OkObjectResult>(result);
            var okResult = (OkObjectResult)result;
            var response = (GeneralResponse)okResult.Value;
            Assert.Equal(expectedResponse, response);
        }

        [Fact]
        public void CreateEmployee_ReturnsBadRequest_WhenUserServiceReturnsBadRequest()
        {
            // Arrange
            var mockUserService = new Mock<IUserServices>();
            var user = new UserModel
            {
                Nombre = "Jane",
                Apellido = "Doe",
                Correo = "jane.doe@example.com",
                Id = 2,
                Clave = "password",
                Celular = "987654321"
            };

            var expectedResponse = new GeneralResponse
            {
                StatusCode = HttpStatusCode.BadRequest,
                Description = "Error creando usuario, error: Some error message"
            };

            mockUserService.Setup(service => service.CreateAccount(It.IsAny<Users>(), 2))
                .Returns(expectedResponse);

            var controller = new UserController(mockUserService.Object);

            // Act
            var result = controller.createEmployee(user);

            // Assert
            Assert.IsType<BadRequestObjectResult>(result);
            var badRequestResult = (BadRequestObjectResult)result;
            var response = (GeneralResponse)badRequestResult.Value;
            Assert.Equal(expectedResponse, response);
        }

        [Fact]
        public void CreateClient_ReturnsOkResult_WhenUserServiceReturnsOk()
        {
            // Arrange
            var mockUserService = new Mock<IUserServices>();
            var user = new UserModel
            {
                Nombre = "Alice",
                Apellido = "Smith",
                Correo = "alice.smith@example.com",
                Id = 3,
                Clave = "password",
                Celular = "555555555"
            };

            var expectedResponse = new GeneralResponse
            {
                StatusCode = HttpStatusCode.OK,
                Description = "Usuario creado"
            };

            mockUserService.Setup(service => service.CreateAccount(It.IsAny<Users>(), 3))
                .Returns(expectedResponse);

            var controller = new UserController(mockUserService.Object);

            // Act
            var result = controller.createClient(user);

            // Assert
            Assert.IsType<OkObjectResult>(result);
            var okResult = (OkObjectResult)result;
            var response = (GeneralResponse)okResult.Value;
            Assert.Equal(expectedResponse, response);
        }

        [Fact]
        public void CreateClient_ReturnsBadRequest_WhenUserServiceReturnsBadRequest()
        {
            // Arrange
            var mockUserService = new Mock<IUserServices>();
            var user = new UserModel
            {
                Nombre = "Alice",
                Apellido = "Smith",
                Correo = "alice.smith@example.com",
                Id = 3,
                Clave = "password",
                Celular = "555555555"
            };

            var expectedResponse = new GeneralResponse
            {
                StatusCode = HttpStatusCode.BadRequest,
                Description = "Error creando usuario, error: Some error message"
            };

            mockUserService.Setup(service => service.CreateAccount(It.IsAny<Users>(), 3))
                .Returns(expectedResponse);

            var controller = new UserController(mockUserService.Object);

            // Act
            var result = controller.createClient(user);

            // Assert
            Assert.IsType<BadRequestObjectResult>(result);
            var badRequestResult = (BadRequestObjectResult)result;
            var response = (GeneralResponse)badRequestResult.Value;
            Assert.Equal(expectedResponse, response);
        }

        [Fact]
        public void HealtCheck_ReturnsOkResult()
        {
            // Arrange
            var controller = new UserController(Mock.Of<IUserServices>());

            // Act
            var result = controller.HealtCheck();

            // Assert
            Assert.IsType<OkResult>(result);
        }
    }
}
