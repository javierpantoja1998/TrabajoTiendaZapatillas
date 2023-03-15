using Microsoft.AspNetCore.Mvc;
using TrabajoTiendaZapatillas.Models;

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

        public IActionResult Register()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Register
            (string nombre, string email, string password, string imagen)
        {
            Usuario user = new Usuario();
            string fileName = user.IdUsuario.ToString();

            

            await this.repo.
            ViewData["MENSAJE"] = "Usuario regristado correctamente";
            return View();
        }
    }
}
