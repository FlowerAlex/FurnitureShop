using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace FurnitureShop.Migrations.CoreDbMigrations
{
    public partial class DeleteBehaviourFix : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Complaints_Users_UserId",
                schema: "dbo",
                table: "Complaints"
            );

            migrationBuilder.DropForeignKey(
                name: "FK_Favourites_Products_ProductId",
                schema: "dbo",
                table: "Favourites"
            );

            migrationBuilder.DropForeignKey(
                name: "FK_Favourites_Users_UserId",
                schema: "dbo",
                table: "Favourites"
            );

            migrationBuilder.DropForeignKey(
                name: "FK_OrderProduct_Orders_OrderId",
                schema: "dbo",
                table: "OrderProduct"
            );

            migrationBuilder.DropForeignKey(
                name: "FK_OrderProduct_Products_ProductId",
                schema: "dbo",
                table: "OrderProduct"
            );

            migrationBuilder.DropForeignKey(
                name: "FK_Orders_Users_UserId",
                schema: "dbo",
                table: "Orders"
            );

            migrationBuilder.DropForeignKey(
                name: "FK_Photos_Products_ProductId",
                schema: "dbo",
                table: "Photos"
            );

            migrationBuilder.DropForeignKey(
                name: "FK_Products_Categories_CategoryId",
                schema: "dbo",
                table: "Products"
            );

            migrationBuilder.DropForeignKey(
                name: "FK_Reviews_Products_ProductId",
                schema: "dbo",
                table: "Reviews"
            );

            migrationBuilder.DropForeignKey(
                name: "FK_Reviews_Products_ProductId1",
                schema: "dbo",
                table: "Reviews"
            );

            migrationBuilder.DropForeignKey(
                name: "FK_Reviews_Users_UserId",
                schema: "dbo",
                table: "Reviews"
            );

            migrationBuilder.DropForeignKey(
                name: "FK_ShoppingCartProduct_Products_ProductId",
                schema: "dbo",
                table: "ShoppingCartProduct"
            );

            migrationBuilder.DropForeignKey(
                name: "FK_ShoppingCartProduct_ShoppingCarts_ShoppingCartId",
                schema: "dbo",
                table: "ShoppingCartProduct"
            );

            migrationBuilder.DropForeignKey(
                name: "FK_ShoppingCarts_Users_UserId",
                schema: "dbo",
                table: "ShoppingCarts"
            );

            migrationBuilder.DropIndex(
                name: "IX_ShoppingCarts_UserId",
                schema: "dbo",
                table: "ShoppingCarts"
            );

            migrationBuilder.DropIndex(
                name: "IX_Reviews_ProductId1",
                schema: "dbo",
                table: "Reviews"
            );

            migrationBuilder.DropColumn(name: "ProductId1", schema: "dbo", table: "Reviews");

            migrationBuilder.AlterColumn<Guid>(
                name: "UserId",
                schema: "dbo",
                table: "ShoppingCarts",
                type: "uniqueidentifier",
                nullable: false,
                defaultValue: new Guid("00000000-0000-0000-0000-000000000000"),
                oldClrType: typeof(Guid),
                oldType: "uniqueidentifier",
                oldNullable: true
            );

            migrationBuilder.AlterColumn<Guid>(
                name: "ShoppingCartId",
                schema: "dbo",
                table: "ShoppingCartProduct",
                type: "uniqueidentifier",
                nullable: false,
                defaultValue: new Guid("00000000-0000-0000-0000-000000000000"),
                oldClrType: typeof(Guid),
                oldType: "uniqueidentifier",
                oldNullable: true
            );

            migrationBuilder.AlterColumn<Guid>(
                name: "ProductId",
                schema: "dbo",
                table: "ShoppingCartProduct",
                type: "uniqueidentifier",
                nullable: false,
                defaultValue: new Guid("00000000-0000-0000-0000-000000000000"),
                oldClrType: typeof(Guid),
                oldType: "uniqueidentifier",
                oldNullable: true
            );

            migrationBuilder.AlterColumn<Guid>(
                name: "UserId",
                schema: "dbo",
                table: "Reviews",
                type: "uniqueidentifier",
                nullable: false,
                defaultValue: new Guid("00000000-0000-0000-0000-000000000000"),
                oldClrType: typeof(Guid),
                oldType: "uniqueidentifier",
                oldNullable: true
            );

            migrationBuilder.AlterColumn<Guid>(
                name: "ProductId",
                schema: "dbo",
                table: "Reviews",
                type: "uniqueidentifier",
                nullable: false,
                defaultValue: new Guid("00000000-0000-0000-0000-000000000000"),
                oldClrType: typeof(Guid),
                oldType: "uniqueidentifier",
                oldNullable: true
            );

            migrationBuilder.AlterColumn<Guid>(
                name: "UserId",
                schema: "dbo",
                table: "Orders",
                type: "uniqueidentifier",
                nullable: false,
                defaultValue: new Guid("00000000-0000-0000-0000-000000000000"),
                oldClrType: typeof(Guid),
                oldType: "uniqueidentifier",
                oldNullable: true
            );

            migrationBuilder.AlterColumn<Guid>(
                name: "ProductId",
                schema: "dbo",
                table: "OrderProduct",
                type: "uniqueidentifier",
                nullable: false,
                defaultValue: new Guid("00000000-0000-0000-0000-000000000000"),
                oldClrType: typeof(Guid),
                oldType: "uniqueidentifier",
                oldNullable: true
            );

            migrationBuilder.AlterColumn<Guid>(
                name: "OrderId",
                schema: "dbo",
                table: "OrderProduct",
                type: "uniqueidentifier",
                nullable: false,
                defaultValue: new Guid("00000000-0000-0000-0000-000000000000"),
                oldClrType: typeof(Guid),
                oldType: "uniqueidentifier",
                oldNullable: true
            );

            migrationBuilder.AlterColumn<Guid>(
                name: "UserId",
                schema: "dbo",
                table: "Favourites",
                type: "uniqueidentifier",
                nullable: false,
                defaultValue: new Guid("00000000-0000-0000-0000-000000000000"),
                oldClrType: typeof(Guid),
                oldType: "uniqueidentifier",
                oldNullable: true
            );

            migrationBuilder.AlterColumn<Guid>(
                name: "ProductId",
                schema: "dbo",
                table: "Favourites",
                type: "uniqueidentifier",
                nullable: false,
                defaultValue: new Guid("00000000-0000-0000-0000-000000000000"),
                oldClrType: typeof(Guid),
                oldType: "uniqueidentifier",
                oldNullable: true
            );

            migrationBuilder.AlterColumn<Guid>(
                name: "UserId",
                schema: "dbo",
                table: "Complaints",
                type: "uniqueidentifier",
                nullable: false,
                defaultValue: new Guid("00000000-0000-0000-0000-000000000000"),
                oldClrType: typeof(Guid),
                oldType: "uniqueidentifier",
                oldNullable: true
            );

            migrationBuilder.AlterColumn<Guid>(
                name: "OrderId",
                schema: "dbo",
                table: "Complaints",
                type: "uniqueidentifier",
                nullable: false,
                defaultValue: new Guid("00000000-0000-0000-0000-000000000000"),
                oldClrType: typeof(Guid),
                oldType: "uniqueidentifier",
                oldNullable: true
            );

            migrationBuilder.CreateIndex(
                name: "IX_ShoppingCarts_UserId",
                schema: "dbo",
                table: "ShoppingCarts",
                column: "UserId",
                unique: true
            );

            migrationBuilder.AddForeignKey(
                name: "FK_Complaints_Users_UserId",
                schema: "dbo",
                table: "Complaints",
                column: "UserId",
                principalSchema: "dbo",
                principalTable: "Users",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade
            );

            migrationBuilder.AddForeignKey(
                name: "FK_Favourites_Products_ProductId",
                schema: "dbo",
                table: "Favourites",
                column: "ProductId",
                principalSchema: "dbo",
                principalTable: "Products",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade
            );

            migrationBuilder.AddForeignKey(
                name: "FK_Favourites_Users_UserId",
                schema: "dbo",
                table: "Favourites",
                column: "UserId",
                principalSchema: "dbo",
                principalTable: "Users",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade
            );

            migrationBuilder.AddForeignKey(
                name: "FK_OrderProduct_Orders_OrderId",
                schema: "dbo",
                table: "OrderProduct",
                column: "OrderId",
                principalSchema: "dbo",
                principalTable: "Orders",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade
            );

            migrationBuilder.AddForeignKey(
                name: "FK_OrderProduct_Products_ProductId",
                schema: "dbo",
                table: "OrderProduct",
                column: "ProductId",
                principalSchema: "dbo",
                principalTable: "Products",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade
            );

            migrationBuilder.AddForeignKey(
                name: "FK_Orders_Users_UserId",
                schema: "dbo",
                table: "Orders",
                column: "UserId",
                principalSchema: "dbo",
                principalTable: "Users",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade
            );

            migrationBuilder.AddForeignKey(
                name: "FK_Photos_Products_ProductId",
                schema: "dbo",
                table: "Photos",
                column: "ProductId",
                principalSchema: "dbo",
                principalTable: "Products",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade
            );

            migrationBuilder.AddForeignKey(
                name: "FK_Products_Categories_CategoryId",
                schema: "dbo",
                table: "Products",
                column: "CategoryId",
                principalSchema: "dbo",
                principalTable: "Categories",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict
            );

            migrationBuilder.AddForeignKey(
                name: "FK_Reviews_Products_ProductId",
                schema: "dbo",
                table: "Reviews",
                column: "ProductId",
                principalSchema: "dbo",
                principalTable: "Products",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade
            );

            migrationBuilder.AddForeignKey(
                name: "FK_Reviews_Users_UserId",
                schema: "dbo",
                table: "Reviews",
                column: "UserId",
                principalSchema: "dbo",
                principalTable: "Users",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade
            );

            migrationBuilder.AddForeignKey(
                name: "FK_ShoppingCartProduct_Products_ProductId",
                schema: "dbo",
                table: "ShoppingCartProduct",
                column: "ProductId",
                principalSchema: "dbo",
                principalTable: "Products",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade
            );

            migrationBuilder.AddForeignKey(
                name: "FK_ShoppingCartProduct_ShoppingCarts_ShoppingCartId",
                schema: "dbo",
                table: "ShoppingCartProduct",
                column: "ShoppingCartId",
                principalSchema: "dbo",
                principalTable: "ShoppingCarts",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade
            );

            migrationBuilder.AddForeignKey(
                name: "FK_ShoppingCarts_Users_UserId",
                schema: "dbo",
                table: "ShoppingCarts",
                column: "UserId",
                principalSchema: "dbo",
                principalTable: "Users",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade
            );
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Complaints_Users_UserId",
                schema: "dbo",
                table: "Complaints"
            );

            migrationBuilder.DropForeignKey(
                name: "FK_Favourites_Products_ProductId",
                schema: "dbo",
                table: "Favourites"
            );

            migrationBuilder.DropForeignKey(
                name: "FK_Favourites_Users_UserId",
                schema: "dbo",
                table: "Favourites"
            );

            migrationBuilder.DropForeignKey(
                name: "FK_OrderProduct_Orders_OrderId",
                schema: "dbo",
                table: "OrderProduct"
            );

            migrationBuilder.DropForeignKey(
                name: "FK_OrderProduct_Products_ProductId",
                schema: "dbo",
                table: "OrderProduct"
            );

            migrationBuilder.DropForeignKey(
                name: "FK_Orders_Users_UserId",
                schema: "dbo",
                table: "Orders"
            );

            migrationBuilder.DropForeignKey(
                name: "FK_Photos_Products_ProductId",
                schema: "dbo",
                table: "Photos"
            );

            migrationBuilder.DropForeignKey(
                name: "FK_Products_Categories_CategoryId",
                schema: "dbo",
                table: "Products"
            );

            migrationBuilder.DropForeignKey(
                name: "FK_Reviews_Products_ProductId",
                schema: "dbo",
                table: "Reviews"
            );

            migrationBuilder.DropForeignKey(
                name: "FK_Reviews_Users_UserId",
                schema: "dbo",
                table: "Reviews"
            );

            migrationBuilder.DropForeignKey(
                name: "FK_ShoppingCartProduct_Products_ProductId",
                schema: "dbo",
                table: "ShoppingCartProduct"
            );

            migrationBuilder.DropForeignKey(
                name: "FK_ShoppingCartProduct_ShoppingCarts_ShoppingCartId",
                schema: "dbo",
                table: "ShoppingCartProduct"
            );

            migrationBuilder.DropForeignKey(
                name: "FK_ShoppingCarts_Users_UserId",
                schema: "dbo",
                table: "ShoppingCarts"
            );

            migrationBuilder.DropIndex(
                name: "IX_ShoppingCarts_UserId",
                schema: "dbo",
                table: "ShoppingCarts"
            );

            migrationBuilder.AlterColumn<Guid>(
                name: "UserId",
                schema: "dbo",
                table: "ShoppingCarts",
                type: "uniqueidentifier",
                nullable: true,
                oldClrType: typeof(Guid),
                oldType: "uniqueidentifier"
            );

            migrationBuilder.AlterColumn<Guid>(
                name: "ShoppingCartId",
                schema: "dbo",
                table: "ShoppingCartProduct",
                type: "uniqueidentifier",
                nullable: true,
                oldClrType: typeof(Guid),
                oldType: "uniqueidentifier"
            );

            migrationBuilder.AlterColumn<Guid>(
                name: "ProductId",
                schema: "dbo",
                table: "ShoppingCartProduct",
                type: "uniqueidentifier",
                nullable: true,
                oldClrType: typeof(Guid),
                oldType: "uniqueidentifier"
            );

            migrationBuilder.AlterColumn<Guid>(
                name: "UserId",
                schema: "dbo",
                table: "Reviews",
                type: "uniqueidentifier",
                nullable: true,
                oldClrType: typeof(Guid),
                oldType: "uniqueidentifier"
            );

            migrationBuilder.AlterColumn<Guid>(
                name: "ProductId",
                schema: "dbo",
                table: "Reviews",
                type: "uniqueidentifier",
                nullable: true,
                oldClrType: typeof(Guid),
                oldType: "uniqueidentifier"
            );

            migrationBuilder.AddColumn<Guid>(
                name: "ProductId1",
                schema: "dbo",
                table: "Reviews",
                type: "uniqueidentifier",
                nullable: true
            );

            migrationBuilder.AlterColumn<Guid>(
                name: "UserId",
                schema: "dbo",
                table: "Orders",
                type: "uniqueidentifier",
                nullable: true,
                oldClrType: typeof(Guid),
                oldType: "uniqueidentifier"
            );

            migrationBuilder.AlterColumn<Guid>(
                name: "ProductId",
                schema: "dbo",
                table: "OrderProduct",
                type: "uniqueidentifier",
                nullable: true,
                oldClrType: typeof(Guid),
                oldType: "uniqueidentifier"
            );

            migrationBuilder.AlterColumn<Guid>(
                name: "OrderId",
                schema: "dbo",
                table: "OrderProduct",
                type: "uniqueidentifier",
                nullable: true,
                oldClrType: typeof(Guid),
                oldType: "uniqueidentifier"
            );

            migrationBuilder.AlterColumn<Guid>(
                name: "UserId",
                schema: "dbo",
                table: "Favourites",
                type: "uniqueidentifier",
                nullable: true,
                oldClrType: typeof(Guid),
                oldType: "uniqueidentifier"
            );

            migrationBuilder.AlterColumn<Guid>(
                name: "ProductId",
                schema: "dbo",
                table: "Favourites",
                type: "uniqueidentifier",
                nullable: true,
                oldClrType: typeof(Guid),
                oldType: "uniqueidentifier"
            );

            migrationBuilder.AlterColumn<Guid>(
                name: "UserId",
                schema: "dbo",
                table: "Complaints",
                type: "uniqueidentifier",
                nullable: true,
                oldClrType: typeof(Guid),
                oldType: "uniqueidentifier"
            );

            migrationBuilder.AlterColumn<Guid>(
                name: "OrderId",
                schema: "dbo",
                table: "Complaints",
                type: "uniqueidentifier",
                nullable: true,
                oldClrType: typeof(Guid),
                oldType: "uniqueidentifier"
            );

            migrationBuilder.CreateIndex(
                name: "IX_ShoppingCarts_UserId",
                schema: "dbo",
                table: "ShoppingCarts",
                column: "UserId",
                unique: true,
                filter: "[UserId] IS NOT NULL"
            );

            migrationBuilder.CreateIndex(
                name: "IX_Reviews_ProductId1",
                schema: "dbo",
                table: "Reviews",
                column: "ProductId1"
            );

            migrationBuilder.AddForeignKey(
                name: "FK_Complaints_Users_UserId",
                schema: "dbo",
                table: "Complaints",
                column: "UserId",
                principalSchema: "dbo",
                principalTable: "Users",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict
            );

            migrationBuilder.AddForeignKey(
                name: "FK_Favourites_Products_ProductId",
                schema: "dbo",
                table: "Favourites",
                column: "ProductId",
                principalSchema: "dbo",
                principalTable: "Products",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict
            );

            migrationBuilder.AddForeignKey(
                name: "FK_Favourites_Users_UserId",
                schema: "dbo",
                table: "Favourites",
                column: "UserId",
                principalSchema: "dbo",
                principalTable: "Users",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict
            );

            migrationBuilder.AddForeignKey(
                name: "FK_OrderProduct_Orders_OrderId",
                schema: "dbo",
                table: "OrderProduct",
                column: "OrderId",
                principalSchema: "dbo",
                principalTable: "Orders",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict
            );

            migrationBuilder.AddForeignKey(
                name: "FK_OrderProduct_Products_ProductId",
                schema: "dbo",
                table: "OrderProduct",
                column: "ProductId",
                principalSchema: "dbo",
                principalTable: "Products",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict
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

            migrationBuilder.AddForeignKey(
                name: "FK_Photos_Products_ProductId",
                schema: "dbo",
                table: "Photos",
                column: "ProductId",
                principalSchema: "dbo",
                principalTable: "Products",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict
            );

            migrationBuilder.AddForeignKey(
                name: "FK_Products_Categories_CategoryId",
                schema: "dbo",
                table: "Products",
                column: "CategoryId",
                principalSchema: "dbo",
                principalTable: "Categories",
                principalColumn: "Id",
                onDelete: ReferentialAction.SetNull
            );

            migrationBuilder.AddForeignKey(
                name: "FK_Reviews_Products_ProductId",
                schema: "dbo",
                table: "Reviews",
                column: "ProductId",
                principalSchema: "dbo",
                principalTable: "Products",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict
            );

            migrationBuilder.AddForeignKey(
                name: "FK_Reviews_Products_ProductId1",
                schema: "dbo",
                table: "Reviews",
                column: "ProductId1",
                principalSchema: "dbo",
                principalTable: "Products",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict
            );

            migrationBuilder.AddForeignKey(
                name: "FK_Reviews_Users_UserId",
                schema: "dbo",
                table: "Reviews",
                column: "UserId",
                principalSchema: "dbo",
                principalTable: "Users",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict
            );

            migrationBuilder.AddForeignKey(
                name: "FK_ShoppingCartProduct_Products_ProductId",
                schema: "dbo",
                table: "ShoppingCartProduct",
                column: "ProductId",
                principalSchema: "dbo",
                principalTable: "Products",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict
            );

            migrationBuilder.AddForeignKey(
                name: "FK_ShoppingCartProduct_ShoppingCarts_ShoppingCartId",
                schema: "dbo",
                table: "ShoppingCartProduct",
                column: "ShoppingCartId",
                principalSchema: "dbo",
                principalTable: "ShoppingCarts",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict
            );

            migrationBuilder.AddForeignKey(
                name: "FK_ShoppingCarts_Users_UserId",
                schema: "dbo",
                table: "ShoppingCarts",
                column: "UserId",
                principalSchema: "dbo",
                principalTable: "Users",
                principalColumn: "Id",
                onDelete: ReferentialAction.SetNull
            );
        }
    }
}
