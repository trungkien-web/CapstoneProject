using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model;
using Repository;

namespace Service
{
	public class ImageService : IImageService
	{
		IImageRepository repository = new ImageRepository();

		public Image GetImageById(int id)
		{
			return repository.GetImageById(id);
		}
	}
}
