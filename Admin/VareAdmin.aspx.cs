using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_VareAdmin : System.Web.UI.Page
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
                        OpretVare();
                    }
                    break;

                case "rediger":
                    RedigerVare();
                    break;

                case "slet":
                    SletVare();
                    break;
            }
        }
        else
        {
            VisVare();

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
            DropDownList_Kategori.Items.Insert(0, new ListItem("Vælg kategori", "0"));


            DropDownList_Maerke.DataSource = db.Maerkes;
            DropDownList_Maerke.DataValueField = "M_Id";
            DropDownList_Maerke.DataTextField = "Brand";
            DropDownList_Maerke.DataBind();
            DropDownList_Maerke.Items.Insert(0, new ListItem("Vælg mærke", "0"));
        }


    }

    private void VisVare()
    {
        Panel_VisAlleVare.Visible = true;
        Repeater_AlleVare.DataSource = db.Vares;
        Repeater_AlleVare.DataBind();

    }

    private void SletVare()
    {
        if (Request.QueryString["vare_id"] != null)
        {
            int id = int.Parse(Request.QueryString["vare_id"].ToString());

            var query = db.Vares.Where(v => v.V_Id.Equals(id)).Single();

            File.Delete(Server.MapPath("~/Billeder/Orginal/" + query.Billeder.Sti));
            File.Delete(Server.MapPath("~/Billeder/Resized/" + query.Billeder.Sti));

            Billeder billede = (from b in db.Billeders where b.B_Id == query.Fk_BilledeId select b).Single();

            var erDerTilbud = (from x in db.Tilbuds where x.Fk_VareId == id select x).SingleOrDefault();
            if(erDerTilbud != null)
            {
                Tilbud tilbud = (from t in db.Tilbuds where t.Fk_VareId == id select t).Single();

                db.Tilbuds.DeleteOnSubmit(tilbud);
                db.SubmitChanges();

                db.Vares.DeleteOnSubmit(query);
                db.SubmitChanges();

                db.Billeders.DeleteOnSubmit(billede);
                db.SubmitChanges();
            }
            else
            {
                db.Vares.DeleteOnSubmit(query);
                db.SubmitChanges();

                db.Billeders.DeleteOnSubmit(billede);
                db.SubmitChanges();
            }
           

           

            

            Response.Redirect("~/Admin/VareAdmin.aspx");
                        
            //var query = from n in db._Nyheders where n.N_Id == id select n;

            //var query2 = query.Single();
            
            //if (query2.Fk_Billede_Id != null)
            //{
            //    File.Delete(Server.MapPath("~/img/NyhedBilleder/Orginal/" + query2._Billeder.Billede));
            //    File.Delete(Server.MapPath("~/img/NyhedBilleder/Resized/" + query2._Billeder.Billede));
            //    _Billeder billede = (from b in db._Billeders where b.B_Id == query2.Fk_Billede_Id select b).Single();

            //    db._Nyheders.DeleteOnSubmit(query2);
            //    db.SubmitChanges();

            //    db._Billeders.DeleteOnSubmit(billede);
            //    db.SubmitChanges();
            //}
            //else
            //{
            //    db._Nyheders.DeleteOnSubmit(query2);
            //    db.SubmitChanges();
            //}
            
            //Response.Redirect("NyhedsblogAdmin.aspx");

        }
    }

    private void OpretVare()
    {
        Panel_Form.Visible = true;
        Literal_Legend.Text = "Opret ny vare";

        BindDdl();

    }
    protected void Button_GemVare_Click(object sender, EventArgs e)
    {
        if (TextBox_Navn.Text == "")
        {
            Label_Error.Text = "skriv et navn";
        }
        else if (TextBox_Beskrivelse.Text == "")
        {
            Label_Error.Text = "Skriv en beskrivelse";
        }
        else if (TextBox_Pris.Text == "")
        {
            Label_Error.Text = "Skriv en pris";
        }
        else if (!FileUpload_Billede.HasFile)
        {
            Label_Error.Text = "Vælg et billede";
        }
        else if (Convert.ToInt32(DropDownList_Kategori.SelectedValue) == 0)
        {
            Label_Error.Text = "Vælg en kategori";
        }
        else if (Convert.ToInt32(DropDownList_Maerke.SelectedValue) == 0)
        {
            Label_Error.Text = "Vælg et mærke";
        }

        else
        {


            var myUniqueFileName = string.Format(@"{0}_", Guid.NewGuid());

            FileUpload_Billede.SaveAs(Server.MapPath("~/Billeder/Orginal/") + myUniqueFileName + FileUpload_Billede.FileName);

            Billeder nytBillede = new Billeder
            {
                Sti = myUniqueFileName + FileUpload_Billede.FileName
            };
            db.Billeders.InsertOnSubmit(nytBillede);
            db.SubmitChanges();

            // Kald Metoden MakeThumbs, som laver en Reisze af originalen til 120px i bredden og uploader den til Resized_original mappen 
            MakeThumb(myUniqueFileName + FileUpload_Billede.FileName, "/Billeder/Orginal/", 120, "/Billeder/Resized/");

            Vare nyVare = new Vare
            {
                Navn = TextBox_Navn.Text,
                Pris = Convert.ToInt32(TextBox_Pris.Text),
                Beskrivelse = TextBox_Beskrivelse.Text,
                Fk_BilledeId = nytBillede.B_Id,
                Fk_KategoriId = Convert.ToInt32(DropDownList_Kategori.SelectedValue),
                Fk_MaerkeId = Convert.ToInt32(DropDownList_Maerke.SelectedValue)
            };
            db.Vares.InsertOnSubmit(nyVare);
            try
            {
                db.SubmitChanges();
                Response.Redirect("~/Admin/VareAdmin.aspx");
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);

            }
        }
       
    }
    private void RedigerVare()
    {
        Panel_Form.Visible = true;
        Button_GemVare.Visible = false;
        Button_GemRedigeret.Visible = true;
        Literal_Legend.Text = "Rediger vare";
        Panel_RedigerBilledeVisGammelt.Visible = true;

        if (!IsPostBack)
        {
            if (Request.QueryString["vare_id"] != null)
            {
                BindDdl();
                int id;
                if (int.TryParse(Request.QueryString["vare_id"].ToString(), out id))
                {
                    var query = db.Vares.Where(v => v.V_Id.Equals(id)).Single();
                    TextBox_Navn.Text = query.Navn;
                    TextBox_Pris.Text = Convert.ToString(query.Pris);
                    TextBox_Beskrivelse.Text = query.Beskrivelse;
                    DropDownList_Kategori.SelectedValue = Convert.ToString(query.Fk_KategoriId);
                    DropDownList_Maerke.SelectedValue = Convert.ToString(query.Fk_MaerkeId);

                    Repeater_Billede.DataSource = db.Vares.Where(v => v.V_Id.Equals(id));
                    Repeater_Billede.DataBind();

                }
            }
        }
    }
    private void UpdateService(string querystring)
    {
        if (TextBox_Navn.Text == "")
        {
            Label_Error.Text = "skriv et navn";
        }
        else if (TextBox_Beskrivelse.Text == "")
        {
            Label_Error.Text = "Skriv en beskrivelse";
        }
        else if (TextBox_Pris.Text == "")
        {
            Label_Error.Text = "Skriv en pris";
        }
        else if (Convert.ToInt32(DropDownList_Kategori.SelectedValue) == 0)
        {
            Label_Error.Text = "Vælg en kategori";
        }
        else if (Convert.ToInt32(DropDownList_Maerke.SelectedValue) == 0)
        {
            Label_Error.Text = "Vælg et mærke";
        }
        else
        {
            if (FileUpload_Billede.HasFile && querystring != null)
            {
                var query = (from v in db.Vares where v.V_Id == Convert.ToInt32(querystring) select v).Single();

                File.Delete(Server.MapPath("~/Billeder/Orginal/" + query.Billeder.B_Id));
                File.Delete(Server.MapPath("~/Billeder/Resized/" + query.Billeder.B_Id));

                var myUniqueFileName = string.Format(@"{0}_", Guid.NewGuid());


                FileUpload_Billede.SaveAs(Server.MapPath("~/Billeder/Orginal/") + myUniqueFileName + FileUpload_Billede.FileName);

                // Kald Metoden MakeThumbs, som laver en Reisze af originalen til 768px i bredden og uploader den til Resized_original mappen 
                MakeThumb(myUniqueFileName + FileUpload_Billede.FileName, "/Billeder/Orginal/", 768, "/Billeder/Resized/");

                var queryBillede = (from b in db.Billeders where b.B_Id == query.Fk_BilledeId select b).Single();

                queryBillede.Sti = myUniqueFileName + FileUpload_Billede.FileName;

                query.Navn = TextBox_Navn.Text;
                query.Pris = Convert.ToInt32(TextBox_Pris.Text);
                query.Beskrivelse = TextBox_Beskrivelse.Text;
                query.Fk_KategoriId = Convert.ToInt32(DropDownList_Kategori.SelectedValue);
                query.Fk_MaerkeId = Convert.ToInt32(DropDownList_Maerke.SelectedValue);

                try
                {
                    db.SubmitChanges();
                    Response.Redirect("~/Admin/VareAdmin.aspx");
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex.Message);

                }
            }
            else
            {
                if (querystring != null)
                {
                    var query = (from v in db.Vares where v.V_Id == Convert.ToInt32(querystring) select v).Single();

                    query.Navn = TextBox_Navn.Text;
                    query.Pris = Convert.ToInt32(TextBox_Pris.Text);
                    query.Beskrivelse = TextBox_Beskrivelse.Text;
                    query.Fk_KategoriId = Convert.ToInt32(DropDownList_Kategori.SelectedValue);
                    query.Fk_MaerkeId = Convert.ToInt32(DropDownList_Maerke.SelectedValue);

                    try
                    {
                        db.SubmitChanges();
                        Response.Redirect("~/Admin/VareAdmin.aspx");
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine(ex.Message);

                    }

                }
            }
                
            
        }


    }
    protected void Button_GemRedigeret_Click(object sender, EventArgs e)
    {
        UpdateService(Request.QueryString["vare_id"]);

    }
    #region Metoden MakeThumb
    /// <summary>
    /// Opret et Thumb, baseret på en fil og en mappe
    /// </summary>
    /// <param name="Filename">Hvad hedder filen</param>
    /// <param name="UploadFolder">Hvor er den uploadet til</param>
    private void MakeThumb(string Filename, string UploadFolder, int bredde, string thumbuploadfolder)
    {
        // find det uploadede image
        System.Drawing.Image OriginalImg = System.Drawing.Image.FromFile(Server.MapPath("~/") + UploadFolder + Filename);

        // find højde og bredde på image
        int originalWidth = OriginalImg.Width;
        int originalHeight = OriginalImg.Height;

        // bestem den nye bredde på det thumbnail som skal laves
        int newWidth = bredde;

        // beregn den nye højde på thumbnailbilledet
        double ratio = newWidth / (double)originalWidth;
        int newHeight = Convert.ToInt32(ratio * originalHeight);


        Bitmap Thumb = new Bitmap(newWidth, newHeight, PixelFormat.Format24bppRgb);
        Thumb.SetResolution(OriginalImg.HorizontalResolution, OriginalImg.VerticalResolution);

        // Hvis billedet indeholder nogen form for transperans 
        //(mere eller mindre gennemsigtig, eller en gennemsigtig baggrund) bliver det gjort her
        Thumb.MakeTransparent();


        // opret det nye billede
        Graphics ThumbMaker = Graphics.FromImage(Thumb);
        ThumbMaker.InterpolationMode = InterpolationMode.HighQualityBicubic;

        ThumbMaker.DrawImage(OriginalImg,
            new Rectangle(0, 0, newWidth, newHeight),
            new Rectangle(0, 0, originalWidth, originalHeight),
            GraphicsUnit.Pixel);

        // encoding
        ImageCodecInfo encoder;
        string fileExt = System.IO.Path.GetExtension(Filename);
        switch (fileExt)
        {
            case ".png":
                encoder = GetEncoderInfo("image/png");
                break;

            case ".gif":
                encoder = GetEncoderInfo("image/gif");
                break;

            default:
                // default til JPG 
                encoder = GetEncoderInfo("image/jpeg");
                break;
        }

        EncoderParameters encoderParameters = new EncoderParameters(1);
        encoderParameters.Param[0] = new EncoderParameter(Encoder.Quality, 100L);

        // gem thumbnail i mappen /Images/Uploads/Thumbs/
        Thumb.Save(Server.MapPath("~") + thumbuploadfolder + Filename, encoder, encoderParameters);

        // Fjern originalbilledet, thumbnail mm, fra computerhukommelsen
        OriginalImg.Dispose();
        ThumbMaker.Dispose();
        Thumb.Dispose();

    }

    #region encoding metode

    private static ImageCodecInfo GetEncoderInfo(String mimeType)
    {
        ImageCodecInfo[] encoders = ImageCodecInfo.GetImageEncoders();
        for (int i = 0; i < encoders.Length; i++)
        {
            if (encoders[i].MimeType == mimeType)
            {
                return encoders[i];
            }
        }
        return null;
    }
    #endregion

    #endregion
}