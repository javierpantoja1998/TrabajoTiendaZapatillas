
using NuggetTiendaZapatillasJPL.Models;
using TrabajoTiendaZapatillas.Data;

namespace TrabajoTiendaZapatillas.Repositories
{
    #region
    
    #endregion
    public class RepositoryZapatillas
    {
        private ZapatillasContext context;

        public RepositoryZapatillas(ZapatillasContext context)
        {
            this.context = context;
        }

        public List<Zapatilla> GetZapatillasCarrito(List<int> idzapatillas)
        {

            var consulta = from datos in context.Zapatillas
                           where idzapatillas.Contains(datos.IdZapatilla)
                           select datos;
            return consulta.ToList();
        }

        

    }
}
