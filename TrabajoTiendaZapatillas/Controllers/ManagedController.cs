using Microsoft.AspNetCore.Mvc;
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
        //TENGO QUE HACER PRIMERO EL REPO
        public async Task<IActionResult> Login(string username, string password)
        {
           /* Usuario user = await this.repo.ExisteEmpleado(username, int.Parse(password));
            if (emp != null)
            {
                ClaimsIdentity identity = new ClaimsIdentity(CookieAuthenticationDefaults.AuthenticationScheme,
                    ClaimTypes.Name, ClaimTypes.Role);

                Claim claimName = new Claim(ClaimTypes.Name, username);
                identity.AddClaim(claimName);

                Claim claimId = new Claim(ClaimTypes.NameIdentifier, emp.IdEmpleado.ToString());
                identity.AddClaim(claimId);

                Claim claimOficio = new Claim(ClaimTypes.Role, emp.Oficio);
                identity.AddClaim(claimOficio);

                Claim claimSalario = new Claim("Salario", emp.Salario.ToString());
                identity.AddClaim(claimSalario);

                Claim claimDepartamento = new Claim("Departamento", emp.Departamento.ToString());
                identity.AddClaim(claimDepartamento);

                ClaimsPrincipal userPrincipal = new ClaimsPrincipal(identity);


                await HttpContext.SignInAsync
                    (CookieAuthenticationDefaults.AuthenticationScheme, userPrincipal);
                return RedirectToAction("PerfilEmpleado", "Empleados");
            }
            else
            {
                ViewData["MENSAJE"] = "Usuario/Contraseña incorrectos";
                return View();
            }*/
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
