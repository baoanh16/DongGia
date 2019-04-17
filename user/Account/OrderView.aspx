<%@ Page Language="c#" MaintainScrollPositionOnPostback="true" CodeBehind="OrderView.aspx.cs"
    MasterPageFile="~/App_MasterPages/layout.Master" AutoEventWireup="false" Inherits="CanhCam.Web.AccountUI.OrderViewPage" %>

<%@ Register TagPrefix="Site" TagName="AccountMenu" Src="~/Account/AccountMenu.ascx" %>
<asp:Content ContentPlaceHolderID="mainContent" ID="MPContent" runat="server">
	<section class="user-wrapper">

		<div class="container">
			<div class="row">
				<Site:AccountMenu ID="accountMenu" runat="server" />
				<div class="col-lg-9">
					<div class="account-info">
						<asp:Xml ID="xmlTransformer" runat="server"></asp:Xml>
					</div>
				</div>
			</div>
		</div>
	</section>
</asp:Content>