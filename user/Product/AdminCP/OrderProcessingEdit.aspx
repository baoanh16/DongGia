<%@ Page Language="C#" AutoEventWireup="false" MasterPageFile="~/App_MasterPages/layout.Master"
    CodeBehind="OrderProcessingEdit.aspx.cs" Inherits="CanhCam.Web.ProductUI.OrderProcessingEditPage" %>

<%@ Register TagPrefix="Site" TagName="OrderEdit" Src="~/Product/AdminCP/Controls/OrderEditControl.ascx" %>
<asp:Content ContentPlaceHolderID="mainContent" ID="MPContent" runat="server">
    <Site:OrderEdit ID="orderEdit" runat="server" 
        PageUrl="/Product/AdminCP/OrderProcessingEdit.aspx" IsEditable="false" AccountType="2"
        ParentTitle="Đơn hàng đang xử lý" ParentUrl="/Product/AdminCP/OrderProcessing.aspx"
        />
</asp:Content>