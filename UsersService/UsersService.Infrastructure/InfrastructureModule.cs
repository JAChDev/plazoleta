using Autofac;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UsersService.Domain.Interfaces;
using UsersService.Infrastructure.Repositories;

namespace UsersService.Infrastructure
{
    public class InfrastructureModule:Module
    {
        protected override void Load(ContainerBuilder builder)
        {
            builder.RegisterType<MySQLRepository>().As<IMySQLRepository>().InstancePerLifetimeScope();
        }
    }
}
