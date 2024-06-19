using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Diagnostics.Eventing.Reader;
using System.Web.Services.Description;

namespace ProiectMTP
{
    public partial class Cautare : System.Web.UI.Page
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


        protected void butonCautare0_Click(object sender, EventArgs e)
        {
            int clickCount = ButtonCounter.CountButtonClick();
            label1.Text = "Button clicked " + clickCount + " times.";

            try
            {
                // Verificăm dacă este introdus un titlu pentru căutare
                if (!string.IsNullOrEmpty(txtCautare0.Text))
                {

                    string errorMessage = ValidateMovieTitle(txtCautare0.Text);
                    
                    
                    if (!string.IsNullOrEmpty(errorMessage))
                    {
                        // Afișăm mesajul de eroare
                        lblErrorMessage.Text = errorMessage;

                        // Resetăm controlul de imagine
                        imgFilm.ImageUrl = "Imagini/NuEDisponibil.jpg";
                        tabelFilme.Rows.Clear();
                        labelCautare.Text = "Cauta un alt film!";
                        return;
                    }
                    else
                    {
                        lblErrorMessage.Text = ""; 
                    }

                    //afisarea tabelului  cu datele gasite
                    ConexiuneBD.conn.Open(); 
                    string query = "SELECT TitluFilm AS [TitluFilm], Gen AS [Gen], DataOra AS [Data], Sala AS [Sala], Durata AS [Durata], NrLocuri AS [NrLocuri] " +
                                   "FROM Filme " +
                                   "WHERE TitluFilm LIKE @titluFilm " +
                                   "ORDER BY DataOra";
                    SqlCommand command = new SqlCommand(query, ConexiuneBD.conn);
                    command.Parameters.AddWithValue("@titluFilm", "%" + txtCautare0.Text + "%");
                    SqlDataAdapter adapter = new SqlDataAdapter(command); //pt a extrage datele din furnizate de query
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

                    // pentru inserarea imaginii corespunazatoare filmului gasit
                    if (dataTable.Rows.Count > 0)
                    {
                        // Obținem titlul primului film din rezultatele căutării
                        string titluFilm = dataTable.Rows[0]["TitluFilm"].ToString();

                        // Setăm calea către imaginea corespunzătoare titlului filmului
                        string caleImagine = "Imagini/" + titluFilm + ".jpg";

                        // Actualizăm sursa imaginii în controlul de imagine
                        imgFilm.ImageUrl = caleImagine;
                        labelCautare.Text = "Filmul este disponibil în cinema! Iată perioadele în care poate fi vizionat.";
                    }
                    else
                    {
                        imgFilm.ImageUrl = "Imagini/NuEDisponibil.jpg"; 
                    }
                }
                else
                {
                    lblErrorMessage.Text = "Camp Obligatoriu!";
                }
            }
            catch (Exception ex)
            {
                lblErrorMessage.Text = "Nu se poate realiza conexiunea!" + ex.Message;
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
        // Metoda pentru validarea titlului filmului
        private string ValidateMovieTitle(string title)
        {
            // Verificăm dacă fiecare cuvânt începe cu o literă mare
            if (!title.Split(' ').All(word => char.IsUpper(word[0])))
            {
                return "Titlul filmului trebuie să înceapă cu literă mare în fiecare cuvânt.";
            }

            // Verificăm dacă titlul filmului există în baza de date
            ConexiuneBD.conn.Open();
            string query = "SELECT COUNT(*) FROM Filme WHERE TitluFilm LIKE @titluFilm";
            SqlCommand command = new SqlCommand(query, ConexiuneBD.conn);
            command.Parameters.AddWithValue("@titluFilm", "%" + title + "%");
            int count = (int)command.ExecuteScalar();
            ConexiuneBD.conn.Close();

            if (count == 0)
            {
                return "Filmul dorit nu este momentan disponibil.";
            }
            // Returnăm un mesaj de validare pozitivă
            return "";
        }
    }
}