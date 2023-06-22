using PlazoletaService.Domain.DTO;
using PlazoletaService.Domain.Entities;
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
        ProductDTO GetProductById(int id);
        DbResponse ActivateProduct(int productId);
        List<RestaurantDTO> GetRestaurants(int pageNumber, int pageSize);
        List<ProductDTO> GetProductsByRestaurant(int restaurantId, int pageNumber, int pageSize);
        DbResponse CreateOrder(OrderDTO order);
        DbResponse AddOrderProduct(OrderProductDTO orderProduct);
        List<OrderDTO> GetOrdersWithFilter(int id, string filter, int pageNumber, int pageSize);




    }
}
