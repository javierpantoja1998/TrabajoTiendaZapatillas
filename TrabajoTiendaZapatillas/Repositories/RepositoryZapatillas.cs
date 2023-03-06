using TrabajoTiendaZapatillas.Data;
using TrabajoTiendaZapatillas.Models;

namespace TrabajoTiendaZapatillas.Repositories
{
    public class RepositoryZapatillas
    {
        private ZapatillasContext context;

        public RepositoryZapatillas(ZapatillasContext context)
        {
            this.context = context;
        }

        //Funcion para sacar la lista de las zapatillas
        public List<Zapatilla> GetZapatillas()
        {
            var consulta = from datos in context.Zapatillas
                           select datos;
            return consulta.ToList();

        }
    }
}
