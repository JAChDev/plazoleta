using Autofac;
using MensajeriaService.Domain.Interfaces;
using MensajeriaService.Infrastructure.WhatsappApi;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MensajeriaService.Infrastructure
{
    public class InfrastructureModule:Module
    {
        protected override void Load(ContainerBuilder builder)
        {
            builder.RegisterType<MessagingApi>().As<IMessagingApi>().InstancePerLifetimeScope();
        }
    }
}
