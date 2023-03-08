using Microsoft.Data.SqlClient;
using TrabajoTiendaZapatillas.Data;
using TrabajoTiendaZapatillas.Models;

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

        //Funcion para sacar la lista de las zapatillas
        public List<Zapatilla> GetZapatillas()
        {
            var consulta = from datos in context.Zapatillas
                           select datos;
            return consulta.ToList();

        }

        public Zapatilla GetZapatillaId(int idZapatilla)
        {
            var consulta = from datos in context.Zapatillas
                           where datos.IdZapatilla == idZapatilla
                           select datos;
            return consulta.FirstOrDefault();

        }

        //Funcion para sacar zapatillas por categoria
        public List<Zapatilla> zapatillasCategoria(int idCategoria) 
        {
            var consulta = from datos in context.Zapatillas
                           where datos.IdCategoria== idCategoria
                           select datos;
            return consulta.ToList();
        }
    }
}
