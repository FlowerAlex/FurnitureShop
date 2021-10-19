using System.Threading.Tasks;
using FurnitureShop.Core.Contracts.Example;
using Xunit;

namespace FurnitureShop.IntegrationTests.Example
{
    public class ExampleTest : TestsBase<UnauthenticatedFurnitureShopTestApp>
    {
        [Fact]
        public async Task Example_test()
        {
            var result = await App.Command.RunAsync(new ExampleCommand
            {
                Arg = "foo",
            });

            Assert.True(result.WasSuccessful);
        }
    }
}
