using Microsoft.AspNetCore.Mvc;
using System;
using System.Diagnostics;
using System.Linq;

namespace SimpleWebApp.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class LoadController : ControllerBase
    {
        [HttpGet]
        public string GenerateLoad()
        {
            Stopwatch sw = Stopwatch.StartNew();
            // Simulate some CPU intensive work
            for (int i = 0; i < 1000000; i++)
            {
                Math.Sqrt(i);
            }
            sw.Stop();
            return $"Load generated in {sw.ElapsedMilliseconds} ms";
        }
    }
}