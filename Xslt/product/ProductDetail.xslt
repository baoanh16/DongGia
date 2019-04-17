<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<xsl:template match="/">
		<div class="row">
			<div class="product-image">
				<div class="big">
					<xsl:apply-templates select="/ProductDetail/ProductImages" mode="BigImages">
					</xsl:apply-templates>
				</div>
				<div class="swiper-container thumbnail">
					<div class="swiper-wrapper">
						<xsl:apply-templates select="/ProductDetail/ProductImages" mode="SmallImages">
						</xsl:apply-templates>

					</div>
				</div>
			</div>
			<div class="product-info">
				<div class="row">
					<h1 class="title">
						<xsl:value-of select="/ProductDetail/Title"></xsl:value-of>
						<xsl:value-of select="/ProductDetail/EditLink" disable-output-escaping="yes">
						</xsl:value-of>
					</h1>
				</div>
				<div class="row info-wrapper">
					<div class="td">
						<h2 class="subTitle">
							<xsl:value-of select="/ProductDetail/SubTitle"></xsl:value-of>
						</h2>
					</div>
					<div class="td">
						<span>Code: </span>
						<span class="code">
							<xsl:value-of select="/ProductDetail/Code" />
						</span>
					</div>
				</div>
				<div class="row price-wrapper">
					<div class="td">
						<span class="price">
							<xsl:value-of select="/ProductDetail/Price" />
						</span>
					</div>
					<!--<div class="td">
								<span>x </span>
								<span class="quantity">Out of Stock</span>
							</div>-->
				</div>
				<div class="row quantity-wrapper">
					<span>Quantity</span>
					<div class="quantity-count">
						<span class="btn-spin btn-dec">-</span>
						<input value="1" id="quantity">
						<xsl:attribute name="name">
							<xsl:text>addtocart_</xsl:text>
							<xsl:value-of select="/ProductDetail/ProductId" disable-output-escaping="yes">
							</xsl:value-of>
							<xsl:text>.EnteredQuantity</xsl:text>
						</xsl:attribute>
						</input>
						<span class="btn-spin btn-inc">+</span>
					</div>
					<div class="addcart" data-action="addcart" data-url=''
						onclick="AjaxCart.addproducttocart_details(this); return false;">
						<xsl:attribute name="data-productid">
							<xsl:value-of select="/ProductDetail/ProductId"></xsl:value-of>
						</xsl:attribute>
						<span>Add to cart</span>
					</div>
				</div>
				<div class="row product-tab">
					<div class="td">
						<nav>
							<xsl:apply-templates select="/ProductDetail/ProductAttributes" mode="Nav" />
						</nav>
					</div>
					<div class="td">
						<xsl:apply-templates select="/ProductDetail/ProductAttributes" mode="Content" />
					</div>
				</div>
			</div>
		</div>
		<div class="row product-other">
			<div class="col">
				<h2 class="title">You may also like...</h2>
			</div>
			<div class="col">
				<div class="swiper-container">
					<div class="swiper-wrapper">
						<xsl:apply-templates select="/ProductDetail/ProductOther"></xsl:apply-templates>

					</div>
				</div>
			</div>
		</div>
		<!-- </div>
		</div> -->
	</xsl:template>

	<xsl:template match="ProductAttributes" mode="Content">
		<div class="pcontent" id="ptab-3">
			<xsl:if test="position() = 1">
				<xsl:attribute name="style">
					<xsl:text>display: block</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<xsl:attribute name="id">
				<xsl:text>ptab-</xsl:text>
				<xsl:value-of select="position()"></xsl:value-of>
			</xsl:attribute>
			<xsl:value-of select="Content" disable-output-escaping="yes" />
		</div>
	</xsl:template>
	<xsl:template match="ProductAttributes" mode="Nav">
		<a href="#ptab-3">
			<xsl:if test="position() = 1">
				<xsl:attribute name="class">
					<xsl:text>active</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<xsl:attribute name="href">
				<xsl:text>#ptab-</xsl:text>
				<xsl:value-of select="position()"></xsl:value-of>
			</xsl:attribute>
			<xsl:value-of select="Title"></xsl:value-of>
		</a>
	</xsl:template>
	<xsl:template match="ProductProperties">
		<xsl:if test="FieldId=4">
			<div class="product-size">
				<strong>
					<xsl:value-of select="Title"></xsl:value-of>
				</strong>
				<select>
					<xsl:attribute name="name">
						<xsl:text>product_attribute_</xsl:text>
						<xsl:value-of select="/ProductDetail/ProductId"></xsl:value-of>
						<xsl:text>_</xsl:text>
						<xsl:value-of select="FieldId"></xsl:value-of>
					</xsl:attribute>
					<xsl:apply-templates select="Options"></xsl:apply-templates>
				</select>
				<a href="/cham-soc-khach-hang/huong-dan-chon-size/so-mi-tay-ngan-kieu-body" class="viewsize">Hướng dẫn
					chọn size</a>
			</div>
		</xsl:if>
	</xsl:template>

	<xsl:template match="Options">
		<option>
			<xsl:attribute name="value">
				<xsl:value-of select="OptionId"></xsl:value-of>
			</xsl:attribute>
			<xsl:value-of select="Title"></xsl:value-of>
		</option>
	</xsl:template>

	<xsl:template match="ProductImages" mode="BigImages">
		<div class="slide" data-id="sl-1">
			<xsl:if test="position() = 1">
				<xsl:attribute name="style">
					<xsl:text>display:block</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<xsl:attribute name="data-id">
				<xsl:text>sl-</xsl:text>
				<xsl:value-of select="position()" disable-output-escaping="yes"></xsl:value-of>
			</xsl:attribute>
			<img src="./img/product/p_1.png" alt="">
			<xsl:attribute name="src">
				<xsl:value-of select="ImageUrl" disable-output-escaping="yes"></xsl:value-of>
			</xsl:attribute>
			<xsl:attribute name="alt">
				<xsl:value-of select="Title"></xsl:value-of>
			</xsl:attribute>
			</img>
		</div>
	</xsl:template>
	<xsl:template match="ProductImages" mode="SmallImages">
		<div class="swiper-slide" data-target="sl-1">
			<xsl:attribute name="data-data-target">
				<xsl:text>sl-</xsl:text>
				<xsl:value-of select="position()" disable-output-escaping="yes"></xsl:value-of>
			</xsl:attribute>
			<img src="./img/product/p_1.png" alt="">
			<xsl:attribute name="src">
				<xsl:value-of select="ImageUrl"></xsl:value-of>
			</xsl:attribute>
			<xsl:attribute name="alt">
				<xsl:value-of select="Title"></xsl:value-of>
			</xsl:attribute>
			</img>
		</div>
	</xsl:template>
	<xsl:template match="ProductOther">
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