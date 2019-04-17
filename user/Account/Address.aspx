<%@ Page Language="c#" MaintainScrollPositionOnPostback="true" CodeBehind="Address.aspx.cs"
    MasterPageFile="~/App_MasterPages/layout.Master" AutoEventWireup="false" Inherits="CanhCam.Web.AccountUI.AddressPage" %>


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
									<h2 class="postname">
										<asp:Literal ID="litHeading" Text="Address Book" runat="server" />
									</h2>
								</div>
							</div>
							<div class="row address-list no-gutters">
								<asp:Repeater ID="rptAddress" runat="server">
									<ItemTemplate>
										<div class="address-item col-12"
											style="border-bottom: 1px solid #e1e1e1; padding: 20px 0">
											<div class="name"><%#Eval("FirstName")%>
												<span class="is-default">
													<%# CanhCam.Web.AccountUI.AccountHelper.GetIsDefaultText(Convert.ToBoolean(Eval("IsDefault")))%>
												</span>
												<a href='<%# SiteRoot + "/Account/AddressEdit.aspx?id=" + Eval("AddressId").ToString() %>'
													class="btn-editaddr lnr-pencil lnr link">Edit</a>
											</div>
											<div class="addr-detail">
												<ul>
													<li><%# FormatAddress(Eval("Address").ToString(), Eval("ProvinceGuid").ToString(), Eval("DistrictGuid").ToString(), Eval("WardGuid").ToString())%>
													</li>
													<li><%#Eval("Phone")%></li>
												</ul>
											</div>

											<asp:HiddenField ID="hdfIsDefault"
												Value='<%# Convert.ToBoolean(Eval("IsDefault")) %>' runat="server" />
											<asp:LinkButton ID="hplDeleteAddress" Visible="false"
												CommandName="DeleteAddress" CommandArgument='<%#Eval("AddressId")%>'
												CssClass="btn-deleteaddr" Text="Remove" runat="server" />
										</div>
									</ItemTemplate>
								</asp:Repeater>
							</div>
							<div class="row">
								<div class="col-12">

									<asp:HyperLink ID="lnkInsert" runat="server" CssClass="btn-addaddr btn-default"
										Text="Add a new address">
									</asp:HyperLink>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</asp:Content>