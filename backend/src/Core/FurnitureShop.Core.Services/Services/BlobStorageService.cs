using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Azure.Storage.Blobs;
using Azure.Storage.Blobs.Models;

namespace FurnitureShop.Core.Services.Services
{
    public interface IBlobStorageService
    {
        Task<string> GetPhotoUploadId();
        Task<string> GetModelUploadId();
        Task<List<string>> GetPhotosUrls();
        Task<List<string>> GetModelsUrls();
    }

    public class BlobStorageService : IBlobStorageService
    {
        private string blobConnectionString;
        private string modelsContainerName;
        private string photosContainerName;

        public BlobStorageService()
        {
            blobConnectionString =
                "DefaultEndpointsProtocol=https;AccountName=furnitureshopstorage;AccountKey=6SRIXCdjvPICeOpofs4bKBTpEz+Wkgxkrp2Hv4wob/t+gLu+3qll4IYB/emr6AyiqfYK3KCqmYqM+AStRi2ouw==;EndpointSuffix=core.windows.net";
            modelsContainerName = "models";
            photosContainerName = "images";
        }

        public async Task<List<string>> GetPhotosUrls()
        {
            return await GetAllBlobsUrlsFromContainer(photosContainerName);
        }

        public async Task<List<string>> GetModelsUrls()
        {
            return await GetAllBlobsUrlsFromContainer(modelsContainerName);
        }

        public async Task<string> GetPhotoUploadId()
        {
            return await GetBlobUploadLink(photosContainerName);
        }

        public async Task<string> GetModelUploadId()
        {
            return await GetBlobUploadLink(modelsContainerName);
        }

        private async Task<string> GetBlobUploadLink(string blobContainerName)
        {
            BlobServiceClient blobServiceClient = new BlobServiceClient(blobConnectionString);
            BlobContainerClient blobContainerClient = blobServiceClient.GetBlobContainerClient(
                blobContainerName
            );
            string blobId = Guid.NewGuid().ToString();
            BlobClient blob = blobContainerClient.GetBlobClient(blobId);
            await blob.UploadAsync(System.IO.MemoryStream.Null);
            return blobId;
        }

        private async Task<List<string>> GetAllBlobsUrlsFromContainer(string blobContainerName)
        {
            BlobServiceClient blobServiceClient = new BlobServiceClient(blobConnectionString);
            BlobContainerClient blobContainerClient = blobServiceClient.GetBlobContainerClient(
                blobContainerName
            );
            var resultSegment = blobContainerClient.GetBlobsAsync().AsPages(default, 10);
            List<string> urls = new List<string>();
            await foreach (Azure.Page<BlobItem> blobPage in resultSegment)
            {
                foreach (BlobItem blobItem in blobPage.Values)
                {
                    urls.Add(blobContainerClient.Uri.AbsoluteUri + "/" + blobItem.Name);
                }
            }

            return urls;
        }
    }
}
