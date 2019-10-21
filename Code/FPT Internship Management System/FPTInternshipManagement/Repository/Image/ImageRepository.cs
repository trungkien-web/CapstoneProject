using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model;

namespace Repository
{
	class ImageRepository : IImageRepository
	{
		public Image GetImageById(int id)
		{
			FPTInternshipManagermentEntities ctx = new FPTInternshipManagermentEntities();
			var image = ctx.Images.Where(i => i.ImageID == id).FirstOrDefault();
			return image;
		}
	}
}
