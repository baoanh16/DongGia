<%@ Page Language="c#" CodeBehind="CouponEdit.aspx.cs" MasterPageFile="~/App_MasterPages/layout.Master"
    AutoEventWireup="false" Inherits="CanhCam.Web.ProductUI.CouponEditPage" %>

<%@ Import Namespace="CanhCam.Web.ProductUI" %>
<asp:Content ContentPlaceHolderID="leftContent" ID="MPLeftPane" runat="server" />
<asp:Content ContentPlaceHolderID="mainContent" ID="MPContent" runat="server">
    <portal:BreadcrumbAdmin ID="breadcrumb" runat="server" 
        ParentTitle="<%$Resources:ProductResources, CouponsPageTitle %>" ParentUrl="~/Product/AdminCP/Promotions/Coupons.aspx"
        CurrentPageTitle="<%$Resources:ProductResources, CouponEditTitle %>" CurrentPageUrl="~/Product/AdminCP/Promotions/CouponEdit.aspx" />
    <div class="admin-content col-md-12">
        <portal:HeadingPanel ID="heading" runat="server">
            <asp:Button SkinID="UpdateButton" ID="btnUpdate" ValidationGroup="CouponEdit" Text="<%$Resources:Resource, UpdateButton %>" runat="server" />
            <asp:Button SkinID="UpdateButton" ID="btnUpdateAndNew" ValidationGroup="CouponEdit" Text="<%$Resources:Resource, UpdateAndNewButton %>" runat="server" />
            <asp:Button SkinID="UpdateButton" ID="btnUpdateAndClose" ValidationGroup="CouponEdit" Text="<%$Resources:Resource, UpdateAndCloseButton %>" runat="server" />
            <asp:Button SkinID="InsertButton" ID="btnInsert" ValidationGroup="CouponEdit" Text="<%$Resources:Resource, InsertButton %>" runat="server" />
            <asp:Button SkinID="InsertButton" ID="btnInsertAndNew" ValidationGroup="CouponEdit" Text="<%$Resources:Resource, InsertAndNewButton %>" runat="server" />
            <asp:Button SkinID="InsertButton" ID="btnInsertAndClose" ValidationGroup="CouponEdit" Text="<%$Resources:Resource, InsertAndCloseButton %>" runat="server" />
            <asp:Button SkinID="DeleteButton" ID="btnDelete" runat="server" Text="<%$Resources:Resource, DeleteButton %>" CausesValidation="false" />
        </portal:HeadingPanel>
        <portal:NotifyMessage ID="message" runat="server" />
        <div class="workplace">
            <div id="divtabs" runat="server" class="tabs">
                <ul id="ulTabs" class="nav nav-tabs" runat="server">
                    <li role="presentation" class="active"><asp:Literal ID="litTabContent" runat="server" /></li>
                    <li role="presentation"><asp:Literal ID="litTabHistory" runat="server" /></li>
                </ul>
                <div class="tab-content">
                <div role="tabpanel" class="tab-pane fade active in" id="tabContent">
                    <div class="form-horizontal">
                        <div class="settingrow form-group">
                            <gb:SiteLabel id="lblCouponCode" runat="server" ForControl="txtCouponCode" ShowRequired="true" CssClass="settinglabel control-label col-sm-3" ConfigKey="CouponCodeLabel" ResourceFile="ProductResources" />
                            <div class="col-sm-9">
                                <asp:TextBox ID="txtCouponCode" MaxLength="50" runat="server" />
                                <asp:RequiredFieldValidator ID="reqCouponCode" runat="server" ControlToValidate="txtCouponCode"
                                    ErrorMessage="<%$Resources:ProductResources, CouponCodeRequiredWarning %>"
                                    Display="Dynamic" SetFocusOnError="true" CssClass="txterror" ValidationGroup="CouponEdit" />
                            </div>
                        </div>
                        <div class="settingrow form-group">
                            <gb:SiteLabel id="lblName" runat="server" ForControl="txtName" ShowRequired="true" CssClass="settinglabel control-label col-sm-3" ConfigKey="CouponNameLabel" ResourceFile="ProductResources" />
                            <div class="col-sm-9">
                                <asp:TextBox ID="txtName" MaxLength="255" runat="server" />
                                <asp:RequiredFieldValidator ID="reqName" runat="server" ControlToValidate="txtName"
                                    ErrorMessage="<%$Resources:ProductResources, CouponNameRequiredWarning %>"
                                    Display="Dynamic" SetFocusOnError="true" CssClass="txterror" ValidationGroup="CouponEdit" />
                            </div>
                        </div>
                        <div id="divDiscount" runat="server" visible="false" class="settingrow form-group">
                            <gb:SiteLabel id="lblDiscount" runat="server" ForControl="txtDiscount" ShowRequired="true" CssClass="settinglabel control-label col-sm-3" ConfigKey="CouponDiscountLabel" ResourceFile="ProductResources" />
                            <div class="col-sm-9">
                                <asp:TextBox ID="txtDiscount" SkinID="PriceTextBox" Text="0" style="display:inline-block" MaxLength="20" runat="server" />
                                <asp:DropDownList ID="ddlDiscountType" style="width:auto;display:inline-block" runat="server" />
                                <asp:RequiredFieldValidator ID="reqDiscount" runat="server" ControlToValidate="txtDiscount"
                                    ErrorMessage="<%$Resources:ProductResources, CouponDiscountRequiredWarning %>"
                                    Display="Dynamic" SetFocusOnError="true" CssClass="txterror" ValidationGroup="CouponEdit" />
                            </div>
                        </div>
                        <div class="settingrow form-group">
                            <gb:SiteLabel id="lblFromDate" runat="server" ForControl="dpFromDate" CssClass="settinglabel control-label col-sm-3" ConfigKey="CouponFromDateLabel" ResourceFile="ProductResources" />
                            <div class="col-sm-9">
                                <telerik:RadDateTimePicker ID="dpFromDate" Width="250" Height="30" Culture="en-US" DateInput-DateFormat="dd/MM/yyyy HH:mm" TimeView-TimeFormat="HH:mm" runat="server" Skin="Simple" />
                            </div>
                        </div>
                        <div class="settingrow form-group">
                            <gb:SiteLabel id="lblExpiryDate" runat="server" ForControl="dpExpiryDate" CssClass="settinglabel control-label col-sm-3" ConfigKey="CouponExpiryDateLabel" ResourceFile="ProductResources" />
                            <div class="col-sm-9">
                                <telerik:RadDateTimePicker ID="dpExpiryDate" Width="250" Height="30" Culture="en-US" DateInput-DateFormat="dd/MM/yyyy HH:mm" TimeView-TimeFormat="HH:mm" runat="server" Skin="Simple" />
                            </div>
                        </div>
                        <div id="divMinPurchase" runat="server" visible="false" class="settingrow form-group">
                            <gb:SiteLabel id="lblMinPurchase" runat="server" ForControl="txtMinPurchase" CssClass="settinglabel control-label col-sm-3" ConfigKey="CouponMinPurchaseLabel" ResourceFile="ProductResources" />
                            <div class="col-sm-9">
                                <asp:TextBox ID="txtMinPurchase" SkinID="PriceTextBox" MaxLength="20" runat="server" />
                            </div>
                        </div>
                        <div class="settingrow form-group">
                            <gb:SiteLabel id="lblLimitationTimes" runat="server" ForControl="txtLimitationTimes" CssClass="settinglabel control-label col-sm-3" Text="Số lần sử dụng coupon" ResourceFile="ProductResources" />
                            <div class="col-sm-9">
                                <asp:TextBox ID="txtLimitationTimes" SkinID="PriceTextBox" style="display:inline-block" Text="0" MaxLength="4" runat="server" />
                                <gb:SiteLabel id="lblLimitationTimesHint" runat="server" UseLabelTag="false" ConfigKey="CouponLimitationTimesHint" ResourceFile="ProductResources" />
                            </div>
                        </div>
                        <div class="settingrow form-group">
                            <gb:SiteLabel id="lblDiscountQtyStep" runat="server" ForControl="ddlDiscountQtyStep" CssClass="settinglabel control-label col-sm-3" Text="SL sản phẩm được áp dụng trong mỗi đơn hàng" ResourceFile="ProductResources" />
                            <div class="col-sm-9">
                                <asp:DropDownList ID="ddlDiscountQtyStep" runat="server">
                                    <asp:ListItem Value="1" Text="1"></asp:ListItem>
                                    <asp:ListItem Value="2" Text="2"></asp:ListItem>
                                    <asp:ListItem Value="3" Text="3"></asp:ListItem>
                                    <asp:ListItem Value="4" Text="4"></asp:ListItem>
                                    <asp:ListItem Value="5" Text="5"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="settingrow form-group">
                            <gb:SiteLabel id="lblMaximumQtyDiscount" runat="server" ForControl="txtMaximumQtyDiscount" CssClass="settinglabel control-label col-sm-3" Text="SL sản phẩm tối đa áp dụng mã khuyến mãi" ResourceFile="ProductResources" />
                            <div class="col-sm-9">
                                <asp:TextBox ID="txtMaximumQtyDiscount" SkinID="PriceTextBox" style="display:inline-block" Text="0" MaxLength="4" runat="server" />
                                <gb:SiteLabel id="lblMaximumQtyDiscountHint" runat="server" UseLabelTag="false" ConfigKey="CouponLimitationTimesHint" ResourceFile="ProductResources" />
                            </div>
                        </div>
                        <div class="settingrow form-group">
                            <gb:SiteLabel id="lblActiveStatus" runat="server" ForControl="ddActiveStatus" CssClass="settinglabel control-label col-sm-3" ConfigKey="CouponActiveStatusLabel" ResourceFile="ProductResources" />
                            <div class="col-sm-9">
                                <asp:DropDownList ID="ddActiveStatus" runat="server">
                                    <asp:ListItem Text="<%$Resources:ProductResources, CouponActiveLabel %>" Value="true"></asp:ListItem>
                                    <asp:ListItem Text="<%$Resources:ProductResources, CouponInactiveLabel %>" Value="false"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div id="divStores" visible="false" runat="server" class="settingrow form-group">
                            <gb:SiteLabel id="lblStores" runat="server" ForControl="cobStores" CssClass="settinglabel control-label col-sm-3" Text="Chỉ áp dụng cho cửa hàng" ResourceFile="ProductResources" />
                            <div class="col-sm-9">
                                <portal:ComboBox ID="cobStores" SelectionMode="Multiple" DataTextField="Name" DataValueField="ItemID" runat="server" />
                            </div>
                        </div>
                        <div id="divAppliedType" visible="false" runat="server" class="settingrow form-group">
                            <gb:SiteLabel id="lblAppliedType" runat="server" CssClass="settinglabel control-label col-sm-3" ConfigKey="CouponAppliedTypeLabel" ResourceFile="ProductResources" />
                            <asp:RadioButton ID="rdbAppliedToCategories" Text="<%$Resources:ProductResources, CouponAppliedToCategoriesLabel %>" Checked="true" GroupName="AppliedType" runat="server" />
                            <div class="appliedtocats">
                                <asp:UpdatePanel ID="upZones" runat="server">
                                    <ContentTemplate>
                                        <div class="clearfix">
                                            <div class="pull-left" style="width:45%;">
                                                <asp:Button SkinID="DefaultButton" ID="btnSearch2" Text="Load danh mục" runat="server" CausesValidation="false" />
                                                <telerik:RadGrid ID="grid2" SkinID="radGridSkin" runat="server">
                                                    <MasterTableView DataKeyNames="ZoneId" AllowPaging="false">
                                                        <Columns>
                                                            <telerik:GridTemplateColumn HeaderText="Danh mục">
                                                                <ItemTemplate>
                                                                    <%# Eval("Name") %>
                                                                </ItemTemplate>
                                                            </telerik:GridTemplateColumn>
                                                            <telerik:GridClientSelectColumn HeaderStyle-Width="35" />
                                                        </Columns>
                                                    </MasterTableView>
                                                </telerik:RadGrid>
                                            </div>
                                            <div class="pull-left mrt80" style="width:3%;">
                                                <asp:ImageButton ID="btnRemove2" runat="server" ImageUrl="~/Data/SiteImages/lt2.gif" CssClass="btnleft" />
                                                <asp:ImageButton ID="btnAdd2" runat="server" ImageUrl="~/Data/SiteImages/rt2.gif" CssClass="btnright" />
                                            </div>
                                            <div class="pull-left" style="width:51%;">
                                                <div class="mrb15">
                                                    <gb:SiteLabel ID="lblSelectedZones" runat="server" UseLabelTag="false" Text="Danh mục được chọn" />
                                                </div>
                                                <telerik:RadGrid ID="gridRelated2" SkinID="radGridSkin" runat="server">
                                                    <MasterTableView DataKeyNames="Guid,ItemId,UsePercentage,Discount">
                                                        <Columns>
                                                            <telerik:GridTemplateColumn HeaderText="Danh mục">
                                                                <ItemTemplate>
                                                                    <asp:Literal ID="litZoneName" runat="server" />
                                                                </ItemTemplate>
                                                            </telerik:GridTemplateColumn>
                                                            <telerik:GridTemplateColumn HeaderText="Giảm giá" UniqueName="ProductCode">
                                                                <ItemTemplate>
                                                                    <asp:TextBox ID="txtDiscount" SkinID="PriceTextBox" style="display:inline-block" Text='<%# ProductHelper.FormatPrice(Convert.ToDecimal(Eval("Discount"))) %>' MaxLength="20" runat="server" />
                                                                    <asp:DropDownList ID="ddlDiscountType" CssClass="percentage" style="width:auto;display:inline-block" runat="server">
                                                                        <asp:ListItem Value="1" Text="%"></asp:ListItem>
                                                                        <asp:ListItem Value="2" Text="VND"></asp:ListItem>
                                                                    </asp:DropDownList>
                                                                </ItemTemplate>
                                                            </telerik:GridTemplateColumn>
                                                            <telerik:GridTemplateColumn>
                                                                <ItemTemplate>
                                                                    <asp:HyperLink CssClass="popup-link" ID="GiftProducts" runat="server" 
                                                                        Font-Bold='<%# Convert.ToInt32(Eval("GiftType")) > 0 %>'
                                                                        Text="Quà tặng" NavigateUrl='<%# SiteRoot + "/Product/AdminCP/Promotions/CouponChooseGiftDialog.aspx?Guid=" + Eval("Guid") %>'>
                                                                    </asp:HyperLink>
                                                                </ItemTemplate>
                                                            </telerik:GridTemplateColumn>
                                                            <telerik:GridClientSelectColumn HeaderStyle-Width="35" />
                                                        </Columns>
                                                    </MasterTableView>
                                                </telerik:RadGrid>
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                            <div>
                                <asp:RadioButton ID="rdbAppliedToProducts" CssClass="col-sm-offset-3" Text="<%$Resources:ProductResources, CouponAppliedToProductsLabel %>" GroupName="AppliedType" runat="server" />
                                <div class="appliedtoproducts">
                                    <asp:UpdatePanel ID="up" runat="server">
                                        <ContentTemplate>
                                            <div class="clearfix">
                                            <div class="pull-left" style="width:45%;">
                                                <asp:Panel ID="pnlSearch" DefaultButton="btnSearch" runat="server">
                                                    <div class="settingrow form-group">
                                                        <gb:SiteLabel ID="lblZones" runat="server" ConfigKey="ZoneLabel"
                                                            ForControl="ddZones" CssClass="settinglabel control-label col-sm-3" />
                                                        <div class="col-sm-9">
                                                            <asp:DropDownList ID="ddZones" Width="100%" AutoPostBack="false" runat="server" />
                                                        </div>
                                                    </div>
                                                    <div class="settingrow form-group">
                                                        <gb:SiteLabel ID="lblTitle" runat="server" ConfigKey="ProductNameLabel"
                                                            ResourceFile="ProductResources" ForControl="txtTitle" CssClass="settinglabel control-label col-sm-3" />
                                                        <div class="col-sm-9">
                                                            <asp:TextBox ID="txtTitle" style="display:inline-block;width:76%;" runat="server" MaxLength="255" />
                                                            <asp:Button SkinID="SearchButton" ID="btnSearch" Text="<%$Resources:ProductResources, ProductSearchButton %>"
                                                                runat="server" CausesValidation="false" />
                                                        </div>
                                                    </div>
                                                </asp:Panel>
                                                <telerik:RadGrid ID="grid" SkinID="radGridSkin" runat="server">
                                                    <MasterTableView DataKeyNames="ProductId" AllowPaging="true">
                                                        <Columns>
                                                            <telerik:GridTemplateColumn HeaderStyle-Width="50" HeaderText="<%$Resources:ProductResources, ProductPictureHeading %>">
                                                                <ItemTemplate>
                                                                    <portal:MediaElement ID="ml" runat="server" Width="40" FileUrl='<%# ProductHelper.GetImageFilePath(siteSettings.SiteId, Convert.ToInt32(Eval("ProductId")), Eval("ImageFile").ToString(), Eval("ThumbnailFile").ToString()) %>' />
                                                                </ItemTemplate>
                                                            </telerik:GridTemplateColumn>
                                                            <telerik:GridTemplateColumn HeaderText="Sản phẩm">
                                                                <ItemTemplate>
                                                                    <%# Eval("Code") %>
                                                                    <div>
                                                                        <asp:HyperLink CssClass="cp-link" ID="Title" runat="server" Text='<%# Eval("Title").ToString() %>'
                                                                            NavigateUrl='<%# ProductHelper.FormatProductUrl(Eval("Url").ToString(), Convert.ToInt32(Eval("ProductId")), Convert.ToInt32(Eval("ZoneID")))  %>'>
                                                                        </asp:HyperLink>
                                                                    </div>
                                                                </ItemTemplate>
                                                            </telerik:GridTemplateColumn>
                                                            <telerik:GridTemplateColumn HeaderStyle-Width="75" ItemStyle-HorizontalAlign="Right" HeaderText="<%$Resources:ProductResources, ProductPriceLabel %>" UniqueName="Price">
                                                                <ItemTemplate>
                                                                    <%# ProductHelper.FormatPrice(Convert.ToDecimal(Eval("Price"))) %>
                                                                </ItemTemplate>
                                                            </telerik:GridTemplateColumn>
                                                            <telerik:GridClientSelectColumn HeaderStyle-Width="35" />
                                                        </Columns>
                                                    </MasterTableView>
                                                </telerik:RadGrid>
                                            </div>
                                            <div class="pull-left mrt150" style="width:3%;">
                                                <asp:ImageButton ID="btnRemove" runat="server" ImageUrl="~/Data/SiteImages/lt2.gif" CssClass="btnleft" />
                                                <asp:ImageButton ID="btnAdd" runat="server" ImageUrl="~/Data/SiteImages/rt2.gif" CssClass="btnright" />
                                            </div>
                                            <div class="pull-left mrt70" style="width:51%;">
                                                <div class="mrb15">
                                                    <gb:SiteLabel ID="lblRelatedProduct" runat="server" UseLabelTag="false" ResourceFile="ProductResources" ConfigKey="CouponSelectedProductsLabel" />
                                                </div>
                                                <telerik:RadGrid ID="gridRelated" SkinID="radGridSkin" runat="server">
                                                    <MasterTableView DataKeyNames="Guid,ItemId,UsePercentage,Discount">
                                                        <Columns>
                                                            <telerik:GridTemplateColumn HeaderStyle-Width="50" HeaderText="<%$Resources:ProductResources, ProductPictureHeading %>">
                                                                <ItemTemplate>
                                                                    <portal:MediaElement ID="ml" runat="server" Width="40" />
                                                                </ItemTemplate>
                                                            </telerik:GridTemplateColumn>
                                                            <telerik:GridTemplateColumn HeaderText="Sản phẩm">
                                                                <ItemTemplate>
                                                                    <asp:Literal ID="litProductCode" runat="server" />
                                                                    <div>
                                                                        <asp:Literal ID="litProductName" runat="server" />
                                                                    </div>
                                                                </ItemTemplate>
                                                            </telerik:GridTemplateColumn>
                                                            <telerik:GridTemplateColumn HeaderText="Giảm giá" UniqueName="ProductCode">
                                                                <ItemTemplate>
                                                                    <asp:TextBox ID="txtDiscount" SkinID="PriceTextBox" style="display:inline-block" Text='<%# ProductHelper.FormatPrice(Convert.ToDecimal(Eval("Discount"))) %>' MaxLength="20" runat="server" />
                                                                    <asp:DropDownList ID="ddlDiscountType" CssClass="percentage" style="width:auto;display:inline-block" runat="server">
                                                                        <asp:ListItem Value="1" Text="%"></asp:ListItem>
                                                                        <asp:ListItem Value="2" Text="VND"></asp:ListItem>
                                                                    </asp:DropDownList>
                                                                </ItemTemplate>
                                                            </telerik:GridTemplateColumn>
                                                            <telerik:GridTemplateColumn>
                                                                <ItemTemplate>
                                                                    <asp:HyperLink CssClass="popup-link" ID="GiftProducts" runat="server" 
                                                                        Font-Bold='<%# Convert.ToInt32(Eval("GiftType")) > 0 %>'
                                                                        Text="Quà tặng" NavigateUrl='<%# SiteRoot + "/Product/AdminCP/Promotions/CouponChooseGiftDialog.aspx?Guid=" + Eval("Guid") %>'>
                                                                    </asp:HyperLink>
                                                                </ItemTemplate>
                                                            </telerik:GridTemplateColumn>
                                                            <telerik:GridClientSelectColumn HeaderStyle-Width="35" />
                                                        </Columns>
                                                    </MasterTableView>
                                                </telerik:RadGrid>
                                            </div>
                                            </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div role="tabpanel" class="tab-pane fade" id="tabHistory" runat="server">
                    <asp:UpdatePanel ID="upHistory" runat="server">
                        <ContentTemplate>
                            <telerik:RadGrid ID="gridOrder" SkinID="radGridSkin" runat="server">
                                <MasterTableView DataKeyNames="OrderId,OrderStatus" AllowSorting="false">
                                    <Columns>
                                        <telerik:GridBoundColumn HeaderText="<%$Resources:ProductResources, OrderIdLabel %>" DataField="OrderCode" />
                                        <telerik:GridTemplateColumn HeaderText="<%$Resources:ProductResources, OrderCreatedOnLabel %>">
                                            <ItemTemplate>
                                                <%# DateTimeHelper.Format(Convert.ToDateTime(Eval("CreatedUtc")), timeZone, "dd/MM/yyyy HH:mm", timeOffset)%>
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn>
                                            <ItemTemplate>
                                                <asp:HyperLink CssClass="cp-link" ID="EditLink" runat="server" 
                                                    Text="<%$Resources:ProductResources, OrderDetailLink %>" NavigateUrl='<%# SiteRoot + "/Product/AdminCP/OrderEdit.aspx?OrderID=" + Eval("OrderId") %>'>
                                                </asp:HyperLink>
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>
                                    </Columns>
                                </MasterTableView>
                            </telerik:RadGrid>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                </div>
            </div>
        </div>
        <script type="text/javascript">
            $(document).ready(function () {
                $("#<%=rdbAppliedToCategories.ClientID%>").click(toggleAppliedType);
                $("#<%=rdbAppliedToProducts.ClientID%>").click(toggleAppliedType);

                toggleAppliedType();
            });

            function toggleAppliedType() {
                if ($("#<%=rdbAppliedToCategories.ClientID%>").is(':checked')) {
                    $('.appliedtocats').show();
                    $('.appliedtoproducts').hide();
                }
                else {
                    $('.appliedtocats').hide();
                    $('.appliedtoproducts').show();
                }
            }
        </script>
        <style type="text/css">
            .settingrow input.rcbInput {border:none;padding:0;width:100%;}
            .settingrow select.percentage {min-width:inherit;width:60px;}
        </style>
        <portal:SessionKeepAliveControl ID="ka1" runat="server" />
    </div>
</asp:Content>
<asp:Content ContentPlaceHolderID="rightContent" ID="MPRightPane" runat="server" />
<asp:Content ContentPlaceHolderID="pageEditContent" ID="MPPageEdit" runat="server" />