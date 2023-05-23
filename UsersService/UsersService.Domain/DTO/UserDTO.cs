using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace UsersService.Domain.DTO
{
    public class UserDTO
    {
        [Key]
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public string Correo { get; set; }
        public string Clave { get; set; }
        public long Id { get; set; }
        public string Celular { get; set; }
        public int id_rol { get; set; }
    }
}
