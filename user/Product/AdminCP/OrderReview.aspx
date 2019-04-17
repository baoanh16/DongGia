<%@ Page Language="C#" AutoEventWireup="false" MasterPageFile="~/App_MasterPages/layout.Master"
    CodeBehind="OrderReview.aspx.cs" Inherits="CanhCam.Web.ProductUI.OrderReviewPage" %>

<%@ Register TagPrefix="Site" TagName="OrderList" Src="~/Product/AdminCP/Controls/OrderListControl.ascx" %>
<asp:Content ContentPlaceHolderID="mainContent" ID="MPContent" runat="server">
    <Site:OrderList ID="orderList" runat="server" 
        PageTitle="Xem lại đơn hàng" PageUrl="~/Product/AdminCP/OrderReview.aspx"
        EditPageUrl="/Product/AdminCP/OrderReviewEdit.aspx"
        OrderStatusValue="1" ShippingStatusValue="2" HideOrderStatusSearch="false"
        />
</asp:Content>