using TrabajoTiendaZapatillas.Data;
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

        public async Task RegisterUser(string nombre, string email,  string password, string telefono, string direccion)
        {
            Usuario user = new Usuario();
            user.IdUsuario = this.GetMaxIdUsuario();
            user.Nombre = nombre;
            user.Dni =
            user.Email = email;
            user.Telefono = telefono;
            user.Direccion
            //CADA USER TENDRA UN SALT DISTINTO
            user.Salt = HelperCriptography.GenerateSalt();
            //CIFRAMOS EL PASSWORD DEL USUARIO CON SU SALT
            user.Password = HelperCriptography.EncriptPassword(password, user.Salt);
            this.context.Usuarios.Add(user);
            await this.context.SaveChangesAsync();
        }
    }
}
