<%@ Control Language="C#" AutoEventWireup="false" CodeBehind="OrderEditControl.ascx.cs" Inherits="CanhCam.Web.ProductUI.OrderEditControl" %>

<%@ Register TagPrefix="Site" Assembly="CanhCam.Features.Product" Namespace="CanhCam.Web.ProductUI" %>
<Site:ProductDisplaySettings ID="displaySettings" runat="server" />
<portal:BreadcrumbAdmin ID="breadcrumb" runat="server"
    ParentTitle="<%$Resources:ProductResources, OrderAdminTitle %>" ParentUrl="~/Product/AdminCP/OrderList.aspx"
    CurrentPageTitle="<%$Resources:ProductResources, OrderDetailTitle %>" CurrentPageUrl="~/Product/AdminCP/OrderEdit.aspx" />
<div class="admin-content col-md-12">
    <portal:HeadingPanel ID="heading" runat="server">
        <asp:Button ID="btnUpdate" SkinID="UpdateButton" Text="<%$Resources:ProductResources, ProductUpdateButton %>" runat="server" />
        <asp:Button ID="btnSendToGHN" SkinID="UpdateButton" Visible="false" Text="Gửi đến giaohangnhanh.vn" runat="server" />
        <asp:Button ID="btnDeliveried" SkinID="UpdateButton" Visible="false" Text="Đã giao hàng" runat="server" />
        <asp:Button ID="btnOK" SkinID="UpdateButton" Visible="false" Text="Xác nhận" runat="server" CausesValidation="false" />
        <asp:Button ID="btnFinished" SkinID="UpdateButton" Visible="false" Text="Hoàn tất" runat="server" CausesValidation="false" />
        <asp:Button ID="btnCancel" SkinID="DeleteButton" Visible="false" Text="Hủy đơn hàng" runat="server" CausesValidation="false" />
        <asp:Button ID="btnDelete" SkinID="DeleteButton" Text="<%$Resources:Resource, DeleteButton %>" runat="server" CausesValidation="false" />
    </portal:HeadingPanel>
    <portal:NotifyMessage ID="message" runat="server" />
    <div class="workplace">
        <div class="row">
            <div class="col-md-4">
                <h3>
                    <gb:SiteLabel ID="lblCustomerInfo" runat="server" ConfigKey="OrderCustomerInfo" ResourceFile="ProductResources" UseLabelTag="false" />
                </h3>
                <div class="form-horizontal">
                    <div class="settingrow form-group">
                        <gb:SiteLabel ID="lblBillingFirstName" runat="server" CssClass="settinglabel control-label col-sm-3" ConfigKey="OrderFirstNameLabel" ResourceFile="ProductResources" />
                        <div class="col-sm-9">
                            <asp:TextBox ID="txtBillingFirstName" runat="server" />
                            <asp:Literal ID="litBillingFirstName" Visible="false" runat="server" />
                        </div>
                    </div>
                    <div id="divBillingLastName" runat="server" visible="false" class="settingrow form-group">
                        <gb:SiteLabel ID="lblBillingLastName" runat="server" CssClass="settinglabel control-label col-sm-3" ConfigKey="OrderLastNameLabel" ResourceFile="ProductResources" />
                        <div class="col-sm-9">
                            <asp:TextBox ID="txtBillingLastName" runat="server" />
                            <asp:Literal ID="litBillingLastName" Visible="false" runat="server" />
                        </div>
                    </div>
                    <div class="settingrow form-group">
                        <gb:SiteLabel ID="lblBillingEmail" runat="server" CssClass="settinglabel control-label col-sm-3" ConfigKey="OrderEmailLabel" ResourceFile="ProductResources" />
                        <div class="col-sm-9">
                            <asp:TextBox ID="txtBillingEmail" runat="server" />
                            <asp:Literal ID="litBillingEmail" Visible="false" runat="server" />
                        </div>
                    </div>
                    <div class="settingrow form-group">
                        <gb:SiteLabel ID="lblBillingPhone" runat="server" CssClass="settinglabel control-label col-sm-3" ConfigKey="OrderPhoneLabel" ResourceFile="ProductResources" />
                        <div class="col-sm-9">
                            <asp:TextBox ID="txtBillingPhone" runat="server" />
                            <asp:Literal ID="litBillingPhone" Visible="false" runat="server" />
                        </div>
                    </div>
                    <div class="settingrow form-group">
                        <gb:SiteLabel ID="lblBillingAddress" runat="server" CssClass="settinglabel control-label col-sm-3" ConfigKey="OrderAddressLabel" ResourceFile="ProductResources" />
                        <div class="col-sm-9">
                            <asp:TextBox ID="txtBillingAddress" runat="server" />
                            <asp:Literal ID="litBillingAddress" Visible="false" runat="server" />
                        </div>
                    </div>
                    <asp:UpdatePanel ID="upBilling" runat="server">
                        <ContentTemplate>
                            <div class="settingrow form-group">
                                <gb:SiteLabel ID="lblBillingProvince" runat="server" CssClass="settinglabel control-label col-sm-3" ConfigKey="OrderProvinceLabel" ResourceFile="ProductResources" />
                                <div class="col-sm-9">
                                    <asp:DropDownList ID="ddBillingProvince" AutoPostBack="true" AppendDataBoundItems="true" DataValueField="Guid" DataTextField="Name" runat="server">
                                        <asp:ListItem Text="<%$Resources:ProductResources, OrderSelectLabel %>" Value=""></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:Literal ID="litBillingProvince" Visible="false" runat="server" />
                                </div>
                            </div>
                            <div class="settingrow form-group">
                                <gb:SiteLabel ID="lblBillingDistrict" runat="server" CssClass="settinglabel control-label col-sm-3" ConfigKey="OrderDistrictLabel" ResourceFile="ProductResources" />
                                <div class="col-sm-9">
                                    <asp:DropDownList ID="ddBillingDistrict" AutoPostBack="true" DataValueField="Guid" DataTextField="Name" runat="server">
                                        <asp:ListItem Text="<%$Resources:ProductResources, OrderSelectLabel %>" Value=""></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:Literal ID="litBillingDistrict" Visible="false" runat="server" />
                                </div>
                            </div>
                            <div class="settingrow form-group">
                                <gb:SiteLabel ID="lblBillingWard" runat="server" CssClass="settinglabel control-label col-sm-3" ConfigKey="OrderWardLabel" ResourceFile="ProductResources" />
                                <div class="col-sm-9">
                                    <asp:DropDownList ID="ddBillingWard" AutoPostBack="true" DataValueField="Guid" DataTextField="Name" runat="server">
                                        <asp:ListItem Text="<%$Resources:ProductResources, OrderSelectLabel %>" Value=""></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:Literal ID="litBillingWard" Visible="false" runat="server" />
                                </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <div class="settingrow form-group">
                        <gb:SiteLabel ID="lblBillingStreet" runat="server" CssClass="settinglabel control-label col-sm-3" Text="Họ tên bé" />
                        <div class="col-sm-9">
                            <asp:TextBox ID="txtBillingStreet" runat="server" />
                            <asp:Literal ID="litBillingStreet" Visible="false" runat="server" />
                        </div>
                    </div>
                    <div class="settingrow form-group">
                        <gb:SiteLabel ID="lblBillingFax" runat="server" CssClass="settinglabel control-label col-sm-3" Text="Ngày sinh" />
                        <div class="col-sm-9">
                            <asp:TextBox ID="txtBillingFax" runat="server" />
                            <asp:Literal ID="litBillingFax" Visible="false" runat="server" />
                        </div>
                    </div>
                    <div id="divAffiliate" runat="server" visible="false">
                        <div class="settingrow form-group">
                            <gb:SiteLabel ID="lblAff" runat="server" CssClass="settinglabel control-label col-sm-6" Text="Tài khoản Affiliate:" />
                            <div class="col-sm-6">
                                <p class="form-control-static"><asp:Literal ID="litAff" runat="server" /></p>
                            </div>
                        </div>
                    </div>
                    <div id="divAccessTrade" runat="server" visible="false">
                        <div class="settingrow form-group">
                            <gb:SiteLabel ID="lblAccessTrade" runat="server" CssClass="settinglabel control-label col-sm-6" Text="AT Conversion:" />
                            <div class="col-sm-6">
                                <p class="form-control-static"><asp:Literal ID="litAccessTrade" runat="server" /></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <h3>
                    <gb:SiteLabel ID="lblConsigneeInfo" runat="server" ConfigKey="OrderConsigneeInfo" ResourceFile="ProductResources"  UseLabelTag="false" />
                </h3>
                <div class="form-horizontal">
                    <div class="settingrow form-group">
                        <gb:SiteLabel ID="lblShippingFirstName" runat="server" CssClass="settinglabel control-label col-sm-3" ConfigKey="OrderFirstNameLabel" ResourceFile="ProductResources" />
                        <div class="col-sm-9">
                            <asp:TextBox ID="txtShippingFirstName" runat="server" />
                            <asp:Literal ID="litShippingFirstName" Visible="false" runat="server" />
                        </div>
                    </div>
                    <div id="divShippingLastName" runat="server" visible="false" class="settingrow form-group">
                        <gb:SiteLabel ID="lblShippingLastName" runat="server" CssClass="settinglabel control-label col-sm-3" ConfigKey="OrderLastNameLabel" ResourceFile="ProductResources" />
                        <div class="col-sm-9">
                            <asp:TextBox ID="txtShippingLastName" runat="server" />
                            <asp:Literal ID="litShippingLastName" Visible="false" runat="server" />
                        </div>
                    </div>
                    <div class="settingrow form-group">
                        <gb:SiteLabel ID="lblShippingEmail" runat="server" CssClass="settinglabel control-label col-sm-3" ConfigKey="OrderEmailLabel" ResourceFile="ProductResources" />
                        <div class="col-sm-9">
                            <asp:TextBox ID="txtShippingEmail" runat="server" />
                            <asp:Literal ID="litShippingEmail" Visible="false" runat="server" />
                        </div>
                    </div>
                    <div class="settingrow form-group">
                        <gb:SiteLabel ID="lblShippingPhone" runat="server" CssClass="settinglabel control-label col-sm-3" ConfigKey="OrderPhoneLabel" ResourceFile="ProductResources" />
                        <div class="col-sm-9">
                            <asp:TextBox ID="txtShippingPhone" runat="server" />
                            <asp:Literal ID="litShippingPhone" Visible="false" runat="server" />
                        </div>
                    </div>
                    <div class="settingrow form-group">
                        <gb:SiteLabel ID="lblShippingAddress" runat="server" CssClass="settinglabel control-label col-sm-3" ConfigKey="OrderAddressLabel" ResourceFile="ProductResources" />
                        <div class="col-sm-9">
                            <asp:TextBox ID="txtShippingAddress" runat="server" />
                            <asp:Literal ID="litShippingAddress" Visible="false" runat="server" />
                        </div>
                    </div>
                    <asp:UpdatePanel ID="upShipping" runat="server">
                        <ContentTemplate>
                            <div class="settingrow form-group">
                                <gb:SiteLabel ID="lblShippingProvince" runat="server" CssClass="settinglabel control-label col-sm-3" ConfigKey="OrderProvinceLabel" ResourceFile="ProductResources" />
                                <div class="col-sm-9">
                                    <asp:DropDownList ID="ddShippingProvince" AutoPostBack="true" AppendDataBoundItems="true" DataValueField="Guid" DataTextField="Name" runat="server">
                                        <asp:ListItem Text="<%$Resources:ProductResources, OrderSelectLabel %>" Value=""></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:Literal ID="litShippingProvince" Visible="false" runat="server" />
                                </div>
                            </div>
                            <div class="settingrow form-group">
                                <gb:SiteLabel ID="lblShippingDistrict" runat="server" CssClass="settinglabel control-label col-sm-3" ConfigKey="OrderDistrictLabel" ResourceFile="ProductResources" />
                                <div class="col-sm-9">
                                    <asp:DropDownList ID="ddShippingDistrict" AutoPostBack="true" DataValueField="Guid" DataTextField="Name" runat="server">
                                        <asp:ListItem Text="<%$Resources:ProductResources, OrderSelectLabel %>" Value=""></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:Literal ID="litShippingDistrict" Visible="false" runat="server" />
                                </div>
                            </div>
                            <div class="settingrow form-group">
                                <gb:SiteLabel ID="lblShippingWard" runat="server" CssClass="settinglabel control-label col-sm-3" ConfigKey="OrderWardLabel" ResourceFile="ProductResources" />
                                <div class="col-sm-9">
                                    <asp:DropDownList ID="ddShippingWard" AutoPostBack="true" DataValueField="Guid" DataTextField="Name" runat="server">
                                        <asp:ListItem Text="<%$Resources:ProductResources, OrderSelectLabel %>" Value=""></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:Literal ID="litShippingWard" Visible="false" runat="server" />
                                </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <div class="settingrow form-group">
                        <gb:SiteLabel ID="lblShippingStreet" runat="server" CssClass="settinglabel control-label col-sm-3" Text="Họ tên bé" />
                        <div class="col-sm-9">
                            <asp:TextBox ID="txtShippingStreet" runat="server" />
                            <asp:Literal ID="litShippingStreet" Visible="false" runat="server" />
                        </div>
                    </div>
                    <div class="settingrow form-group">
                        <gb:SiteLabel ID="lblShippingFax" runat="server" CssClass="settinglabel control-label col-sm-3" Text="Ngày sinh" />
                        <div class="col-sm-9">
                            <asp:TextBox ID="txtShippingFax" runat="server" />
                            <asp:Literal ID="litShippingFax" Visible="false" runat="server" />
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <h3>
                    <gb:SiteLabel ID="lblOrderInfo" runat="server" ConfigKey="OrderInfoLabel" ResourceFile="ProductResources" UseLabelTag="false" />
                </h3>
                <div class="form-horizontal">
                    <div class="settingrow form-group">
                        <gb:SiteLabel ID="lblOrderStatus" runat="server" CssClass="settinglabel control-label col-sm-5" ConfigKey="OrderStatusLabel" ResourceFile="ProductResources" />
                        <div class="col-sm-7">
                            <asp:DropDownList ID="ddOrderStatus" CssClass="order-status" runat="server" />
                            <asp:Label ID="litOrderStatus" Visible="false" runat="server" />
                        </div>
                    </div>
                    <div class="settingrow form-group">
                        <gb:SiteLabel ID="lblOrderNote" runat="server" CssClass="settinglabel control-label col-sm-5" ConfigKey="OrderNoteLabel" ResourceFile="ProductResources" />
                        <div class="col-sm-7">
                            <asp:TextBox ID="txtOrderNote" TextMode="MultiLine" style="min-height:50px" runat="server" />
                            <asp:Literal ID="litOrderNote" runat="server" />
                        </div>
                    </div>
                    <div class="settingrow form-group">
                        <gb:SiteLabel ID="lblShippingStatus" runat="server" CssClass="settinglabel control-label col-sm-5" Text="Tình trạng Giao hàng" />
                        <div class="col-sm-7">
                            <p class="form-control-static">
                                <asp:Literal ID="litShippingStatus" runat="server" />
                            </p>
                        </div>
                    </div>
                    <div class="settingrow form-group">
                        <gb:SiteLabel ID="lblCreatedOn" runat="server" CssClass="settinglabel control-label col-sm-5" ConfigKey="OrderCreatedOnLabel" ResourceFile="ProductResources" />
                        <div class="col-sm-7">
                            <p class="form-control-static">
                                <asp:Literal ID="litCreatedOn" runat="server" />
                            </p>
                        </div>
                    </div>
                    <div class="settingrow form-group">
                        <gb:SiteLabel ID="lblOrderCode" runat="server" CssClass="settinglabel control-label col-sm-5" ConfigKey="OrderCodeLabel" ResourceFile="ProductResources" />
                        <div class="col-sm-7">
                            <p class="form-control-static">
                                <asp:Literal ID="litOrderCode" runat="server" />
                            </p>
                        </div>
                    </div>
                    <asp:UpdatePanel ID="upMethod" runat="server">
                        <ContentTemplate>
                            <div id="divShippingMethod" runat="server" class="settingrow form-group">
                                <gb:SiteLabel ID="lblShippingMethod" runat="server" CssClass="settinglabel control-label col-sm-5" ConfigKey="ShippingMethodLabel" ResourceFile="ProductResources" />
                                <div class="col-sm-7">
                                    <asp:RadioButtonList ID="rdbListShippingMethod" AutoPostBack="true" RepeatLayout="UnorderedList" CssClass="nav" DataTextField="Name" DataValueField="ShippingMethodId" runat="server" />
                                    <asp:Literal ID="litShippingMethod" Visible="false" runat="server" />
                                </div>
                            </div>
                            <div id="divPaymentMethod" runat="server" class="settingrow form-group">
                                <gb:SiteLabel ID="lblPaymentMethod" runat="server" CssClass="settinglabel control-label col-sm-5" ConfigKey="PaymentMethodLabel" ResourceFile="ProductResources" />
                                <div class="col-sm-7">
                                    <asp:RadioButtonList ID="rdbListPaymentMethod" RepeatLayout="UnorderedList" CssClass="nav" DataTextField="Name" DataValueField="PaymentMethodId" runat="server" />
                                    <asp:Literal ID="litPaymentMethod" Visible="false" runat="server" />
                                </div>
                            </div>
                            <div class="settingrow form-group">
                                <gb:SiteLabel ID="lblSubTotal" runat="server" CssClass="settinglabel control-label col-sm-5" ConfigKey="OrderSubTotalLabel" ResourceFile="ProductResources" />
                                <div class="col-sm-7">
                                    <p class="form-control-static"><b><asp:Literal ID="litSubTotal" runat="server" /></b></p>
                                </div>
                            </div>
                            <div class="settingrow form-group">
                                <gb:SiteLabel ID="lblShippingFee" runat="server" CssClass="settinglabel control-label col-sm-5" ConfigKey="OrderShippingFeeLabel" ResourceFile="ProductResources" />
                                <div class="col-sm-7">
                                    <p class="form-control-static"><b><asp:Literal ID="litShippingFee" runat="server" /></b></p>
                                </div>
                            </div>
                            <div class="settingrow form-group">
                                <gb:SiteLabel ID="lblDiscount" runat="server" CssClass="settinglabel control-label col-sm-5" ConfigKey="OrderDiscountLabel" ResourceFile="ProductResources" />
                                <div class="col-sm-7">
                                    <p class="form-control-static"><b><asp:Literal ID="litDiscount" runat="server" /></b></p>
                                </div>
                            </div>
                            <div class="settingrow form-group">
                                <gb:SiteLabel ID="lblOrderTotal" runat="server" CssClass="settinglabel control-label col-sm-5" ConfigKey="OrderTotalLabel" ResourceFile="ProductResources" />
                                <div class="col-sm-7">
                                    <p class="form-control-static">
                                        <b>
                                            <asp:Literal ID="litOrderTotal" runat="server" />
                                        </b>
                                    </p>
                                </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <div id="divCouponCode" runat="server" visible="false" class="settingrow form-group">
                        <gb:SiteLabel ID="lblCouponCode" runat="server" CssClass="settinglabel control-label col-sm-5" ConfigKey="OrderCouponCodeLabel" ResourceFile="ProductResources" />
                        <div class="col-sm-7">
                            <p class="form-control-static"><b><asp:Literal ID="litCouponCode" runat="server" /></b></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <h3>
            <gb:SiteLabel ID="lblProductList" runat="server" ConfigKey="ProductListTitle" ResourceFile="ProductResources" UseLabelTag="false" />
        </h3>
        <telerik:RadGrid ID="grid" SkinID="radGridSkin" runat="server">
            <MasterTableView DataKeyNames="Guid,ProductId,AttributeDescription,AttributesXml,Quantity,DiscountAmount" AllowPaging="false" AllowSorting="false">
                <Columns>
                    <telerik:GridTemplateColumn HeaderText="<%$Resources:ProductResources, ProductNameLabel %>" UniqueName="ProductName">
                        <ItemTemplate>
                            <asp:Literal ID="litProductCode" runat="server" />
                            <div>
                                <asp:Literal ID="litProductName" runat="server" />
                            </div>
                            <%# Eval("AttributeDescription")%>
                            <asp:Literal ID="litAttributes" Visible="false" runat="server" />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="<%$Resources:ProductResources, OrderQuantityLabel %>" UniqueName="Quantity">
                        <ItemTemplate>
                            <asp:TextBox ID="txtQuantity" SkinID="NumericTextBox" Visible="false"
                                MaxLength="4" Text='<%# Eval("Quantity") %>' runat="server" />
                            <%# Eval("Quantity") %>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" HeaderText="<%$Resources:ProductResources, OrderPriceLabel %>" UniqueName="OrderPrice">
                        <ItemTemplate>
                            <%#CanhCam.Web.ProductUI.ProductHelper.FormatPrice(Convert.ToDecimal(Eval("Price")), true)%>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" HeaderText="Khuyến mãi" UniqueName="DiscountAmount">
                        <ItemTemplate>
                            <%#CanhCam.Web.ProductUI.ProductHelper.FormatPrice(Convert.ToDecimal(Eval("DiscountAmount")), true)%>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" HeaderText="<%$Resources:ProductResources, OrderTotalPriceLabel %>" UniqueName="OrderTotalPrice">
                        <ItemTemplate>
                            <%#CanhCam.Web.ProductUI.ProductHelper.FormatPrice(Convert.ToDecimal(Eval("Price")) * Convert.ToInt32(Eval("Quantity")) - Convert.ToDecimal(Eval("DiscountAmount")), true) %>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn Visible="false" UniqueName="Delete">
                        <ItemTemplate>
                            <asp:LinkButton ID="btnDelete" CssClass="cp-link" CommandName="Delete" CommandArgument='<%#Eval("Guid").ToString()%>' Text="Hủy" runat="server" />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </div>
</div>
<style type="text/css">
    .attributes {font-size: 12px;font-style: italic;}
</style>
<div id="divWarningScripts" runat="server">
    <script type="text/javascript">
        var currVal = $('.order-status').val();
        $('.order-status').change(function () {
            var selected = $(this).val();

            if (selected == '1' || selected == '2') {
                //var message = "Khi chuyển sang trạng thái \"" + $(this).find('option:selected').text() + "\", website sẽ gửi SMS cho KH.\n\nBạn có chắc chắn muốn tiếp tục?\n";
                var message = "KHI CHUYỂN SANG TRẠNG THÁI \"" + $(this).find('option:selected').text().toUpperCase() + "\", WEBSITE SẼ GỬI SMS CHO KH.\n\nBẠN CÓ CHẮC CHẮN MUỐN TIẾP TỤC?\n";
                if (!confirm(message)) {
                    $(this).val(currVal);
                    return false;
                }
            }

            currVal = $(this).val();
        });
    </script>
</div>