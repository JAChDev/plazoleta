using PlazoletaService.Domain.DTO;
using PlazoletaService.Domain.Entities;
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
                _dbContext.platos.Add(productDTO);
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
                _dbContext.restaurantes.Add(restaurantDTO);
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
                var restaurant = _dbContext.restaurantes.Where(x => x.id_propietario == id).ToList();
                if (restaurant.FirstOrDefault() != null)
                {
                    return restaurant.FirstOrDefault();
                }
                else { 
                    return null;
                }
            }
            catch
            {
                return null;
            }
        }

        public ProductDTO GetProductById(int id) 
        {
            try
            {
                var plato = _dbContext.platos.Find(id);
                if (plato != null) { return plato; }
                else { return null; }
            }
            catch { return null; }
        }

        public DbResponse UpdateProduct(ModifyProductDTO productDTO)
        {
            try
            {
                var plato = _dbContext.platos.Find(productDTO.Id);
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

        public DbResponse ActivateProduct(int productId)
        {
            try
            {
                var plato = _dbContext.platos.Find(productId);
                if (plato != null)
                {
                    plato.Activo = !plato.Activo;
                    _dbContext.SaveChanges();
                    return new DbResponse { Success = true, Message = plato.Activo == true ? "Plato activado" : "Plato desactivado" };
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

        public List<RestaurantDTO> GetRestaurants(int pageNumber, int pageSize)
        {
            try
            {
                var restaurants = _dbContext.restaurantes.AsQueryable();
                int total = restaurants.Count();
                int pages = (int)Math.Ceiling((double)total / pageSize);
                pageNumber = Math.Max(1, Math.Min(pageNumber, pageSize));
                int skippep = (pageNumber - 1) * pageSize;
                restaurants = restaurants.OrderBy(r => r.Nombre);
                restaurants = restaurants.Skip(skippep).Take(pageSize);
                return restaurants.ToList();
            }
            catch
            {
                return null;
            }
        }

        public List<ProductDTO> GetProductsByRestaurant(int restaurantId, int pageNumber, int pageSize)
        {
            try
            {
                var products = _dbContext.platos.Where(p => p.Id_Restaurante == restaurantId)
                    .GroupBy(p => p.id_categoria)
                    .Select(g => new {Categoria = g.Key, platos = g.ToList() });
                int total = products.Count();
                //int pages = (int)Math.Ceiling((double)total / pageSize);

                var resultado = products
                    .AsEnumerable()
                    .Skip((pageNumber - 1) * pageSize)
                    .Take(pageSize)
                    .SelectMany(g => g.platos)
                    .ToList();
                return resultado;

            }
            catch
            {
                return null;
            }
        }

        public DbResponse CreateOrder(OrderDTO order)
        {
            try
            {
                _dbContext.pedidos.Add(order);
                _dbContext.SaveChanges();
                return new DbResponse { Success = true, Message = "Pedido creado" };

            }
            catch (Exception ex)
            {
                return new DbResponse { Success = false, Message = ex.Message };

            }
        }

        public DbResponse AddOrderProduct(OrderProductDTO orderProduct)
        {
            try
            {
                var order = _dbContext.pedidos.Find(orderProduct.id_Pedido);
                if (order != null)
                {
                    _dbContext.pedidos_Platos.Add(orderProduct);
                    _dbContext.SaveChanges();
                    return new DbResponse { Success = true, Message = "platos agregados al pedido" };
                }
                else
                {
                    return new DbResponse { Success = false, Message = "No existe la orden solicitada" };
                }
            }
            catch (Exception ex)
            {
                return new DbResponse { Success = false, Message = ex.Message };

            }
        }

        public List<OrderDTO> GetOrdersWithFilter(int id, string filter, int pageNumber, int pageSize)
        {
            try
            {
                var Orders = _dbContext.pedidos.Where(p => p.Id_Restaurante == id && p.Estado==filter).ToList();
                int total = Orders.Count();
                int pages = (int)Math.Ceiling((double)total / pageSize);

                var resultado = Orders
                    .AsEnumerable()
                    .Skip((pageNumber - 1) * pageSize)
                    .Take(pageSize)
                    .ToList();
                return resultado;
            }
            catch (Exception ex)
            {
                return null;
            }
        }
    }
}
