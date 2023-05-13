using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using NuggetTiendaZapatillasJPL.Models;
using System.Net.Http.Headers;
using System.Text;
using TrabajoTiendaZapatillas.Models;

namespace TrabajoTiendaZapatillas.Services
{
    public class ServiceApiZapatillas
    {
        private MediaTypeWithQualityHeaderValue Header;
        private string UrlApiZapatillas;

        public ServiceApiZapatillas(IConfiguration configuration)
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

        //METODOS DE ZAPATILLAS(TODOS SON METODOS LIBRES)

        //METODO PARA SACAR TODAS LAS ZAPATILLAS
        public async Task<List<Zapatilla>> GetZapatillassAsync()
        {
            string request = "api/Zapatillas";
            List<Zapatilla> zapatillas =
                await this.CallApiAsync<List<Zapatilla>>(request);
            return zapatillas;
        }

        //METODO PARA DETALLES DE CADA ZAPATILLA
        public async Task<Zapatilla> FindZapatillaAsync(int id)
        {
            using (HttpClient client = new HttpClient())
            {

                string request = "/api/Zapatillas/" + id;

                client.BaseAddress = new Uri(this.UrlApiZapatillas);

                client.DefaultRequestHeaders.Clear();

                client.DefaultRequestHeaders.Accept.Add(this.Header);

                HttpResponseMessage response = await client.GetAsync(request);

                if (response.IsSuccessStatusCode)
                {
                    Zapatilla zap =
                        await response.Content.ReadAsAsync<Zapatilla>();
                    return zap;
                }
                else
                {
                    return null;
                }
            }
        }

        public async Task<List<VistaZapatillasCategoria>> ZapatillasCategoriaAsync(string nombreCategoria)
        {
            string request = "api/Zapatillas/ZapatillasCategoria/" + nombreCategoria;
            List<VistaZapatillasCategoria> zapatillas =
                await this.CallApiAsync<List<VistaZapatillasCategoria>>(request);
            return zapatillas;
        }

       
    }
}
