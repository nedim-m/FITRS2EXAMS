﻿
using exam.Model;
using exam.Services.IServices;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore.SqlServer.Query.Internal;

namespace exam.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class BaseController<T, TSearch> : ControllerBase where T : class where TSearch : class
    {
        protected readonly IService<T, TSearch> _service;
        protected readonly ILogger<BaseController<T, TSearch>> _logger;

        public BaseController(ILogger<BaseController<T, TSearch>> logger, IService<T, TSearch> service)
        {
            _logger = logger;
            _service = service;
        }

        [HttpGet()]
        public virtual async Task<PagedResult<T>> Get([FromQuery] TSearch search)
        {
            return await _service.Get(search);
        }

        [HttpGet("{id}")]
        public virtual async Task<T> GetById(int id)
        {
            return await _service.GetById(id);
        }
    }
}
