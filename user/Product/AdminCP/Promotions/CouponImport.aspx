<%@ Page Language="C#" AutoEventWireup="false" MasterPageFile="~/App_MasterPages/layout.Master"
    CodeBehind="CouponImport.aspx.cs" Inherits="CanhCam.Web.ProductUI.CouponImportPage" %>

<asp:Content ContentPlaceHolderID="mainContent" ID="MPContent" runat="server">
    <portal:BreadcrumbAdmin ID="breadcrumb" runat="server"
        ParentTitle="<%$Resources:ProductResources, CouponsPageTitle %>" ParentUrl="~/Product/AdminCP/Promotions/Coupons.aspx"
        CurrentPageTitle="<%$Resources:ProductResources, CouponImportTitle %>" CurrentPageUrl="~/Product/AdminCP/Promotions/CouponImport.aspx" />
    <div class="admin-content col-md-12">
        <portal:HeadingPanel ID="heading" runat="server">
            <asp:Button SkinID="UpdateButton" ID="btnDownloadSample" Text="Tải mẫu" runat="server" />
        </portal:HeadingPanel>
        <portal:NotifyMessage ID="message" runat="server" />
        <div class="workplace">
            <div class="form-horizontal">
                <div class="settingrow form-group">
                    <gb:SiteLabel id="lblOverwriteCoupon" runat="server" ForControl="ddlOverwriteCoupon" CssClass="settinglabel control-label col-sm-3" Text="Nhập mã khuyến mãi trùng" ResourceFile="ProductResources" />
                    <div class="col-sm-9">
                        <asp:DropDownList ID="ddlOverwriteCoupon" runat="server">
                            <asp:ListItem Value="write" Text="Không ghi đè mã khuyến mãi"></asp:ListItem>
                            <asp:ListItem Value="overwrite" Text="Ghi đè mã khuyến mãi"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="settingrow form-group">
                    <gb:SiteLabel id="lblSameCoupon" runat="server" ForControl="txtSameCoupon" CssClass="settinglabel control-label col-sm-3" Text="Cấu hình giống với mã" ResourceFile="ProductResources" />
                    <div class="col-sm-9">
                        <asp:TextBox ID="txtSameCoupon" MaxLength="50" runat="server" />
                        <asp:RequiredFieldValidator ID="reqSameCoupon" runat="server" ControlToValidate="txtSameCoupon"
                            ErrorMessage="Vui lòng nhập mã coupon"
                            Display="Dynamic" SetFocusOnError="true" CssClass="txterror" ValidationGroup="ImportCoupon" />
                    </div>
                </div>
                <div class="settingrow form-group">
                    <gb:SiteLabel id="lblFileUpload" runat="server" ForControl="fileUpload" CssClass="settinglabel control-label col-sm-3" Text="Nhập tập tin (xsl)" ResourceFile="ProductResources" />
                    <div class="col-sm-9">
                        <telerik:RadAsyncUpload ID="fileUpload" SkinID="radAsyncUploadSkin" MultipleFileSelection="Disabled" AllowedFileExtensions="xls" runat="server" />

                        <asp:Button SkinID="DefaultButton" ID="btnContinue" ValidationGroup="ImportCoupon" Text="<%$Resources:ProductResources, CouponContinueButton %>" runat="server" />
                        <asp:Button SkinID="DefaultButton" ID="btnImport" Visible="false" Text="<%$Resources:ProductResources, CouponContinueButton %>" runat="server" CausesValidation="false" />
                    </div>
                </div>
            </div>
            <telerik:RadGrid ID="grid" Visible="false" SkinID="radGridSkin" runat="server">
                <MasterTableView DataKeyNames="CouponCode,Name" AllowPaging="false" AllowSorting="false">
                    <Columns>
                        <telerik:GridTemplateColumn HeaderText="<%$Resources:ProductResources, CouponCodeLabel %>">
                            <ItemTemplate>
                                <%# Eval("CouponCode") %>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="<%$Resources:ProductResources, CouponNameLabel %>">
                            <ItemTemplate>
                                <%# Eval("Name") %>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridClientSelectColumn HeaderStyle-Width="35" />
                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
        </div>
    </div>
</asp:Content>