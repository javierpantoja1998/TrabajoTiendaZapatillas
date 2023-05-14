using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using NuggetTiendaZapatillasJPL.Models;
using System.Numerics;
using System.Security.Claims;

using TrabajoTiendaZapatillas.Services;

namespace TrabajoTiendaZapatillas.Controllers
{
    public class ManagedController : Controller
    {
        private ServiceApiUsuarios service;

        public ManagedController(ServiceApiUsuarios service)
        {
            this.service = service;
        }


        public IActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Login
     (string email, string password)
        {
            string token =
                await this.service.GetTokenAsync(email, password);
            if (token == null)
            {
                ViewData["MENSAJE"] = "Email/Password incorrectos";
                return View();
            }
            else
            {
                ViewData["MENSAJE"] = "Bienvenid@ a mi App!!!";
                HttpContext.Session.SetString("TOKEN", token);
                ClaimsIdentity identity =
                    new ClaimsIdentity
                    (CookieAuthenticationDefaults.AuthenticationScheme,
                    ClaimTypes.Name, ClaimTypes.Role);
                identity.AddClaim(new Claim(ClaimTypes.Name, email));
                identity.AddClaim(new Claim(ClaimTypes.NameIdentifier, password));
                ClaimsPrincipal userPrincipal = new ClaimsPrincipal(identity);
                await HttpContext.SignInAsync
                    (CookieAuthenticationDefaults.AuthenticationScheme
                    , userPrincipal, new AuthenticationProperties
                    {
                        ExpiresUtc = DateTime.UtcNow.AddMinutes(30)
                    });
                return RedirectToAction("Index", "Tienda");
            }
        }

        public async Task<IActionResult> Logout()
        {
            await HttpContext.SignOutAsync
                (CookieAuthenticationDefaults.AuthenticationScheme);
            HttpContext.Session.Remove("TOKEN");
            return RedirectToAction("Index", "Tienda");
        }

        public async Task<IActionResult> Register()
        {
            return View();
        }


        [HttpPost]
        
        public async Task<IActionResult> Register(string nombre, string dni, string direccion, string telefono, string email, byte[] password)
        {
            await this.service.InsertUsuarioAsync(nombre, dni, direccion, telefono, email, password);
            return RedirectToAction("Index", "Tienda");
        }

        //[Authorize]
        //[HttpGet]
        //[Route("[action]")]
        //public async Task<ActionResult<Usuario>> PerfilUsuario()
        //{
        //    string token =
        //        HttpContext.Session.GetString("TOKEN");
        //    Usuario user = await
        //        this.service.GetPerfilUsuarioAsync(token);
        //    return View(user);
        //}
    }
}
