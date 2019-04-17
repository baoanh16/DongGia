<%@ Page Language="C#" AutoEventWireup="false" MasterPageFile="~/App_MasterPages/layout.Master"
    CodeBehind="OrderReviewEdit.aspx.cs" Inherits="CanhCam.Web.ProductUI.OrderReviewEditPage" %>

<%@ Register TagPrefix="Site" TagName="OrderEdit" Src="~/Product/AdminCP/Controls/OrderEditControl.ascx" %>
<asp:Content ContentPlaceHolderID="mainContent" ID="MPContent" runat="server">
    <Site:OrderEdit ID="orderEdit" runat="server" 
        PageUrl="/Product/AdminCP/OrderReviewEdit.aspx" IsEditable="false" AccountType="3"
        ParentTitle="Danh sách đơn hàng" ParentUrl="/Product/AdminCP/OrderReview.aspx"
        />
</asp:Content>