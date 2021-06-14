using BestBook.Model;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;


namespace BestBook.Controllers
{
    public class ReviewController : Controller
    {
        public BookContext Context { get; set; }
        public ReviewController(BookContext context)
        {
            this.Context = context;
        }
        public IActionResult Index()
        {
            return View();
        }
        public IActionResult CreateReview(int bookId)
        {
            var book = Context.Books.FirstOrDefault(b => b.Id == bookId);
            TempData["book"] = book;
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult CreateReview(Review review)
        {
            if (ModelState.IsValid)
            {
                Context.Reviews.Add(review);
                Context.SaveChanges();
                return RedirectToAction("Index", "Home");
            }
            return View(review);
        }
    }
}
