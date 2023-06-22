using Autofac;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UsersService.Domain.Interfaces;
using UsersService.Domain.Services;
using UsersService.Domain.Servicios;

namespace UsersService.Domain
{
    public class DomainModule:Module
    {
        protected override void Load(ContainerBuilder builder)
        {
            builder.RegisterType<UserServices>().As<IUserServices>().InstancePerLifetimeScope();
            builder.RegisterType<JwtService>().As<IJwtService>().InstancePerLifetimeScope();
            builder.RegisterType<LoginService>().As<ILoginService>().InstancePerLifetimeScope();
            builder.RegisterType<AuthService>().As<IAuthService>().InstancePerLifetimeScope();
        }
    }
}
