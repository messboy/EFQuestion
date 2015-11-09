using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebAPIDemo.Models
{
    public class ViewModel
    {
        public string ArticleID { get; set; }

        public string Name { get; set; }

        public List<Category> Category { get; set; }

    }
}