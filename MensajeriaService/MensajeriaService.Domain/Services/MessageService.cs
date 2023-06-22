using MensajeriaService.Domain.Entities;
using MensajeriaService.Domain.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MensajeriaService.Domain.Services
{
    public class MessageService : IMessageService
    {
        private readonly IMessagingApi _messagingApi;

        public MessageService(IMessagingApi messagingApi)
        {
            _messagingApi = messagingApi;
        }
        public Task<bool> SendSMS(MessageData messageData)
        {
            try
            {
                var sendSmsMessage = _messagingApi.SendSMS(messageData);
                return sendSmsMessage;
            }
            catch 
            { 
                return Task.FromResult(false);
            }
        }

        public Task<bool> SendWhatsapp(MessageData messageData)
        {
            try
            {
                var sendWhatsappMessage = _messagingApi.SendWhatsapp(messageData);
                return sendWhatsappMessage;
            }
            catch
            {
                return Task.FromResult(false);
            }
        }
    }
}
