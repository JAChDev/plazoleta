using System.ComponentModel.DataAnnotations;

namespace PlazoletaService.WebApi.Models
{
    public class RestaurantModel
    {
        [Required]
        [RegularExpression(@"^(?!\d*$)[\w\s]+$", ErrorMessage = "El nombre no debe tener caracteres ni debe ser sólo numérico")]
        public string? Nombre { get; set; }
        [Required]
        public string? Direccion { get; set; }
        [Required]
        public int id_propietario { get; set; }
        [Required]
        [StringLength(13)]
        [RegularExpression("(^[0-9+]+)", ErrorMessage = "Debe ingresar un número de celular válido, se permite usar +")]
        public string? Telefono { get; set; }
        [Required]
        public string? UrlLogo { get; set; }
        [Required]
        [RegularExpression("(^[0-9]+)", ErrorMessage = "Sólo se admiten números")]
        public string? Nit { get; set; }
    }
}
