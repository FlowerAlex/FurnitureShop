using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace FurnitureShop.Migrations.CoreDbMigrations
{
    public partial class AddedOrders : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Orders",
                schema: "dbo",
                columns: table =>
                    new { Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false), },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Orders", x => x.Id);
                }
            );

            migrationBuilder.CreateTable(
                name: "OrderProduct",
                schema: "dbo",
                columns: table =>
                    new
                    {
                        OrdersId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                        ProductsId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    },
                constraints: table =>
                {
                    table.PrimaryKey("PK_OrderProduct", x => new { x.OrdersId, x.ProductsId });
                    table.ForeignKey(
                        name: "FK_OrderProduct_Orders_OrdersId",
                        column: x => x.OrdersId,
                        principalSchema: "dbo",
                        principalTable: "Orders",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade
                    );
                    table.ForeignKey(
                        name: "FK_OrderProduct_Products_ProductsId",
                        column: x => x.ProductsId,
                        principalSchema: "dbo",
                        principalTable: "Products",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade
                    );
                }
            );

            migrationBuilder.CreateIndex(
                name: "IX_OrderProduct_ProductsId",
                schema: "dbo",
                table: "OrderProduct",
                column: "ProductsId"
            );
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(name: "OrderProduct", schema: "dbo");

            migrationBuilder.DropTable(name: "Orders", schema: "dbo");
        }
    }
}
