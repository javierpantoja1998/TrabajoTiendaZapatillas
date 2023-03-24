using Microsoft.AspNetCore.Mvc;
using TrabajoTiendaZapatillas.Filters;
using TrabajoTiendaZapatillas.Models;
using TrabajoTiendaZapatillas.Repositories;
using TrabajoTiendaZapatillas.Extensions;


namespace TrabajoTiendaZapatillas.Controllers
{
    public class TiendaController : Controller
    {
        private RepositoryZapatillas repo;


        public TiendaController(RepositoryZapatillas repo)
        {
            this.repo = repo;
        }

        public IActionResult Index()
        {
            List<VistaZapatillasCategoria> zapatillasCategoriaBasketball = this.repo.zapatillasCategoria("BASKETBALL");
            List<VistaZapatillasCategoria> zapatillasCategoriaFutbol = this.repo.zapatillasCategoria("FUTBOL");
            List<VistaZapatillasCategoria> zapatillasCategoriaSkate = this.repo.zapatillasCategoria("SKATE");
            List<VistaZapatillasCategoria> zapatillasCategoriaPremium = this.repo.zapatillasCategoria("PREMIUM");


            ZapatillaCategoria zapatillaCategoria = new ZapatillaCategoria();
            zapatillaCategoria.ZapatillasBasket = zapatillasCategoriaBasketball;
            zapatillaCategoria.ZapatillasFutbol = zapatillasCategoriaFutbol;
            zapatillaCategoria.ZapatillasSkate = zapatillasCategoriaSkate;
            zapatillaCategoria.ZapatillasPremium = zapatillasCategoriaPremium;


            ////////////////////////////
            

            return View(zapatillaCategoria);
        }

        public IActionResult ZapatillaDetalles(int idZapatilla, int?  idZapatillaCarrito)
        {
            if (idZapatillaCarrito != null)
            {
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


            }
            Zapatilla zapatillas = this.repo.GetZapatillaId(idZapatilla);
            return View(zapatillas);
            
        }


        public IActionResult ZapatillasCategoria()
        {
            return View();
        }

        [HttpPost]
        public IActionResult ZapatillasCategoria(string nombreCategoria) 
        {
            List<VistaZapatillasCategoria> zapatillasCategoria =  this.repo.zapatillasCategoria(nombreCategoria);
            return View(zapatillasCategoria);
        }



       



        /*[AuthorizationUsuarios]*/
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



    }
}
