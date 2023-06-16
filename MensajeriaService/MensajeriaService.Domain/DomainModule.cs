using Autofac;
using MensajeriaService.Domain.Interfaces;
using MensajeriaService.Domain.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MensajeriaService.Domain
{
    public class DomainModule:Module
    {
        protected override void Load(ContainerBuilder builder)
        {
            builder.RegisterType<MessageService>().As<IMessageService>().InstancePerLifetimeScope();
        }
    }
}
