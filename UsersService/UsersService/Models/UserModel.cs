using System.ComponentModel.DataAnnotations;

namespace UsersService.WebApi.Models
{
    public class UserModel
    {
        [Required]
        public string Nombre { get; set; }
        [Required]
        public string Apellido { get; set; }
        [Required]
        [EmailAddress]
        public string Correo { get; set; }
        [Required]
        public string Clave { get; set; }
        [Required]
        [RegularExpression("(^[0-9]+)")]
        public long Id { get; set; }
        [Required]
        [StringLength(13)]
        [RegularExpression("(^[0-9+]+)")]
        public string Celular { get; set; }
    }
}
