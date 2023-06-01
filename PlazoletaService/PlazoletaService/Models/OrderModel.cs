using System.ComponentModel.DataAnnotations;
using System.Diagnostics.CodeAnalysis;

namespace PlazoletaService.WebApi.Models
{
    public class OrderModel
    {
        public int Id { get; set; }
        [Required]
        [NotNull]
        public int id_Cliente { get; set; }
        [Required]
        [NotNull]
        public DateTime Fecha { get; set; }
        [Required]
        [NotNull]
        public string Estado { get; set; }
        [Required]
        [NotNull]
        public int id_Chef { get; set; }
        [Required]
        [NotNull]
        public int id_Restaurante { get; set; }
    }
}
