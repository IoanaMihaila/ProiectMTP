using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace ProiectMTP
{
    public partial class StergereRezervare : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
                try
                {
                    ConexiuneBD.conn.Open(); // Deschideți conexiunea
                    SqlCommand command = new SqlCommand("SELECT NumeUtilizator AS [NumeUtilizator], TitluFilm AS [TitluFilm], DataOra AS [Data], NrBilete AS [NrBilete] FROM Rezervari WHERE NumeUtilizator = @NumeUtilizatorAutentificat", ConexiuneBD.conn);
                    command.Parameters.AddWithValue("@NumeUtilizatorAutentificat", Application["ddlUsername"].ToString());
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

                        tabelRezervari.Rows.Add(tableRow);
                    }
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "Nu se poate realiza conexiunea la BD: " + ex.Message;
                }
                finally
                {
                    ConexiuneBD.conn.Close(); // Închideți conexiunea în blocul finally pentru a vă asigura că este închisă corect
                }
            

            int rowIndex = 0; // Variabilă pentru a urmări indexul rândului

            foreach (HtmlTableRow tableRow in tabelRezervari.Rows)
            {
                if (rowIndex > 0 && tableRow.Cells.Count > 0)
                {

                    // Obțineți valorile pentru NumeUtilizator, TitluFilm și DataOra din celulele rândului curent
                    string numeUtilizator = tableRow.Cells[0].InnerText;
                    string titluFilm = tableRow.Cells[1].InnerText;
                    string dataOra = tableRow.Cells[2].InnerText;
                    string nrBilete = tableRow.Cells[3].InnerText;


                    // Construiți butonul de ștergere pentru acest rând
                    Button deleteButton = new Button();
                    deleteButton.Text = "Delete";
                    deleteButton.CommandName = "DeleteRow";
                    deleteButton.CommandArgument = numeUtilizator + "|" + titluFilm + "|" + dataOra + "|" + nrBilete;
                    deleteButton.Click += DeleteButton_Click;

                    // Adăugați butonul de ștergere în ultima celulă din rândul curent
                    HtmlTableCell lastCell = tableRow.Cells[tableRow.Cells.Count - 1];
                    lastCell.Controls.Add(deleteButton);
                }
                rowIndex++; // Incrementați indexul rândului
            }
            
        }

        protected void DeleteButton_Click(object sender, EventArgs e)
        {
            
            Button deleteButton = (Button)sender; //obtine referinta catre butonul care a declansat evenimentul
            string[] args = deleteButton.CommandArgument.Split('|');
            string numeUtilizator = args[0];
            string titluFilm = args[1];
            string dataOra = args[2];
            string nrBilete = args[3];

            try
            {
                ConexiuneBD.conn.Open();
                SqlCommand command = new SqlCommand("DELETE FROM Rezervari WHERE NumeUtilizator = @NumeUtilizator AND TitluFilm = @TitluFilm AND DataOra = @DataOra AND NrBilete = @NrBilete", ConexiuneBD.conn);
                command.Parameters.AddWithValue("@NumeUtilizator", numeUtilizator);
                command.Parameters.AddWithValue("@TitluFilm", titluFilm);
                command.Parameters.AddWithValue("@DataOra", dataOra);
                command.Parameters.AddWithValue("@NrBilete", nrBilete);
                int rowsAffected = command.ExecuteNonQuery();
                lblMessage.Text = rowsAffected + " înregistrare a fost ștearsă cu succes.";
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Eroare la ștergerea înregistrării: " + ex.Message;
            }
            finally
            {
                ConexiuneBD.conn.Close();
            }
            LoadReservationTable();
        }
        private void LoadReservationTable()
        {
            try
            {
                ConexiuneBD.conn.Open(); // Deschideți conexiunea

                // Selectați toate rezervările pentru utilizatorul autentificat
                SqlCommand command = new SqlCommand("SELECT NumeUtilizator AS [NumeUtilizator], TitluFilm AS [TitluFilm], DataOra AS [Data], NrBilete AS [NrBilete] FROM Rezervari WHERE NumeUtilizator = @NumeUtilizatorAutentificat", ConexiuneBD.conn);
                command.Parameters.AddWithValue("@NumeUtilizatorAutentificat", Application["ddlUsername"].ToString());
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataTable dataTable = new DataTable();
                adapter.Fill(dataTable);

                // Păstrați primul rând al tabelului existent
                if (tabelRezervari.Rows.Count > 0)
                {
                    HtmlTableRow firstRow = tabelRezervari.Rows[0];
                    tabelRezervari.Rows.Clear();
                    tabelRezervari.Rows.Add(firstRow);
                }

                // Adăugați doar rezervările pentru utilizatorul autentificat în tabelul HTML, începând cu al doilea rând
                foreach (DataRow row in dataTable.Rows)
                {
                    HtmlTableRow tableRow = new HtmlTableRow();

                    for (int i = 0; i < dataTable.Columns.Count; i++)
                    {
                        HtmlTableCell cell = new HtmlTableCell();
                        cell.InnerText = row[i].ToString();
                        tableRow.Cells.Add(cell);
                    }

                    // Adăugați rândul în tabel
                    tabelRezervari.Rows.Add(tableRow);
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Nu se poate realiza conexiunea la BD: " + ex.Message;
            }
            finally
            {
                ConexiuneBD.conn.Close(); // Închideți conexiunea
            }
        }
    }
}