using Microsoft.AspNetCore.Mvc;

namespace SimpleRestApi.Controllers
{
	[ApiController]
	[Route("[controller]")]
	public class WeatherForecastController : ControllerBase
	{
		[HttpGet]
		public IActionResult Get()
		{
			return Ok(new { Message = "Hello, World!" });
		}
	}
}
