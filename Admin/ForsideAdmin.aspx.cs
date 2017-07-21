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

public partial class Admin_ForsideAdmin : System.Web.UI.Page
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
                    RedigerForside();
                    break;

                //case "slet":
                //    SletKontakt();
                //    break;
            }
        }
        else
        {
            Visforside();

        }
    }

    private void Visforside()
    {
        Panel_VisAlleForside.Visible = true;
        Repeater_AlleForside.DataSource = db.Forsides;
        Repeater_AlleForside.DataBind();
    }

    private void RedigerForside()
    {
        Panel_Form.Visible = true;
        Literal_Legend.Text = "Rediger forside";

        if (!IsPostBack)
        {
            if (Request.QueryString["forside_id"] != null)
            {

                int id;
                if (int.TryParse(Request.QueryString["forside_id"].ToString(), out id))
                {
                    var query = db.Forsides.Where(f => f.F_Id.Equals(id)).Single();

                    TextBox_Overskrift.Text = query.Overskrift;
                    TextBox_Tekst.Text = query.Tekst;

                    Repeater_Billede.DataSource = db.Forsides;
                    Repeater_Billede.DataBind();

                }
            }
        }
    }
    protected void Button_GemRedigeret_Click(object sender, EventArgs e)
    {
        UpdateService(Request.QueryString["forside_id"]);
        
    }
    private void UpdateService(string querystring)
    {
        if (TextBox_Overskrift.Text == "")
        {
            Label_Error.Text = "skriv en overskrift";
        }
        else if (TextBox_Tekst.Text == "")
        {
            Label_Error.Text = "Skriv noget tekst";
        }



        else
        {
            if (FileUpload_Billede.HasFile && querystring != null)
            {
                var query = (from f in db.Forsides where f.F_Id == Convert.ToInt32(querystring) select f).Single();

                File.Delete(Server.MapPath("~/Billeder/" + query.Billede));
                File.Delete(Server.MapPath("~/Billeder/ForsideOrg/" + query.Billede));

                FileUpload_Billede.SaveAs(Server.MapPath("~/Billeder/") + FileUpload_Billede.FileName);

                // Kald Metoden MakeThumbs, som laver en Reisze af originalen til 290px i bredden og uploader den til Resized_original mappen 
                MakeThumb(FileUpload_Billede.FileName, "/Billeder/", 290, "/Billeder/ForsideOrg/");

                query.Overskrift = TextBox_Overskrift.Text;
                query.Tekst = TextBox_Tekst.Text;
                query.Billede = FileUpload_Billede.FileName;

                try
                {
                    db.SubmitChanges();
                    Response.Redirect("~/Admin/ForsideAdmin.aspx");
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
                    var query = (from f in db.Forsides where f.F_Id == Convert.ToInt32(querystring) select f).Single();

                    query.Overskrift = TextBox_Overskrift.Text;
                    query.Tekst = TextBox_Tekst.Text;


                    try
                    {
                        db.SubmitChanges();
                        Response.Redirect("~/Admin/ForsideAdmin.aspx");
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine(ex.Message);

                    }
                }

            }
        }


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