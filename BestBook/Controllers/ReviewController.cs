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
            ViewData["title"] = book.Name;
            ViewData["bookid"] = book.Id;
            

            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult CreateReview(Review review)
        {
            if (ModelState.IsValid)
            {
                var book = Context.Books.FirstOrDefault(b => b.Id == review.BookId);
                review.PostedDate = DateTime.Now;
                book.Reviews.Add(review);
                //Context.Books.FirstOrDefault(b => b.Id == review.BookId).Reviews.Add(review);
                Context.SaveChanges();
                ChangeAvgStars(review);
                TempData["message"] = "Review added to database";
                return RedirectToAction("Index", "Home");
            }
            return View(review);
        }
        
        private void ChangeAvgStars(Review review)
        {
            double reviewCount = Context.Reviews.Where(r => r.BookId == review.BookId).Count();
            double totalStars = (int)Context.Reviews.Where(r => r.BookId == review.BookId)
                .Select(r => r.Stars).Sum();
            var book = Context.Books.Where(b => b.Id == review.BookId).FirstOrDefault();
            double starValue = totalStars / reviewCount;
            book.AvgStar = (decimal)starValue;
            Context.SaveChanges();
        }
    }
}
