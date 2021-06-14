using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

#nullable disable

namespace BestBook.Model
{
    [Table("Book")]
    public partial class Book
    {
        public Book()
        {
            //Reviews = new HashSet<Review>();
            Reviews = new List<Review>();
        }

        [Key]
        [Column("ID")]
        public int Id { get; set; }
        [Required]
        [StringLength(64)]
        public string Name { get; set; }
        [StringLength(500)]
        public string Description { get; set; }
        [Column("GenreID")]
        public int? GenreId { get; set; }
        [Column("AuthorID")]
        public int AuthorId { get; set; }
        [StringLength(100)]
        public string PicLink { get; set; }
        [Column(TypeName = "decimal(3, 2)")]
        public decimal? AvgStar { get; set; }

        [ForeignKey(nameof(AuthorId))]
        [InverseProperty("Books")]
        public virtual Author Author { get; set; }
        [ForeignKey(nameof(GenreId))]
        [InverseProperty("Books")]
        public virtual Genre Genre { get; set; }
        [InverseProperty(nameof(Review.Book))]
        public virtual ICollection<Review> Reviews { get; set; }
    }
}
