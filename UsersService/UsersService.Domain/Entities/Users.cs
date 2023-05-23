using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BCrypt;

namespace UsersService.Domain.Entities
{
    public class Users
    {
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public string Correo { get; set; }
        public string Clave { get; set; }
        public long Id { get; set; }
        public string Celular { get; set; }
        public int id_rol { get; set; }

        public void SetPassword(string password)
        {
            Clave = BCrypt.Net.BCrypt.HashPassword(password);
        }
        public bool CheckPassword(string password)
        {
            return BCrypt.Net.BCrypt.Verify(password, Clave);
        }
    }
}
