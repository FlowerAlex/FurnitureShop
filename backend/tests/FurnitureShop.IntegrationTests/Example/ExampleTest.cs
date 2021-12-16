using System.Threading.Tasks;
using FurnitureShop.Core.Contracts.Mobile.Categories;
using Xunit;

namespace FurnitureShop.IntegrationTests.Example
{
    public class ExampleTest : TestsBase<UnauthenticatedFurnitureShopTestApp>
    {
        [Fact]
        public async Task Example_test()
        {
            var result = await App.Command.RunAsync(new CreateCategory
            {
                CategoryName = "Sypialnia",
            });
            Assert.True(result.WasSuccessful);
        }
    }
}
