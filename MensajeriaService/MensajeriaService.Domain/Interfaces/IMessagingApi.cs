using MensajeriaService.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MensajeriaService.Domain.Interfaces
{
    public interface IMessagingApi
    {
        Task<bool> SendSMS(MessageData messageData);
        Task<bool> SendWhatsapp(MessageData messageData);

    }
}
