<%@ Page Language="C#" AutoEventWireup="false" MasterPageFile="~/App_MasterPages/layout.Master"
    CodeBehind="OrderProcessing.aspx.cs" Inherits="CanhCam.Web.ProductUI.OrderProcessingPage" %>

<%@ Register TagPrefix="Site" TagName="OrderList" Src="~/Product/AdminCP/Controls/OrderListControl.ascx" %>
<asp:Content ContentPlaceHolderID="mainContent" ID="MPContent" runat="server">
    <Site:OrderList ID="orderList" runat="server" 
        PageTitle="Đơn hàng đang xử lý" PageUrl="~/Product/AdminCP/OrderProcessing.aspx"
        EditPageUrl="/Product/AdminCP/OrderProcessingEdit.aspx"
        OrderStatusValue="1" HideOrderStatusSearch="false"
        />
</asp:Content>