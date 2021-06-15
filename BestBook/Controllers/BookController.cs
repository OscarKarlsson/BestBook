using BestBook.Model;
using BestBook.ViewModels;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Session;
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
            IEnumerable<Genre> genreList = Context.Genres;
            ViewData["genres"] = genreList;
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
                return RedirectToAction("Index","Home");
            }
            IEnumerable<Genre> genreList = Context.Genres;
            ViewData["genres"] = genreList;
            return View(book);
        }
        public IActionResult SearchBook(string SearchText)
        {
            var books = Context.Books.Where(b => b.Name.Contains(SearchText));
            return View(books);
        }
        public IActionResult BookDetails(int id)
        {
            var reviewList = Context.Reviews.Where(b => b.BookId == id).ToList();
            ViewData["reviews"] = reviewList;
            var book = Context.Books.FirstOrDefault(b => b.Id == id);

            return View(book);
        }
        public IActionResult DeleteBook(int? id)
        {
            if (id == null || id == 0)
            {
                return NotFound();
            }
            var book = Context.Books.Find(id);
            if (book == null)
            {
                return NotFound();
            }
            return View(book);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult DeletePost(int? id)
        {
            var book = Context.Books.Find(id);
            if (book == null)
            {
                return NotFound();
            }
            
            foreach (var review in book.Reviews)
            {
                book.Reviews.Remove(review);
            }
            Context.SaveChanges();
            Context.Books.Remove(book);            
            Context.SaveChanges();
            return RedirectToAction("Index", "Home");
        }
        public IActionResult Edit(int? Id)
        {
            if (Id == null || Id == 0)
            {
                return NotFound();
            }
            var book = Context.Books.Find(Id);
            if (book == null)
            {
                return NotFound();
            }
            return View(book);
        }
        //POST - EDIT
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Edit(Book book)
        {
            if (ModelState.IsValid)
            {
                Context.Books.Update(book);
                Context.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(book);
        }

    }
}
