using System;
using AutoMapper;
using FurnitureShop.Core.Contracts.Mobile.Orders;
using FurnitureShop.Core.Contracts.Mobile.Products;
using FurnitureShop.Core.Contracts.Mobile.Reviews;
using FurnitureShop.Core.Domain;
using LeanCode.DomainModels.Model;

namespace FurnitureShop.Core.Services.Services.MappingProfiles
{
    public class FurnitureShopMappingProfile : Profile
    {
        public FurnitureShopMappingProfile()
        {
            CreateMap<Order, OrderDTO>()
                .ForMember(dto => dto.Id, o => o.MapFrom(dto => Id<Order>.From(dto.Id)));

        }
    }
}
