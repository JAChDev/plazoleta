using System.ComponentModel.DataAnnotations;

namespace MensajeriaService.WebApi.Models
{
    public class MessageModel
    {
        [Required]
        public string Phone { get; set; }
        [Required]
        public string Message { get; set; }
    }
}
