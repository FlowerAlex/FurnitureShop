using Microsoft.EntityFrameworkCore.Migrations;

namespace FurnitureShop.Migrations.CoreDbMigrations
{
    public partial class AddedPricesToOrderAndProduct : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<decimal>(
                name: "Price",
                schema: "dbo",
                table: "Products",
                type: "decimal(18,2)",
                nullable: false,
                defaultValue: 0m
            );

            migrationBuilder.AddColumn<decimal>(
                name: "Price",
                schema: "dbo",
                table: "Orders",
                type: "decimal(18,2)",
                nullable: false,
                defaultValue: 0m
            );
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(name: "Price", schema: "dbo", table: "Products");

            migrationBuilder.DropColumn(name: "Price", schema: "dbo", table: "Orders");
        }
    }
}
