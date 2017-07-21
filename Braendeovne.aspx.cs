using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Braendeovne : System.Web.UI.Page
{
    private DataClassesDataContext db = new DataClassesDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {

        Repeater_Maerke.DataSource = db.Maerkes.Where(m => m.Fk_KategoriId.Equals(1));
        Repeater_Maerke.DataBind();

        Repeater_AsideTilbud.DataSource = db.Tilbuds.Take(3);
        Repeater_AsideTilbud.DataBind();

        if (Request.QueryString["maerke_id"] != null)
        {
            Panel_MaerkeVaelg.Visible = false;
            PanelEnkeltMaerke.Visible = true;

            var querystring = Request.QueryString["maerke_id"];


           
            ListView_EnkeltMaerke.DataSource = db.Vares.Where(v => v.Fk_MaerkeId.Equals(querystring));
            ListView_EnkeltMaerke.DataBind();

            Repeater_MaerkeBeskrivelse.DataSource = db.Maerkes.Where(m => m.M_Id.Equals(querystring));
            Repeater_MaerkeBeskrivelse.DataBind();
        }
        if (Request.QueryString["vare_id"] != null)
        {
            Panel_MaerkeVaelg.Visible = false;
            Panel_EnkeltVare.Visible = true;
            var querystring = Request.QueryString["vare_id"];

            ListView_EnkeltVare.DataSource = db.Vares.Where(v => v.V_Id.Equals(querystring));
            ListView_EnkeltVare.DataBind();

            Repeater_EnkeltVareHeader.DataSource = db.Vares.Where(v => v.V_Id.Equals(querystring));
            Repeater_EnkeltVareHeader.DataBind();

        }

    }
    public string HentBilledeStiOgNavn(int repeaterindex)
    {
        //var query = (from n in db._Nyheders select n);
        var querystring = Request.QueryString["maerke_id"];
        var query = db.Vares.Where(v => v.Fk_MaerkeId.Equals(querystring));
        //if (query.ToList()[repeaterindex].Fk_BilledeId != null)
        if (query.ToList()[repeaterindex].Fk_BilledeId != 0)
        {

            string billedeUrl = query.ToList()[repeaterindex].Billeder.Sti;

            string result = @"<img src='../Billeder/Resized/" + billedeUrl + "' alt='Billede' style=' max-height: 170px;' class='center-block'  /> ";
            //
            return result;
        }
        else
        {
            return "";
        }


    }
    public string HentBilledeStiOgNavnEnkelt(int repeaterindex)
    {
        var query = (from v in db.Vares where v.V_Id == Convert.ToInt32(Request.QueryString["vare_id"]) select v);

        if (query.ToList()[repeaterindex].Fk_BilledeId != 0)
        {

            string billedeUrl = query.ToList()[repeaterindex].Billeder.Sti;

            string result = @"<img src='../Billeder/Resized/" + billedeUrl + "' alt='Billede' style=' max-height: 200px; max-width: 130px;'  /> ";
            //style='max-width: 100%; max-height: 400px'
            return result;
        }
        else
        {
            return "";
        }


    }





}