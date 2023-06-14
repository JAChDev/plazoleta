using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PlazoletaService.Domain.Entities
{
    public class Product
    {
        public int Id { get; set; }
        public string? Nombre { get; set; }
        public int id_categoria { get; set; }
        public string? Descripcion { get; set; }
        public string? Precio { get; set; }
        public int Id_Restaurante { get; set; }
        public string? url_imagen { get; set; }
        public bool Activo { get; set; }
    }
}
