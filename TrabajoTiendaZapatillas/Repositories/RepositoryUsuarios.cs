using TrabajoTiendaZapatillas.Data;
using TrabajoTiendaZapatillas.Helpers;
using TrabajoTiendaZapatillas.Models;

namespace TrabajoTiendaZapatillas.Repositories
{
    public class RepositoryUsuarios
    {
        private UsuariosContext context;

        public RepositoryUsuarios(UsuariosContext context)
        {
            this.context = context;
        }

        //Funcion para sacar el id maximo
        private int GetMaxIdUsuario()
        {
            if (this.context.Usuarios.Count() == 0)
            {
                return 1;
            }
            else
            {
                return this.context.Usuarios.Max(z => z.IdUsuario);
            }
        }

        public async Task RegisterUser(string nombre, string dni, string direccion, string telefono, string email, string password)
        {
            Usuario user = new Usuario();
            user.IdUsuario = this.GetMaxIdUsuario();
            user.Nombre = nombre;
            user.Dni = dni;
            user.Direccion = direccion;
            user.Telefono = telefono;
            user.Email = email;


            //CADA USER TENDRA UN SALT DISTINTO
            user.Salt = HelperCriptography.GenerateSalt();
            //CIFRAMOS EL PASSWORD DEL USUARIO CON SU SALT
            user.Password = HelperCriptography.EncriptPassword(password, user.Salt);
            this.context.Usuarios.Add(user);
            await this.context.SaveChangesAsync();
        }
    }
}
