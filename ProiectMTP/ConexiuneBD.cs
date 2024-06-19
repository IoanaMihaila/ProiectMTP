using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace ProiectMTP
{
    public class ConexiuneBD
    {
        public static SqlConnection conn = new SqlConnection("Data Source=DESKTOP-N69226P\\SQLEXPRESS; Initial Catalog=Cinema; Integrated Security=True");
    }
}