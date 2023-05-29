using AutoMapper;
using PlazoletaService.Domain.DTO;
using PlazoletaService.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PlazoletaService.Domain
{
    public class MappingProfile:Profile
    {
        public MappingProfile() {
            CreateMap<Restaurant, RestaurantDTO>();
            CreateMap<RestaurantDTO, Restaurant>();
            CreateMap<ModifyProductDTO, ModifyProduct>();
            CreateMap<ModifyProduct, ModifyProductDTO>();
            CreateMap<Product, ProductDTO>();
            CreateMap<ProductDTO, Product>();

        }
    }
}
