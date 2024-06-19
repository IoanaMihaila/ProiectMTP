using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace ProiectMTP
{
    public partial class Adaugare_rezervare : System.Web.UI.Page
    {
        SqlCommand cmd;
        SqlDataReader dr;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) //verifica daca pagina e incarcata pentru prima data sau e un postback
            {
                ddlTitluFilm.Items.Clear();

                   // Folosim un set pentru a stoca numele filmelor unice
                   HashSet<string> uniqueTitles = new HashSet<string>();

                   try
                   {
                       ConexiuneBD.conn.Open();
                       SqlCommand cmd = new SqlCommand("SELECT TitluFilm FROM Filme", ConexiuneBD.conn);
                       SqlDataReader dr = cmd.ExecuteReader(); //sunt salvate rezultatele interogarii sql
                       while (dr.Read())
                       {
                           uniqueTitles.Add(dr["TitluFilm"].ToString());
                       }
                   }
                   catch (Exception ex)
                   {
                       ddlTitluFilm.Items.Add("Nu se poate realiza conexiunea: " + ex.Message);
                   }
                   finally
                   {
                       ConexiuneBD.conn.Close();
                   }
                   foreach (string title in uniqueTitles)
                   {
                       ddlTitluFilm.Items.Add(title);
                   }
            }

             // Verificăm dacă este selectat un film în dropdown-ul ddlTitluFilm
             if (ddlTitluFilm.SelectedIndex >= 0)
             {
                 ddlDataOra.Items.Clear(); // Înlăturăm orice elemente din dropdown-ul ddlDataOra pentru a-l re-popula

                 try
                 {
                     ConexiuneBD.conn.Open();
                     string titluFilmSelectat = ddlTitluFilm.SelectedItem.Text;
                     SqlCommand cmd = new SqlCommand("SELECT DataOra FROM Filme WHERE TitluFilm = @TitluFilm", ConexiuneBD.conn);
                     cmd.Parameters.AddWithValue("@TitluFilm", titluFilmSelectat);
                     SqlDataReader dr = cmd.ExecuteReader();
                     while (dr.Read())
                     {
                         ddlDataOra.Items.Add(dr["DataOra"].ToString());
                     }
                 }
                 catch (Exception ex)
                 {
                     ddlDataOra.Items.Add("Nu s-au putut încărca datele: " + ex.Message);
                 }
                 finally
                 {
                     ConexiuneBD.conn.Close();
                 }
             }
        }

        // Funcție pentru validarea numărului de bilete
        private void ValidateNumberOfTickets(string input)
        {
            int numar;

            if (int.TryParse(input, out numar)) // Verificăm dacă input-ul este un număr întreg
            {
               
                if (numar >= 1 && numar <= 10) // Verificăm dacă numărul este în intervalul specificat
                {
                    labelValidare.Text = "Numarul este valid";
                }
                else
                {
                    labelValidare.Text = "Introduceti un numar intre 1 si 10.";
                }
            }
            else
            {
                labelValidare.Text = "Introduceți doar caractere numerice.";
            }
        }

        // Adaugarea link-ului Edit in dreptul rezervarii adaugate
        protected override void Render(System.Web.UI.HtmlTextWriter writer)
        {
            int rowIndex = 1; // Variabilă pentru a urmări indexul rândului
            string numeUtilizator = Application["ddlUsername"].ToString();

            foreach (HtmlTableRow tableRow in tabelRezervari.Rows)
            {
                if (rowIndex > 1 && tableRow.Cells.Count > 0)
                {

                    HtmlTableCell lastCell = tableRow.Cells[tableRow.Cells.Count - 1]; // Ultima celulă din rândul curent

                    string titluFilm = tableRow.Cells[2].InnerText.Trim();
                    string dataOra = tableRow.Cells[3].InnerText.Trim();

                    // Construiți hyperlink-ul pentru editare
                    string editLink = "<a href='EditareRezervare.aspx?NumeUtilizator=" + numeUtilizator + "&TitluFilm=" + titluFilm + "&DataOra=" + dataOra + "'>Edit</a>";

                    // Adăugați hyperlink-ul la ultima celulă
                    lastCell.Controls.Add(new LiteralControl(editLink));
                }
                rowIndex++; // Incrementați indexul rândului
            }
            base.Render(writer);
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
        protected void butonRezervare_Click(object sender, EventArgs e)
        {
            int clickCount = ButtonCounter.CountButtonClick();
            lbl1.Text = "Button clicked " + clickCount + " times.";

            if (Page.IsValid)
            {
                try
                {
                    ConexiuneBD.conn.Open();
                    SqlCommand cmd = new SqlCommand("INSERT INTO Rezervari (Imagine, NumeUtilizator, TitluFilm, DataOra, NrBilete) VALUES (@Imagine, @NumeUtilizator, @TitluFilm, @DataOra, @NrBilete)", ConexiuneBD.conn);

                    // Cod pentru încărcarea imaginii din hidden field
                    string imageData = hiddenImageData.Value;
                    if (!string.IsNullOrEmpty(imageData))
                    {
                        byte[] imageBytes = Convert.FromBase64String(imageData.Substring(imageData.IndexOf(",") + 1));
                        cmd.Parameters.Add("@Imagine", SqlDbType.VarBinary).Value = imageBytes;
                    }
                    else
                    {
                        labelIMG.Text = "Este nevoie sa introduceti o imagine!";
                        cmd.Parameters.Add("@Imagine", SqlDbType.VarBinary).Value = DBNull.Value;
                    }

                    // Validarea numărului de bilete
                    ValidateNumberOfTickets(txtNrBilete.Text.Trim());

                    // Dacă validarea trece, actualizați rezervarea în baza de date cu noile date introduse de utilizator
                    if (labelValidare.Text == "Introduceti un numar intre 1 si 10." || labelValidare.Text == "Introduceți doar caractere numerice.")
                    {
                        return;
                    }

                    cmd.Parameters.AddWithValue("@NumeUtilizator", Application["ddlUsername"].ToString());
                    cmd.Parameters.AddWithValue("@TitluFilm", ddlTitluFilm.Text.Trim());
                    cmd.Parameters.AddWithValue("@DataOra", ddlDataOra.Text.Trim());
                    cmd.Parameters.AddWithValue("@NrBilete", txtNrBilete.Text.Trim());
                    int rowsAffected = cmd.ExecuteNonQuery();

                    if (rowsAffected == 1)
                    {
                        SqlCommand command = new SqlCommand("SELECT Imagine, NumeUtilizator, TitluFilm, DataOra, NrBilete FROM Rezervari WHERE NumeUtilizator = @NumeUtilizatorAutentificat", ConexiuneBD.conn);
                        command.Parameters.AddWithValue("@NumeUtilizatorAutentificat", Application["ddlUsername"].ToString());
                        SqlDataAdapter adapter = new SqlDataAdapter(command); //se extrag datele din baza de date
                        DataTable dataTable = new DataTable();
                        adapter.Fill(dataTable);

                        foreach (DataRow row in dataTable.Rows)
                        {
                            HtmlTableRow tableRow = new HtmlTableRow();

                            for (int i = 0; i < dataTable.Columns.Count; i++)
                            {
                                HtmlTableCell cell = new HtmlTableCell();
                                if (dataTable.Columns[i].ColumnName == "Imagine")
                                {
                                    byte[] bytes = (byte[])row[i];
                                    string base64String = Convert.ToBase64String(bytes, 0, bytes.Length);

                                    string imageHtml = "<img style='width: 200px; margin: 5px;' src='data:image/png;base64," + base64String + "' />";
                                    cell.InnerHtml = imageHtml; 
                                }
                                else
                                {
                                    cell.InnerText = row[i].ToString();
                                }
                                tableRow.Cells.Add(cell);
                            }
                            tabelRezervari.Rows.Add(tableRow);
                        }
                    }
                    else
                    {
                        lblErrorMessage.Text = "Eroare inserare!";
                    }
                }
                catch (Exception ex)
                {
                    lblErrorMessage.Text = "Eroare la deschiderea bazei de date" + ex.Message;
                }
                finally
                {
                    ConexiuneBD.conn.Close();
                }
            }
        }
    }
}