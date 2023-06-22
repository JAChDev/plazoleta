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
        public SQLDbContext(DbContextOptions<SQLDbContext> options) : base(options)
        {

        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
            modelBuilder.Entity<OrderProductDTO>().HasNoKey();
        }

        public DbSet<RestaurantDTO> restaurantes { get; set; }
        public DbSet<ProductDTO> platos { get; set; }
        public DbSet<OrderDTO> pedidos { get; set; }
        public DbSet<OrderProductDTO> pedidos_Platos { get; set; } 
        
    }
}
