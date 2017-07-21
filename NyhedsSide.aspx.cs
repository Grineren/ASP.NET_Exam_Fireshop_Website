using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class NyhedsSide : System.Web.UI.Page
{
    private DataClassesDataContext db = new DataClassesDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        GetAlleNyheder();

        Repeater_AsideTilbud.DataSource = db.Tilbuds.Take(3);
        Repeater_AsideTilbud.DataBind();
    }

    private void GetAlleNyheder()
    {
        ListView_Nyheder.DataSource = db.Nyheders.OrderByDescending(v => v.Dato);
        ListView_Nyheder.DataBind();
    }
    protected void DataPager_Nyheder_PreRender(object sender, EventArgs e)
    {
        GetAlleNyheder();
    }
}