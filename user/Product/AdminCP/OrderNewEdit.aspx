<%@ Page Language="C#" AutoEventWireup="false" MasterPageFile="~/App_MasterPages/layout.Master"
    CodeBehind="OrderNewEdit.aspx.cs" Inherits="CanhCam.Web.ProductUI.OrderNewEditPage" %>

<%@ Register TagPrefix="Site" TagName="OrderEdit" Src="~/Product/AdminCP/Controls/OrderEditControl.ascx" %>
<asp:Content ContentPlaceHolderID="mainContent" ID="MPContent" runat="server">
    <Site:OrderEdit ID="orderEdit" runat="server" 
        PageUrl="/Product/AdminCP/OrderNewEdit.aspx" AccountType="1"
        ParentTitle="Danh sách đơn hàng mới" ParentUrl="/Product/AdminCP/OrderNew.aspx"
        />
</asp:Content>