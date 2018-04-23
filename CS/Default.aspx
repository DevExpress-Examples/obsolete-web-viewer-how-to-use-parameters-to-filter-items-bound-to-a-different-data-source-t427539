<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="AspProject.Default" %>

<%@ Register assembly="DevExpress.Dashboard.v16.1.Web, Version=16.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.DashboardWeb" tagprefix="dx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript" >
        function UpdateMasterFilter(webViewer, e) {
            
            var productIDs = GetSelectedFilterValues(webViewer, 'treeViewDashboardItem1', 'ProductID');
            var parameters = webViewer.GetParameters();
            var parameteProductIDs = parameters.GetParameterByName("ProductIDs");
            
            webViewer.BeginUpdateParameters();
            parameteProductIDs.SetValue(productIDs);            
            webViewer.EndUpdateParameters();

        }
        function GetSelectedFilterValues(viewer, itemName, measureFieldName) {
            var filterValueTuples = viewer.GetCurrentFilterValues(itemName);
            var itemData = viewer.GetItemData(itemName),
                axes = itemData.GetAxisNames(),
                measures = itemData.GetMeasures(),
                measure,
                result = [];
                
            var matchingMeasures = $.grep(measures, function (m) { return m.DataMember == measureFieldName && 'MinMax'.indexOf(m.SummaryType) >= 0 });
            if (matchingMeasures.length  == 0)
                return result;
            measure = matchingMeasures[0];            
            $.each(filterValueTuples, function (_, tuple) {                
                var dataSlice = itemData;
                $.each(axes, function (_, axis) {
                    var axisPoint = tuple.GetAxisPoint(axis);
                    dataSlice = dataSlice.GetSlice(axisPoint);
                });
                var measureValue = dataSlice.GetMeasureValue(measure.Id);                
                result.push(measureValue.GetValue());
            });
            return result;
        }

    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <dx:ASPxDashboardViewer ID="ASPxDashboardViewer1" runat="server" 
            DashboardSource="~/App_Data/FilterByParameter.xml" FullscreenMode="True" 
            onconfiguredataconnection="ASPxDashboardViewer1_ConfigureDataConnection" CalculateHiddenTotals="true" 
            >
            <ClientSideEvents MasterFilterSet="UpdateMasterFilter" MasterFilterCleared="UpdateMasterFilter" Loaded="UpdateMasterFilter" />
        </dx:ASPxDashboardViewer>
    
    </div>
    </form>
</body>
</html>
