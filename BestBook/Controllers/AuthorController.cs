using BestBook.Model;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BestBook.Controllers
{
    public class AuthorController : Controller
    {
        public BookContext Context { get; set; }
        public AuthorController(BookContext context)
        {
            this.Context = context;
        }
        public IActionResult Index()
        {
            return View();
        }
        public IActionResult AddAuthor()
        {
            TempData["name"] = "Stephen";
            return View();
        }
        public IActionResult SearchAuthor(string name)
        {
            var authors = Context.Authors.Where(a => a.Name.Contains(name));
            return View(authors);
        }
            
    }
}
