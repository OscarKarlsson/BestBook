using BestBook.Model;
using BestBook.Models;
using BestBook.ViewModels;
using Humanizer;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;

namespace BestBook.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly BookContext _context;
        private static BookAuthor _bookAuthor;
        public HomeController(ILogger<HomeController> logger, BookContext context)
        {
            _context = context;
            _logger = logger;
        }
        public IActionResult about()
        {
            
            return View();
        }
        public IActionResult Index()
        {
            IEnumerable<Genre> genres = _context.Genres;
            return View(genres);
        }
        public IActionResult BooksIframe()
        {
            var books = _bookAuthor.Books;
            
            return View(books);
        }
        public IActionResult AuthorIframe()
        {
            var authors = _bookAuthor.Authors;
            return View(authors);
        }
        public IActionResult BooksByGenre(int id)
        {
            IEnumerable<Book> books = _context.Books.Where(b => b.GenreId == id).OrderBy(b => b.Name);

            return View(books);
        }
        public IActionResult ItemsByName(string SearchText)
        {
            _bookAuthor = new BookAuthor() { Books = _context.Books.Where(b => b.Name.Contains(SearchText)).ToList(), Authors = _context.Authors.Where(b => b.Name.Contains(SearchText)).ToList() };

            return View();
        }
        
        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
