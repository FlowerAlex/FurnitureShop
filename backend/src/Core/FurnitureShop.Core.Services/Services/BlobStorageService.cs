using Azure.Storage;
using Azure.Storage.Blobs;
using Azure.Storage.Blobs.Models;
using Azure.Storage.Blobs.Specialized;
using Azure.Storage.Sas;
using System;
using System.Collections.Generic;
using System.IO;
using System.Threading.Tasks;
using LeanCode.Time;
using FurnitureShop.Core.Contracts.Mobile.Blobs;

namespace FurnitureShop.Core.Services.Services
{
    public interface IBlobStorageService
    {
        Task<string> GetPhotoUploadLink(string blobName);
        Task<string> GetModelUploadLink(string blobName);
        Task<List<string>> GetPhotosUrls();
        Task<List<string>> GetModelsUrls();
    }
    public class BlobStorageService : IBlobStorageService
    {
        private string _blobConnectionString;
        private string _modelsContainerName;
        private string _photosContainerName;
        public BlobStorageService()
        {
            _blobConnectionString = "DefaultEndpointsProtocol=https;AccountName=furniturestoreblob1;AccountKey=7RElTWiIcqNeijKRBODpw6cBG9xxVOsWzriCs3bEXkLkGBt026Lvfcdi+Oec8Gg0Jn6eNDj4MEAVm365iIEb0g==;EndpointSuffix=core.windows.net";
            _modelsContainerName = "furniturestoremodels";
            _photosContainerName = "furniturestorephotos"; // narazie tutaj na sztywno póki nie wyjasnie czemu dependecy incejtion nie działa
        }
        public async Task UploadPhoto(string localFilePath, string blobName)
        {
            await UploadBlob(localFilePath,blobName,_photosContainerName);
        }
        public async Task UploadModel(string localFilePath, string blobName)
        {
            await UploadBlob(localFilePath,blobName,_modelsContainerName);
        }
        public async Task<List<string>> GetPhotosUrls()
        {
            return await GetAllBlobsUrlsFromContainer(_photosContainerName);
        }
        public async Task<List<string>> GetModelsUrls()
        {
            return await GetAllBlobsUrlsFromContainer(_modelsContainerName);
        }
        public async Task<string> GetPhotoUploadLink(string blobName)
        {
            return await GetBlobUploadLink(_photosContainerName,blobName);
        }
        public async Task<string> GetModelUploadLink(string blobName)
        {
            return await GetBlobUploadLink(_modelsContainerName,blobName);
        }
        private async Task UploadBlob(string localFilePath, string blobName, string blobContainerName)
        {
            BlobServiceClient blobServiceClient = new BlobServiceClient(_blobConnectionString);
            BlobContainerClient blobContainerClient = blobServiceClient.GetBlobContainerClient(blobContainerName);
            BlobClient blobClient = blobContainerClient.GetBlobClient(blobName);
            using FileStream fs = File.OpenRead(localFilePath);
            await blobClient.UploadAsync(fs,true);
        }
        private async Task<string> GetBlobUploadLink(string blobContainerName, string blobName)
        {
            BlobServiceClient blobServiceClient = new BlobServiceClient(_blobConnectionString);
            BlobContainerClient blobContainerClient = blobServiceClient.GetBlobContainerClient(blobContainerName);
            BlobClient blob = blobContainerClient.GetBlobClient(blobName);
            await blob.UploadAsync(System.IO.MemoryStream.Null);
            return blobContainerClient.Uri.AbsoluteUri + "/" + blob.Name;
        }
       
        private async Task<List<string>> GetAllBlobsUrlsFromContainer(string blobContainerName)
        {
            BlobServiceClient blobServiceClient = new BlobServiceClient(_blobConnectionString);
            BlobContainerClient blobContainerClient = blobServiceClient.GetBlobContainerClient(blobContainerName);
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