using PlazoletaService.Domain.Entities;
using PlazoletaService.Domain.Responses;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PlazoletaService.Domain.Interfaces
{
    public interface IRestaurantService
    {
        public GeneralResponse CreateRestaurant(Restaurant restaurant);
        public GeneralResponse CreateProduct(Product product);
        public GeneralResponse UpdateProduct(ModifyProduct product, int id);
        public GeneralResponse ActivateProduct(int id, int ownerId);
        public List<object> GetRestaurants(int pageNumber, int pageSize);
        public List<Product> GetProductsByRestaurant(int restaurantId, int pageNumber, int pageSize);
    }
}
