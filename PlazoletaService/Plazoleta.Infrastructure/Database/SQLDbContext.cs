using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PlazoletaService.Domain.DTO;

namespace PlazoletaService.Infrastructure.Database
{
    public class SQLDbContext:DbContext
    {
        private readonly IConfiguration _configuration;
        public SQLDbContext(DbContextOptions<SQLDbContext> options, IConfiguration configuration) : base(options)
        {
            _configuration = configuration;
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
        }

        public DbSet<RestaurantDTO> Restaurantes { get; set; }
        public DbSet<ProductDTO> Platos { get; set; }
        
    }
}
