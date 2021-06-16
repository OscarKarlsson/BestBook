using BestBook.Model;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace BestBook.CustomAttributes
{
    public class ValidateAuthorIdExistInDb:ValidationAttribute
    {
        public new string ErrorMessage { get; set; } = "Invalid author. Use the search function to find your author.";
        private BookContext Context { get; set; } = new BookContext();        
        protected override ValidationResult IsValid(object value, ValidationContext validationContext)
        {            
            int id = (int)value;
            
            var authorExists = Context.Authors.Any(a => a.Id == id);
            if (!authorExists)
            {                
                return new ValidationResult(ErrorMessage);
                //return new ValidationResult(this.FormatErrorMessage(validationContext.DisplayName));
            }
            return null;
        }
    }
}
