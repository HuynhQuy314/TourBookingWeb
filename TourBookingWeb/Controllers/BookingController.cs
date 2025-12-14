using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using TourBookingWeb.Data;
using TourBookingWeb.Models;
using NLog;

namespace TourBookingWeb.Controllers
{
    public class BookingController : Controller
    {
        private readonly TourDBContext _ctx;
        private static Logger logger = LogManager.GetCurrentClassLogger();

        public BookingController(TourDBContext ctx)
        {
            _ctx = ctx;
        }

        [HttpGet]
        public IActionResult Create(int tourId, DateTime departureDate)
        {
            var tour = _ctx.Tours
                .Include(t => t.Images)
                .FirstOrDefault(t => t.TourId == tourId);

            if (tour == null)
            {
                logger.Warn("Không tìm thấy tour với ID = {TourId}", tourId);
                return NotFound();
            }

            logger.Info("Người dùng mở trang đặt tour: {Title} – Ngày đi: {Date}", tour.Title, departureDate.ToString("dd/MM/yyyy"));

            ViewBag.AdultPrice = tour.AdultPrice;
            ViewBag.ChildPrice = tour.ChildPrice;

            var schedules = _ctx.TourSchedules
                .Where(s => s.TourId == tourId && s.RemainingSlot > 0)
                .OrderBy(s => s.DepartureDate)
                .ToList();

            ViewBag.Schedules = schedules;

            var booking = new Booking
            {
                TourId = tourId,
                DepartureDate = departureDate,
                BookingDate = DateTime.Now,
                Tour = tour
            };

            return View("Booking", booking);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Create(int TourId, int AdultQuantity, int ChildQuantity,
            string FullName, string Email, string Phone, string Address,
            string SpecialRequest, string PaymentMethod, DateTime DepartureDate)
        {
            var tour = _ctx.Tours.FirstOrDefault(t => t.TourId == TourId);
            if (tour == null)
            {
                logger.Error("Không tìm thấy tour khi đặt: ID = {TourId}", TourId);
                return NotFound();
            }

            var schedule = _ctx.TourSchedules.FirstOrDefault(s =>
                s.TourId == TourId && s.DepartureDate.Date == DepartureDate.Date);

            if (schedule == null)
            {
                logger.Warn("Không tìm thấy lịch khởi hành {Date} cho TourID = {TourId}", DepartureDate.ToString("dd/MM/yyyy"), TourId);
                TempData["Error"] = "Không tìm thấy lịch khởi hành.";
                return RedirectToAction("Index", "Tour");
            }

            int totalBooked = AdultQuantity + ChildQuantity;
            if (schedule.RemainingSlot < totalBooked)
            {
                logger.Warn("Không đủ chỗ: Đặt {Total}, còn lại {Available} – TourID = {TourId}", totalBooked, schedule.RemainingSlot, TourId);
                TempData["Error"] = "Không đủ chỗ còn lại.";
                return RedirectToAction("Create", new { tourId = TourId, departureDate = DepartureDate.ToString("yyyy-MM-dd") });
            }

            var user = _ctx.Users.FirstOrDefault(u => u.Email == Email);
            int userId;
            if (user != null)
            {
                userId = user.UserId;
            }
            else
            {
                var newUser = new User
                {
                    FullName = FullName,
                    Email = Email,
                    Phone = Phone,
                    Address = Address,
                    Role = "Guest",
                    Password = ""
                };
                _ctx.Users.Add(newUser);
                _ctx.SaveChanges();
                userId = newUser.UserId;
            }

            decimal total = (AdultQuantity * tour.AdultPrice) + (ChildQuantity * tour.ChildPrice);

            var booking = new Booking
            {
                BookingDate = DateTime.Now,
                TourId = TourId,
                TourScheduleId = schedule.TourScheduleId,
                DepartureDate = DepartureDate,
                AdultQuantity = AdultQuantity,
                ChildQuantity = ChildQuantity,
                TotalPrice = total,
                SpecialRequest = SpecialRequest,
                UserId = userId,
                PaymentMethod = PaymentMethod
            };

            _ctx.Bookings.Add(booking);
            schedule.RemainingSlot -= totalBooked;
            _ctx.SaveChanges();

            logger.Info(" Đặt tour thành công – TourID: {TourId}, Tên tour: {TourTitle}, Ngày đi: {DepartureDate}, Người đặt: {Name}, Email: {Email}, Số điện thoại: {Phone}, Địa chỉ: {Address}, Người lớn: {Adults}, Trẻ em: {Children}, Tổng tiền: {Total} đ, Thanh toán: {Payment}",
                TourId, tour.Title, DepartureDate.ToString("dd/MM/yyyy"),
                FullName, Email, Phone, Address,
                AdultQuantity, ChildQuantity, total.ToString("n0"), PaymentMethod);


            TempData["Success"] = "Đặt tour thành công!";
            return RedirectToAction("Index", "Tour");
        }
    }
}
