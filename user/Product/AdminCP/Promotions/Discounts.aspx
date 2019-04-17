<%@ Page Language="C#" AutoEventWireup="false" MasterPageFile="~/App_MasterPages/layout.Master"
    CodeBehind="Discounts.aspx.cs" Inherits="CanhCam.Web.ProductUI.DiscountsPage" %>

<asp:Content ContentPlaceHolderID="mainContent" ID="MPContent" runat="server">
    <portal:BreadcrumbAdmin ID="breadcrumb" runat="server"
        CurrentPageTitle="<%$Resources:ProductResources, DiscountPageTitle %>" CurrentPageUrl="~/Product/AdminCP/Promotions/Discounts.aspx" />
    <div class="admin-content col-md-12">
        <portal:HeadingPanel ID="heading" runat="server">
            <asp:HyperLink SkinID="InsertButton" ID="lnkInsert" Text="<%$Resources:Resource, InsertButton %>" runat="server" />
            <asp:Button SkinID="DeleteButton" ID="btnDelete" Text="<%$Resources:Resource, DeleteSelectedButton %>" runat="server" CausesValidation="false" />
        </portal:HeadingPanel>
        <portal:NotifyMessage ID="message" runat="server" />
        <div class="workplace">
            <div class="form-horizontal">
                <div id="divDiscountType" runat="server" class="settingrow form-group">
                    <gb:SiteLabel id="lblDiscountType" runat="server" ForControl="ddlDiscountType" CssClass="settinglabel control-label col-sm-3" Text="Loại khuyến mãi" />
                    <div class="col-sm-9">
                        <asp:DropDownList ID="ddlDiscountType" AutoPostBack="true" runat="server">
                            <asp:ListItem Text="Tất cả" Value="-10"></asp:ListItem>
                            <asp:ListItem Text="Combo sale" Value="0"></asp:ListItem>
                            <asp:ListItem Text="Promotion" Value="1"></asp:ListItem>
                            <%--<asp:ListItem Text="Deal" Value="2"></asp:ListItem>--%>
                        </asp:DropDownList>
                    </div>
                </div>
            </div>
            <telerik:RadGrid ID="grid" SkinID="radGridSkin" runat="server">
                <MasterTableView DataKeyNames="DiscountId" AllowSorting="false">
                    <Columns>
                        <telerik:GridTemplateColumn HeaderText="Tên">
                            <ItemTemplate>
                                <%# Eval("Name") %>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="<%$Resources:ProductResources, CouponExpiryDateLabel %>">
                            <ItemTemplate>
                                <%# Eval("EndDate")%>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="Số HĐ đã sử dụng">
                            <ItemTemplate>
                                <%# Eval("OrderCount") %>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="<%$Resources:ProductResources, CouponActiveStatusLabel %>">
                            <ItemTemplate>
                                <%# GetActive(Convert.ToBoolean(Eval("IsActive")), Eval("StartDate"), Eval("EndDate"))%>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn>
                            <ItemTemplate>
                                <asp:HyperLink CssClass="cp-link" ID="EditLink" runat="server" 
                                    Text="<%$Resources:ProductResources, CouponEditLink %>" NavigateUrl='<%# SiteRoot + "/Product/AdminCP/Promotions/DiscountEdit.aspx?DiscountID=" + Eval("DiscountId") %>'>
                                </asp:HyperLink>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridClientSelectColumn HeaderStyle-Width="35" />
                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
        </div>
    </div>
</asp:Content>