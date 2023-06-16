using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PlazoletaService.Domain.DTO
{
    public class ProductDTO
    {
        public int Id { get; set; }
        public string? Nombre { get; set; }
        public int id_categoria { get; set; }
        public string? Descripcion { get; set; }
        public string? Precio { get; set; }
        public int id_restaurante { get; set; }
        public string? url_imagen { get; set; }
        public bool Activo { get; set; }
    }
}
