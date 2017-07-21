using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_KontaktAdmin : System.Web.UI.Page
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
                //case "opret":
                //    if (!IsPostBack)
                //    {
                //        OpretKontakt();
                //    }
                //    break;

                case "rediger":
                    RedigerKontakt();
                    break;

                //case "slet":
                //    SletKontakt();
                //    break;
            }
        }
        else
        {
            VisKontakt();

        }
    }

    private void VisKontakt()
    {
        Panel_VisAlleKontakt.Visible = true;
        Repeater_AlleKontakt.DataSource = db.Kontakts;
        Repeater_AlleKontakt.DataBind();
    }

    private void RedigerKontakt()
    {
        Panel_Form.Visible = true;
        Literal_Legend.Text = "Rediger kontakt oplysninger";

        if (!IsPostBack)
        {
            if (Request.QueryString["kontakt_id"] != null)
            {

                int id;
                if (int.TryParse(Request.QueryString["kontakt_id"].ToString(), out id))
                {
                    var query = db.Kontakts.Where(k => k.K_Id.Equals(id)).Single();

                    TextBox_Navn.Text = query.Navn;
                    TextBox_Adresse.Text = query.Adresse;
                    TextBox_PostnrOgBy.Text = query.PostnrOgBy;
                    TextBox_Telefon.Text = query.Tlf;
                    TextBox_Mail.Text = query.Mail;

                }
            }
        }
    }
    protected void Button_GemRedigeret_Click(object sender, EventArgs e)
    {
        UpdateService(Request.QueryString["kontakt_id"]);

    }
    private void UpdateService(string querystring)
    {
        if (TextBox_Navn.Text == "")
        {
            Label_Error.Text = "skriv et navn";
        }
        else if (TextBox_Adresse.Text == "")
        {
            Label_Error.Text = "Skriv en adresse";
        }
        else if(TextBox_PostnrOgBy.Text == "")
        {
            Label_Error.Text = "Skriv post nr og by";
        }
        else if (TextBox_Telefon.Text == "")
        {
            Label_Error.Text = "Skriv et telefon nummer";
        }
        else if (TextBox_Mail.Text == "")
        {
            Label_Error.Text = "Skriv en mail";
        }


        else
        {
            if (querystring != null)
            {
                var query = (from k in db.Kontakts where k.K_Id == Convert.ToInt32(querystring) select k).Single();

                query.Navn = TextBox_Navn.Text;
                query.Adresse = TextBox_Adresse.Text;
                query.PostnrOgBy = TextBox_PostnrOgBy.Text;
                query.Tlf = TextBox_Telefon.Text;
                query.Mail = TextBox_Mail.Text;


                try
                {
                    db.SubmitChanges();
                    Response.Redirect("~/Admin/KontaktAdmin.aspx");
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex.Message);

                }

            }
        }


    }

}