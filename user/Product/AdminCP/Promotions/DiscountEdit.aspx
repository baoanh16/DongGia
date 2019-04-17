<%@ Page Language="c#" CodeBehind="DiscountEdit.aspx.cs" MasterPageFile="~/App_MasterPages/layout.Master"
    AutoEventWireup="false" Inherits="CanhCam.Web.ProductUI.DiscountEditPage" %>

<%@ Import Namespace="CanhCam.Web.ProductUI" %>
<asp:Content ContentPlaceHolderID="mainContent" ID="MPContent" runat="server">
    <portal:BreadcrumbAdmin ID="breadcrumb" runat="server" 
        ParentTitle="<%$Resources:ProductResources, DiscountPageTitle %>" ParentUrl="~/Product/AdminCP/Promotions/Discounts.aspx"
        CurrentPageTitle="<%$Resources:ProductResources, DiscountEditTitle %>" CurrentPageUrl="~/Product/AdminCP/Promotions/DiscountEdit.aspx" />
    <div class="admin-content col-md-12">
        <portal:HeadingPanel ID="heading" runat="server">
            <asp:Button SkinID="UpdateButton" ID="btnUpdate" ValidationGroup="DealEdit" Text="<%$Resources:Resource, UpdateButton %>" runat="server" />
            <asp:Button SkinID="UpdateButton" ID="btnUpdateAndNew" ValidationGroup="DealEdit" Text="<%$Resources:Resource, UpdateAndNewButton %>" runat="server" />
            <asp:Button SkinID="UpdateButton" ID="btnUpdateAndClose" ValidationGroup="DealEdit" Text="<%$Resources:Resource, UpdateAndCloseButton %>" runat="server" />
            <asp:Button SkinID="InsertButton" ID="btnInsert" ValidationGroup="DealEdit" Text="<%$Resources:Resource, InsertButton %>" runat="server" />
            <asp:Button SkinID="InsertButton" ID="btnInsertAndNew" ValidationGroup="DealEdit" Text="<%$Resources:Resource, InsertAndNewButton %>" runat="server" />
            <asp:Button SkinID="InsertButton" ID="btnInsertAndClose" ValidationGroup="DealEdit" Text="<%$Resources:Resource, InsertAndCloseButton %>" runat="server" />
            <asp:Button SkinID="DeleteButton" ID="btnDelete" runat="server" Text="<%$Resources:Resource, DeleteButton %>" CausesValidation="false" />
        </portal:HeadingPanel>
        <portal:NotifyMessage ID="message" runat="server" />
        <div class="workplace">
            <div id="divtabs" runat="server" class="tabs">
                <ul id="ulTabs" class="nav nav-tabs" runat="server">
                    <li role="presentation" class="active">
                        <asp:Literal ID="litTabContent" runat="server" /></li>
                    <li role="presentation">
                        <asp:Literal ID="litTabHistory" runat="server" /></li>
                </ul>
                <div class="tab-content">
                <div role="tabpanel" class="tab-pane fade active in" id="tabContent">
                    <div class="form-horizontal">
                        <div id="divDiscountType" runat="server" class="settingrow form-group">
                            <gb:SiteLabel id="lblDiscountType" runat="server" ForControl="ddlDiscountType" ShowRequired="true" CssClass="settinglabel control-label col-sm-3" Text="Loại khuyến mãi" />
                            <div class="col-sm-9">
                                <asp:DropDownList ID="ddlDiscountType" runat="server">
                                    <asp:ListItem Text="Promotion" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="Combo sale" Value="0"></asp:ListItem>
                                    <%--<asp:ListItem Text="Deal" Value="2"></asp:ListItem>--%>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="settingrow form-group">
                            <gb:SiteLabel id="lblName" runat="server" ForControl="txtName" ShowRequired="true" CssClass="settinglabel control-label col-sm-3" Text="Tên" />
                            <div class="col-sm-9">
                                <asp:TextBox ID="txtName" MaxLength="255" runat="server" />
                                <asp:RequiredFieldValidator ID="reqName" runat="server" ControlToValidate="txtName"
                                    ErrorMessage="<%$Resources:ProductResources, CouponNameRequiredWarning %>"
                                    Display="Dynamic" SetFocusOnError="true" CssClass="txterror" ValidationGroup="DealEdit" />
                            </div>
                        </div>
                        <div class="settingrow form-group">
                            <gb:SiteLabel id="lblDiscount" runat="server" ForControl="txtDiscountAmount" ShowRequired="true" CssClass="settinglabel control-label col-sm-3" ConfigKey="CouponDiscountLabel" ResourceFile="ProductResources" />
                            <div class="col-sm-9">
                                <asp:TextBox ID="txtDiscountAmount" SkinID="PriceTextBox" style="display:inline-block" MaxLength="20" runat="server" />
                                <asp:DropDownList ID="ddlUsePercentage" style="width:auto;display:inline-block" runat="server">
                                    <asp:ListItem Text="<%$Resources:ProductResources, DiscountPercentagePerProduct %>" Value="true"></asp:ListItem>
                                    <asp:ListItem Text="<%$Resources:ProductResources, DiscountAmountPerProduct %>" Value="false"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="settingrow form-group">
                            <gb:SiteLabel id="lblFromDate" runat="server" ForControl="dpStartDate" ShowRequired="true" CssClass="settinglabel control-label col-sm-3" ConfigKey="DiscountStartDateLabel" ResourceFile="ProductResources" />
                            <div class="col-sm-9">
                                <telerik:RadDateTimePicker ID="dpStartDate" Width="250" Height="30" Culture="en-US" DateInput-DateFormat="dd/MM/yyyy HH:mm" TimeView-TimeFormat="HH:mm" runat="server" Skin="Simple" />
                                <asp:RequiredFieldValidator ID="reqStartDate" SkinID="Discount" ForeColor="Red" runat="server" ControlToValidate="dpStartDate"
                                    ErrorMessage="<%$Resources:ProductResources, DiscountStartDateRequiredWarning %>"
                                    Display="Dynamic" SetFocusOnError="true" ValidationGroup="DealEdit" />
                            </div>
                        </div>
                        <div class="settingrow form-group">
                            <gb:SiteLabel id="lblExpiryDate" runat="server" ForControl="dpEndDate" ShowRequired="true" CssClass="settinglabel control-label col-sm-3" ConfigKey="DiscountEndDateLabel" ResourceFile="ProductResources" />
                            <div class="col-sm-9">
                                <telerik:RadDateTimePicker ID="dpEndDate" Width="250" Height="30" Culture="en-US" DateInput-DateFormat="dd/MM/yyyy HH:mm" TimeView-TimeFormat="HH:mm" runat="server" Skin="Simple" />
                                <asp:RequiredFieldValidator ID="reqEndDate" SkinID="Discount" ForeColor="Red" runat="server" ControlToValidate="dpEndDate"
                                    ErrorMessage="<%$Resources:ProductResources, DiscountEndDateRequiredWarning %>"
                                    Display="Dynamic" SetFocusOnError="true" ValidationGroup="DealEdit" />
                            </div>
                        </div>
                        <div id="divMinPurchase" runat="server" visible="false" class="settingrow form-group">
                            <gb:SiteLabel id="lblMinPurchase" runat="server" ForControl="txtMinPurchase" CssClass="settinglabel control-label col-sm-3" ConfigKey="CouponMinPurchaseLabel" ResourceFile="ProductResources" />
                            <div class="col-sm-9">
                                <asp:TextBox ID="txtMinPurchase" SkinID="PriceTextBox" MaxLength="20" runat="server" />
                            </div>
                        </div>
                        <div id="divDiscountQtyStep" visible="false" runat="server" class="settingrow form-group">
                            <gb:SiteLabel id="lblDiscountQtyStep" runat="server" ForControl="ddlDiscountQtyStep" CssClass="settinglabel control-label col-sm-3" Text="SL sản phẩm được áp dụng trong mỗi đơn hàng" ResourceFile="ProductResources" />
                            <div class="col-sm-9">
                                <asp:DropDownList ID="ddlDiscountQtyStep" runat="server">
                                    <asp:ListItem Value="0" Text="Không giới hạn"></asp:ListItem>
                                    <asp:ListItem Value="1" Text="1"></asp:ListItem>
                                    <asp:ListItem Value="2" Text="2"></asp:ListItem>
                                    <asp:ListItem Value="3" Text="3"></asp:ListItem>
                                    <asp:ListItem Value="4" Text="4"></asp:ListItem>
                                    <asp:ListItem Value="5" Text="5"></asp:ListItem>
                                    <asp:ListItem Value="6" Text="6"></asp:ListItem>
                                    <asp:ListItem Value="7" Text="7"></asp:ListItem>
                                    <asp:ListItem Value="8" Text="8"></asp:ListItem>
                                    <asp:ListItem Value="9" Text="9"></asp:ListItem>
                                    <asp:ListItem Value="10" Text="10"></asp:ListItem>
                                </asp:DropDownList>
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
                        <div id="divAppliedType" visible="false" runat="server">
                            <hr class="mrt10 mrb10" />
                            <div id="divAppliedToCategories" runat="server" class="">
                                <div class="settingrow form-group">
                                    <label class="col-sm-offset-3"></label>
                                    <div class="col-sm-9">
                                        <b>
                                            <gb:SiteLabel id="lblAppliedToCategories" runat="server" UseLabelTag="false" ConfigKey="CouponAppliedToCategoriesLabel" ResourceFile="ProductResources" />
                                        </b>
                                    </div>
                                </div>
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
                                                    <MasterTableView DataKeyNames="Guid,ItemId,UsePercentage,DiscountAmount">
                                                        <Columns>
                                                            <telerik:GridTemplateColumn HeaderText="Danh mục">
                                                                <ItemTemplate>
                                                                    <asp:Literal ID="litZoneName" runat="server" />
                                                                </ItemTemplate>
                                                            </telerik:GridTemplateColumn>
                                                            <telerik:GridTemplateColumn HeaderText="Giảm giá">
                                                                <ItemTemplate>
                                                                    <asp:TextBox ID="txtDiscountAmount" SkinID="PriceTextBox" style="display:inline-block" Text='<%# ProductHelper.FormatPrice(Convert.ToDecimal(Eval("DiscountAmount"))) %>' MaxLength="20" runat="server" />
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
                                                                        Text="SP tặng kèm" NavigateUrl='<%# SiteRoot + "/Product/AdminCP/Promotions/DiscountChooseGiftDialog.aspx?Guid=" + Eval("Guid") %>'>
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
                            <hr class="mrt10 mrb10" />
                            <div class="settingrow form-group">
                                <label class="col-sm-offset-3"></label>
                                <div class="col-sm-9">
                                    <b>
                                        <gb:SiteLabel id="lblAppliedToProducts" runat="server" UseLabelTag="false" ConfigKey="CouponAppliedToProductsLabel" ResourceFile="ProductResources" />
                                    </b>
                                </div>
                            </div>
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
                                                        <asp:TextBox ID="txtTitle" runat="server" MaxLength="255" />
                                                        <asp:Button SkinID="DefaultButton" ID="btnSearch" Text="<%$Resources:ProductResources, ProductSearchButton %>"
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
                                                                <%# ProductHelper.FormatPrice(Convert.ToDecimal(Eval("Price")), true) %>
                                                            </ItemTemplate>
                                                        </telerik:GridTemplateColumn>
                                                        <telerik:GridTemplateColumn Visible="false" HeaderStyle-Width="50" HeaderText="Hot?" UniqueName="SpecialProduct">
                                                            <ItemTemplate>
                                                                <asp:ImageButton ID="btnSpecialProduct" runat="server"
                                                                    CommandName="SpecialProduct" CommandArgument='<%#Eval("ProductId")%>' ImageUrl='<%# GetSpecialProductImageUrl(Convert.ToInt32(Eval("ProductId")))%>' />
                                                            </ItemTemplate>
                                                        </telerik:GridTemplateColumn>
                                                        <telerik:GridClientSelectColumn HeaderStyle-Width="35" />
                                                    </Columns>
                                                </MasterTableView>
                                            </telerik:RadGrid>
                                        </div>
                                        <div class="pull-left mrt180" style="width:3%">
                                            <asp:ImageButton ID="btnRemove" runat="server" ImageUrl="~/Data/SiteImages/lt2.gif" CssClass="btnleft" />
                                            <asp:ImageButton ID="btnAdd" runat="server" ImageUrl="~/Data/SiteImages/rt2.gif" CssClass="btnright" />
                                        </div>
                                        <div class="pull-left mrt100" style="width:51%">
                                            <div class="mrb15">
                                                <gb:SiteLabel ID="lblRelatedProduct" runat="server" UseLabelTag="false"
                                                    ResourceFile="ProductResources" ConfigKey="CouponSelectedProductsLabel" />
                                            </div>
                                            <telerik:RadGrid ID="gridRelated" SkinID="radGridSkin" runat="server">
                                                <MasterTableView DataKeyNames="Guid,ItemId,UsePercentage,DiscountAmount,DealQty,SoldQty,ComboSaleQty">
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
                                                        <telerik:GridTemplateColumn HeaderText="Giảm giá">
                                                            <ItemTemplate>
                                                                <asp:TextBox ID="txtDiscountAmount" SkinID="PriceTextBox" style="display:inline-block" Text='<%# ProductHelper.FormatPrice(Convert.ToDecimal(Eval("DiscountAmount"))) %>' MaxLength="20" runat="server" />
                                                                <asp:DropDownList ID="ddlDiscountType" CssClass="percentage" style="width:auto;display:inline-block" runat="server">
                                                                    <asp:ListItem Value="1" Text="%"></asp:ListItem>
                                                                    <asp:ListItem Value="2" Text="VND"></asp:ListItem>
                                                                </asp:DropDownList>
                                                            </ItemTemplate>
                                                        </telerik:GridTemplateColumn>
                                                        <telerik:GridTemplateColumn Visible="false" HeaderText="DealQty/SoldQty" UniqueName="DealQty">
                                                            <ItemTemplate>
                                                                <asp:TextBox ID="txtDealQty" SkinID="NumericTextBox" Text='<%# Eval("DealQty") %>' runat="server" />
                                                                <%# Eval("SoldQty") %>
                                                            </ItemTemplate>
                                                        </telerik:GridTemplateColumn>
                                                        <telerik:GridTemplateColumn Visible="false" HeaderText="SL" UniqueName="ComboSaleQty">
                                                            <ItemTemplate>
                                                                <asp:TextBox ID="txtComboSaleQty" SkinID="NumericTextBox" Text='<%# Eval("ComboSaleQty") %>' runat="server" />
                                                            </ItemTemplate>
                                                        </telerik:GridTemplateColumn>
                                                        <telerik:GridTemplateColumn>
                                                            <ItemTemplate>
                                                                <asp:HyperLink CssClass="popup-link" ID="ComboSale" runat="server" 
                                                                    Font-Bold='<%# Eval("ComboSaleRules").ToString().Length > 0 %>'
                                                                    Visible='<%# discount.DiscountType == (int)DiscountType.ComboSale %>'
                                                                    Text="Combo sale" NavigateUrl='<%# SiteRoot + "/Product/AdminCP/Promotions/DiscountComboSaleDialog.aspx?Guid=" + Eval("Guid") %>'>
                                                                </asp:HyperLink>
                                                                <asp:HyperLink CssClass="popup-link" ID="GiftProducts" runat="server" 
                                                                    Font-Bold='<%# Convert.ToInt32(Eval("GiftType")) > 0 %>'
                                                                    Visible='<%# discount.DiscountType != (int)DiscountType.ComboSale %>'
                                                                    Text="Quà tặng" NavigateUrl='<%# SiteRoot + "/Product/AdminCP/Promotions/DiscountChooseGiftDialog.aspx?Guid=" + Eval("Guid") %>'>
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
                                                    Text="<%$Resources:ProductResources, OrderDetailLink %>" NavigateUrl='<%# SiteRoot + "/Product/AdminOrderDetail.aspx?OrderID=" + Eval("OrderId") %>'>
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
        <style type="text/css">
            .settingrow input.rcbInput {border:none;padding:0;width:100%;}
            .settingrow select.percentage {min-width:inherit;width:60px;}
            .separator {margin-top:10px;border:solid 1px #ccc}
        </style>
        <portal:SessionKeepAliveControl ID="ka1" runat="server" />
    </div>
</asp:Content>