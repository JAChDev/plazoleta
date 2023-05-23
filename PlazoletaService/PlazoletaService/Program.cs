using Autofac.Extensions.DependencyInjection;
using Autofac;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.IdentityModel.Tokens;
using PlazoletaService.Domain;
using PlazoletaService.Infrastructure;
using AutoMapper;
using Microsoft.EntityFrameworkCore;
using PlazoletaService.Infrastructure.Database;
using System.Text;
using PlazoletaService.WebApi.Authorization;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle

var configuration = builder.Services.BuildServiceProvider().CreateScope().ServiceProvider.GetRequiredService<IConfiguration>();

builder.Services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme)
    .AddJwtBearer(options =>
    {
        options.TokenValidationParameters = new TokenValidationParameters
        {
            ValidateIssuerSigningKey = true,
            IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(configuration.GetSection("Token").Value)),
            ValidateIssuer = true,
            ValidateAudience = false,
            ValidateLifetime = false
        };
    });

builder.Host.UseServiceProviderFactory(new AutofacServiceProviderFactory())
    .ConfigureContainer<ContainerBuilder>(builder =>
    {
        builder.RegisterModule(new DomainModule());
        builder.RegisterModule(new InfrastructureModule());
    });


//Automapper configuration
var mapperConfig = new MapperConfiguration(cfg =>
{
    cfg.AddProfile<MappingProfile>();
});

IMapper mapper = mapperConfig.CreateMapper();

builder.Services.AddDbContext<SQLDbContext>(options => options.UseMySQL(configuration.GetConnectionString("DbPlazoletaString")));
builder.Services.AddSingleton(mapper);
builder.Services.AddMvc(options => { options.Filters.Add(typeof(JwtAuthorizationFilter)); });
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
