using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace TrabajoTiendaZapatillas.Models
{
    [Table("USUARIOS")]
    public class Usuario
    {
        [Key]
        [Column("IDUSUARIO")]
        public int IdUsuario { get; set; }

        [Column("NOMBRE")]
        public string Nombre { get; set; }

        [Column("DNI")]
        public string Dni { get; set; }

        [Column("DIRECCION")]
        public string Direccion { get; set; }

        [Column("TELEFONO")]
        public string Telefono { get; set; }

        [Column("EMAIL")]
        public string Email { get; set; }

        [Column("SALT")]
        public string Salt { get; set; }

        [Column("PASSWORD")]
        public byte[] Password { get; set; }
    }
}
