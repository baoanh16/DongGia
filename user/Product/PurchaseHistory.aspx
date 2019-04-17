<%@ Page Language="C#" AutoEventWireup="false" MasterPageFile="~/App_MasterPages/layout.Master"
    CodeBehind="PurchaseHistory.aspx.cs" Inherits="CanhCam.Web.ProductUI.PurchaseHistoryPage" %>

<%@ Register TagPrefix="Site" TagName="AccountMenu" Src="~/Account/AccountMenu.ascx" %>
<asp:Content ContentPlaceHolderID="mainContent" ID="MPContent" runat="server">
	<section class="user-wrapper">

		<div class="container">
			<div class="row">
				<Site:AccountMenu ID="accountMenu" runat="server" />
				<div class="col-lg-9">
					<div class="user-page">
						<div class="account-info">
							<h2 class="postname">
								<asp:Literal ID="litTitle" Text="Đơn hàng của tôi" runat="server" />
							</h2>
							<div class="cart-history">
								<asp:Xml ID="xmlTransformer" runat="server"></asp:Xml>
								<div id="divPager" runat="server" class="pages text-xs-center">
									<portal:gbCutePager ID="pgr" runat="server" />
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</asp:Content>