using PlazoletaService.Domain.DTO;
using PlazoletaService.Domain.Responses;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PlazoletaService.Domain.Interfaces
{
    public interface IMySQLRepository
    {
        DbResponse CreateRestaurant(RestaurantDTO restaurantDTO);
        DbResponse CreateProduct(ProductDTO productDTO);
        DbResponse UpdateProduct(ModifyProductDTO productDTO);
        RestaurantDTO GetRestaurantByOwnerId(int id);
        public ProductDTO GetProductById(int id);

    }
}
