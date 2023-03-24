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
        public List<VistaZapatillasCategoria> GetZapatillas()
        {
            var consulta = from datos in context.ZapatillasCategoria
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
        public List<VistaZapatillasCategoria> zapatillasCategoria(string nombreCategoria) 
        {
            var consulta = from datos in context.ZapatillasCategoria
                           where datos.NombreCategoria== nombreCategoria
                           select datos;
            return consulta.ToList();
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
