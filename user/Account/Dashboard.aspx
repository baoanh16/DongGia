<%@ Page Language="c#" MaintainScrollPositionOnPostback="true" CodeBehind="Dashboard.aspx.cs"
    MasterPageFile="~/App_MasterPages/layout.Master" AutoEventWireup="false" Inherits="CanhCam.Web.AccountUI.DashboardPage" %>

<%@ Register TagPrefix="Site" TagName="AccountMenu" Src="~/Account/AccountMenu.ascx" %>
<asp:Content ContentPlaceHolderID="mainContent" ID="MPContent" runat="server">
	<section class="user-wrapper">
		<div class="container">
			<div class="row">
				<Site:AccountMenu ID="accountMenu" runat="server" />
				<div class="col-lg-9">
					<div class="user-page">
						<div class="account-info">
							<div class="row">
								<div class="col-12">
									<div class="title-wrap">
										<h2 class="postname">
											<asp:Literal ID="litHeading" Text="Personal Information" runat="server" />
										</h2>
										<asp:HyperLink ID="lnkProfileEdit" runat="server" CssClass="link lnr-pencil lnr"
											Text="Edit">
										</asp:HyperLink>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="info-detail col-sm">
									<div class="label">Name</div>
									<div class="detail">
										<asp:Literal ID="litFullName" runat="server" />
									</div>
								</div>
								<div class="info-detail col-sm">
									<div class="label">Email</div>
									<div class="detail">
										<asp:Literal ID="litEmail" runat="server" />
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-12">
									<div class="title-wrap">
										<h2 class="postname" style="margin-top: 40px">
											Address book
										</h2>
										<asp:HyperLink ID="lnkAddress" runat="server" CssClass="link lnr-pencil lnr"
											Text="Edit">
										</asp:HyperLink>
									</div>
								</div>
							</div>
							<div class="row address-list" style="margin-bottom: 0">
								<asp:Repeater ID="rptAddress" runat="server">
									<ItemTemplate>
										<div class="address-item col-sm default">

											<div class="name"><%#Eval("FirstName")%>
												<span class="is-default">
													<%# CanhCam.Web.AccountUI.AccountHelper.GetIsDefaultText(Convert.ToBoolean(Eval("IsDefault")))%>
												</span>
											</div>
											<div class="addr-detail">
												<ul>
													<li class="address">
														<%# FormatAddress(Eval("Address").ToString(), Eval("ProvinceGuid").ToString(), Eval("DistrictGuid").ToString(), Eval("WardGuid").ToString())%>
													</li>
													<li class="phone"><%#Eval("Phone")%></li>
												</ul>
											</div>
											<a href='<%# SiteRoot + "/Account/AddressEdit.aspx?id=" + Eval("AddressId").ToString() %>'
												class="btn-editaddr d-none">Edit</a>
										</div>
									</ItemTemplate>
								</asp:Repeater>
							</div>
							<div class="row">
								<div class="col-12">

									<div class="title-wrap">
										<h2 class="postname" style="margin-top: 40px">
											Recent orders
										</h2>
										<!-- <asp:HyperLink ID="lnkAllOrders" runat="server" CssClass="link" Text="Xem tất cả">
									</asp:HyperLink> -->
									</div>
								</div>
							</div>
							<div class="row recent-orders">
								<!-- <div class="col-md-6">
									<div class="coin-info">
										<div class="info-detail">
											<div class="detail">
												<asp:Literal ID="litCurrentPoints" runat="server" />
											</div>
										</div>
									</div>
								</div> -->
								<div class="col-12">
									<div class="cart-history">
										<asp:Xml ID="xmlTransformer" runat="server"></asp:Xml>


									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</asp:Content>