﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using BestBook.CustomAttributes;
using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;

#nullable disable

namespace BestBook.Model
{
    [Table("Book")]
    public partial class Book
    {
        public Book()
        {
            Reviews = new HashSet<Review>();
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
        [ValidateAuthorIdExistInDb()]
        public int AuthorId { get; set; }
        [StringLength(4000)]
        public string PicLink { get; set; }
        [Column(TypeName = "decimal(3, 2)")]
        public decimal? AvgStar { get; set; }
        [NotMapped]
        [DisplayName("Upload File")]
        public IFormFile ImageFile { get; set; }

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
