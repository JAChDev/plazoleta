using AutoMapper;
using PlazoletaService.Domain.DTO;
using PlazoletaService.Domain.Entities;
using PlazoletaService.Domain.Interfaces;
using PlazoletaService.Domain.Responses;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;

namespace PlazoletaService.Domain.Servicios
{
    public class RestaurantServices : IRestaurantService
    {
        private readonly IMySQLRepository _mysqlRepository;
        private readonly IMapper _mapper;
        public RestaurantServices(IMySQLRepository mysqlRepository, IMapper mapper)
        {
            _mysqlRepository = mysqlRepository;
            _mapper = mapper;
        }

        public GeneralResponse CreateProduct(Product product)
        {
            try
            {
                ProductDTO productDTO = _mapper.Map<ProductDTO>(product);
                DbResponse createProduct = _mysqlRepository.CreateProduct(productDTO);
                if (createProduct.Success)
                {
                    return new GeneralResponse { StatusCode = HttpStatusCode.OK, Description = "Plato creado exitosamente" };
                }
                else
                {
                    return new GeneralResponse { StatusCode = HttpStatusCode.BadRequest, Description = "Error creando plato" };
                }
            }
            catch (Exception ex)
            {
                return new GeneralResponse { StatusCode = HttpStatusCode.BadRequest, Description = ex.Message };
            }
        }

        public GeneralResponse CreateRestaurant(Restaurant restaurant)
        {
            try
            {
                RestaurantDTO restaurantDTO = _mapper.Map<RestaurantDTO>(restaurant);
                DbResponse createRestaurant = _mysqlRepository.CreateRestaurant(restaurantDTO);
                if (createRestaurant.Success) 
                {
                    return new GeneralResponse { StatusCode = HttpStatusCode.OK, Description = "Restaurante creado exitosamente" };
                }
                else
                {
                    return new GeneralResponse { StatusCode = HttpStatusCode.BadRequest, Description = "Error creando restaurante" };
                }
            }
            catch (Exception ex)
            {
                return new GeneralResponse { StatusCode = HttpStatusCode.BadRequest, Description = ex.Message };
            }
        }

        public GeneralResponse UpdateProduct(ModifyProduct product, int id)
        {
            try
            {
                ProductDTO getProduct = _mysqlRepository.GetProductById(product.Id);
                RestaurantDTO getRestaurant = _mysqlRepository.GetRestaurantByOwnerId(id);
                
                if (getProduct != null && getRestaurant != null) 
                {
                    if (getProduct.id_restaurante != getRestaurant.Id)
                    {
                        return new GeneralResponse { StatusCode = HttpStatusCode.BadRequest, Description = "Este plato no pertenece a su restaurante" };
                    }
                } 
                else
                {
                    return new GeneralResponse { StatusCode = HttpStatusCode.BadRequest, Description = "El plato o el restaurante no existe" };
                }

                ModifyProductDTO productDTO = _mapper.Map<ModifyProductDTO>(product);
                DbResponse updateProduct = _mysqlRepository.UpdateProduct(productDTO);
                if (updateProduct.Success)
                {
                    return new GeneralResponse { StatusCode = HttpStatusCode.OK, Description = "Plato modificado exitosamente" };
                }
                else
                {
                    return new GeneralResponse { StatusCode = HttpStatusCode.BadRequest, Description = "Error al modificar el plato" };
                }
            }
            catch (Exception ex)
            {
                return new GeneralResponse { StatusCode = HttpStatusCode.BadRequest, Description = ex.Message };
            }
        }

        public GeneralResponse ActivateProduct(int id, int ownerId)
        {
            try
            {
                ProductDTO getProduct = _mysqlRepository.GetProductById(id);
                RestaurantDTO getRestaurant = _mysqlRepository.GetRestaurantByOwnerId(ownerId);

                if (getProduct != null && getRestaurant != null)
                {
                    if (getProduct.id_restaurante != getRestaurant.Id)
                    {
                        return new GeneralResponse { StatusCode = HttpStatusCode.BadRequest, Description = "Este plato no pertenece a su restaurante" };
                    }
                }
                else
                {
                    return new GeneralResponse { StatusCode = HttpStatusCode.BadRequest, Description = "El plato o el restaurante no existe" };
                }

                DbResponse activateProduct = _mysqlRepository.ActivateProduct(id);
                if (activateProduct.Success)
                {
                    return new GeneralResponse { StatusCode = HttpStatusCode.OK, Description = activateProduct.Message };
                }
                else
                {
                    return new GeneralResponse { StatusCode = HttpStatusCode.BadRequest, Description = "Error al cambiar estado del plato" };
                }
            }
            catch (Exception ex)
            {
                return new GeneralResponse { StatusCode = HttpStatusCode.BadRequest, Description = ex.Message };
            }
        }

        public List<object> GetRestaurants(int pageNumber, int pageSize)
        {
            try
            {
                List<Restaurant> restaurants = _mapper.Map<List<Restaurant>>(_mysqlRepository.GetRestaurants(pageNumber, pageSize));
                var result = new List<object>();
                foreach(Restaurant restaurant in restaurants)
                {
                    result.Add(new {Nombre = restaurant.Nombre, UrlLogo=restaurant.UrlLogo});
                }
                return result;
            }
            catch
            {
                return null;
            }
        }

        public List<Product> GetProductsByRestaurant(int restaurantId, int pageNumber, int pageSize)
        {
            try
            {
                List<Product> products = _mapper.Map<List<Product>>(_mysqlRepository.GetProductsByRestaurant(restaurantId, pageNumber, pageSize));
                return products;
            }
            catch
            {
                return null;
            }
        }

        public GeneralResponse CreateOrder(Order order)
        {
            try
            {
                OrderDTO orderDTO = _mapper.Map<OrderDTO>(order);
                DbResponse createOrder = _mysqlRepository.CreateOrder(orderDTO);
                if (createOrder.Success)
                {
                    return new GeneralResponse { StatusCode = HttpStatusCode.OK, Description = createOrder.Message };
                }
                else
                {
                    return new GeneralResponse { StatusCode = HttpStatusCode.BadRequest, Description = createOrder.Message };
                }
            }
            catch (Exception ex)
            {
                return new GeneralResponse { StatusCode=HttpStatusCode.BadRequest, Description=ex.Message };
            }
        }

        public GeneralResponse AddOrderProduct(OrderProduct orderProduct)
        {
            try
            {
                OrderProductDTO order = _mapper.Map<OrderProductDTO>(orderProduct);
                DbResponse addProductOrder = _mysqlRepository.AddOrderProduct(order);
                if (addProductOrder.Success)
                {
                    return new GeneralResponse { StatusCode = HttpStatusCode.OK, Description = addProductOrder.Message };
                }
                else
                {
                    return new GeneralResponse { StatusCode = HttpStatusCode.BadRequest, Description = addProductOrder.Message };
                }
            }
            catch(Exception ex)
            {
                return new GeneralResponse { StatusCode = HttpStatusCode.BadRequest, Description = ex.Message };
            }
        }
    }
}
