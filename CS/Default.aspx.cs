using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.DataAccess.ConnectionParameters;

namespace AspProject
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ASPxDashboardViewer1_ConfigureDataConnection(object sender, DevExpress.DashboardWeb.ConfigureDataConnectionWebEventArgs e)
        {
            switch (e.ConnectionName)
            {
                case "nwindConnection":
                    Access97ConnectionParameters access = e.ConnectionParameters as Access97ConnectionParameters;
                    if (access != null)
                        access.FileName = Server.MapPath( @"~/App_Data/nwind.mdb");
                    break;
                
            }
        }
    }
}