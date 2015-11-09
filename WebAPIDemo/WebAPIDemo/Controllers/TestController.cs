using AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using WebAPIDemo.Models;

using System.Data.Entity;

namespace WebAPIDemo.Controllers
{
    public class TestController : ApiController
    {
        

        public HttpResponseMessage Update(ViewModel viewModel)
        {
            try
            {
                using (TestEntities db = new TestEntities())
                {
                    var model = db.Article.Find(viewModel.ArticleID);

                    //mapping
                    Mapper.CreateMap<ViewModel, Article>()
                    .ForMember(i => i.ArticleID, s => s.MapFrom(i => i.ArticleID))
                    .ForMember(i => i.Name, s => s.MapFrom(i => i.Name))
                    .ForMember(i => i.Category, s => s.MapFrom(i => i.Category));
                    Mapper.Map(viewModel, model);

                    //問題 : ICollection<Category> 對應因為沒有mapping到PrimaryKey會報錯,請問該如何調整
                    // ps.Category 的資料可能資料庫以經存在也可能沒有需另外新增
                    
                    db.SaveChanges();

                }

                return Request.CreateResponse(HttpStatusCode.OK, true);

            }
            catch (Exception ex)
            {

                return Request.CreateResponse(HttpStatusCode.BadRequest, ex.Message); ;
            }
        }


        public HttpResponseMessage Get()
        {
            try
            {

                List<Article> model;
                using (TestEntities db = new TestEntities())
                {
                    model = db.Article.Include(a => a.Category).ToList();

                }

                return Request.CreateResponse(HttpStatusCode.OK, model);

            }
            catch (Exception ex)
            {

                return Request.CreateResponse(HttpStatusCode.BadRequest, ex.Message); ;
            }
        }
    }
}
