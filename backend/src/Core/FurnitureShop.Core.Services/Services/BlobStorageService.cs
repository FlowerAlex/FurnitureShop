using Azure.Storage;
using Azure.Storage.Blobs;
using Azure.Storage.Blobs.Models;

namespace FurnitureShop.Core.Services.Services
{
    public interface IBlobStorageService
    {

    }
    public class BlobStorageService : IBlobStorageService
    {
        private string _blobConnectionString;
        private string _modelsContainerName;
        private string _photosContainerName; 
        public BlobStorageService(string blobConnString, string modelsContName, string photosContName)
        {
            _blobConnectionString = blobConnString;
            _modelsContainerName = modelsContName;
            _photosContainerName = photosContName;
        }
        private void UploadBlob(string localFilePath, string fileName, string blobContainerName)
        {
            BlobServiceClient blobServiceClient = new BlobServiceClient(_blobConnectionString);
            BlobContainerClient blobContainerClient = blobServiceClient.GetBlobContainerClient(blobContainerName);
            BlobClient blobClient = blobContainerClient.GetBlobClient(fileName);
            blobClient.Upload(localFilePath,true);
        }
        private void GetAllBlobsFromContainer(string blobContainerName)
        {
            BlobServiceClient blobServiceClient = new BlobServiceClient(_blobConnectionString);
            BlobContainerClient blobContainerClient = blobServiceClient.GetBlobContainerClient(blobContainerName);
            var blobs = blobContainerClient.GetBlobs();
            var enumerator = blobs.GetEnumerator();
            enumerator.MoveNext();
            var blob = enumerator.Current;
            //blob
        }
    }
}