using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using FurnitureShop.Core.Contracts.Web.Blobs;
using FurnitureShop.Core.Domain;
using FurnitureShop.Core.Services.DataAccess;
using FurnitureShop.Core.Services.Services;
using Microsoft.EntityFrameworkCore;

namespace FurnitureShop.Core.Services.CQRS.Web.Blobs
{
    public class GetAllModelsUrlsQH : IQueryHandler<GetAllModelsUrls, List<string>>
    {
        private readonly CoreDbContext dbContext;
        private readonly IBlobStorageService blobStorageService;

        public GetAllModelsUrlsQH(CoreDbContext dbContext, IBlobStorageService blobStorageService)
        {
            this.dbContext = dbContext;
            this.blobStorageService = blobStorageService;
        }

        public async Task<List<string>> ExecuteAsync(CoreContext context, GetAllModelsUrls query)
        {
            return await blobStorageService.GetModelsUrls();
        }
    }
}
