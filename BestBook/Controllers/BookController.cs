using BestBook.Model;
using BestBook.ViewModels;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Session;
using Microsoft.Extensions.Hosting;
using System.IO;

namespace BestBook.Controllers
{
    public class BookController : Controller
    {
        private readonly IHostingEnvironment environment;

        public BookContext Context { get; set; }

        public BookController(BookContext context, IHostingEnvironment _environment)
        {
            this.Context = context;
            environment = _environment;
        }
        public IActionResult Index()
        {
            return View();
        }
        public int GetReviewCount(int bookid)
        {
            return Context.Reviews.Where(r => r.BookId == bookid).Count();
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
                //Save image to wwwroot/image
                string wwwRootPath = environment.ContentRootPath + "\\wwwroot\\";
                string fileName = Path.GetFileNameWithoutExtension(book.ImageFile.FileName);
                string extension = Path.GetExtension(book.ImageFile.FileName);
                book.PicLink = fileName = fileName + DateTime.Now.ToString("yymmssfff") + extension;
                string path = Path.Combine(wwwRootPath + @"\Image\", fileName);
                using (var fileStream = new FileStream(path, FileMode.Create))
                {
                    book.ImageFile.CopyTo(fileStream);
                }
                Context.Books.Add(book);
                Context.SaveChanges();
                TempData["message"] = "Book added to database";
                return RedirectToAction("Index","Home");
            }
            IEnumerable<Genre> genreList = Context.Genres;
            ViewData["genres"] = genreList;
            return View(book);
        }        

        public IActionResult SearchBook(string SearchText)
        {
            var books = Context.Books.Where(b => b.Name.Contains(SearchText));
            ViewBag.GetReviewCount =
                new Func<int, int>(ReturnCount);
            return View(books);
        }
        public int ReturnCount(int id)
        {
            return Context.Reviews.Where(r => r.BookId == id).Count();
        }
        public IActionResult BookDetails(int id)
        {
            var reviewList = Context.Reviews.Where(b => b.BookId == id).ToList();
            ViewData["reviews"] = reviewList;

            var bookAuthorID = Context.Books.Where(b => b.Id == id).Select(b => b.AuthorId).First();
            var author = Context.Authors.First(a => a.Id == bookAuthorID);
            ViewData["author"] = author.Name;
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
           
            Context.Books.Remove(book);
            Context.SaveChanges();
            return RedirectToAction("Index", "Home");
        }
        public IActionResult EditBook(int? Id)
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
        public IActionResult EditBook(Book newBook)
        {            
            if (ModelState.IsValid)
            {
                var book = Context.Books.Find(newBook.Id);
                book.Name = newBook.Name;
                book.Description = newBook.Description;                
                Context.Books.Update(book);
                Context.SaveChanges();
                return RedirectToAction("BookDetails", "Book", new { id = book.Id});
            }
            return View(newBook);
        }
        public IActionResult ListTop10Books()
        {
            var countBooks = Context.Books.Count();

            int amount = 10;

            if (countBooks <10)
            {
                amount = countBooks;
            }
            var books = Context.Books.OrderByDescending(b => b.AvgStar).Take(amount).ToList();

            foreach (var book in books)
            {
                if (book.AvgStar == null)
                {
                    book.AvgStar = 0;
                }
            }

            return View(books);
        }

    }
}
