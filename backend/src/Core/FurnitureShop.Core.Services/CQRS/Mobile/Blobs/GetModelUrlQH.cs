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
    public class GetModelUrlQH : IQueryHandler<GetModelUrl,string>
    {
        private readonly CoreDbContext dbContext;
        private readonly IBlobStorageService blobStorageService;

        public GetModelUrlQH(CoreDbContext dbContext, IBlobStorageService blobStorageService)
        {
            this.dbContext = dbContext;
            this.blobStorageService = blobStorageService;
        }

        public async Task<string> ExecuteAsync(CoreContext context, GetModelUrl query)
        { 
            return blobStorageService.GetModelUrl(query.BlobName);
        }
    }
}
