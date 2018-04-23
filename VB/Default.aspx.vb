Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports DevExpress.DataAccess.ConnectionParameters

Namespace AspProject
    Partial Public Class [Default]
        Inherits System.Web.UI.Page

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)

        End Sub

        Protected Sub ASPxDashboardViewer1_ConfigureDataConnection(ByVal sender As Object, ByVal e As DevExpress.DashboardWeb.ConfigureDataConnectionWebEventArgs)
            Select Case e.ConnectionName
                Case "nwindConnection"
                    Dim access As Access97ConnectionParameters = TryCast(e.ConnectionParameters, Access97ConnectionParameters)
                    If access IsNot Nothing Then
                        access.FileName = Server.MapPath("~/App_Data/nwind.mdb")
                    End If

            End Select
        End Sub
    End Class
End Namespace