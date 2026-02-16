namespace BackEnd.src.Models;

public class UserTransactions
{
    public int id { get; set; }
    public string title { get; set; } = string.Empty;
    public string description_tran { get; set; } = string.Empty;
    public decimal value { get; set; }
    public string type { get; set; } = string.Empty;
    public string creation_date { get; set; } = string.Empty;
    public string pay_date { get; set; } = string.Empty;
    public int id_user { get; set; }
    public virtual Users? user { get; set; }
    public int id_recbill { get; set; }
    public virtual RecurrentBills? recbill { get; set; }
    public int id_pot { get; set; }
    public virtual Pots? pot { get; set; }
}