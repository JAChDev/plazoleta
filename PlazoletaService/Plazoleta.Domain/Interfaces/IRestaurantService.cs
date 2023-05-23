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
    }
}
