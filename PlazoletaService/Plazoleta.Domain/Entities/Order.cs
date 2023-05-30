using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PlazoletaService.Domain.Entities
{
    public class Order
    {
        public int Id { get; set; }
        public int id_Cliente { get; set; }
        public DateTime Fecha { get; set; }
        public string Estado { get; set; }
        public int id_Chef { get; set; }
        public int id_Restaurante { get; set; }
    }
}
