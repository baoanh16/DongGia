<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<xsl:template match="/">
		<xsl:if test="count(/ProductList/Product)>0">
			<div class="row product-other">
				<div class="col">
					<h2 class="title">
						<xsl:value-of select="/ProductList/ModuleTitle" disable-output-escaping="yes"></xsl:value-of>
					</h2>
				</div>
				<div class="col">
					<div class="swiper-container">
						<div class="swiper-wrapper">
							<xsl:apply-templates select="/ProductList/Product"></xsl:apply-templates>

						</div>
					</div>
				</div>
			</div>
		</xsl:if>


	</xsl:template>


	<xsl:template match="Product">
		<div class="swiper-slide">
			<figure class="product-item">
				<div class="imgbox">
					<a href="product-detail.html">
						<xsl:attribute name="href">
							<xsl:value-of select="Url"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="target">
							<xsl:value-of select="Target"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="title">
							<xsl:value-of select="Title"></xsl:value-of>
						</xsl:attribute>
						<img>
						<xsl:attribute name="src">
							<xsl:value-of select="ImageUrl"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="alt">
							<xsl:value-of select="Title"></xsl:value-of>
						</xsl:attribute>
						</img>
					</a>
				</div>
				<figcaption>
					<div class="type">
						<xsl:value-of select="SubTitle"></xsl:value-of>
					</div>
					<a class="name" href="product-detail.html">
						<xsl:attribute name="href">
							<xsl:value-of select="Url"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="target">
							<xsl:value-of select="Target"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="title">
							<xsl:value-of select="Title"></xsl:value-of>
						</xsl:attribute>
						<xsl:value-of select="Title"></xsl:value-of>
					</a>
					<div class="price">
						<xsl:value-of select="Price"></xsl:value-of>
					</div>
					<a class="addcart" onclick="AjaxCart.addproducttocart_catalog(this);return false;">
						<xsl:attribute name="data-productid">
							<xsl:value-of select="ProductId"></xsl:value-of>
						</xsl:attribute>
						<span>
							<xsl:value-of select="/ProductDetail/BuyText"></xsl:value-of>
						</span>
					</a>
				</figcaption>
			</figure>
		</div>
	</xsl:template>
</xsl:stylesheet>