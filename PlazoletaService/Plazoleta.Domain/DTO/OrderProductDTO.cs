using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PlazoletaService.Domain.DTO
{
    public class OrderProductDTO
    {
        public int id_Pedido { get; set; }
        public int id_Plato { get; set; }
        public int Cantidad { get; set; }
    }
}
