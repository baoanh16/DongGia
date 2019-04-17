<%@ Control Language="c#" AutoEventWireup="false" CodeBehind="CheckoutLoginModule.ascx.cs" Inherits="CanhCam.Web.ProductUI.CheckoutLoginModule" %>

<section class="cart-login clearfix">
    <div class="login-form clearfix">
        <div class="select-group">
            <ul> 
                <li>
                    <asp:RadioButton GroupName="login" runat="server" ID="rdbCheckoutAsGuest" AutoPostBack="true" OnCheckedChanged="rdbCheckout_CheckedChanged" Text="<%$Resources:ProductResources, CheckoutAsGuest %>" />
                </li>
                <li>
                    <asp:RadioButton GroupName="login" runat="server" CssClass="active" Checked="true" ID="rdbCheckoutAsReturningCustomer" AutoPostBack="true" OnCheckedChanged="rdbCheckout_CheckedChanged" Text="<%$Resources:ProductResources, CheckoutAsReturningCustomer %>" />
                    <%--<div class="help"><i class="fa fa-question-circle" aria-hidden="true"></i><span class="help-tip">Tài khoản thành viên của Cánh Cam Group</span></div>--%>
                </li>
            </ul>
        </div>
        <asp:Panel ID="pnlGuest" Visible="false" class="checkout-guest" runat="server">
            <div id="divEmailInput" class="guest-email" runat="server">
                <div class="module-title">Vui lòng nhập Email</div>
                <div class="form-group">
                    <asp:TextBox ID="txtGuestEmail" runat="server" placeholder="<%$Resources:Resource, SignInEmailLabel %>" CssClass="form-control" MaxLength="100" />
                    <%--<asp:RequiredFieldValidator ControlToValidate="txtGuestEmail" ID="reqGuestEmail" ErrorMessage="<%$Resources:ProductResources, CheckoutAddressEmailRequired %>"
                        runat="server" Display="Dynamic" SetFocusOnError="true" ValidationGroup="CheckoutGuest" />--%>
                    <asp:RegularExpressionValidator ID="revGuestEmail" runat="server" ControlToValidate="txtGuestEmail" ErrorMessage="<%$Resources:ProductResources, CheckoutAddressEmailInvalid %>"
                        Display="Dynamic" SetFocusOnError="true" ValidationExpression="^([0-9a-zA-Z]([-.\w]*[0-9a-zA-Z])*@(([0-9a-zA-Z])+([-\w]*[0-9a-zA-Z])*\.)+[a-zA-Z]{2,9})$"
                        ValidationGroup="CheckoutGuest" />
                </div>
            </div>
            <div id="divCheckoutAsGuestMessage" class="guest-message" runat="server" visible="false">
                <asp:Literal ID="litCheckoutAsGuestMessage" runat="server" />
            </div>
            <asp:Button CssClass="hvr-sweep-to-right btn-continue" ID="btnContinue" ValidationGroup="CheckoutGuest" OnClick="btnCheckoutAsGuest_Click" runat="server" Text="<%$Resources:ProductResources, CheckoutContinue %>" />
        </asp:Panel>
        <portal:SiteLogin ID="LoginCtrl" runat="server">
            <LayoutTemplate>
                <div class="module-title">Vui lòng nhập Email</div>
                <asp:Panel ID="pnlLContainer" runat="server" DefaultButton="Login">
                    <portal:gbLabel ID="FailureText" runat="server" CssClass="alert alert-danger" EnableViewState="false" />
                    <div class="form-group">
                        <asp:TextBox ID="UserName" runat="server" placeholder="<%$Resources:Resource, SignInEmailLabel %>" CssClass="form-control" maxlength="100" />
                        <asp:RequiredFieldValidator ControlToValidate="UserName" ID="UserNameRequired" ErrorMessage="<%$Resources:ProductResources, CheckoutAddressEmailRequired %>"
                            runat="server" Display="Dynamic" SetFocusOnError="true" ValidationGroup="CheckoutLogin" />
                        <asp:RegularExpressionValidator ID="EmailRegex" runat="server" ControlToValidate="UserName" ErrorMessage="<%$Resources:ProductResources, CheckoutAddressEmailInvalid %>"
                            Display="Dynamic" SetFocusOnError="true" ValidationExpression="^([0-9a-zA-Z]([-.\w]*[0-9a-zA-Z])*@(([0-9a-zA-Z])+([-\w]*[0-9a-zA-Z])*\.)+[a-zA-Z]{2,9})$"
                            ValidationGroup="CheckoutLogin" />
                    </div>
                    <div class="form-group">
                        <asp:TextBox id="Password" runat="server" placeholder="<%$Resources:Resource, SignInPasswordLabel %>" CssClass="form-control" textmode="password" />
                    </div>
                    <asp:Panel class="captcha" id="divCaptcha" runat="server">
                        <telerik:RadCaptcha ID="captcha" runat="server" EnableRefreshImage="true" 
                            CaptchaTextBoxCssClass="form-control" CaptchaTextBoxLabel="" ErrorMessage="<%$Resources:Resource, CaptchaFailureMessage %>" 
                            CaptchaTextBoxTitle="<%$Resources:Resource, CaptchaInstructions %>" 
                            CaptchaLinkButtonText="<%$Resources:Resource, CaptchaRefreshImage %>" />
                    </asp:Panel>
                    <div class="form-group">
                        <asp:CheckBox id="RememberMe" Visible="false" Text="<%$Resources:Resource, SignInSendRememberMeLabel %>" runat="server" />
                        <asp:HyperLink id="lnkPasswordRecovery" Text="<%$Resources:Resource, ForgotPasswordLabel %>" runat="server" />
                        <asp:HyperLink id="lnkRegisterExtraLink" Text="<%$Resources:Resource, RegisterLink %>" runat="server" />
                    </div>
                    <asp:Button CssClass="hvr-sweep-to-right btn-continue" ID="Login" CommandName="Login" ValidationGroup="CheckoutLogin" runat="server" Text="<%$Resources:ProductResources, CheckoutContinue %>" />
                </asp:Panel>
            </LayoutTemplate>
        </portal:SiteLogin>
    </div>
</section>

