using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    private DataClassesDataContext db = new DataClassesDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        Repeater_FooterInfo.DataSource = db.Kontakts;
        Repeater_FooterInfo.DataBind();
    }
    protected void Button_Soeg_Click(object sender, EventArgs e)
    {
        if(TextBox_Soeg.Text != "")
        {
            Response.Redirect("Soeg.aspx?result=" + Server.UrlEncode(TextBox_Soeg.Text));

        }
    }
}
