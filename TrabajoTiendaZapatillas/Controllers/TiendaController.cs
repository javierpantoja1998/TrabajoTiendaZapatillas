using Microsoft.AspNetCore.Mvc;
using TrabajoTiendaZapatillas.Filters;
using TrabajoTiendaZapatillas.Models;
using TrabajoTiendaZapatillas.Repositories;

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




            return View(zapatillaCategoria);
        }

        public IActionResult ZapatillaDetalles(int idZapatilla)
        {
            return View(repo.GetZapatillaId(idZapatilla));
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
        public IActionResult Carrito()
        {
            return View();
        }

       
    }
}
