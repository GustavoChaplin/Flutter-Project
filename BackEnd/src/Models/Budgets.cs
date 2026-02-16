namespace BackEnd.src.Models;

class Budgets
{
    public int id { get; set; }
    public string title { get; set; } = string.Empty;
    public decimal expended_value { get; set; }
    public decimal limit_value { get; set; }
    public int id_user { get; set; }
    public virtual Users? user { get; set; }
    public DateTime created_at { get; set; }
}