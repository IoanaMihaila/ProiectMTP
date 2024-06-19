using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProiectMTP
{
    public partial class AboutUs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void butonPaginaPrincipala_Click(object sender, EventArgs e)
        {
            Response.Redirect("PaginaPrincipala.aspx");
        }
    }
}