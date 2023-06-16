using MensajeriaService.Domain.Entities;
using MensajeriaService.Domain.Interfaces;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Twilio;
using Twilio.Rest.Api.V2010.Account;
using Twilio.Types;

namespace MensajeriaService.Infrastructure.WhatsappApi
{
    public class MessagingApi : IMessagingApi
    {
        private readonly IConfiguration _configuration;

        public MessagingApi(IConfiguration configuration)
        {
            _configuration = configuration;

            var accountSid = _configuration["Twilio:Sid"];
            var authToken = _configuration["Twilio:Token"];
            TwilioClient.Init(accountSid, authToken);
        }

        public async Task<bool> SendSMS(MessageData messageData)
        {
            try
            {
                var fromPhoneNumber = _configuration["Twilio:Number"];

                var smsMessage = await MessageResource.CreateAsync(
                    body: messageData.Message,
                    from: new Twilio.Types.PhoneNumber(fromPhoneNumber),
                    to: new Twilio.Types.PhoneNumber(messageData.Phone)
                );

                return smsMessage != null;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public async Task<bool> SendWhatsapp(MessageData messageData)
        {
            try
            {
                var fromPhoneNumber = _configuration["Twilio:Number"];

                var whatsappMessage = await MessageResource.CreateAsync(
                    body: messageData.Message,
                    from: new PhoneNumber("whatsapp:" + fromPhoneNumber),
                    to: new PhoneNumber("whatsapp:" + messageData.Phone)
                );

                return whatsappMessage != null;
            }
            catch (Exception ex)
            {
                // Manejar el error de envío de mensaje
                return false;
            }
        }
    }
}
