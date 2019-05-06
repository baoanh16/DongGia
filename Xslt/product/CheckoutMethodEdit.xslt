<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt"
 exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<xsl:template match="/">
		<xsl:if test="count(/CheckoutMethod/Shipping)>0">
			<div class="cart-title">
				<h3><span class="fas fa-shopping-cart"></span><span>Phương thức thanh toán</span></h3>
			</div>
			<div class="cart-payment-method">
				<xsl:apply-templates select="/CheckoutMethod/Shipping"></xsl:apply-templates>
			</div>
		</xsl:if>

		<xsl:if test="count(/CheckoutMethod/Payment)>0">
			<div class="cart-title">
				<h3><span class="fas fa-shopping-cart"></span>
				<span>
				
					<xsl:value-of select="/CheckoutMethod/MethodText"></xsl:value-of></span>
				</h3>
			</div>
			<div class="cart-payment-method">
				<xsl:apply-templates select="/CheckoutMethod/Payment"></xsl:apply-templates>
			</div>
			<!-- <xsl:if test="Id=3"> -->
			<div class="cart-title">
				<!-- <h3><span class="fas fa-shopping-cart"></span> -->
				<h3><span class="fas fa-clipboard-list"></span>
				<span>
					<xsl:value-of select="/CheckoutMethod/PolicyText"></xsl:value-of>
				</span>
				</h3>
			</div>
			<div class="cart-payment-method">
				<div style="width:100%;height:250px;line-height:1.4em;overflow:auto;padding:10px; border: 1px solid #ddd;background: white">
					<xsl:value-of select="/CheckoutMethod/PolicyOrder" disable-output-escaping="yes"></xsl:value-of>
				</div>
				<div class="agree" style="margin-top: .5rem">
				<input id="PaymentAgree" type="checkbox" checked="checked" name="PaymentAgree" required="required" aria-required=""/>
				<label for="PaymentAgree"><xsl:value-of select="/CheckoutMethod/AgreeText"></xsl:value-of></label>
				<!-- <label for="PaymentAgree">
						<xsl:value-of select="/CheckoutMethod/AgreeText"></xsl:value-of>
					</label> -->
				</div>
				</div>
			<!-- </xsl:if> -->
		</xsl:if>


		<div class="cart-button-checkout">
			<a class="btn btn-prev">
				<xsl:attribute name="href">
					<xsl:text>/gio-hang</xsl:text>
				</xsl:attribute>
				<span class="mdi mdi-chevron-left"></span>
				<span>Quay lại</span>
			</a>
			<a class="btn btn-next">
				<xsl:attribute name="onclick">
					<xsl:text>AjaxCheckout.saveorder(true, '</xsl:text>
					<xsl:value-of select="/CheckoutMethod/NextPageUrl"></xsl:value-of>
					<xsl:text>');return false;</xsl:text>
				</xsl:attribute>
				<span>
					<!-- <xsl:value-of select="/CheckoutAddress/ContinueShoppingText"></xsl:value-of> -->
					Tiếp tục
				</span>
				<span class="mdi mdi-chevron-right"></span>
			</a>
		</div>
	</xsl:template>

	<xsl:template match="Shipping">
		<div class="form-group">
			<input type="radio" name="ShippingMethod" onchange="AjaxCheckout.getshippingtotal(this)">
			<xsl:if test="position()=1">
				<xsl:attribute name="checked">
					<xsl:text>checked</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<xsl:attribute name="value">
				<xsl:value-of select="Id"></xsl:value-of>
			</xsl:attribute>
			</input>
			<label>
				<xsl:value-of select="Title"></xsl:value-of>
			</label>
			<xsl:if test="Description!=''">
				<div class="des">
					<xsl:value-of select="Description" disable-output-escaping="yes"></xsl:value-of>
				</div>
			</xsl:if>
		</div>
	</xsl:template>

	<xsl:template match="Payment">
		<div class="method">
			<input type="radio" name="PaymentMethod">
			<xsl:attribute name="id">
				<xsl:value-of select="Id"></xsl:value-of>
			</xsl:attribute>
			<xsl:attribute name="value">
				<xsl:value-of select="Id"></xsl:value-of>
			</xsl:attribute>
			<xsl:if test="position()=1">
				<xsl:attribute name="checked">
					<xsl:text>checked</xsl:text>
				</xsl:attribute>
				<xsl:attribute name="value">
					<xsl:value-of select="Id"></xsl:value-of>
				</xsl:attribute>
			</xsl:if>
			</input>
			<label>
				<xsl:attribute name="for">
					<xsl:value-of select="Id"></xsl:value-of>
				</xsl:attribute>
				<!-- <div class="img">
					<img>
					<xsl:attribute name="src">
						<xsl:value-of select="ImageUrl"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="alt">
						<xsl:value-of select="Title"></xsl:value-of>
					</xsl:attribute>
					</img>
				</div>
				<div class="text">
				</div> -->
				
				<xsl:if test="position()=1">
					<xsl:attribute name="class">
						<xsl:text>active</xsl:text>
					</xsl:attribute>
				</xsl:if>
				<xsl:if test="Description!=''">
					<xsl:value-of select="Description" disable-output-escaping="yes"></xsl:value-of>
				</xsl:if>
			</label>
		</div>
	</xsl:template>

</xsl:stylesheet>