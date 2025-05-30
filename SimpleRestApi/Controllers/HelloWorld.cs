using Microsoft.AspNetCore.Mvc;

namespace SimpleRestApi.Controllers
{
	[ApiController]
	[Route("hello")]
	public class HelloController : ControllerBase
	{
		[HttpGet]
		public IActionResult Get()
		{
			return Ok(new { Message = "Hello, World!" });
		}
	}
}
