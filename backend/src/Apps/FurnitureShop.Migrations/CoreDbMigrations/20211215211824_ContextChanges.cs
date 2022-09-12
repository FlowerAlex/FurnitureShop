using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace FurnitureShop.Migrations.CoreDbMigrations
{
    public partial class ContextChanges : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Orders_Users_UserId",
                schema: "dbo",
                table: "Orders"
            );

            migrationBuilder.DropTable(name: "OrderProduct", schema: "dbo");

            migrationBuilder.RenameColumn(
                name: "OrdrerState",
                schema: "dbo",
                table: "Orders",
                newName: "OrderState"
            );

            migrationBuilder.CreateTable(
                name: "Order_Product",
                schema: "dbo",
                columns: table =>
                    new
                    {
                        Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                        OrderId = table.Column<Guid>(type: "uniqueidentifier", nullable: true),
                        ProductId = table.Column<Guid>(type: "uniqueidentifier", nullable: true),
                        Amount = table.Column<int>(type: "int", nullable: false)
                    },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Order_Product", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Order_Product_Orders_OrderId",
                        column: x => x.OrderId,
                        principalSchema: "dbo",
                        principalTable: "Orders",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict
                    );
                    table.ForeignKey(
                        name: "FK_Order_Product_Products_ProductId",
                        column: x => x.ProductId,
                        principalSchema: "dbo",
                        principalTable: "Products",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict
                    );
                }
            );

            migrationBuilder.CreateIndex(
                name: "IX_Order_Product_OrderId",
                schema: "dbo",
                table: "Order_Product",
                column: "OrderId"
            );

            migrationBuilder.CreateIndex(
                name: "IX_Order_Product_ProductId",
                schema: "dbo",
                table: "Order_Product",
                column: "ProductId"
            );

            migrationBuilder.AddForeignKey(
                name: "FK_Orders_Users_UserId",
                schema: "dbo",
                table: "Orders",
                column: "UserId",
                principalSchema: "dbo",
                principalTable: "Users",
                principalColumn: "Id",
                onDelete: ReferentialAction.SetNull
            );
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Orders_Users_UserId",
                schema: "dbo",
                table: "Orders"
            );

            migrationBuilder.DropTable(name: "Order_Product", schema: "dbo");

            migrationBuilder.RenameColumn(
                name: "OrderState",
                schema: "dbo",
                table: "Orders",
                newName: "OrdrerState"
            );

            migrationBuilder.CreateTable(
                name: "OrderProduct",
                schema: "dbo",
                columns: table =>
                    new
                    {
                        OrdersId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                        ProductsId = table.Column<Guid>(type: "uniqueidentifier", nullable: false)
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

            migrationBuilder.AddForeignKey(
                name: "FK_Orders_Users_UserId",
                schema: "dbo",
                table: "Orders",
                column: "UserId",
                principalSchema: "dbo",
                principalTable: "Users",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict
            );
        }
    }
}
