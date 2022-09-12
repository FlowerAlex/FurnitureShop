using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace FurnitureShop.Migrations.CoreDbMigrations
{
    public partial class AddedPreviewPhoto : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Complaint_Users_UserId",
                schema: "dbo",
                table: "Complaint"
            );

            migrationBuilder.DropForeignKey(
                name: "FK_Orders_Complaint_ComplaintId",
                schema: "dbo",
                table: "Orders"
            );

            migrationBuilder.DropForeignKey(
                name: "FK_Review_Products_ProductId",
                schema: "dbo",
                table: "Review"
            );

            migrationBuilder.DropForeignKey(
                name: "FK_Review_Products_ProductId1",
                schema: "dbo",
                table: "Review"
            );

            migrationBuilder.DropForeignKey(
                name: "FK_Review_Users_UserId",
                schema: "dbo",
                table: "Review"
            );

            migrationBuilder.DropTable(name: "Order_Product", schema: "dbo");

            migrationBuilder.DropPrimaryKey(name: "PK_Review", schema: "dbo", table: "Review");

            migrationBuilder.DropPrimaryKey(
                name: "PK_Complaint",
                schema: "dbo",
                table: "Complaint"
            );

            migrationBuilder.RenameTable(
                name: "Review",
                schema: "dbo",
                newName: "Reviews",
                newSchema: "dbo"
            );

            migrationBuilder.RenameTable(
                name: "Complaint",
                schema: "dbo",
                newName: "Complaints",
                newSchema: "dbo"
            );

            migrationBuilder.RenameIndex(
                name: "IX_Review_UserId",
                schema: "dbo",
                table: "Reviews",
                newName: "IX_Reviews_UserId"
            );

            migrationBuilder.RenameIndex(
                name: "IX_Review_ProductId1",
                schema: "dbo",
                table: "Reviews",
                newName: "IX_Reviews_ProductId1"
            );

            migrationBuilder.RenameIndex(
                name: "IX_Review_ProductId",
                schema: "dbo",
                table: "Reviews",
                newName: "IX_Reviews_ProductId"
            );

            migrationBuilder.RenameIndex(
                name: "IX_Complaint_UserId",
                schema: "dbo",
                table: "Complaints",
                newName: "IX_Complaints_UserId"
            );

            migrationBuilder.AddColumn<string>(
                name: "PreviewPhotoUrl",
                schema: "dbo",
                table: "Products",
                type: "nvarchar(max)",
                nullable: true
            );

            migrationBuilder.AddPrimaryKey(
                name: "PK_Reviews",
                schema: "dbo",
                table: "Reviews",
                column: "Id"
            );

            migrationBuilder.AddPrimaryKey(
                name: "PK_Complaints",
                schema: "dbo",
                table: "Complaints",
                column: "Id"
            );

            migrationBuilder.CreateTable(
                name: "OrderProduct",
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
                    table.PrimaryKey("PK_OrderProduct", x => x.Id);
                    table.ForeignKey(
                        name: "FK_OrderProduct_Orders_OrderId",
                        column: x => x.OrderId,
                        principalSchema: "dbo",
                        principalTable: "Orders",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict
                    );
                    table.ForeignKey(
                        name: "FK_OrderProduct_Products_ProductId",
                        column: x => x.ProductId,
                        principalSchema: "dbo",
                        principalTable: "Products",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict
                    );
                }
            );

            migrationBuilder.CreateIndex(
                name: "IX_OrderProduct_OrderId",
                schema: "dbo",
                table: "OrderProduct",
                column: "OrderId"
            );

            migrationBuilder.CreateIndex(
                name: "IX_OrderProduct_ProductId",
                schema: "dbo",
                table: "OrderProduct",
                column: "ProductId"
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
                name: "FK_Orders_Complaints_ComplaintId",
                schema: "dbo",
                table: "Orders",
                column: "ComplaintId",
                principalSchema: "dbo",
                principalTable: "Complaints",
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
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Complaints_Users_UserId",
                schema: "dbo",
                table: "Complaints"
            );

            migrationBuilder.DropForeignKey(
                name: "FK_Orders_Complaints_ComplaintId",
                schema: "dbo",
                table: "Orders"
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

            migrationBuilder.DropTable(name: "OrderProduct", schema: "dbo");

            migrationBuilder.DropPrimaryKey(name: "PK_Reviews", schema: "dbo", table: "Reviews");

            migrationBuilder.DropPrimaryKey(
                name: "PK_Complaints",
                schema: "dbo",
                table: "Complaints"
            );

            migrationBuilder.DropColumn(name: "PreviewPhotoUrl", schema: "dbo", table: "Products");

            migrationBuilder.RenameTable(
                name: "Reviews",
                schema: "dbo",
                newName: "Review",
                newSchema: "dbo"
            );

            migrationBuilder.RenameTable(
                name: "Complaints",
                schema: "dbo",
                newName: "Complaint",
                newSchema: "dbo"
            );

            migrationBuilder.RenameIndex(
                name: "IX_Reviews_UserId",
                schema: "dbo",
                table: "Review",
                newName: "IX_Review_UserId"
            );

            migrationBuilder.RenameIndex(
                name: "IX_Reviews_ProductId1",
                schema: "dbo",
                table: "Review",
                newName: "IX_Review_ProductId1"
            );

            migrationBuilder.RenameIndex(
                name: "IX_Reviews_ProductId",
                schema: "dbo",
                table: "Review",
                newName: "IX_Review_ProductId"
            );

            migrationBuilder.RenameIndex(
                name: "IX_Complaints_UserId",
                schema: "dbo",
                table: "Complaint",
                newName: "IX_Complaint_UserId"
            );

            migrationBuilder.AddPrimaryKey(
                name: "PK_Review",
                schema: "dbo",
                table: "Review",
                column: "Id"
            );

            migrationBuilder.AddPrimaryKey(
                name: "PK_Complaint",
                schema: "dbo",
                table: "Complaint",
                column: "Id"
            );

            migrationBuilder.CreateTable(
                name: "Order_Product",
                schema: "dbo",
                columns: table =>
                    new
                    {
                        Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                        Amount = table.Column<int>(type: "int", nullable: false),
                        OrderId = table.Column<Guid>(type: "uniqueidentifier", nullable: true),
                        ProductId = table.Column<Guid>(type: "uniqueidentifier", nullable: true)
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
                name: "FK_Complaint_Users_UserId",
                schema: "dbo",
                table: "Complaint",
                column: "UserId",
                principalSchema: "dbo",
                principalTable: "Users",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict
            );

            migrationBuilder.AddForeignKey(
                name: "FK_Orders_Complaint_ComplaintId",
                schema: "dbo",
                table: "Orders",
                column: "ComplaintId",
                principalSchema: "dbo",
                principalTable: "Complaint",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict
            );

            migrationBuilder.AddForeignKey(
                name: "FK_Review_Products_ProductId",
                schema: "dbo",
                table: "Review",
                column: "ProductId",
                principalSchema: "dbo",
                principalTable: "Products",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict
            );

            migrationBuilder.AddForeignKey(
                name: "FK_Review_Products_ProductId1",
                schema: "dbo",
                table: "Review",
                column: "ProductId1",
                principalSchema: "dbo",
                principalTable: "Products",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict
            );

            migrationBuilder.AddForeignKey(
                name: "FK_Review_Users_UserId",
                schema: "dbo",
                table: "Review",
                column: "UserId",
                principalSchema: "dbo",
                principalTable: "Users",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict
            );
        }
    }
}
