using System;
using System.Threading.Tasks;
using Xunit;

namespace FurnitureShop.IntegrationTests
{
    public abstract class TestsBase<TApp> : IAsyncLifetime, IDisposable
        where TApp : FurnitureShopTestApp, new()
    {
        protected TApp App { get; private set; }

        public TestsBase()
        {
            App = new TApp();
        }

        Task IAsyncLifetime.InitializeAsync() => App.InitializeAsync();
        Task IAsyncLifetime.DisposeAsync() => App.DisposeAsync().AsTask();
        void IDisposable.Dispose() => App.Dispose();
    }
}
