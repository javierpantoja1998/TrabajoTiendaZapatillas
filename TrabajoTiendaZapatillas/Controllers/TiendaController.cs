using Microsoft.AspNetCore.Mvc;

namespace TrabajoTiendaZapatillas.Controllers
{
    public class TiendaController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
