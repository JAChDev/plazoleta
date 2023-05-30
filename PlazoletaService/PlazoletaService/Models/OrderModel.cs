namespace PlazoletaService.WebApi.Models
{
    public class OrderModel
    {
        public int Id { get; set; }
        public int id_Cliente { get; set; }
        public DateTime Fecha { get; set; }
        public string Estado { get; set; }
        public int id_Chef { get; set; }
        public int id_Restaurante { get; set; }
    }
}
