namespace BackEnd.src.Models;

class Users
{
    public int id { get; set; }
    public string user_name { get; set; } = string.Empty;
    public string sur_name { get; set; } = string.Empty;
    public string email { get; set; } = string.Empty;
    public string user_password { get; set; } = string.Empty;
    public string cpf { get; set; } = string.Empty;
    public decimal income { get; set; }
    public decimal expenses { get; set; }
    public decimal balance { get; set; }
    public string gender { get; set; } = string.Empty;
    public DateTime created_at { get; set; }
    public virtual ICollection<UserTransactions>? transactions { get; set; }
    public virtual ICollection<Pots>? pots { get; set; }
    public virtual ICollection<Budgets>? budgets { get; set; }
}