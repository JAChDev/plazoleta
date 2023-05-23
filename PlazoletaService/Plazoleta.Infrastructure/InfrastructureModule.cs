using Autofac;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PlazoletaService.Domain.Interfaces;
using PlazoletaService.Infrastructure.Repositories;

namespace PlazoletaService.Infrastructure
{
    public class InfrastructureModule:Module
    {
        protected override void Load(ContainerBuilder builder)
        {
            builder.RegisterType<MySQLRepository>().As<IMySQLRepository>().InstancePerLifetimeScope();
        }
    }
}
