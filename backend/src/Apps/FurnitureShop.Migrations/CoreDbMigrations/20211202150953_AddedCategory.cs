using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace FurnitureShop.Migrations.CoreDbMigrations
{
    public partial class AddedCategory : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Categories",
                schema: "dbo",
                columns: table =>
                    new
                    {
                        Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                        Name = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Categories", x => x.Id);
                }
            );
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(name: "Categories", schema: "dbo");
        }
    }
}
