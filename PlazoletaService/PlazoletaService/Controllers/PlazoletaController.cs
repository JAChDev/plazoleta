using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using PlazoletaService.Domain.Interfaces;

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

        [Authorize]
        [HttpPost("restaurant/create")]
        public IActionResult CreateRestaurant()
        {
            return null;
        }
    }
}
