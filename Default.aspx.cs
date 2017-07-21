using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    private DataClassesDataContext db = new DataClassesDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        Repeater_Forside.DataSource = db.Forsides;
        Repeater_Forside.DataBind();


        DateTime date = DateTime.Now.Date;

        var result = from x in db.Tilbuds where x.SlutDato >= date && x.StartDato <= date select x;

        Repeater_AsideTilbud.DataSource = result.ToList();
        Repeater_AsideTilbud.DataBind();
    }
}