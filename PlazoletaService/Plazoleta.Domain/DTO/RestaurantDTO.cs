using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PlazoletaService.Domain.DTO
{
    public class RestaurantDTO
    {
        public int Id { get; set; }
        public string Nombre { get; set; }
        public string Direccion { get; set; }
        public int id_propietario { get; set; }
        public string Telefono { get; set; }
        public string UrlLogo { get; set; }
        public string Nit { get; set; }
    }
}
