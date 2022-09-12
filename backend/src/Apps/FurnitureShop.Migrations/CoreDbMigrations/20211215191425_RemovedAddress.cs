using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace FurnitureShop.Migrations.CoreDbMigrations
{
    public partial class RemovedAddress : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Orders_Address_AddressId",
                schema: "dbo",
                table: "Orders"
            );

            migrationBuilder.DropTable(name: "Address", schema: "dbo");

            migrationBuilder.DropIndex(name: "IX_Orders_AddressId", schema: "dbo", table: "Orders");

            migrationBuilder.DropColumn(name: "AddressId", schema: "dbo", table: "Orders");

            migrationBuilder.AlterColumn<string>(
                name: "Text",
                schema: "dbo",
                table: "Review",
                type: "nvarchar(max)",
                nullable: true,
                oldClrType: typeof(string),
                oldType: "nvarchar(max)"
            );

            migrationBuilder.AlterColumn<string>(
                name: "ModelUrl",
                schema: "dbo",
                table: "Products",
                type: "nvarchar(max)",
                nullable: true,
                oldClrType: typeof(string),
                oldType: "nvarchar(max)"
            );

            migrationBuilder.AlterColumn<string>(
                name: "State",
                schema: "dbo",
                table: "Orders",
                type: "nvarchar(max)",
                nullable: false,
                oldClrType: typeof(int),
                oldType: "int"
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

            migrationBuilder.AddColumn<DateTime>(
                name: "DeliveredDate",
                schema: "dbo",
                table: "Orders",
                type: "datetime2",
                nullable: true
            );

            migrationBuilder.AddColumn<DateTime>(
                name: "OrderedDate",
                schema: "dbo",
                table: "Orders",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified)
            );

            migrationBuilder.AddColumn<int>(
                name: "OrdrerState",
                schema: "dbo",
                table: "Orders",
                type: "int",
                nullable: false,
                defaultValue: 0
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
                name: "Street",
                schema: "dbo",
                table: "Orders",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: ""
            );
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(name: "City", schema: "dbo", table: "Orders");

            migrationBuilder.DropColumn(name: "Country", schema: "dbo", table: "Orders");

            migrationBuilder.DropColumn(name: "DeliveredDate", schema: "dbo", table: "Orders");

            migrationBuilder.DropColumn(name: "OrderedDate", schema: "dbo", table: "Orders");

            migrationBuilder.DropColumn(name: "OrdrerState", schema: "dbo", table: "Orders");

            migrationBuilder.DropColumn(name: "PostalCode", schema: "dbo", table: "Orders");

            migrationBuilder.DropColumn(name: "Street", schema: "dbo", table: "Orders");

            migrationBuilder.AlterColumn<string>(
                name: "Text",
                schema: "dbo",
                table: "Review",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "",
                oldClrType: typeof(string),
                oldType: "nvarchar(max)",
                oldNullable: true
            );

            migrationBuilder.AlterColumn<string>(
                name: "ModelUrl",
                schema: "dbo",
                table: "Products",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "",
                oldClrType: typeof(string),
                oldType: "nvarchar(max)",
                oldNullable: true
            );

            migrationBuilder.AlterColumn<int>(
                name: "State",
                schema: "dbo",
                table: "Orders",
                type: "int",
                nullable: false,
                oldClrType: typeof(string),
                oldType: "nvarchar(max)"
            );

            migrationBuilder.AddColumn<Guid>(
                name: "AddressId",
                schema: "dbo",
                table: "Orders",
                type: "uniqueidentifier",
                nullable: true
            );

            migrationBuilder.CreateTable(
                name: "Address",
                schema: "dbo",
                columns: table =>
                    new
                    {
                        Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                        City = table.Column<string>(type: "nvarchar(max)", nullable: false),
                        Country = table.Column<string>(type: "nvarchar(max)", nullable: false),
                        PostalCode = table.Column<string>(type: "nvarchar(max)", nullable: false),
                        State = table.Column<string>(type: "nvarchar(max)", nullable: false),
                        Street = table.Column<string>(type: "nvarchar(max)", nullable: false)
                    },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Address", x => x.Id);
                }
            );

            migrationBuilder.CreateIndex(
                name: "IX_Orders_AddressId",
                schema: "dbo",
                table: "Orders",
                column: "AddressId",
                unique: true,
                filter: "[AddressId] IS NOT NULL"
            );

            migrationBuilder.AddForeignKey(
                name: "FK_Orders_Address_AddressId",
                schema: "dbo",
                table: "Orders",
                column: "AddressId",
                principalSchema: "dbo",
                principalTable: "Address",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict
            );
        }
    }
}
