using MensajeriaService.Domain.Entities;
using MensajeriaService.Domain.Interfaces;
using MensajeriaService.WebApi.Models;
using Microsoft.AspNetCore.Mvc;

namespace MensajeriaService.WebApi.Controllers
{
    [ApiController]
    [Route("api")]
    public class MessageController:ControllerBase
    {
        private readonly IMessageService _messageService;
        public MessageController(IMessageService messageService)
        {
            _messageService = messageService;
        }

        [HttpPost("sms")]
        public async Task<IActionResult> SendSMS([FromBody] MessageModel message)
        {
            MessageData data = new MessageData
            {
                Phone = message.Phone,
                Message = message.Message
            };

            var success = await _messageService.SendSMS(data);

            if (success)
            {
                return Ok("SMS enviado exitosamente");
            }
            else
            {
                return BadRequest("Error al enviar el SMS");
            }
        }

        [HttpPost("whatsapp")]
        public async Task<IActionResult> SendWhatsapp([FromBody] MessageModel message)
        {
            MessageData data = new MessageData
            {
                Phone = message.Phone,
                Message = message.Message
            };

            var success = await _messageService.SendWhatsapp(data);

            if (success)
            {
                return Ok("Mensaje de whatsapp enviado exitosamente");
            }
            else
            {
                return BadRequest("Error al enviar el mensaje");
            }
        }

        [HttpGet("Healt")]
        public IActionResult HealtCheck()
        {
            return Ok();
        }
    }
}
