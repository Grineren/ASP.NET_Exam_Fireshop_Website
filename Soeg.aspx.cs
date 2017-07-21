using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Soeg : System.Web.UI.Page
{
    private DataClassesDataContext db = new DataClassesDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        BindDdl();

        Repeater_AsideTilbud.DataSource = db.Tilbuds.Take(3);
        Repeater_AsideTilbud.DataBind();

        if(Request.QueryString["result"] != null)
        {
            var query = db.Vares.Where(v => v.Navn.Contains(Convert.ToString(Request.QueryString["result"])));
            if(query.Count() > 0)
            {
                Panel_SoegForm.Visible = false;
                Panel_SoegResult.Visible = true;

                ListView_Result.DataSource = query;
                ListView_Result.DataBind();
            }
            else
            {
                Panel_Fejl.Visible = true;

            }
            
        }
    }
    public string HentBilledeStiOgNavn(int repeaterindex)
    {
        //var query = (from n in db._Nyheders select n);
        var querystring = Request.QueryString["maerke_id"];
        var query = db.Vares;
        //if (query.ToList()[repeaterindex].Fk_BilledeId != null)
        if (query.ToList()[repeaterindex].Fk_BilledeId != 0)
        {

            string billedeUrl = query.ToList()[repeaterindex].Billeder.Sti;

            string result = @"<img src='../Billeder/Resized/" + billedeUrl + "' alt='Billede' style=' max-height: 200px'  /> ";
            //
            return result;
        }
        else
        {
            return "";
        }


    }
    private void BindDdl()
    {
        if (!IsPostBack)
        {
            DropDownList_Kategori.DataSource = db.Kategoriers;
            DropDownList_Kategori.DataValueField = "K_Id";
            DropDownList_Kategori.DataTextField = "Kategori";
            DropDownList_Kategori.DataBind();
            DropDownList_Kategori.Items.Insert(0, new ListItem("Vælg alle kategorier", "0"));


            DropDownList_Maerke.DataSource = db.Maerkes;
            DropDownList_Maerke.DataValueField = "M_Id";
            DropDownList_Maerke.DataTextField = "Brand";
            DropDownList_Maerke.DataBind();
            DropDownList_Maerke.Items.Insert(0, new ListItem("Vælg alle mærker", "0"));
        }


    }
    protected void Button_Soeg_Click(object sender, EventArgs e)
    {
        Panel_SoegForm.Visible = false;
        Panel_SoegResult.Visible = true;

        IEnumerable<Vare> condQuery = db.Vares;

        
        if (Convert.ToInt32(DropDownList_Kategori.SelectedValue) > 0)
        {
            condQuery = condQuery.Where(v => v.Fk_KategoriId.Equals(Convert.ToInt32(DropDownList_Kategori.SelectedValue)));
        }
        if (Convert.ToInt32(DropDownList_Maerke.SelectedValue) > 0)
        {
            condQuery = condQuery.Where(v => v.Fk_MaerkeId.Equals(Convert.ToInt32(DropDownList_Maerke.SelectedValue)));
        }
        if (TextBox_MaxPris.Text != "")
        {
            condQuery = condQuery.Where(v => v.Pris <= Convert.ToInt32(TextBox_MaxPris.Text));
        }
        if (TextBox_Soegeord.Text != "")
        {
            //man kan ikke bare søge på et bogstav det skal være et helt ord
            condQuery = condQuery.Where(v => v.Navn.Contains(TextBox_Soegeord.Text) || v.Maerke.Brand.Contains(TextBox_Soegeord.Text));
        }
       

        if(condQuery.Count() == 0)
        {
            Panel_SoegResult.Visible = false;
            Panel_SoegForm.Visible = true;
            Panel_Fejl.Visible = true;
        }
        ListView_Result.DataSource = condQuery;
        ListView_Result.DataBind();

    }
}