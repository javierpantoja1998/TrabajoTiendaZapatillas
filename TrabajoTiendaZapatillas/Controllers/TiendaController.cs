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
            List<Zapatilla> zapatillas = this.repo.GetZapatillas();
            return View(zapatillas);
        }
    }
}
