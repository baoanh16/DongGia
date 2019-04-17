<%@ Page Language="C#" AutoEventWireup="false" MasterPageFile="~/App_MasterPages/layout.Master"
    CodeBehind="BestsellersReport.aspx.cs" Inherits="CanhCam.Web.ProductUI.BestsellersReport" %>

<%@ Register TagPrefix="Site" Assembly="CanhCam.Features.Product" Namespace="CanhCam.Web.ProductUI" %>
<asp:Content ContentPlaceHolderID="mainContent" ID="MPContent" runat="server">
    <Site:ProductDisplaySettings ID="displaySettings" runat="server" />
    <portal:BreadcrumbAdmin ID="breadcrumb" runat="server"
        CurrentPageTitle="<%$Resources:ProductResources,ReportBestsellersProducts %>" CurrentPageUrl="~/Product/AdminCP/ReportBestsellers.aspx" />
    <div class="admin-content col-md-12">
        <portal:HeadingPanel ID="heading" Text="<%$Resources:ProductResources,ReportBestsellersProducts %>" runat="server">
            <asp:Button ID="btnExport" SkinID="DefaultButton" Text="<%$Resources:ProductResources,OrderExportButton %>" OnClick="btnExport_Click" runat="server" CausesValidation="false" />
        </portal:HeadingPanel>
        <portal:NotifyMessage ID="message" runat="server" />
        <div class="workplace">
            <asp:Panel ID="pnlSearch" CssClass="form-horizontal" DefaultButton="btnSearch" runat="server">
                <div class="settingrow form-group">
                    <gb:SiteLabel ID="lblFromDate" runat="server" ConfigKey="OrderDateFromLabel"
                        ResourceFile="ProductResources" ForControl="dpFromDate" CssClass="settinglabel control-label col-sm-3" />
                    <div class="col-sm-9">
                        <div class="form-inline">
                            <gb:DatePickerControl ID="dpFromDate" ShowTime="false" runat="server" />
                            <gb:SiteLabel ID="lblEndDate" runat="server" ConfigKey="OrderDateToLabel" ResourceFile="ProductResources"
                                ForControl="dpToDate" CssClass="settinglabel control-label" />
                            <gb:DatePickerControl ID="dpToDate" ShowTime="false" runat="server" />
                        </div>
                    </div>
                </div>
                <div class="settingrow form-group">
                    <gb:SiteLabel ID="lblZones" runat="server" ConfigKey="ZoneLabel"
                        ForControl="ddZones" CssClass="settinglabel control-label col-sm-3" />
                    <div class="col-sm-9">
                        <asp:DropDownList ID="ddZones" runat="server" />
                    </div>
                </div>
                <div class="settingrow form-group">
                    <gb:SiteLabel ID="lblOrderStatus" runat="server" ConfigKey="OrderStatusLabel" ResourceFile="ProductResources"
                        ForControl="ddOrderStatus" CssClass="settinglabel control-label col-sm-3" />
                    <div class="col-sm-9">
                        <asp:DropDownList ID="ddOrderStatus" runat="server" />
                    </div>
                </div>
                <div class="settingrow form-group">
                    <gb:SiteLabel ID="lblOrderBy" runat="server" ConfigKey="ReportOrderByLabel" ResourceFile="ProductResources"
                        ForControl="ddOrderBy" CssClass="settinglabel control-label col-sm-3" />
                    <div class="col-sm-9">
                        <asp:DropDownList ID="ddOrderBy" runat="server">
                            <asp:ListItem Text="<%$Resources:ProductResources,ReportOrderBySubTotal %>" Value="0"></asp:ListItem>
                            <asp:ListItem Text="<%$Resources:ProductResources,ReportOrderByQuantity %>" Value="1"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="settingrow form-group">
                    <div class="col-sm-9 col-sm-offset-3">
                        <asp:Button SkinID="DefaultButton" ID="btnSearch" Text="<%$Resources:ProductResources,ReportButton %>" runat="server" CausesValidation="false" />
                    </div>
                </div>
            </asp:Panel>
            <telerik:RadGrid ID="grid" SkinID="radGridSkin" runat="server">
                <MasterTableView AllowSorting="false">
                    <Columns>
                        <telerik:GridTemplateColumn HeaderStyle-Width="35" HeaderText="<%$Resources:Resource, RowNumber %>">
                            <ItemTemplate>
                                <%# (grid.PageSize * grid.CurrentPageIndex) + Container.ItemIndex + 1%>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridBoundColumn HeaderText="<%$Resources:ProductResources, ProductCodeLabel %>" DataField="Code" UniqueName="Code" />
                        <telerik:GridBoundColumn HeaderText="<%$Resources:ProductResources, ProductNameLabel %>" DataField="Title" />
                        <telerik:GridBoundColumn HeaderText="<%$Resources:ProductResources, OrderQuantityLabel %>" DataField="Quantity" />
                        <telerik:GridTemplateColumn HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" HeaderText="<%$Resources:ProductResources, OrderTotalLabel %>" DataField="SubTotal">
                            <ItemTemplate>
                                <%# CanhCam.Web.ProductUI.ProductHelper.FormatPrice(Convert.ToDecimal(Eval("SubTotal")))%>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderStyle-Width="100">
                            <ItemTemplate>
                                <asp:HyperLink ID="EditLink" runat="server" 
                                    Text="<%$Resources:ProductResources, OrderDetailLink %>" NavigateUrl='<%# SiteRoot + (Eval("ProductType").ToString()=="1"?"/Product/AdminAccessoryEdit.aspx?ProductID=":"/Product/AdminProductEdit.aspx?ProductID=") + Eval("ProductId") %>'>
                                </asp:HyperLink>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
        </div>
    </div>
</asp:Content>