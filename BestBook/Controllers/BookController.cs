using BestBook.Model;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BestBook.Controllers
{
    public class BookController : Controller
    {
        public BookContext Context { get; set; }
        public BookController(BookContext context)
        {
            this.Context = context;
        }
        public IActionResult Index()
        {
            return View();
        }
        public IActionResult Create()
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Create(Book book)
        {
            if (ModelState.IsValid)
            {
                Context.Books.Add(book);
                Context.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(book);
        }
    }
}
