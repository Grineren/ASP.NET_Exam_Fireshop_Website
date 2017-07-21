using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_MasterPageAdmin : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userId"] == null || Session["userId"].ToString() == "")
        {
            Response.Redirect("~/admin/Login.aspx");
        }
    }
    protected void Button_LogUd_Click(object sender, EventArgs e)
    {
        if (Session["userId"] != null)
        {
            Session.Remove("userId");
            Session.Clear();
            Response.Redirect("~/Admin/Login.aspx");
        }
        else
        {
            Response.Redirect("~/Admin/Login.aspx");

        }
    }
}
