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

public partial class Admin_MaerkeAdmin : System.Web.UI.Page
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
                        OpretMaerke();
                    }
                    break;

                case "rediger":
                    RedigerMaerke();
                    break;

                case "slet":
                    SletMaerke();
                    break;
            }
        }
        else
        {
            VisMaerke();

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


        }


    }
    private void VisMaerke()
    {
        Panel_VisAlleMaerker.Visible = true;
        Repeater_AlleMaerker.DataSource = db.Maerkes;
        Repeater_AlleMaerker.DataBind();
    }

    private void SletMaerke()
    {
        if (Request.QueryString["maerke_id"] != null)
        {
            int id = int.Parse(Request.QueryString["maerke_id"].ToString());

            var query = db.Maerkes.Where(v => v.M_Id.Equals(id)).Single();
            
            var query22 = db.Vares.Where(v => v.Fk_MaerkeId.Equals(id));
           
            if(query22.ToList().Count > 0)
            {

                var query2 = db.Vares.Where(v => v.Fk_MaerkeId.Equals(id)).Single();
                Billeder billede = (from b in db.Billeders where b.B_Id == query2.Fk_BilledeId select b).Single();

                File.Delete(Server.MapPath("~/Billeder/Orginal/" + query2.Billeder.Sti));
                File.Delete(Server.MapPath("~/Billeder/Resized/" + query2.Billeder.Sti));

                db.Vares.DeleteOnSubmit(query2);
                db.SubmitChanges();

                db.Billeders.DeleteOnSubmit(billede);
                db.SubmitChanges();
            }
            
            

            File.Delete(Server.MapPath("~/Billeder/Orginal/" + query.Billede));
            File.Delete(Server.MapPath("~/Billeder/Maerker/" + query.Billede));

            

            db.Maerkes.DeleteOnSubmit(query);
            db.SubmitChanges();


            Response.Redirect("~/Admin/MaerkeAdmin.aspx");
        }
    }

    private void RedigerMaerke()
    {
        Panel_Form.Visible = true;
        Button_GemMaerke.Visible = false;
        Button_GemRedigeret.Visible = true;
        Literal_Legend.Text = "Rediger mærke";
        
        

        if (!IsPostBack)
        {
            if (Request.QueryString["maerke_id"] != null)
            {
                BindDdl();
                int id;
                if (int.TryParse(Request.QueryString["maerke_id"].ToString(), out id))
                {
                    var query = db.Maerkes.Where(m => m.M_Id.Equals(id)).Single();
                    TextBox_Navn.Text = query.Brand;
                    TextBox_Beskrivelse.Text = query.Beskrivelse;
                    DropDownList_Kategori.SelectedValue = Convert.ToString(query.Fk_KategoriId);

                    Repeater_Billede.DataSource = db.Maerkes.Where(m => m.M_Id.Equals(id));
                    Repeater_Billede.DataBind();
                }
            }
        }
    }

    private void OpretMaerke()
    {
        Panel_Form.Visible = true;
        Literal_Legend.Text = "Opret nyt mærke";

        BindDdl();
    }
    protected void Button_GemMaerke_Click(object sender, EventArgs e)
    {
        if (TextBox_Navn.Text == "")
        {
            Label_Error.Text = "Skriv et navn";
        }
        else if (Convert.ToInt32(DropDownList_Kategori.SelectedValue) == 0)
        {
            Label_Error.Text = "Vælg en kategori";
        }
        else if (TextBox_Beskrivelse.Text == "")
        {
            Label_Error.Text = "Skriv en beskrivelse";
        }
        else if (!FileUpload_Billede.HasFile)
        {
            Label_Error.Text = "Vælg et billede";
        }
        else
        {
            var myUniqueFileName = string.Format(@"{0}_", Guid.NewGuid());

            FileUpload_Billede.SaveAs(Server.MapPath("~/Billeder/Orginal/") + myUniqueFileName + FileUpload_Billede.FileName);


            // Kald Metoden MakeThumbs, som laver en Reisze af originalen til 200px i bredden og uploader den til Resized_original mappen 
            MakeThumb(myUniqueFileName + FileUpload_Billede.FileName, "/Billeder/Orginal/", 200, "/Billeder/Maerker/");

            Maerke nytMaerke = new Maerke
            {
                Brand = TextBox_Navn.Text,
                Billede = myUniqueFileName + FileUpload_Billede.FileName,
                Fk_KategoriId = Convert.ToInt32(DropDownList_Kategori.SelectedValue),
                Beskrivelse = TextBox_Beskrivelse.Text
            };
            db.Maerkes.InsertOnSubmit(nytMaerke);
            try
            {
                db.SubmitChanges();
                Response.Redirect("~/Admin/MaerkeAdmin.aspx");
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);

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

        else if (Convert.ToInt32(DropDownList_Kategori.SelectedValue) == 0)
        {
            Label_Error.Text = "Vælg en kategori";
        }
        else
        {
            if (FileUpload_Billede.HasFile && querystring != null)
            {
                var query = (from m in db.Maerkes where m.M_Id == Convert.ToInt32(querystring) select m).Single();

                File.Delete(Server.MapPath("~/Billeder/Orginal/" + query.Billede));
                File.Delete(Server.MapPath("~/Billeder/Maerker/" + query.Billede));

                var myUniqueFileName = string.Format(@"{0}_", Guid.NewGuid());

                FileUpload_Billede.SaveAs(Server.MapPath("~/Billeder/Orginal/") + myUniqueFileName + FileUpload_Billede.FileName);


                // Kald Metoden MakeThumbs, som laver en Reisze af originalen til 200px i bredden og uploader den til Resized_original mappen 
                MakeThumb(myUniqueFileName + FileUpload_Billede.FileName, "/Billeder/Orginal/", 200, "/Billeder/Maerker/");

                query.Brand = TextBox_Navn.Text;
                query.Billede = myUniqueFileName + FileUpload_Billede.FileName;
                query.Beskrivelse = TextBox_Beskrivelse.Text;
                query.Fk_KategoriId = Convert.ToInt32(DropDownList_Kategori.SelectedValue);


                try
                {
                    db.SubmitChanges();
                    Response.Redirect("~/Admin/MaerkeAdmin.aspx");
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
                    var query = (from m in db.Maerkes where m.M_Id == Convert.ToInt32(querystring) select m).Single();

                    query.Brand = TextBox_Navn.Text;

                    query.Beskrivelse = TextBox_Beskrivelse.Text;
                    query.Fk_KategoriId = Convert.ToInt32(DropDownList_Kategori.SelectedValue);


                    try
                    {
                        db.SubmitChanges();
                        Response.Redirect("~/Admin/MaerkeAdmin.aspx");
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
        UpdateService(Request.QueryString["maerke_id"]);

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