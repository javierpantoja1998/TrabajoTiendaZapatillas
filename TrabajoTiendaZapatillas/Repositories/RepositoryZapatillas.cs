using TrabajoTiendaZapatillas.Data;

namespace TrabajoTiendaZapatillas.Repositories
{
    public class RepositoryZapatillas
    {
        private ZapatillasContext context;

        public RepositoryZapatillas(ZapatillasContext context)
        {
            this.context = context;
        }
    }
}
