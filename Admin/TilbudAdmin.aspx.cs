using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_TilbudAdmin : System.Web.UI.Page
{
    private DataClassesDataContext db = new DataClassesDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userId"] == null || Session["userId"].ToString() == "")
        {
            Response.Redirect("~/admin/Login.aspx");
        }
        if (Request.QueryString["handling"] != null)
        {
            switch (Request.QueryString["handling"])
            {
                case "opret":
                    if (!IsPostBack)
                    {
                        OpretTilbud();
                    }
                    break;

                case "rediger":
                    RedigerTilbud();
                    break;

                case "slet":
                    SletTilbud();
                    break;
            }
        }
        else
        {
            VisTilbud();

        }
    }

    private void RedigerTilbud()
    {
        Panel_Form.Visible = true;
        Literal_Legend.Text = "Rediger tilbud";
        Button_GemTilbud.Visible = false;
        Button_GemRedigeret.Visible = true;
        Panel_VisStartOgSlutRepeater.Visible = true;
        BindDdl();
        
        if (!IsPostBack)
        {
            if (Request.QueryString["tilbud_id"] != null)
            {

                int id;
                if (int.TryParse(Request.QueryString["tilbud_id"].ToString(), out id))
                {
                    var query = db.Tilbuds.Where(t => t.T_Id.Equals(id)).Single();

                    DropDownList_Vare.SelectedValue = Convert.ToString(query.Fk_VareId);
                    TextBox_TilbudPct.Text = Convert.ToString(query.TildbudPct);
                    Calendar_Date.SelectedDate = query.SlutDato;
                    Calendar_Start.SelectedDate = query.StartDato;

                    Repeater_CurrentStartOgSlut.DataSource = db.Tilbuds.Where(t => t.T_Id.Equals(id)).ToList();
                    Repeater_CurrentStartOgSlut.DataBind();

                }
            }
        }
    }
    private void BindDdl()
    {
        if (!IsPostBack)
        {
            DropDownList_Vare.DataSource = db.Vares;
            DropDownList_Vare.DataValueField = "V_Id";
            DropDownList_Vare.DataTextField = "Navn";
            DropDownList_Vare.DataBind();
            DropDownList_Vare.Items.Insert(0, new ListItem("Vælg vare", "0"));



        }


    }

    private void VisTilbud()
    {
        Panel_VisAlleTilbud.Visible = true;
        Repeater_AlleTilbud.DataSource = db.Tilbuds;
        Repeater_AlleTilbud.DataBind();
    }

    private void SletTilbud()
    {
        if(Request.QueryString["tilbud_id"] != null)
        {
            int id = int.Parse(Request.QueryString["tilbud_id"].ToString());

            var query = db.Tilbuds.Where(t => t.T_Id.Equals(id)).Single();


            db.Tilbuds.DeleteOnSubmit(query);
            db.SubmitChanges();


            Response.Redirect("~/Admin/TilbudAdmin.aspx");
        }
    }

    private void OpretTilbud()
    {
        Panel_Form.Visible = true;
        Literal_Legend.Text = "Opret tilbud";

        BindDdl();
    }
    protected void Button_GemTilbud_Click(object sender, EventArgs e)
    {
        if (TextBox_TilbudPct.Text == "")
        {
            Label_Error.Text = "Skriv en tilbuds procent";
        }
        else if (Convert.ToInt32(DropDownList_Vare.SelectedValue) == 0)
        {
            Label_Error.Text = "Vælg en vare";
        }
        else if (Calendar_Date.SelectedDate == null)
        {
            Label_Error.Text = "Vælg en dato";
        }
        else
        {
            Tilbud nytTilbud = new Tilbud
            {
                TildbudPct = Convert.ToInt32(TextBox_TilbudPct.Text),
                Fk_VareId = Convert.ToInt32(DropDownList_Vare.SelectedValue),
                SlutDato = Calendar_Date.SelectedDate,
                StartDato = Calendar_Start.SelectedDate
            };
            db.Tilbuds.InsertOnSubmit(nytTilbud);
            try
            {
                db.SubmitChanges();
                Response.Redirect("~/Admin/TilbudAdmin.aspx");
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);

            }
        }
    }
    protected void Button_GemRedigeret_Click(object sender, EventArgs e)
    {
        UpdateService(Request.QueryString["tilbud_id"]);

    }
    private void UpdateService(string querystring)
    {
        if (Convert.ToInt32(DropDownList_Vare.SelectedValue) == 0)
        {
            Label_Error.Text = "Vælg en vare";
        }
        else if (TextBox_TilbudPct.Text == "")
        {
            Label_Error.Text = "Skriv en procent";
        }
        else if(Calendar_Date.SelectedDate == null)
        {
            Label_Error.Text = "Vælg en slutdato";
        }
        else if (Calendar_Start.SelectedDate == null)
        {
            Label_Error.Text = "Vælg en startdato";
        }

        else
        {
            if (querystring != null)
            {
                var query = (from t in db.Tilbuds where t.T_Id == Convert.ToInt32(querystring) select t).Single();

                query.Fk_VareId = Convert.ToInt32(DropDownList_Vare.SelectedValue);
                query.TildbudPct = Convert.ToInt32(TextBox_TilbudPct.Text);
                query.SlutDato = Calendar_Date.SelectedDate;
                query.StartDato = Calendar_Start.SelectedDate;


                try
                {
                    db.SubmitChanges();
                    Response.Redirect("~/Admin/TilbudAdmin.aspx");
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex.Message);

                }

            }
        }


    }

}