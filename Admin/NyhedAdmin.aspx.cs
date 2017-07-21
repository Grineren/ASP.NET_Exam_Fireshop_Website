using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_NyhedAdmin : System.Web.UI.Page
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
                        OpretNyhed();
                    }
                    break;

                case "rediger":
                    RedigerNyhed();
                    break;

                case "slet":
                    SletNyhed();
                    break;
            }
        }
        else
        {
            VisNyhed();

        }
    }

    private void VisNyhed()
    {
        Panel_VisAlleNyheder.Visible = true;
        Repeater_AlleNyheder.DataSource = db.Nyheders;
        Repeater_AlleNyheder.DataBind();
    }

    private void SletNyhed()
    {
        if (Request.QueryString["nyhed_id"] != null)
        {
            int id = int.Parse(Request.QueryString["nyhed_id"].ToString());

            var query = db.Nyheders.Where(n => n.N_Id.Equals(id)).Single();

           
            db.Nyheders.DeleteOnSubmit(query);
            db.SubmitChanges();


            Response.Redirect("~/Admin/NyhedAdmin.aspx");
        }
    }

    private void RedigerNyhed()
    {
        Panel_Form.Visible = true;
        Button_GemNyhed.Visible = false;
        Button_GemRedigeret.Visible = true;
        Literal_Legend.Text = "Rediger nyhed";

        if (!IsPostBack)
        {
            if (Request.QueryString["nyhed_id"] != null)
            {
                
                int id;
                if (int.TryParse(Request.QueryString["nyhed_id"].ToString(), out id))
                {
                    var query = db.Nyheders.Where(n => n.N_Id.Equals(id)).Single();

                    TextBox_Overskrift.Text = query.Overskrift;
                    TextBox_Tekst.Text = query.Tekst;
                    
                }
            }
        }
    }

    private void OpretNyhed()
    {
        Panel_Form.Visible = true;
        Literal_Legend.Text = "Opret en nyhed";

    }
    protected void Button_GemNyhed_Click(object sender, EventArgs e)
    {
        if(TextBox_Overskrift.Text == "")
        {
            Label_Error.Text = "Skriv et navn";
        }
        else if (TextBox_Tekst.Text == "")
        {
            Label_Error.Text = "Skriv noget tekst";
        }
        else
        {
            Nyheder nyNyhed = new Nyheder
            {
                Overskrift = TextBox_Overskrift.Text,
                Tekst = TextBox_Tekst.Text,
                Dato = DateTime.Now
            };
            db.Nyheders.InsertOnSubmit(nyNyhed);
            try
            {
                db.SubmitChanges();
                Response.Redirect("~/Admin/NyhedAdmin.aspx");
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);

            }
            
        }
    }
    protected void Button_GemRedigeret_Click(object sender, EventArgs e)
    {
        UpdateService(Request.QueryString["nyhed_id"]);

    }
    private void UpdateService(string querystring)
    {
        if (TextBox_Overskrift.Text == "")
        {
            Label_Error.Text = "skriv en overskrift";
        }
        else if (TextBox_Tekst.Text == "")
        {
            Label_Error.Text = "Skriv en tekst";
        }

      
        else
        {
            if (querystring != null)
            {
                var query = (from n in db.Nyheders where n.N_Id == Convert.ToInt32(querystring) select n).Single();

                query.Overskrift = TextBox_Overskrift.Text;
                query.Tekst = TextBox_Tekst.Text;


                try
                {
                    db.SubmitChanges();
                    Response.Redirect("~/Admin/NyhedAdmin.aspx");
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex.Message);

                }

            }
        }


    }

}