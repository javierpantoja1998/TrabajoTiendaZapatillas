using Microsoft.EntityFrameworkCore;
using System.Text;
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
        // FUNCIONALIDAD DEL REGISTRO
            
        ///////
     
        //Funcion para sacar el id maximo
        private int GetMaxIdUsuario()
        {
            if (this.context.Usuarios.Count() == 0)
            {
                return 1;
            }
            else
            {
                return this.context.Usuarios.Max(z => z.IdUsuario)+1;
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
        ////////////////
        
        // FUNCIONALIDAD DEL LOGIN

        //FUNCION PARA BUSCAR USUARIO
        public async Task<Usuario> FindUsuarioAsync(int idUsuario)
        {
            Usuario usuario =
                await this.context.Usuarios.FirstOrDefaultAsync
                (x => x.IdUsuario == idUsuario);
            return usuario;
        }

        public async Task<Usuario> FindEmailAsync(string email)
        {
            Usuario usuario =
                await this.context.Usuarios.FirstOrDefaultAsync
                (x => x.Email == email);
            return usuario;
        }


        //FUNCION PARA SACAR LOS USUARIOS
        public async Task <List<Usuario>> GetUsuariosAsync()
        {
            return await this.context.Usuarios.ToListAsync();
        }

        //FUNCION PARA SABER SI EXISTE UN USUARIO
        public async Task<Usuario> ExisteUsuario(string email, string password)
        {
            Usuario user = await this.FindEmailAsync(email);
            
            //utilizamos el método SequenceEqual
            //para comparar los dos arrays de bytes. 
            var usuario = await this.context.Usuarios.Where(x => x.Email == email && x.Password == HelperCriptography.EncriptPassword(password, user.Salt)).FirstOrDefaultAsync();
            //Devolvemos el usuario
            return usuario;
        }
    }
}
