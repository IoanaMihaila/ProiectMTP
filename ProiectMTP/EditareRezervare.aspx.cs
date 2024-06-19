using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using static System.Net.Mime.MediaTypeNames;

namespace ProiectMTP
{
    public partial class EditareRezervare : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        public class ButtonCounter
        {
            // Variabilă statică pentru a stoca numărul de accesări ale butonului
            private static int buttonClickCount = 0;

            // Funcție pentru a număra accesările butonului
            public static int CountButtonClick()
            {
                // Incrementăm numărul de accesări
                buttonClickCount++;

                // Returnăm numărul de accesări curent
                return buttonClickCount;
            }
        }

        private void UpdateReservation(string numeUtilizator, string titluFilm, string dataOra)
        {
            try
            {
                ConexiuneBD.conn.Open();
                string query = "UPDATE Rezervari SET NrBilete = @NrBilete WHERE NumeUtilizator = @NumeUtilizator AND TitluFilm = @TitluFilm AND DataOra = @DataOra";
                SqlCommand cmd = new SqlCommand(query, ConexiuneBD.conn);
                cmd.Parameters.AddWithValue("@NrBilete", txtNrBilete.Text.Trim());
                cmd.Parameters.AddWithValue("@NumeUtilizator", numeUtilizator);
                cmd.Parameters.AddWithValue("@TitluFilm", titluFilm);
                cmd.Parameters.AddWithValue("@DataOra", dataOra);
                int rowsAffected = cmd.ExecuteNonQuery();
                if (rowsAffected > 0)
                {
                    lblMessage.Text = "Rezervarea a fost actualizată cu succes.";
                    string utilizator = Application["ddlUsername"].ToString();
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
                else
                {
                    lblMessage.Text = "Eroare: Nu s-au efectuat modificări în baza de date.";
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Eroare: " + ex.Message;
            }
            finally
            {
                // Închideți conexiunea după ce ați terminat cu ea
                if (ConexiuneBD.conn.State == ConnectionState.Open)
                {
                    ConexiuneBD.conn.Close();
                }
            }
        }

        private string ValidateNumberOfTickets(string input)
        {
            int numar;

            if (int.TryParse(input, out numar)) // Verificăm dacă input-ul este un număr întreg
            {
                if (numar >= 1 && numar <= 10) // Verificăm dacă numărul este în intervalul specificat
                {
                    //return "Numărul este valid.";
                    return "Numărul este valid";
                }
                else
                {
                    return "Introduceți un număr între 1 și 10.";
                }
            }
            else
            {
                return "Introduceți doar caractere numerice.";
            }
        }
       
        protected void butonSalvare_Click(object sender, EventArgs e)
        {
            int clickCount = ButtonCounter.CountButtonClick();
            lbl1.Text = "Button clicked " + clickCount + " times.";

            // Verificați dacă parametrii necesari pentru identificarea rezervării au fost furnizați
            if (!string.IsNullOrEmpty(Request.QueryString["NumeUtilizator"]) &&
                !string.IsNullOrEmpty(Request.QueryString["TitluFilm"]) &&
                !string.IsNullOrEmpty(Request.QueryString["DataOra"]))
            {
                // Utilizați parametrii pentru a identifica rezervarea pe care utilizatorul dorește să o modifice
                string numeUtilizator = Request.QueryString["NumeUtilizator"];
                string titluFilm = Request.QueryString["TitluFilm"];
                string dataOra = Request.QueryString["DataOra"];


                // Validarea numărului de bilete
                string validationMessage = ValidateNumberOfTickets(txtNrBilete.Text.Trim());
                labelValidare.Text = validationMessage;

                // Dacă validarea trece, actualizați rezervarea în baza de date cu noile date introduse de utilizator
                if (validationMessage == "Numărul este valid")
                {
                    UpdateReservation(numeUtilizator, titluFilm, dataOra);

                    // Actualizați mesajul de confirmare
                    lblMessage.Text = "Rezervarea a fost actualizată cu succes.";
                }
            }
            else
            {
                lblMessage.Text = "Nu s-au furnizat suficienți parametrii pentru identificarea rezervării.";
            }
        }
    }
}