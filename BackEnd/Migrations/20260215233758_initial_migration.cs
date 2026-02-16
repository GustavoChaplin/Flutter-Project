using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace BackEnd.Migrations
{
    /// <inheritdoc />
    public partial class initial_migration : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "RecurrentBills",
                columns: table => new
                {
                    id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    title = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    description = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    amount = table.Column<decimal>(type: "decimal(10,2)", nullable: false),
                    due_date = table.Column<DateTime>(type: "datetime2", nullable: false),
                    end_date = table.Column<DateTime>(type: "datetime2", nullable: false),
                    frequency = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    recurrence_type = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    total_installments = table.Column<int>(type: "int", nullable: false),
                    paid_installments = table.Column<int>(type: "int", nullable: false),
                    is_active = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_RecurrentBills", x => x.id);
                });

            migrationBuilder.CreateTable(
                name: "Users",
                columns: table => new
                {
                    id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    user_name = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    sur_name = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    email = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    user_password = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    cpf = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    income = table.Column<decimal>(type: "decimal(10,2)", nullable: false),
                    expenses = table.Column<decimal>(type: "decimal(10,2)", nullable: false),
                    balance = table.Column<decimal>(type: "decimal(10,2)", nullable: false),
                    gender = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    created_at = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Users", x => x.id);
                });

            migrationBuilder.CreateTable(
                name: "Budgets",
                columns: table => new
                {
                    id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    title = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    expended_value = table.Column<decimal>(type: "decimal(10,2)", nullable: false),
                    limit_value = table.Column<decimal>(type: "decimal(10,2)", nullable: false),
                    id_user = table.Column<int>(type: "int", nullable: false),
                    created_at = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Budgets", x => x.id);
                    table.ForeignKey(
                        name: "FK_Budgets_Users_id_user",
                        column: x => x.id_user,
                        principalTable: "Users",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Pots",
                columns: table => new
                {
                    id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    title = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    target_value = table.Column<decimal>(type: "decimal(10,2)", nullable: false),
                    current_value = table.Column<decimal>(type: "decimal(10,2)", nullable: false),
                    id_user = table.Column<int>(type: "int", nullable: false),
                    created_at = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Pots", x => x.id);
                    table.ForeignKey(
                        name: "FK_Pots_Users_id_user",
                        column: x => x.id_user,
                        principalTable: "Users",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "UserTransactions",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    title = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    description_tran = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    value = table.Column<decimal>(type: "decimal(10,2)", nullable: false),
                    type = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    creation_date = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    pay_date = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    id_user = table.Column<int>(type: "int", nullable: false),
                    id_recbill = table.Column<int>(type: "int", nullable: false),
                    recbillid = table.Column<int>(type: "int", nullable: true),
                    id_pot = table.Column<int>(type: "int", nullable: false),
                    potid = table.Column<int>(type: "int", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_UserTransactions", x => x.Id);
                    table.ForeignKey(
                        name: "FK_UserTransactions_Pots_potid",
                        column: x => x.potid,
                        principalTable: "Pots",
                        principalColumn: "id");
                    table.ForeignKey(
                        name: "FK_UserTransactions_RecurrentBills_recbillid",
                        column: x => x.recbillid,
                        principalTable: "RecurrentBills",
                        principalColumn: "id");
                    table.ForeignKey(
                        name: "FK_UserTransactions_Users_id_user",
                        column: x => x.id_user,
                        principalTable: "Users",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_Budgets_id_user",
                table: "Budgets",
                column: "id_user");

            migrationBuilder.CreateIndex(
                name: "IX_Pots_id_user",
                table: "Pots",
                column: "id_user");

            migrationBuilder.CreateIndex(
                name: "IX_Users_cpf",
                table: "Users",
                column: "cpf",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_Users_email",
                table: "Users",
                column: "email",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_UserTransactions_id_user",
                table: "UserTransactions",
                column: "id_user");

            migrationBuilder.CreateIndex(
                name: "IX_UserTransactions_potid",
                table: "UserTransactions",
                column: "potid");

            migrationBuilder.CreateIndex(
                name: "IX_UserTransactions_recbillid",
                table: "UserTransactions",
                column: "recbillid");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Budgets");

            migrationBuilder.DropTable(
                name: "UserTransactions");

            migrationBuilder.DropTable(
                name: "Pots");

            migrationBuilder.DropTable(
                name: "RecurrentBills");

            migrationBuilder.DropTable(
                name: "Users");
        }
    }
}
