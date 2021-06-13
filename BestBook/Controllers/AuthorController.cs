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
            return View();
        }
        public IActionResult SearchAuthor(string name)
        {
            
            var authors = Context.Authors.Where(a => a.Name.Contains(name));
            return View(authors);
        }
        public IActionResult AuthorDetails(int id)
        {
            var author = Context.Authors.FirstOrDefault(b => b.Id == id);

            return View(author);

        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Create(Author author)
        {
            if (ModelState.IsValid)
            {
                Context.Authors.Add(author);
                Context.SaveChanges();
                return RedirectToAction("Index", "Home");
            }
            return View(author);
        }
    }
}
