using PlazoletaService.Domain.DTO;
using PlazoletaService.Domain.Interfaces;
using PlazoletaService.Domain.Responses;
using PlazoletaService.Infrastructure.Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PlazoletaService.Infrastructure.Repositories
{
    public class MySQLRepository : IMySQLRepository
    {
        private readonly SQLDbContext _dbContext;
        public MySQLRepository(SQLDbContext dbContext)
        {
            _dbContext = dbContext;
        }

        public DbResponse CreateProduct(ProductDTO productDTO)
        {
            try
            {
                _dbContext.Platos.Add(productDTO);
                _dbContext.SaveChanges();
                return new DbResponse { Success = true, Message = "Plato insertado" };
            }
            catch (Exception ex)
            {
                return new DbResponse { Success = false, Message = ex.Message };
            }
        }

        public DbResponse CreateRestaurant(RestaurantDTO restaurantDTO)
        {
            try
            {
                _dbContext.Restaurantes.Add(restaurantDTO);
                _dbContext.SaveChanges();
                return new DbResponse { Success = true, Message = "Restaurante insertado" };
            }
            catch (Exception ex) 
            {
                return new DbResponse { Success = false, Message = ex.Message};
            }
        }

        public RestaurantDTO GetRestaurantByOwnerId(int id)
        {
            try
            {
                var restaurant = _dbContext.Restaurantes.Where(x => x.id_propietario == id).ToList();
                if (restaurant.FirstOrDefault() != null)
                {
                    return restaurant.FirstOrDefault();
                }
                else { 
                    return null;
                }
            }
            catch (Exception ex) 
            {
                return null;
            }
        }

        public ProductDTO GetProductById(int id) 
        {
            try
            {
                var plato = _dbContext.Platos.Find(id);
                if (plato != null) { return plato; }
                else { return null; }
            }
            catch (Exception ex) { return null; }
        }

        public DbResponse UpdateProduct(ModifyProductDTO productDTO)
        {
            try
            {
                var plato = _dbContext.Platos.Find(productDTO.Id);
                if (plato != null) 
                {
                    plato.Nombre = productDTO.Nombre;
                    plato.Descripcion = productDTO.Descripcion;
                    _dbContext.SaveChanges();
                    return new DbResponse { Success = true, Message = "Plato modificado" };
                }
                else
                { 
                    return new DbResponse { Success = false, Message = "El plato especificado no existe" };
                }
            }
            catch (Exception ex)
            {
                return new DbResponse { Success = false, Message = ex.Message };
            }
        }
    }
}
