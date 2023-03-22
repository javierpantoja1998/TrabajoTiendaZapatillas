using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Mvc;
using System.Numerics;
using System.Security.Claims;
using TrabajoTiendaZapatillas.Filters;
using TrabajoTiendaZapatillas.Models;
using TrabajoTiendaZapatillas.Repositories;

namespace TrabajoTiendaZapatillas.Controllers
{
    public class ManagedController : Controller
    {
        private RepositoryUsuarios repo;

        public ManagedController(RepositoryUsuarios repo)
        {
            this.repo = repo;
        }

        public IActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> LogIn(string email, string password)
        {
            Usuario usuario = await this.repo.ExisteUsuario(email, password);
            if(usuario != null)
            {
                ClaimsIdentity identity =
               new ClaimsIdentity
               (CookieAuthenticationDefaults.AuthenticationScheme
               , ClaimTypes.Name, ClaimTypes.Role);
                identity.AddClaim
                   (new Claim(ClaimTypes.Name, usuario.Email));
                identity.AddClaim
                    (new Claim(ClaimTypes.NameIdentifier, usuario.Password.ToString()));

                ClaimsPrincipal user = new ClaimsPrincipal(identity);

                await HttpContext.SignInAsync
                    (CookieAuthenticationDefaults.AuthenticationScheme
                    , user);
                

                return RedirectToAction("Index", "Tienda");
            }
            else
            {
                ViewData["MENSAJE"] = "Usuario/Password incorrectos";
                return View();
            }
        }

        [AuthorizationUsuarios]
        public IActionResult PerfilUsuario()
        {
            return View();
        }

        //LOG OUT
        public async Task<IActionResult> LogOut()
        {
            await HttpContext.SignOutAsync
                (CookieAuthenticationDefaults.AuthenticationScheme);
            return RedirectToAction("Index", "Tienda");
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
            (string nombre, string dni, string direccion, string telefono, string email, string password)
        {
            Usuario user = new Usuario();
            string fileName = user.IdUsuario.ToString();

            await this.repo.RegisterUser(nombre, dni, direccion, telefono, email, password);
            ViewData["MENSAJE"] = "Usuario regristado correctamente";
            return View();
        }
    }
}
