using LeanCode.CQRS;
using LeanCode.CQRS.Execution;

namespace FurnitureShop.Core.Services.CQRS
{
    public interface ICommandHandler<TCommand> : ICommandHandler<CoreContext, TCommand>
        where TCommand : ICommand
    { }

    public interface IQueryHandler<TQuery, TResult> : IQueryHandler<CoreContext, TQuery, TResult>
        where TQuery : IQuery<TResult>
    { }
}
