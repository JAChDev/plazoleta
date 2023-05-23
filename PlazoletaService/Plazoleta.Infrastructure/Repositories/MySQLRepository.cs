using PlazoletaService.Domain.DTO;
using PlazoletaService.Domain.Interfaces;
using PlazoletaService.Domain.Responses;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PlazoletaService.Infrastructure.Repositories
{
    public class MySQLRepository : IMySQLRepository
    {
        public DbResponse CreateRestaurant(RestaurantDTO restaurantDTO)
        {
            throw new NotImplementedException();
        }
    }
}
