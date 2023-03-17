using System.Security.Cryptography;
using System.Text;

namespace TrabajoTiendaZapatillas.Helpers
{
    public class HelperCriptography
    {
        public static string GenerateSalt()
        {
            //TENDREMOS UN SALT DE 50
            Random random = new Random();
            string salt = "";
            for (int i = 1; i <= 50; i++)
            {
                int aleat = random.Next(0, 255);
                char letra = Convert.ToChar(aleat);
                salt += letra;
            }
            return salt;
        }

        public static bool CompareArrays(byte[] a, byte[] b)
        {
            bool iguales = true;
            if (a.Length != b.Length)
            {
                iguales = false;
            }
            else
            {
                for (int i = 0; i < a.Length; i++)
                {
                    if (a[i].Equals(b[i]) == false)
                    {
                        iguales = false;
                        break;
                    }
                }
            }
            return iguales;
        }

        public static byte[] EncriptPassword(string password, string salt)
        {
            string contenido = password + salt;
            SHA512 sHA512 = SHA512.Create();
            //Convertimos nuestro contenido a bytes
            byte[] salida = Encoding.UTF8.GetBytes(contenido);
            //ITERACONES PARA NUESTRO PASSWORD
            for (int i = 0; i <= 107; i++)
            {
                salida = sHA512.ComputeHash(salida);
            }
            sHA512.Clear();
            return salida;
        }
    }
}
