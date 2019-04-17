<%@ Page Language="C#" AutoEventWireup="false" MasterPageFile="~/App_MasterPages/layout.Master"
    CodeBehind="OrderEdit.aspx.cs" Inherits="CanhCam.Web.ProductUI.OrderEditPage" %>

<%@ Register TagPrefix="Site" Assembly="CanhCam.Features.Product" Namespace="CanhCam.Web.ProductUI" %>
<asp:Content ContentPlaceHolderID="mainContent" ID="MPContent" runat="server">
    <Site:ProductDisplaySettings ID="displaySettings" runat="server" />
    <portal:BreadcrumbAdmin ID="breadcrumb" runat="server"
        ParentTitle="<%$Resources:ProductResources, OrderAdminTitle %>" ParentUrl="~/Product/AdminCP/OrderList.aspx"
        CurrentPageTitle="<%$Resources:ProductResources, OrderDetailTitle %>" CurrentPageUrl="~/Product/AdminCP/OrderEdit.aspx" />
    <div class="admin-content col-md-12">
        <portal:HeadingPanel ID="heading" runat="server">
            <asp:Button ID="btnUpdate" SkinID="UpdateButton" Text="<%$Resources:ProductResources, ProductUpdateButton %>" runat="server" />
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
                        <div class="settingrow form-group">
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
                                        <asp:DropDownList ID="ddBillingDistrict" DataValueField="Guid" DataTextField="Name" runat="server">
                                            <asp:ListItem Text="<%$Resources:ProductResources, OrderSelectLabel %>" Value=""></asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:Literal ID="litBillingDistrict" Visible="false" runat="server" />
                                    </div>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <div id="divRewardPoints" runat="server">
                            <hr />
                            <div class="settingrow form-group">
                                <gb:SiteLabel ID="lblPointReward" runat="server" ForControl="txtPointReward" CssClass="settinglabel control-label col-sm-3" Text="Điểm thưởng" ResourceFile="ProductResources" />
                                <div class="col-sm-9">
                                    <asp:TextBox ID="txtPointReward" runat="server" />
                                </div>
                            </div>
                            <div class="settingrow form-group">
                                <gb:SiteLabel ID="lblPointUsed" runat="server" ForControl="txtPointUsed" CssClass="settinglabel control-label col-sm-3" Text="Điểm sử dụng" ResourceFile="ProductResources" />
                                <div class="col-sm-9">
                                    <asp:TextBox ID="txtPointUsed" runat="server" />
                                </div>
                            </div>
                            <div class="settingrow form-group">
                                <gb:SiteLabel ID="lblPointApproved" runat="server" ForControl="chkPointApproved" CssClass="settinglabel control-label col-sm-3" Text="Duyệt điểm" ResourceFile="ProductResources" />
                                <div class="col-sm-9">
                                    <asp:CheckBox ID="chkPointApproved" runat="server" />
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
                        <div class="settingrow form-group">
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
                            </ContentTemplate>
                        </asp:UpdatePanel>
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
                                <asp:DropDownList ID="ddOrderStatus" runat="server" />
                                <asp:Label ID="litOrderStatus" Visible="false" runat="server" />
                            </div>
                        </div>
                        <div class="settingrow form-group">
                            <gb:SiteLabel ID="lblOrderNote" runat="server" CssClass="settinglabel control-label col-sm-5" ConfigKey="OrderNoteLabel" ResourceFile="ProductResources" />
                            <div class="col-sm-7">
                                <asp:TextBox ID="txtOrderNote" TextMode="MultiLine" style="min-height:50px" runat="server" />
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
                                    </div>
                                </div>
                                <div id="divPaymentMethod" runat="server" class="settingrow form-group">
                                    <gb:SiteLabel ID="lblPaymentMethod" runat="server" CssClass="settinglabel control-label col-sm-5" ConfigKey="PaymentMethodLabel" ResourceFile="ProductResources" />
                                    <div class="col-sm-7">
                                        <asp:RadioButtonList ID="rdbListPaymentMethod" RepeatLayout="UnorderedList" CssClass="nav" DataTextField="Name" DataValueField="PaymentMethodId" runat="server" />
                                    </div>
                                </div>
                                <div class="settingrow form-group">
                                    <gb:SiteLabel ID="lblPaymentStatus" runat="server" CssClass="settinglabel control-label col-sm-5" ConfigKey="PaymentStatusLabel" ResourceFile="ProductResources" />
                                    <div class="col-sm-7">
                                        <asp:DropDownList ID="ddlPaymentStatus" runat="server">
                                            <asp:ListItem Text="" Value="-1"></asp:ListItem>
                                            <asp:ListItem Text="Đã thanh toán" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Pending" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="Chưa thanh toán" Value="3"></asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:Button ID="btnGetPaymentStatus" Text="Kiểm tra thủ công" SkinID="DefaultButton" Visible="false" runat="server" />
                                    </div>
                                </div>
                                <div class="settingrow form-group">
                                    <gb:SiteLabel ID="lblOrderSubtotal" runat="server" CssClass="settinglabel control-label col-sm-5" ConfigKey="OrderSubTotalLabel" ResourceFile="ProductResources" />
                                    <div class="col-sm-7">
                                        <p class="form-control-static">
                                            <b>
                                                <asp:Literal ID="litOrderSubtotal" runat="server" />
                                            </b>
                                        </p>
                                    </div>
                                </div>
                                <div class="settingrow form-group">
                                    <gb:SiteLabel ID="lblShippingFee" runat="server" CssClass="settinglabel control-label col-sm-5" ConfigKey="OrderShippingFeeLabel" ResourceFile="ProductResources" />
                                    <div class="col-sm-7">
                                        <p class="form-control-static">
                                            <b>
                                                <asp:Literal ID="litShippingFee" runat="server" />
                                            </b>
                                        </p>
                                    </div>
                                </div>
                                <div class="settingrow form-group">
                                    <gb:SiteLabel ID="lblOrderDiscount" runat="server" CssClass="settinglabel control-label col-sm-5" ConfigKey="OrderDiscountLabel" ResourceFile="ProductResources" />
                                    <div class="col-sm-7">
                                        <p class="form-control-static">
                                            <b>
                                                <asp:Literal ID="litOrderDiscount" runat="server" />
                                            </b>
                                        </p>
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
                    </div>
                </div>
            </div>
            <h3>
                <gb:SiteLabel ID="lblProductList" runat="server" ConfigKey="ProductListTitle" ResourceFile="ProductResources" UseLabelTag="false" />
            </h3>
            <asp:HyperLink ID="hplAddNewProduct" CssClass="popup-link btn btn-default" Text="<%$Resources:Resource, InsertButton %>" runat="server" />
            <telerik:RadGrid ID="grid" SkinID="radGridSkin" runat="server">
                <MasterTableView DataKeyNames="Guid,ProductId,AttributeDescription,AttributesXml,Quantity,DiscountAmount" AllowPaging="false" AllowSorting="false">
                    <Columns>
                        <telerik:GridTemplateColumn HeaderText="<%$Resources:ProductResources, ProductNameLabel %>" UniqueName="ProductName">
                            <ItemTemplate>
                                <asp:Literal ID="litProductCode" runat="server" />
                                <div>
                                    <asp:Literal ID="litProductName" runat="server" />
                                </div>
                                <asp:Literal ID="litAttributes" runat="server" />
                                <div class="gifts">
                                    <%#Eval("AttributeDescription")%>
                                </div>
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
                                <asp:Button ID="btnDelete" SkinID="InsertButton" CommandName="Delete" CommandArgument='<%#Eval("Guid").ToString()%>' Text="Hủy" runat="server" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
        </div>
    </div>
    <style type="text/css">
        .attributes {font-size: 12px;font-style: italic;}
        .gifts img{max-width:50px;}
    </style>
</asp:Content>