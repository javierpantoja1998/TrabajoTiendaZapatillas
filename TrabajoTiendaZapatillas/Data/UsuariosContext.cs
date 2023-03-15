using Microsoft.EntityFrameworkCore;
using TrabajoTiendaZapatillas.Models;

namespace TrabajoTiendaZapatillas.Data
{
    public class UsuariosContext : DbContext
    {
        public UsuariosContext(DbContextOptions<UsuariosContext> options) : base(options) { }

        public DbSet<Usuario> Usuarios { get; set; }
    }
}
