using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class KontaktSide : System.Web.UI.Page
{
    private DataClassesDataContext db = new DataClassesDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        Repeater_KontaktOplysninger.DataSource = db.Kontakts;
        Repeater_KontaktOplysninger.DataBind();

        Repeater_AsideTilbud.DataSource = db.Tilbuds.Take(3);
        Repeater_AsideTilbud.DataBind();
    }
    protected void Button_Send_Click(object sender, EventArgs e)
    {



        if (RegexValidation.IsNameValid(TextBox_Kontaktperson.Text) == false)
        {
            Label_Error.Text = "Fejl i navn";
        }
        else if (RegexValidation.IsTlfNrValid(TextBox_Telefon.Text) == false)
        {
            Label_Error.Text = "Fejl i telefon nummer";
        }
        else if (RegexValidation.IsEmailValid(TextBox_Email.Text) == false)
        {
            Label_Error.Text = "Forkert mail";
        }
        else if (TextBox_Sporgsmal.Text == "")
        {
            Label_Error.Text = "Skriv et spørgsmål";
        }
        else
        {

            Response.Redirect(Request.RawUrl);

            //Kode der sender en mail via SMTP protokolen - det kræver at serveren er sat op til det 
            //but here it is 

            //MailMessage objeto_mail = new MailMessage();
            //SmtpClient client = new SmtpClient();
            //client.Port = 25;
            //client.Host = "smtp.internal.mycompany.com";
            //client.Timeout = 10000;
            //client.DeliveryMethod = SmtpDeliveryMethod.Network;
            //client.UseDefaultCredentials = false;
            //client.Credentials = new System.Net.NetworkCredential("user", "Password");
            //objeto_mail.From = new MailAddress("from@server.com");
            //objeto_mail.To.Add(new MailAddress("to@server.com"));
            //objeto_mail.Subject = TextBox_Email.Text + TextBox_Kontaktperson.Text + TextBox_Firmanavn.Text + TextBox_Telefon.Text;
            //objeto_mail.Body = TextBox_Sporgsmal.Text;
            //client.Send(objeto_mail);
        }



    }


   


}