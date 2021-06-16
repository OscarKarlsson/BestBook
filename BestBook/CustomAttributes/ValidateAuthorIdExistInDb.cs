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
        private BookContext Context { get; set; } = new BookContext();        
        protected override ValidationResult IsValid(object value, ValidationContext validationContext)
        {            
            int id = (int)value;                      
            var test = Context.Authors.Any(a => a.Id == id);
            if (!test)
            {
                return new ValidationResult(this.FormatErrorMessage(validationContext.DisplayName));
            }
            return null;
        }
    }
}
