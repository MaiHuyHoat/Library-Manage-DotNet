﻿using System;
using System.Collections.Generic;

namespace QLTV.Data.Model
{
    public partial class Book
    {
        public Book()
        {
            BorrowRequest = new HashSet<BorrowRequest>();
        }

        public int Id { get; set; }
        public string Image { get; set; }
        public string Name { get; set; }
        public int? AuthorId { get; set; }
        public decimal? Price { get; set; }
        public DateTime PublicationYear { get; set; }
        public int? NumberOffPages { get; set; }
        public int? CategoryId { get; set; }
        public int Amount { get; set; }
        public int? PublisherId { get; set; }
        public DateTime CreateDay { get; set; }
        public int Deleted { get; set; }

        public Author Author { get; set; }
        public Category Category { get; set; }
        public Publisher Publisher { get; set; }
        public ICollection<BorrowRequest> BorrowRequest { get; set; }
    }
}
