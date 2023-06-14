using System.ComponentModel.DataAnnotations;

namespace PlazoletaService.WebApi.Models
{
    public class ProductModel
    {
        [Required]
        public string? Nombre { get; set; }
        [Required]
        public int id_categoria { get; set; }
        [Required]
        public string? Descripcion { get; set; }
        [Required]
        [RegularExpression("^[1-9]\\d*$", ErrorMessage = "Escriba un valor numérico mayor a 0")]
        public string? Precio { get; set; }
        [Required]
        public int Id_Restaurante { get; set; }
        [Required]
        public string? url_imagen { get; set; }
        [Required]
        public bool Activo { get; set; }
    }
}
