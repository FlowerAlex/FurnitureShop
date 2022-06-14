using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using FurnitureShop.Core.Contracts.Mobile.Blobs;
using FurnitureShop.Core.Domain;
using FurnitureShop.Core.Services.DataAccess;
using FurnitureShop.Core.Services.Services;
using Microsoft.EntityFrameworkCore;

namespace FurnitureShop.Core.Services.CQRS.Mobile.Blobs
{
    public class GetPhotoUrlQH : IQueryHandler<GetPhotoUrl,string>
    {
        private readonly CoreDbContext dbContext;
        private readonly IBlobStorageService blobStorageService;

        public GetPhotoUrlQH(CoreDbContext dbContext, IBlobStorageService blobStorageService)
        {
            this.dbContext = dbContext;
            this.blobStorageService = blobStorageService;
        }

        public async Task<string> ExecuteAsync(CoreContext context, GetPhotoUrl query)
        { 
            return blobStorageService.GetPhotoUrl(query.BlobName);
        }
    }
}
