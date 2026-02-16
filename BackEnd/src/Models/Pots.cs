namespace BackEnd.src.Models;

public class Pots {
    public int id { get; set; }
    public string title { get; set; } = string.Empty;
    public decimal target_value { get; set; }
    public decimal current_value { get; set; }
    public int id_user { get; set; }
    public virtual Users? user { get; set; }
    public virtual ICollection<UserTransactions>? transactions { get; set; }
    public DateTime created_at { get; set; }
}