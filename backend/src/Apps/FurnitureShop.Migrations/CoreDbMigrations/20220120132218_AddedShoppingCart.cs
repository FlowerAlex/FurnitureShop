using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace FurnitureShop.Migrations.CoreDbMigrations
{
    public partial class AddedShoppingCart : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "ShoppingCarts",
                schema: "dbo",
                columns: table =>
                    new
                    {
                        Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                        UserId = table.Column<Guid>(type: "uniqueidentifier", nullable: true)
                    },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ShoppingCarts", x => x.Id);
                    table.ForeignKey(
                        name: "FK_ShoppingCarts_Users_UserId",
                        column: x => x.UserId,
                        principalSchema: "dbo",
                        principalTable: "Users",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.SetNull
                    );
                }
            );

            migrationBuilder.CreateTable(
                name: "ShoppingCartProduct",
                schema: "dbo",
                columns: table =>
                    new
                    {
                        Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                        ShoppingCartId = table.Column<Guid>(
                            type: "uniqueidentifier",
                            nullable: true
                        ),
                        ProductId = table.Column<Guid>(type: "uniqueidentifier", nullable: true),
                        Amount = table.Column<int>(type: "int", nullable: false),
                    },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ShoppingCartProduct", x => x.Id);
                    table.ForeignKey(
                        name: "FK_ShoppingCartProduct_Products_ProductId",
                        column: x => x.ProductId,
                        principalSchema: "dbo",
                        principalTable: "Products",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict
                    );
                    table.ForeignKey(
                        name: "FK_ShoppingCartProduct_ShoppingCarts_ShoppingCartId",
                        column: x => x.ShoppingCartId,
                        principalSchema: "dbo",
                        principalTable: "ShoppingCarts",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict
                    );
                }
            );

            migrationBuilder.CreateIndex(
                name: "IX_ShoppingCartProduct_ProductId",
                schema: "dbo",
                table: "ShoppingCartProduct",
                column: "ProductId"
            );

            migrationBuilder.CreateIndex(
                name: "IX_ShoppingCartProduct_ShoppingCartId",
                schema: "dbo",
                table: "ShoppingCartProduct",
                column: "ShoppingCartId"
            );

            migrationBuilder.CreateIndex(
                name: "IX_ShoppingCarts_UserId",
                schema: "dbo",
                table: "ShoppingCarts",
                column: "UserId",
                unique: true,
                filter: "[UserId] IS NOT NULL"
            );
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(name: "ShoppingCartProduct", schema: "dbo");

            migrationBuilder.DropTable(name: "ShoppingCarts", schema: "dbo");
        }
    }
}
