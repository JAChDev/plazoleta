using System.ComponentModel.DataAnnotations;

namespace PlazoletaService.WebApi.Models
{
    public class ModifyProductModel
    {
        [Required]
        public int Id { get; set; }
        [Required]
        public string Nombre { get; set; }
        [Required]
        public string Descripcion { get; set; }
    }
}
