using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace FurnitureShop.Migrations.CoreDbMigrations
{
    public partial class Final : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<Guid>(
                name: "ComplaintId",
                schema: "dbo",
                table: "Orders",
                type: "uniqueidentifier",
                nullable: true
            );

            migrationBuilder.AddColumn<Guid>(
                name: "DeliveryAddressId",
                schema: "dbo",
                table: "Orders",
                type: "uniqueidentifier",
                nullable: false,
                defaultValue: new Guid("00000000-0000-0000-0000-000000000000")
            );

            migrationBuilder.AddColumn<Guid>(
                name: "UserId",
                schema: "dbo",
                table: "Orders",
                type: "uniqueidentifier",
                nullable: false,
                defaultValue: new Guid("00000000-0000-0000-0000-000000000000")
            );

            migrationBuilder.CreateTable(
                name: "Address",
                schema: "dbo",
                columns: table =>
                    new
                    {
                        Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                        Street = table.Column<string>(type: "nvarchar(max)", nullable: false),
                        City = table.Column<string>(type: "nvarchar(max)", nullable: false),
                        State = table.Column<string>(type: "nvarchar(max)", nullable: false),
                        PostalCode = table.Column<string>(type: "nvarchar(max)", nullable: false),
                        Country = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Address", x => x.Id);
                }
            );

            migrationBuilder.CreateTable(
                name: "Complaint",
                schema: "dbo",
                columns: table =>
                    new
                    {
                        Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                        UserId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                        Text = table.Column<string>(type: "nvarchar(max)", nullable: false),
                        Response = table.Column<string>(type: "nvarchar(max)", nullable: true),
                        CreatedDate = table.Column<DateTime>(type: "datetime2", nullable: false),
                    },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Complaint", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Complaint_AspNetUsers_UserId",
                        column: x => x.UserId,
                        principalSchema: "auth",
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade
                    );
                }
            );

            migrationBuilder.CreateTable(
                name: "Review",
                schema: "dbo",
                columns: table =>
                    new
                    {
                        Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                        UserId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                        ProductId = table.Column<Guid>(type: "uniqueidentifier", nullable: true),
                        Text = table.Column<string>(type: "nvarchar(max)", nullable: false),
                        Rating = table.Column<double>(type: "float", nullable: false),
                        CreatedDate = table.Column<DateTime>(type: "datetime2", nullable: false),
                    },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Review", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Review_AspNetUsers_UserId",
                        column: x => x.UserId,
                        principalSchema: "auth",
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade
                    );
                    table.ForeignKey(
                        name: "FK_Review_Products_ProductId",
                        column: x => x.ProductId,
                        principalSchema: "dbo",
                        principalTable: "Products",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict
                    );
                }
            );

            migrationBuilder.CreateIndex(
                name: "IX_Orders_ComplaintId",
                schema: "dbo",
                table: "Orders",
                column: "ComplaintId",
                unique: true,
                filter: "[ComplaintId] IS NOT NULL"
            );

            migrationBuilder.CreateIndex(
                name: "IX_Orders_DeliveryAddressId",
                schema: "dbo",
                table: "Orders",
                column: "DeliveryAddressId",
                unique: true
            );

            migrationBuilder.CreateIndex(
                name: "IX_Orders_UserId",
                schema: "dbo",
                table: "Orders",
                column: "UserId"
            );

            migrationBuilder.CreateIndex(
                name: "IX_Complaint_UserId",
                schema: "dbo",
                table: "Complaint",
                column: "UserId"
            );

            migrationBuilder.CreateIndex(
                name: "IX_Review_ProductId",
                schema: "dbo",
                table: "Review",
                column: "ProductId"
            );

            migrationBuilder.CreateIndex(
                name: "IX_Review_UserId",
                schema: "dbo",
                table: "Review",
                column: "UserId"
            );

            migrationBuilder.AddForeignKey(
                name: "FK_Orders_Address_DeliveryAddressId",
                schema: "dbo",
                table: "Orders",
                column: "DeliveryAddressId",
                principalSchema: "dbo",
                principalTable: "Address",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade
            );

            migrationBuilder.AddForeignKey(
                name: "FK_Orders_AspNetUsers_UserId",
                schema: "dbo",
                table: "Orders",
                column: "UserId",
                principalSchema: "auth",
                principalTable: "AspNetUsers",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade
            );

            migrationBuilder.AddForeignKey(
                name: "FK_Orders_Complaint_ComplaintId",
                schema: "dbo",
                table: "Orders",
                column: "ComplaintId",
                principalSchema: "dbo",
                principalTable: "Complaint",
                principalColumn: "Id"
            );
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Orders_Address_DeliveryAddressId",
                schema: "dbo",
                table: "Orders"
            );

            migrationBuilder.DropForeignKey(
                name: "FK_Orders_AspNetUsers_UserId",
                schema: "dbo",
                table: "Orders"
            );

            migrationBuilder.DropForeignKey(
                name: "FK_Orders_Complaint_ComplaintId",
                schema: "dbo",
                table: "Orders"
            );

            migrationBuilder.DropTable(name: "Address", schema: "dbo");

            migrationBuilder.DropTable(name: "Complaint", schema: "dbo");

            migrationBuilder.DropTable(name: "Review", schema: "dbo");

            migrationBuilder.DropIndex(
                name: "IX_Orders_ComplaintId",
                schema: "dbo",
                table: "Orders"
            );

            migrationBuilder.DropIndex(
                name: "IX_Orders_DeliveryAddressId",
                schema: "dbo",
                table: "Orders"
            );

            migrationBuilder.DropIndex(name: "IX_Orders_UserId", schema: "dbo", table: "Orders");

            migrationBuilder.DropColumn(name: "ComplaintId", schema: "dbo", table: "Orders");

            migrationBuilder.DropColumn(name: "DeliveryAddressId", schema: "dbo", table: "Orders");

            migrationBuilder.DropColumn(name: "UserId", schema: "dbo", table: "Orders");
        }
    }
}
