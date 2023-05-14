using Microsoft.AspNetCore.Mvc;

using TrabajoTiendaZapatillas.Repositories;
using TrabajoTiendaZapatillas.Extensions;
using NuggetTiendaZapatillasJPL.Models;
using TrabajoTiendaZapatillas.Services;

namespace TrabajoTiendaZapatillas.Controllers
{
    public class TiendaController : Controller
    {
        private ServiceApiZapatillas service;
        private RepositoryZapatillas repo;

        public TiendaController(ServiceApiZapatillas service, RepositoryZapatillas repo)
        {
            this.service = service;
            this.repo = repo;   
        }

        public async Task<IActionResult> Index()
        {
            List<VistaZapatillasCategoria> zapatillasCategoriaBasketball = await this.service.ZapatillasCategoriaAsync("BASKETBALL");
            List<VistaZapatillasCategoria> zapatillasCategoriaFutbol = await this.service.ZapatillasCategoriaAsync("FUTBOL");
            List<VistaZapatillasCategoria> zapatillasCategoriaSkate = await this.service.ZapatillasCategoriaAsync("SKATE");
            List<VistaZapatillasCategoria> zapatillasCategoriaPremium = await this.service.ZapatillasCategoriaAsync("PREMIUM");


            ZapatillaCategoria zapatillaCategoria = new ZapatillaCategoria();
            zapatillaCategoria.ZapatillasBasket = zapatillasCategoriaBasketball;
            zapatillaCategoria.ZapatillasFutbol = zapatillasCategoriaFutbol;
            zapatillaCategoria.ZapatillasSkate = zapatillasCategoriaSkate;
            zapatillaCategoria.ZapatillasPremium = zapatillasCategoriaPremium;


            ////////////////////////////
            

            return View(zapatillaCategoria);
        }

        public async Task<IActionResult> ZapatillaDetalles(int idZapatilla, int? idZapatillaCarrito)
        {
            Zapatilla producto = new Zapatilla();

            if (idZapatillaCarrito != null)
            {
                //GUARDAMOS EL PRODUCTO EN EL CARRITO
                List<int> carrito;
                if (HttpContext.Session.GetObject<List<int>>("CARRITO") == null)
                {
                    carrito = new List<int>();
                }
                else
                {
                    carrito = HttpContext.Session.GetObject<List<int>>("CARRITO");
                }
                carrito.Add(idZapatillaCarrito.Value);
                HttpContext.Session.SetObject("CARRITO", carrito);

                producto = await this.service.FindZapatillaAsync(idZapatillaCarrito.Value);
            }
            else
            {
                //MOSTRAMOS EL DETALLE DEL PRODUCTO
                producto = await this.service.FindZapatillaAsync(idZapatilla);
            }

            return View(producto);
        }


        public IActionResult ZapatillasCategoria()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> ZapatillasCategoria(string nombreCategoria) 
        {
            List<VistaZapatillasCategoria> zapatillasCategoria = await  this.service.ZapatillasCategoriaAsync(nombreCategoria);
            return View(zapatillasCategoria);
        }


        //FUNCION PARA MOSTAR LOS OBJETOS GUARDADOS EN EL CARRITO Y PODER BORRARLOS
        public IActionResult Carrito(int? idzapatilla)
        {
            List<int> carrito = HttpContext.Session.GetObject<List<int>>("CARRITO");
            //TIENES QUE CREAR PARA AÑADIR DATOS AL CARRITO
            if(carrito == null)
            {
                return View();
            }
            else
            {
                if(idzapatilla != null)
                {
                    carrito.Remove(idzapatilla.Value);
                    HttpContext.Session.SetObject("CARRITO", carrito);
                }
                List<Zapatilla> productos = this.repo.GetZapatillasCarrito(carrito);
                return View(productos);
            }
            
        }

        public IActionResult Pedidos()
        {
            List<int> carrito = HttpContext.Session.GetObject<List<int>>("CARRITO");
            List<Zapatilla> zapatillas = this.repo.GetZapatillasCarrito(carrito);
            HttpContext.Session.Remove("CARRITO");
            return View(zapatillas);
        }

        public IActionResult Compra()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Compra(string numerotarjeta, string nombre, string apellidos, string direccion, string email,
            string numerotelefono, int codigopostal)
        {
            await this.service.InsertCompraAsync(numerotarjeta,nombre,apellidos,direccion,email, numerotelefono, codigopostal);
            return RedirectToAction("Index     c ", "Tienda");
        }

        public IActionResult PagoFinalizado()
		{
			return View();
		}

	}
}
