using Microsoft.AspNetCore.Mvc;

namespace TrabajoTiendaZapatillas.Controllers
{
    public class ManagedController : Controller
    {
        public IActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Login(string usuario, string password)
        {
            if (usuario.ToLower() == "admin" && password.ToLower() == "admin")
            {
                //ALMACENAMOS EL USUARIO EN SESSION
                HttpContext.Session.SetString("USUARIO", usuario);
                return RedirectToAction("Productos", "Tienda");
            }
            else
            {
                
                return RedirectToAction("AccesoDenegado");
            }
        }

        public IActionResult AccesoDenegado()
        {
            return View();
        }

       /* public IActionResult Register()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Register(string usuario, string password)
        {
            if (usuario.ToLower() == "admin" && password.ToLower() == "admin")
            {
                //ALMACENAMOS EL USUARIO EN SESSION
                HttpContext.Session.SetString("USUARIO", usuario);
                return RedirectToAction("Productos", "Tienda");
            }
            else
            {

                return RedirectToAction("AccesoDenegado");
            }
        }*/
    }
}
