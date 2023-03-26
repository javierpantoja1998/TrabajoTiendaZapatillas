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

        //Funcion para sacar el id
        

        private int GetMaximoIdVenta()
        {
            var maximo = (from datos in this.context.Ventas
                          select datos).Max(x => x.IdVenta) + 1;
            return maximo;
        }

        public async Task InsertVentasAsync(int idZapatilla, int idUsuario, string numComprobante, DateTime fecha, int impuesto, int total, string nombre)
        {
            Venta venta = new Venta();
            
            int maximoIdVenta= this.GetMaximoIdVenta();
            
            venta.IdVenta= this.GetMaximoIdVenta();
            venta.IdZapatilla= idZapatilla;
            venta.IdUsuario= idUsuario;
            venta.NumeroComprobante = numComprobante;
            venta.Fecha= fecha;
            venta.Impuesto= impuesto;
            venta.Total= total;
            venta.NombreZapatilla = nombre;

            this.context.Ventas.Add(venta);

            await this.context.SaveChangesAsync();
        }

		public async Task InsertComprasAsync
            (string numerotarjeta, string nombre,string apellidos, string direccion,
            string email, string numerotelefono, int codigopostal)
		{
			Compra compra = new Compra();

			compra.NumeroTarjeta = numerotarjeta;
            compra.Nombre = nombre;
            compra.Apellidos = apellidos;
            compra.Direccion = direccion;
            compra.Email = email;
            compra.NumeroTelefono = numerotelefono;
            compra.CodigoPostal = codigopostal;
			
			

			this.context.Compras.Add(compra);

			await this.context.SaveChangesAsync();
		}

	}
}
