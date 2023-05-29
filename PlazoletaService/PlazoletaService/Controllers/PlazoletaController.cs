using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using PlazoletaService.Domain.Entities;
using PlazoletaService.Domain.Interfaces;
using PlazoletaService.Domain.Responses;
using PlazoletaService.WebApi.Authorization;
using PlazoletaService.WebApi.Models;
using System.Net;
using System.Security.Claims;

namespace PlazoletaService.WebApi.Controllers
{
    [ApiController]
    [Route("api")]
    public class PlazoletaController:ControllerBase
    {
        private readonly IRestaurantService _restaurantService;
        public PlazoletaController(IRestaurantService restaurantService)
        {
            _restaurantService = restaurantService;
        }

        [TypeFilter(typeof(JwtAuthorizationFilter), Arguments = new object[] { "4" })]
        [HttpPost("restaurant/create")]
        public IActionResult CreateRestaurant(RestaurantModel restaurantModel)
        {
            Restaurant restaurant = new Restaurant();
            restaurant.Nombre = restaurantModel.Nombre;
            restaurant.Direccion = restaurantModel.Direccion;
            restaurant.id_propietario = restaurantModel.id_propietario;
            restaurant.Telefono = restaurantModel.Telefono;
            restaurant.UrlLogo = restaurantModel.UrlLogo;
            restaurant.Nit = restaurantModel.Nit;
            GeneralResponse response = _restaurantService.CreateRestaurant(restaurant);

            return response.StatusCode == HttpStatusCode.OK ? Ok(response) : BadRequest(response);
        }

        [TypeFilter(typeof(JwtAuthorizationFilter), Arguments = new object[] { "1" })]
        [HttpPost("restaurant/product")]
        public IActionResult CreateProduct(ProductModel productModel)
        {
            Product product = new Product();
            product.Nombre = productModel.Nombre;
            product.id_categoria = productModel.id_categoria;
            product.Descripcion = productModel.Descripcion;
            product.Precio = productModel.Precio;
            product.id_restaurante = productModel.id_restaurante;
            product.url_imagen = productModel.url_imagen;
            product.Activo = productModel.Activo;
            GeneralResponse response = _restaurantService.CreateProduct(product);

            return response.StatusCode == HttpStatusCode.OK ? Ok(response) : BadRequest(response);
        }

        [TypeFilter(typeof(JwtAuthorizationFilter), Arguments = new object[] { "1" })]
        [HttpPut("restaurant/product/modify")]
        public IActionResult UpdateProduct(ModifyProductModel productModel)
        {
            var idClaim = HttpContext.User.FindAll(ClaimTypes.Name).Select(c => c.Value).ToList();

            ModifyProduct product = new ModifyProduct();
            product.Id = productModel.Id;
            product.Nombre = productModel.Nombre;
            product.Descripcion = productModel.Descripcion;
            GeneralResponse response = _restaurantService.UpdateProduct(product, Convert.ToInt32(idClaim[0]));

            return response.StatusCode == HttpStatusCode.OK ? Ok(response) : BadRequest(response);
        }

        [TypeFilter(typeof(JwtAuthorizationFilter), Arguments = new object[] { "1" })]
        [HttpGet("restaurant/product/activation/{id}")]
        public IActionResult ProductStatus(string id)
        {
            var idClaim = HttpContext.User.FindAll(ClaimTypes.Name).Select(c => c.Value).ToList();

            GeneralResponse response = _restaurantService.ActivateProduct(Convert.ToInt32(id), Convert.ToInt32(idClaim[0]));

            return response.StatusCode == HttpStatusCode.OK ? Ok(response) : BadRequest(response);
        }

        [TypeFilter(typeof(JwtAuthorizationFilter), Arguments = new object[] { "3" })]
        [HttpGet("restaurant/get_all")]
        public IActionResult GetRestaurants(int pageNumber, int pageSize)
        {
            var response = _restaurantService.GetRestaurants(pageNumber, pageSize);
            if (response != null)
            {
                return Ok(response);
            }
            else
            {
                return BadRequest(new GeneralResponse { StatusCode = HttpStatusCode.BadRequest, Description = "Error al obtener los restaurantes" });
            }
        }
        [TypeFilter(typeof(JwtAuthorizationFilter), Arguments = new object[] { "3" })]
        [HttpGet("restaurant/product/get")]
        public IActionResult GetProductsByRestaurant(int idRes, int pageNumber, int pageSize)
        {
            var response = _restaurantService.GetProductsByRestaurant(idRes, pageNumber, pageSize);
            if (response != null)
            {
                return Ok(response);
            }
            else
            {
                return BadRequest(new GeneralResponse { StatusCode = HttpStatusCode.BadRequest, Description = "Error al obtener los restaurantes" });
            }
        }
    }
}
