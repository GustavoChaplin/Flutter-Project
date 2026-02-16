namespace BackEnd.src.Models;

public class RecurrentBills
{
    public int id { get; set; }
    public string title { get; set; } = string.Empty;
    public string description { get; set; } = string.Empty;
    public decimal amount { get; set; }
    public DateTime due_date { get; set; }
    public DateTime end_date { get; set; }
    public string frequency { get; set; } = string.Empty;
    public string recurrence_type { get; set; } = string.Empty;
    public int total_installments { get; set; }
    public int paid_installments { get; set; }
    public int is_active { get; set; }
}