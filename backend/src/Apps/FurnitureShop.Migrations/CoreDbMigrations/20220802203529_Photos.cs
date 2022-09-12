using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace FurnitureShop.Migrations.CoreDbMigrations
{
    public partial class Photos : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "PreviewPhotoUrl",
                schema: "dbo",
                table: "Products",
                newName: "PreviewPhotoId"
            );

            migrationBuilder.RenameColumn(
                name: "ModelUrl",
                schema: "dbo",
                table: "Products",
                newName: "ModelId"
            );

            migrationBuilder.CreateTable(
                name: "Photos",
                schema: "dbo",
                columns: table =>
                    new
                    {
                        Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                        ProductId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                        ProductId1 = table.Column<Guid>(type: "uniqueidentifier", nullable: true)
                    },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Photos", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Photos_Products_ProductId",
                        column: x => x.ProductId,
                        principalSchema: "dbo",
                        principalTable: "Products",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict
                    );
                    table.ForeignKey(
                        name: "FK_Photos_Products_ProductId1",
                        column: x => x.ProductId1,
                        principalSchema: "dbo",
                        principalTable: "Products",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict
                    );
                }
            );

            migrationBuilder.CreateIndex(
                name: "IX_Photos_ProductId",
                schema: "dbo",
                table: "Photos",
                column: "ProductId"
            );

            migrationBuilder.CreateIndex(
                name: "IX_Photos_ProductId1",
                schema: "dbo",
                table: "Photos",
                column: "ProductId1"
            );
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(name: "Photos", schema: "dbo");

            migrationBuilder.RenameColumn(
                name: "PreviewPhotoId",
                schema: "dbo",
                table: "Products",
                newName: "PreviewPhotoUrl"
            );

            migrationBuilder.RenameColumn(
                name: "ModelId",
                schema: "dbo",
                table: "Products",
                newName: "ModelUrl"
            );
        }
    }
}
