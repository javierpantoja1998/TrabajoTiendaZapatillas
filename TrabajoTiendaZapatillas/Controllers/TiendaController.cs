using Microsoft.AspNetCore.Mvc;
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
            List<VistaZapatillasCategoria> zapatillas = this.repo.GetZapatillas();
            return View(zapatillas);
        }

        public IActionResult ZapatillaDetalles()
        {
            return View();
        }

        [HttpPost]
        public IActionResult ZapatillaDetalles(int idZapatilla)
        {
            Zapatilla zapatilla = repo.GetZapatillaId(idZapatilla);
            return View(zapatilla);
        }

        public IActionResult ZapatillasCategoria()
        {
            return View();
        }

        [HttpPost]
        public IActionResult ZapatillasCategoria(int idCategoria) 
        {
            List<Zapatilla> zapatillasCategoria =  this.repo.zapatillasCategoria(idCategoria);
            return View(zapatillasCategoria);
        }

       
    }
}
