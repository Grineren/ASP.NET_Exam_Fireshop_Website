using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Login : System.Web.UI.Page
{
    private DataClassesDataContext db = new DataClassesDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ButtonLogIn_Click(object sender, EventArgs e)
    {
        string salt = "HdSd321dSda23SDAl23";

        var query = from x in db.Admins where x.Kodeord == sha256(TextBoxPassword.Text + salt) && x.Brugernavn == TextBoxUsername.Text select x;


        if (query.Count() == 1)
        {
            HttpContext.Current.Session["userId"] = query.Single().A_Id;
            Response.Redirect("~/Admin/DefaultAdmin.aspx");
        }
        else
        {
            LiteralMsg.Text = "Forkert login";
        }
    }
    static string sha256(string textToHashSha256)
    {
        System.Security.Cryptography.SHA256Managed crypt = new System.Security.Cryptography.SHA256Managed();
        System.Text.StringBuilder hash = new System.Text.StringBuilder();
        byte[] crypto = crypt.ComputeHash(Encoding.UTF8.GetBytes(textToHashSha256), 0, Encoding.UTF8.GetByteCount(textToHashSha256));
        foreach (byte theByte in crypto)
        {
            hash.Append(theByte.ToString("x2"));
        }
        return hash.ToString();
    }
}