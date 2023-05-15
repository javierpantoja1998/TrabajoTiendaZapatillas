using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using NuggetTiendaZapatillasJPL.Models;
using System.Net.Http.Headers;
using System.Text;
using TrabajoTiendaZapatillas.Models;

namespace TrabajoTiendaZapatillas.Services
{
    public class ServiceApiUsuarios
    {
        private MediaTypeWithQualityHeaderValue Header;
        private string UrlApiZapatillas;

        public ServiceApiUsuarios(IConfiguration configuration)
        {
            this.UrlApiZapatillas =
                configuration.GetValue<string>("ApiUrls:ApiOAuthZapatillas");
            this.Header =
                new MediaTypeWithQualityHeaderValue("application/json");
        }

        public async Task<string> GetTokenAsync
            (string email, string password)
        {
            using (HttpClient client = new HttpClient())
            {
                string request = "api/auth";
                client.BaseAddress = new Uri(this.UrlApiZapatillas);
                client.DefaultRequestHeaders.Clear();
                client.DefaultRequestHeaders.Accept.Add(this.Header);
                LoginModel model = new LoginModel
                {
                    Email = email,
                    Password = password
                };
                string jsonModel = JsonConvert.SerializeObject(model);
                StringContent content =
                    new StringContent(jsonModel, Encoding.UTF8, "application/json");
                HttpResponseMessage response =
                    await client.PostAsync(request, content);
                if (response.IsSuccessStatusCode)
                {
                    string data = await response.Content.ReadAsStringAsync();

                    JObject jsonObject = JObject.Parse(data);
                    string token =
                        jsonObject.GetValue("response").ToString();
                    return token;
                }
                else
                {
                    return null;
                }
            }
        }

        private async Task<T> CallApiAsync<T>(string request)
        {
            using (HttpClient client = new HttpClient())
            {
                client.BaseAddress = new Uri(this.UrlApiZapatillas);
                client.DefaultRequestHeaders.Clear();
                client.DefaultRequestHeaders.Accept.Add(this.Header);
                HttpResponseMessage response =
                    await client.GetAsync(request);
                if (response.IsSuccessStatusCode)
                {
                    T data = await response.Content.ReadAsAsync<T>();
                    return data;
                }
                else
                {
                    return default(T);
                }
            }
        }

        private async Task<T> CallApiAsync<T>(string request, string token)
        {
            using (HttpClient client = new HttpClient())
            {
                client.BaseAddress = new Uri(this.UrlApiZapatillas);
                client.DefaultRequestHeaders.Clear();
                client.DefaultRequestHeaders.Accept.Add(this.Header);
                client.DefaultRequestHeaders.Add
                    ("Authorization", "bearer " + token);
                HttpResponseMessage response =
                    await client.GetAsync(request);
                if (response.IsSuccessStatusCode)
                {
                    T data = await response.Content.ReadAsAsync<T>();
                    return data;
                }
                else
                {
                    return default(T);
                }
            }
        }

        //METODO PARA CREAR UN NUEVO USUARIO
        public async Task InsertUsuarioAsync
        (string nombre, string dni, string direccion, string telefono, string email, string password)
        {
            using (HttpClient client = new HttpClient())
            {
                string request = "api/Usuarios/Register/" + nombre + "/" + dni + "/" + direccion + "/" + telefono + "/" + email + "/" + password;
                client.BaseAddress = new Uri(this.UrlApiZapatillas);
                client.DefaultRequestHeaders.Clear();
                client.DefaultRequestHeaders.Accept.Add(this.Header);
                //TENEMOS QUE ENVIAR UN OBJETO JSON
                //NOS CREAMOS UN OBJETO DE LA CLASE DEPARTAMENTO
                HttpResponseMessage response =
                    await client.PostAsync(request, null);
            }
        }

        //METODO PROTEGIDO PARA RECUPERAR EL PERFIL
        //public async Task<Usuario> GetPerfilUsuarioAsync
        //    (string token)
        //{
        //    string request = "/api/Usuarios/PerfilUsuario";
        //    Usuario user = await
        //        this.CallApiAsync<Usuario>(request, token);
        //    return user;
        //}
    }
}
