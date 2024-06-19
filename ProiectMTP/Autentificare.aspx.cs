using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace ProiectMTP
{
    public partial class Autentificare : System.Web.UI.Page
    {

        SqlCommand cmd;
        SqlDataReader dr;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                try
                {
                    ConexiuneBD.conn.Open();
                    cmd = new SqlCommand("select NumeUtilizator from Utilizatori", ConexiuneBD.conn);
                    dr = cmd.ExecuteReader();
                    while (dr.Read())
                    {
                        ddlUsername.Items.Add(dr[0].ToString());
                    }
                }
                catch (Exception ex)
                {
                    ddlUsername.Text = "Nu se poate realiza conexiunea " + ex.Message;
                }
                finally
                {
                    ConexiuneBD.conn.Close();
                }
            }
        }

        public class ButtonCounter
        {
            // Variabilă statică pentru a stoca numărul de accesări ale butonului
            private static int buttonClickCount = 0;

            public static object ButtonLogin { get; private set; }

            // Funcție pentru a număra accesările butonului
            public static int CountButtonClick()
            {
                // Incrementăm numărul de accesări
                buttonClickCount++;

                if (buttonClickCount % 3 == 0) // Rearanjează butonul la fiecare al treilea click
                {
                    /*ButtonLogin.Width = new Unit(ButtonLogin.Width.Value - 10, UnitType.Pixel);
                    ButtonLogin.Height = new Unit(ButtonLogin.Height.Value - 5, UnitType.Pixel);*/
                }


                // Returnăm numărul de accesări curent
                return buttonClickCount;
            }
        }

        protected void ButtonLogin_Click1(object sender, EventArgs e)
        {
            int clickCount = ButtonCounter.CountButtonClick();
            label1.Text = "Button clicked " + clickCount + " times.";

            try
            {
                string username = ddlUsername.SelectedValue;
                Application["ddlUsername"] = username;

                string password = Request.Form["txtPassword"]; // Preia valoarea introdusă în câmpul de parolă

                ConexiuneBD.conn.Open();
                cmd = new SqlCommand("select Parola from Utilizatori where NumeUtilizator='" + ddlUsername.Text + "'", ConexiuneBD.conn);
                dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    // Compară parola introdusă cu cea din baza de date
                    if (dr[0].ToString().Trim() == password.Trim())
                    {
                        Application["NumeUtilizator"] = ddlUsername.Text;
                        Response.Redirect("AboutUs.aspx");
                    }
                    else
                    {
                        lblErrorMessage.Text = "Parola greșită";
                    }
                }
                else
                {
                    lblErrorMessage.Text = "Datele sunt greșite";
                }
            }
            catch (Exception ex)
            {
                lblErrorMessage.Text = "Nu se poate realiza conexiunea: " + ex.Message;
            }
            finally
            {
                if (ConexiuneBD.conn.State == ConnectionState.Open)
                    ConexiuneBD.conn.Close();
            }
        }
    }
}
