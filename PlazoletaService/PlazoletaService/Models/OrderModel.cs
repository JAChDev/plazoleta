using System.ComponentModel.DataAnnotations;
using System.Diagnostics.CodeAnalysis;

namespace PlazoletaService.WebApi.Models
{
    public class OrderModel
    {
        public int Id { get; set; }
        [Required]
        [NotNull]
        public int Id_Cliente { get; set; }
        [Required]
        [NotNull]
        public DateTime Fecha { get; set; }
        [Required]
        [NotNull]
        public string? Estado { get; set; }
        [Required]
        [NotNull]
        public int Id_Chef { get; set; }
        [Required]
        [NotNull]
        public int Id_Restaurante { get; set; }
    }
}
