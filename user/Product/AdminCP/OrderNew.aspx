<%@ Page Language="C#" AutoEventWireup="false" MasterPageFile="~/App_MasterPages/layout.Master"
    CodeBehind="OrderNew.aspx.cs" Inherits="CanhCam.Web.ProductUI.OrderNewPage" %>

<%@ Register TagPrefix="Site" TagName="OrderList" Src="~/Product/AdminCP/Controls/OrderListControl.ascx" %>
<asp:Content ContentPlaceHolderID="mainContent" ID="MPContent" runat="server">
    <Site:OrderList ID="orderList" runat="server" 
        PageTitle="Danh sách đơn hàng mới" PageUrl="~/Product/AdminCP/OrderNew.aspx"
        EditPageUrl="/Product/AdminCP/OrderNewEdit.aspx"
        OrderStatusValue="0" HideOrderStatusSearch="false"
        />
</asp:Content>