using Microsoft.EntityFrameworkCore.Migrations;

namespace FurnitureShop.Migrations.CoreDbMigrations
{
    public partial class SimplifiedAddress : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(name: "City", schema: "dbo", table: "Orders");

            migrationBuilder.DropColumn(name: "Country", schema: "dbo", table: "Orders");

            migrationBuilder.DropColumn(name: "PostalCode", schema: "dbo", table: "Orders");

            migrationBuilder.DropColumn(name: "State", schema: "dbo", table: "Orders");

            migrationBuilder.RenameColumn(
                name: "Street",
                schema: "dbo",
                table: "Orders",
                newName: "Address"
            );

            migrationBuilder.AddColumn<string>(
                name: "Address",
                schema: "dbo",
                table: "Users",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: ""
            );
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(name: "Address", schema: "dbo", table: "Users");

            migrationBuilder.RenameColumn(
                name: "Address",
                schema: "dbo",
                table: "Orders",
                newName: "Street"
            );

            migrationBuilder.AddColumn<string>(
                name: "City",
                schema: "dbo",
                table: "Orders",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: ""
            );

            migrationBuilder.AddColumn<string>(
                name: "Country",
                schema: "dbo",
                table: "Orders",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: ""
            );

            migrationBuilder.AddColumn<string>(
                name: "PostalCode",
                schema: "dbo",
                table: "Orders",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: ""
            );

            migrationBuilder.AddColumn<string>(
                name: "State",
                schema: "dbo",
                table: "Orders",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: ""
            );
        }
    }
}
