using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.DynamicData;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace ProiectMTP
{
    public partial class PaginaPrincipala : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Verificăm dacă există un utilizator autentificat în sesiunea de aplicație
                if (Application["ddlUsername"] != null)
                {
                    // Setăm textul etichetei lblUserName cu numele utilizatorului autentificat
                    lblUserName.Text = "Utilizator autentificat: " + Application["ddlUsername"].ToString();
                }
                else
                {
                    // Dacă nu există un utilizator autentificat, afișăm un mesaj corespunzător
                    lblUserName.Text = "Niciun utilizator autentificat.";
                }
                try
                {
                    ConexiuneBD.conn.Open(); // Deschideți conexiunea
                    SqlCommand command = new SqlCommand("SELECT TitluFilm AS [TitluFilm], Gen AS [Gen], DataOra AS [Data], Sala AS [Sala], Durata AS [Durata], NrLocuri AS [NrLocuri] FROM Filme ORDER BY TitluFilm", ConexiuneBD.conn);
                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    DataTable dataTable = new DataTable();
                    adapter.Fill(dataTable);

                    foreach (DataRow row in dataTable.Rows)
                    {
                        HtmlTableRow tableRow = new HtmlTableRow();

                        for (int i = 0; i < dataTable.Columns.Count; i++)
                        {
                            HtmlTableCell cell = new HtmlTableCell();
                            cell.InnerText = row[i].ToString();
                            tableRow.Cells.Add(cell);
                        }

                        tabelFilme.Rows.Add(tableRow);
                    }
                }
                catch (Exception ex)
                {
                    lblErrorMessage.Text = "Nu se poate realiza conexiunea la BD: " + ex.Message;
                }
                finally
                {
                    ConexiuneBD.conn.Close(); 
                }
            }
        }

        protected void ButtonLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("Autentificare.aspx");
        }

        protected void ButtonCautare_Click(object sender, EventArgs e)
        {
            Response.Redirect("Cautare.aspx");
        }

        protected void ButtonModificare_Click(object sender, EventArgs e)
        {
            Response.Redirect("Adaugare_rezervare.aspx");
        }

        protected void ButtonStergere_Click(object sender, EventArgs e)
        {
            Response.Redirect("StergereRezervare.aspx");
        }
    }
}