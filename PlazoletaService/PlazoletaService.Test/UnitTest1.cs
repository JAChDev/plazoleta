using PlazoletaService.Domain.Interfaces;
using PlazoletaService.Domain.Responses;
using PlazoletaService.WebApi.Controllers;
using System.Net;
using Moq;
using PlazoletaService.Domain.Entities;
using PlazoletaService.WebApi.Models;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System.ComponentModel.DataAnnotations;

namespace PlazoletaService.Test
{
    public class UnitTest1
    {

        [Fact]
        public void CrearOrdenOk()
        {
            var mockRestauranService = new Mock<IRestaurantService>();
            OrderModel order = new OrderModel
            {
                Id = 1,
                Id_Cliente = 323232,
                Fecha = DateTime.Now,
                Estado = "Pendiente",
                Id_Chef = 23232,
                id_Restaurante = 3,
            };
            GeneralResponse response = new GeneralResponse { StatusCode = HttpStatusCode.OK, Description = "Pedido creado" };
            mockRestauranService.Setup(service => service.CreateOrder(It.IsAny<Order>())).Returns(response);
            var controller = new PlazoletaController(mockRestauranService.Object);
            var result = controller.CreateOrder(order);
            Assert.IsType<OkObjectResult>(result);
            var okResult = (OkObjectResult)result;
            var final = (GeneralResponse)okResult.Value;
            Assert.Equal(response, final);
        }

        [Fact]
        public void CrearOrdenParametros()
        {
            var mockRestauranService = new Mock<IRestaurantService>();
            var controller = new PlazoletaController(mockRestauranService.Object);

            var method = typeof(PlazoletaController).GetMethod("CreateOrder");
            var parameters = method.GetParameters();

            foreach ( var parameter in parameters )
            {
                var attributes = parameter.GetCustomAttributes(typeof(RequiredAttribute), true);
                Assert.NotNull(attributes);
            }

        }

        //[Fact]
        //public void CrearOrdenParametrosError()
        //{
        //    var mockRestauranService = new Mock<IRestaurantService>();
        //    GeneralResponse response = new GeneralResponse { StatusCode = HttpStatusCode.OK, Description = "Pedido creado" };
        //    mockRestauranService.Setup(service => service.CreateOrder(It.IsAny<Order>())).Returns(response);

        //    var controller = new PlazoletaController(mockRestauranService.Object);
        //    OrderModel order = new OrderModel
        //    {
        //        Id = 1,
        //        Fecha = DateTime.Now,
        //        Estado = null,
        //    };
        //    var result = controller.CreateOrder(order);
        //    Assert.IsType<BadRequestObjectResult>(result);
        //    var badRequestResult = (BadRequestObjectResult)result;
        //}

        [Fact]
        public void CreateOrder_ShouldReturnOkObjectResult()
        {
            // Arrange
            var mockRestaurantService = new Mock<IRestaurantService>();
            var order = new OrderModel
            {
                Id = 1,
                Id_Cliente = 323232,
                Fecha = DateTime.Now,
                Estado = "Pendiente",
                Id_Chef = 23232,
                id_Restaurante = 3
            };
            var response = new GeneralResponse { StatusCode = HttpStatusCode.OK, Description = "Pedido creado" };
            mockRestaurantService.Setup(service => service.CreateOrder(It.IsAny<Order>())).Returns(response);
            var controller = new PlazoletaController(mockRestaurantService.Object);

            // Act
            var result = controller.CreateOrder(order);

            // Assert
            Assert.IsType<OkObjectResult>(result);
            var okResult = (OkObjectResult)result;
            var final = (GeneralResponse)okResult.Value;
            Assert.Equal(response, final);
        }

        [Fact]
        public void CreateOrder_ShouldValidateRequiredParameters()
        {
            // Arrange
            var mockRestaurantService = new Mock<IRestaurantService>();
            var controller = new PlazoletaController(mockRestaurantService.Object);

            var method = typeof(PlazoletaController).GetMethod("CreateOrder");
            var parameters = method.GetParameters();

            foreach (var parameter in parameters)
            {
                var attributes = parameter.GetCustomAttributes(typeof(RequiredAttribute), true);
                Assert.NotNull(attributes);
            }
        }

        //[Fact]
        //public void CreateOrder_ShouldReturnBadRequestObjectResultOnValidationError()
        //{
        //    // Arrange
        //    var mockRestaurantService = new Mock<IRestaurantService>();
        //    var response = new GeneralResponse { StatusCode = HttpStatusCode.OK, Description = "Pedido creado" };
        //    mockRestaurantService.Setup(service => service.CreateOrder(It.IsAny<Order>())).Returns(response);
        //    var controller = new PlazoletaController(mockRestaurantService.Object);
        //    var order = new OrderModel
        //    {
        //        Id = 1,
        //        Fecha = DateTime.Now,
        //        Estado = null
        //    };

        //    // Act
        //    var result = controller.CreateOrder(order);

        //    // Assert
        //    Assert.IsType<BadRequestObjectResult>(result);
        //    var badRequestResult = (BadRequestObjectResult)result;
        //}

    }


}