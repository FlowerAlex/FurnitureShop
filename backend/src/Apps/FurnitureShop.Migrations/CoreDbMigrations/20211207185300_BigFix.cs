using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace FurnitureShop.Migrations.CoreDbMigrations
{
    public partial class BigFix : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Complaint_AspNetUsers_UserId",
                schema: "dbo",
                table: "Complaint");

            migrationBuilder.DropForeignKey(
                name: "FK_Orders_Address_DeliveryAddressId",
                schema: "dbo",
                table: "Orders");

            migrationBuilder.DropForeignKey(
                name: "FK_Orders_AspNetUsers_UserId",
                schema: "dbo",
                table: "Orders");

            migrationBuilder.DropForeignKey(
                name: "FK_Orders_Complaint_ComplaintId",
                schema: "dbo",
                table: "Orders");

            migrationBuilder.DropForeignKey(
                name: "FK_Products_Categories_CategoryId",
                schema: "dbo",
                table: "Products");

            migrationBuilder.DropForeignKey(
                name: "FK_Review_AspNetUsers_UserId",
                schema: "dbo",
                table: "Review");

            migrationBuilder.DropIndex(
                name: "IX_Orders_DeliveryAddressId",
                schema: "dbo",
                table: "Orders");

            migrationBuilder.DropColumn(
                name: "DeliveryAddressId",
                schema: "dbo",
                table: "Orders");

            migrationBuilder.AlterColumn<Guid>(
                name: "UserId",
                schema: "dbo",
                table: "Review",
                type: "uniqueidentifier",
                nullable: true,
                oldClrType: typeof(Guid),
                oldType: "uniqueidentifier");

            migrationBuilder.AddColumn<Guid>(
                name: "ProductId1",
                schema: "dbo",
                table: "Review",
                type: "uniqueidentifier",
                nullable: true);

            migrationBuilder.AlterColumn<Guid>(
                name: "UserId",
                schema: "dbo",
                table: "Orders",
                type: "uniqueidentifier",
                nullable: true,
                oldClrType: typeof(Guid),
                oldType: "uniqueidentifier");

            migrationBuilder.AddColumn<Guid>(
                name: "AddressId",
                schema: "dbo",
                table: "Orders",
                type: "uniqueidentifier",
                nullable: true);

            migrationBuilder.AlterColumn<Guid>(
                name: "UserId",
                schema: "dbo",
                table: "Complaint",
                type: "uniqueidentifier",
                nullable: true,
                oldClrType: typeof(Guid),
                oldType: "uniqueidentifier");

            migrationBuilder.AddColumn<Guid>(
                name: "OrderId",
                schema: "dbo",
                table: "Complaint",
                type: "uniqueidentifier",
                nullable: true);

            migrationBuilder.CreateTable(
                name: "Users",
                schema: "dbo",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    Firstname = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Surname = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Username = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    EmailAddress = table.Column<string>(type: "nvarchar(max)", nullable: false),
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Users", x => x.Id);
                });

            migrationBuilder.CreateIndex(
                name: "IX_Review_ProductId1",
                schema: "dbo",
                table: "Review",
                column: "ProductId1");

            migrationBuilder.CreateIndex(
                name: "IX_Orders_AddressId",
                schema: "dbo",
                table: "Orders",
                column: "AddressId",
                unique: true,
                filter: "[AddressId] IS NOT NULL");

            migrationBuilder.AddForeignKey(
                name: "FK_Complaint_Users_UserId",
                schema: "dbo",
                table: "Complaint",
                column: "UserId",
                principalSchema: "dbo",
                principalTable: "Users",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_Orders_Address_AddressId",
                schema: "dbo",
                table: "Orders",
                column: "AddressId",
                principalSchema: "dbo",
                principalTable: "Address",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_Orders_Complaint_ComplaintId",
                schema: "dbo",
                table: "Orders",
                column: "ComplaintId",
                principalSchema: "dbo",
                principalTable: "Complaint",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_Orders_Users_UserId",
                schema: "dbo",
                table: "Orders",
                column: "UserId",
                principalSchema: "dbo",
                principalTable: "Users",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_Products_Categories_CategoryId",
                schema: "dbo",
                table: "Products",
                column: "CategoryId",
                principalSchema: "dbo",
                principalTable: "Categories",
                principalColumn: "Id",
                onDelete: ReferentialAction.SetNull);

            migrationBuilder.AddForeignKey(
                name: "FK_Review_Products_ProductId1",
                schema: "dbo",
                table: "Review",
                column: "ProductId1",
                principalSchema: "dbo",
                principalTable: "Products",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_Review_Users_UserId",
                schema: "dbo",
                table: "Review",
                column: "UserId",
                principalSchema: "dbo",
                principalTable: "Users",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Complaint_Users_UserId",
                schema: "dbo",
                table: "Complaint");

            migrationBuilder.DropForeignKey(
                name: "FK_Orders_Address_AddressId",
                schema: "dbo",
                table: "Orders");

            migrationBuilder.DropForeignKey(
                name: "FK_Orders_Complaint_ComplaintId",
                schema: "dbo",
                table: "Orders");

            migrationBuilder.DropForeignKey(
                name: "FK_Orders_Users_UserId",
                schema: "dbo",
                table: "Orders");

            migrationBuilder.DropForeignKey(
                name: "FK_Products_Categories_CategoryId",
                schema: "dbo",
                table: "Products");

            migrationBuilder.DropForeignKey(
                name: "FK_Review_Products_ProductId1",
                schema: "dbo",
                table: "Review");

            migrationBuilder.DropForeignKey(
                name: "FK_Review_Users_UserId",
                schema: "dbo",
                table: "Review");

            migrationBuilder.DropTable(
                name: "Users",
                schema: "dbo");

            migrationBuilder.DropIndex(
                name: "IX_Review_ProductId1",
                schema: "dbo",
                table: "Review");

            migrationBuilder.DropIndex(
                name: "IX_Orders_AddressId",
                schema: "dbo",
                table: "Orders");

            migrationBuilder.DropColumn(
                name: "ProductId1",
                schema: "dbo",
                table: "Review");

            migrationBuilder.DropColumn(
                name: "AddressId",
                schema: "dbo",
                table: "Orders");

            migrationBuilder.DropColumn(
                name: "OrderId",
                schema: "dbo",
                table: "Complaint");

            migrationBuilder.AlterColumn<Guid>(
                name: "UserId",
                schema: "dbo",
                table: "Review",
                type: "uniqueidentifier",
                nullable: false,
                defaultValue: new Guid("00000000-0000-0000-0000-000000000000"),
                oldClrType: typeof(Guid),
                oldType: "uniqueidentifier",
                oldNullable: true);

            migrationBuilder.AlterColumn<Guid>(
                name: "UserId",
                schema: "dbo",
                table: "Orders",
                type: "uniqueidentifier",
                nullable: false,
                defaultValue: new Guid("00000000-0000-0000-0000-000000000000"),
                oldClrType: typeof(Guid),
                oldType: "uniqueidentifier",
                oldNullable: true);

            migrationBuilder.AddColumn<Guid>(
                name: "DeliveryAddressId",
                schema: "dbo",
                table: "Orders",
                type: "uniqueidentifier",
                nullable: false,
                defaultValue: new Guid("00000000-0000-0000-0000-000000000000"));

            migrationBuilder.AlterColumn<Guid>(
                name: "UserId",
                schema: "dbo",
                table: "Complaint",
                type: "uniqueidentifier",
                nullable: false,
                defaultValue: new Guid("00000000-0000-0000-0000-000000000000"),
                oldClrType: typeof(Guid),
                oldType: "uniqueidentifier",
                oldNullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_Orders_DeliveryAddressId",
                schema: "dbo",
                table: "Orders",
                column: "DeliveryAddressId",
                unique: true);

            migrationBuilder.AddForeignKey(
                name: "FK_Complaint_AspNetUsers_UserId",
                schema: "dbo",
                table: "Complaint",
                column: "UserId",
                principalSchema: "auth",
                principalTable: "AspNetUsers",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_Orders_Address_DeliveryAddressId",
                schema: "dbo",
                table: "Orders",
                column: "DeliveryAddressId",
                principalSchema: "dbo",
                principalTable: "Address",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_Orders_AspNetUsers_UserId",
                schema: "dbo",
                table: "Orders",
                column: "UserId",
                principalSchema: "auth",
                principalTable: "AspNetUsers",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_Orders_Complaint_ComplaintId",
                schema: "dbo",
                table: "Orders",
                column: "ComplaintId",
                principalSchema: "dbo",
                principalTable: "Complaint",
                principalColumn: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_Products_Categories_CategoryId",
                schema: "dbo",
                table: "Products",
                column: "CategoryId",
                principalSchema: "dbo",
                principalTable: "Categories",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_Review_AspNetUsers_UserId",
                schema: "dbo",
                table: "Review",
                column: "UserId",
                principalSchema: "auth",
                principalTable: "AspNetUsers",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
