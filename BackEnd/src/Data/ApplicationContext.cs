using Microsoft.EntityFrameworkCore;
using BackEnd.src.Models;

namespace BackEnd.src.Data
{
    public class ApplicationContext : DbContext
    {
        public DbSet<Users> Users { get; set; }
        public DbSet<Budgets> Budgets { get; set; }
        public DbSet<Pots> Pots { get; set; }
        public DbSet<RecurrentBills> RecurrentBills { get; set; }
        public DbSet<UserTransactions> UserTransactions { get; set; }

        public ApplicationContext(DbContextOptions<ApplicationContext> options) : base(options)
        {
            Database.EnsureCreated();
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Users>()
                .HasMany(u => u.transactions)
                .WithOne(t => t.user)
                .HasForeignKey(t => t.id_user);

            modelBuilder.Entity<Users>()
                .HasMany(u => u.pots)
                .WithOne(p => p.user)
                .HasForeignKey(p => p.id_user);

            modelBuilder.Entity<Users>()
                .HasMany(u => u.budgets)
                .WithOne(b => b.user)
                .HasForeignKey(b => b.id_user);

            modelBuilder.Entity<Users>()
                .HasIndex(u => u.email)
                .IsUnique();
            modelBuilder.Entity<Users>()
                .HasIndex(u => u.cpf)
                .IsUnique();

            modelBuilder.Entity<Budgets>()
            .Property(b => b.expended_value)
            .HasColumnType("decimal(10,2)");

            modelBuilder.Entity<Budgets>()
                .Property(b => b.limit_value)
                .HasColumnType("decimal(10,2)");

            modelBuilder.Entity<Pots>()
                .Property(p => p.current_value)
                .HasColumnType("decimal(10,2)");
            
            modelBuilder.Entity<Pots>()
                .Property(p => p.target_value)
                .HasColumnType("decimal(10,2)");

            modelBuilder.Entity<RecurrentBills>()
                .Property(r => r.amount)
                .HasColumnType("decimal(10,2)");

            modelBuilder.Entity<UserTransactions>()
                .Property(t => t.value)
                .HasColumnType("decimal(10,2)");

            modelBuilder.Entity<Users>()
                .Property(u => u.balance)
                .HasColumnType("decimal(10,2)");

            modelBuilder.Entity<Users>()
                .Property(u => u.income)
                .HasColumnType("decimal(10,2)");

            modelBuilder.Entity<Users>()
                .Property(u => u.expenses)
                .HasColumnType("decimal(10,2)");
        }
    }
}