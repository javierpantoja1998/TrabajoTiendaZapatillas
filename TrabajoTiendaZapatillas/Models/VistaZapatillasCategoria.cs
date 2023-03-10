using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace TrabajoTiendaZapatillas.Models
{
    [Table("VISTA_ZAPATILLAS_CATEGORIA")]
    public class VistaZapatillasCategoria
    {
        [Key]
        [Column("IDZAPATILLA")]
        public int IdZapatilla { get; set; }


        [Column("NOMBRE")]
        public string Nombre { get; set; }

        [Column("TALLA")]
        public decimal Talla { get; set; }

        [Column("UNIDADESTOCK")]
        public int UnidadesStock { get; set; }

        [Column("DESCRIPCION")]
        public string Descripcion { get; set; }

        [Column("IMAGEN")]
        public string Imagen { get; set; }

        [Column("PRECIO")]
        public decimal Precio { get; set; }

        [Column("NOMBRECATEGORIA")]
        public string NombreCategoria { get; set; }
    }
}
