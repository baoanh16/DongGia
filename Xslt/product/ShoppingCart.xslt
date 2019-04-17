<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt"
 exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<xsl:template match="/">
		<xsl:choose>
			<xsl:when test="count(/ShoppingCart/CartItem)=0">
				<div class="row cart-title">
					<div class="col">
						<h3>
							<span class="fas fa-shopping-cart"></span>
							<span>
								<xsl:value-of select="/ShoppingCart/CartEmptyText"></xsl:value-of>
							</span>
						</h3>
					</div>
				</div>
				<div class="cart-button-checkout">
					<a class="btn btn-prev" href="/">
						<span class="mdi mdi-chevron-left"></span>
						<span>
							<xsl:value-of select="/ShoppingCart/BackText"></xsl:value-of>
							<!-- Quay lại -->
						</span>
					</a>
				</div>
			</xsl:when>
			<xsl:otherwise>
				<div class="row cart-title">
					<div class="col">
						<h3>
							<span class="fas fa-shopping-cart"></span>
							<span><xsl:value-of select="/ShoppingCart/YourBagText" disable-output-escaping="yes"></xsl:value-of> (</span>
							<span><xsl:value-of select="/ShoppingCart/TotalProducts"></xsl:value-of> </span><span><xsl:value-of select="/ShoppingCart/CartProductText" disable-output-escaping="yes"></xsl:value-of>)</span>
						</h3>
					</div>
				</div>

				<div class="row cart-table-list">
					<div class="col">
						<table>
							<thead>
								<tr>
									<th><xsl:value-of select="/ShoppingCart/CartProductText" disable-output-escaping="yes"></xsl:value-of></th>
									<th><xsl:value-of select="/ShoppingCart/PriceText" disable-output-escaping="yes"></xsl:value-of></th>
									<th><xsl:value-of select="/ShoppingCart/QuantityText" disable-output-escaping="yes"></xsl:value-of></th>
									<th><xsl:value-of select="/ShoppingCart/TotalText" disable-output-escaping="yes"></xsl:value-of></th>
								</tr>
							</thead>
							<tbody>
								<xsl:apply-templates select="/ShoppingCart/CartItem"></xsl:apply-templates>
							</tbody>
						</table>
					</div>
				</div>

				<div class="row cart-total-price">
					<div class="col">
						<p><span><xsl:value-of select="/ShoppingCart/TotalText" disable-output-escaping="yes"></xsl:value-of>: </span>
							<strong class="price-temp">
								<xsl:value-of select="/ShoppingCart/SubTotal"></xsl:value-of>
							</strong>
						</p>
						<!-- <p><span>Phí vận chuyển:</span>
							<strong class="price-shipping">
								<xsl:value-of select="/ShoppingCart/ShippingTotal"></xsl:value-of>
							</strong>
						</p>
						<p><span>Giảm giá:</span>
							<strong class="price-reduce">
								<xsl:value-of select="/ShoppingCart/DiscountTotal"></xsl:value-of>
							</strong>
						</p>
						<p>
							<span>Tổng tiền:</span>
							<strong>
								<xsl:value-of select="/ShoppingCart/Total"></xsl:value-of>
							</strong>
						</p> -->
						<p><xsl:value-of select="/ShoppingCart/NotIncludeTaxText" disable-output-escaping="yes"></xsl:value-of></p>
					</div>
				</div>

				<div class="cart-button-checkout">
					<xsl:if test="/ShoppingCart/ContinueShoppingUrl!=''">
						<a class="btn btn-prev">
							<xsl:attribute name="href">
								<xsl:value-of select="/ShoppingCart/ContinueShoppingUrl"></xsl:value-of>
							</xsl:attribute>
							<span class="mdi mdi-chevron-left"></span>
							<span>
							<xsl:value-of select="/ShoppingCart/ContinueShoppingText"></xsl:value-of></span>
						</a>
					</xsl:if>
					<a class="btn btn-next">
						<xsl:attribute name="onclick">
							<xsl:text>setLocation('</xsl:text>
							<xsl:value-of select="/ShoppingCart/CheckoutUrl"></xsl:value-of>
							<xsl:text>')</xsl:text>
						</xsl:attribute>
						<span>
							<xsl:value-of select="/ShoppingCart/CheckoutProcessText"></xsl:value-of>
						</span>
						<span class="mdi mdi-chevron-right"></span>
					</a>
				</div>
			</xsl:otherwise>
		</xsl:choose>

	</xsl:template>

	<xsl:template match="CartItem">
		<tr>
			<td>
				<figure>
					<a>
						<xsl:attribute name="href">
							<xsl:value-of select="Url"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="target">
							<xsl:value-of select="target"></xsl:value-of>
						</xsl:attribute>
						<img>
						<xsl:attribute name="src">
							<xsl:value-of select="ThumbnailUrl"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="alt">
							<xsl:value-of select="Title"></xsl:value-of>
						</xsl:attribute>
						</img>
					</a>
					<figcaption>
						<h4>
							<a>
								<xsl:attribute name="href">
									<xsl:value-of select="Url"></xsl:value-of>
								</xsl:attribute>
								<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
							</a>
						</h4>
						<p>
							<xsl:value-of select="Code" disable-output-escaping="yes"></xsl:value-of>
						</p>
						<xsl:apply-templates select="Attributes"></xsl:apply-templates>
					</figcaption>
				</figure>
				<div class="removeproduct" onclick="AjaxCart.removefromcart(this);return false;">
					<xsl:attribute name="data-itemguid">
						<xsl:value-of select="ItemGuid"></xsl:value-of>
					</xsl:attribute>
					<a >
						<span class="mdi mdi-close"></span>
						<!-- <xsl:text>Bỏ sản phẩm</xsl:text> -->
						<!--<xsl:value-of select="/ShoppingCart/RemoveText"></xsl:value-of>-->
					</a>
					<!-- <a class="loveit" onclick="AjaxCart.carttowishlist(this);return false;">
						<xsl:attribute name="data-itemguid">
							<xsl:value-of select="ItemGuid"></xsl:value-of>
						</xsl:attribute>
						<i class="fa fa-heart" aria-hidden="true"></i>
						<xsl:text> </xsl:text>
						<xsl:text>Để dành mua sau</xsl:text>
					</a> -->
				</div>
			</td>
			<td>
				<div class="price-wrap">
				<div class="new">
					<xsl:value-of select="OriginalPrice"></xsl:value-of>
				</div>
				<!-- <xsl:if test="OldPrice !=''">
					(<del class="old">
						<xsl:value-of select="OldPrice"></xsl:value-of>
					</del>)
				</xsl:if> -->
				<xsl:if test="OldPrice !=''">
					<div class="sale">
						<xsl:text>(Giảm </xsl:text>
						<xsl:value-of select="ItemPercent" disable-output-escaping="yes"></xsl:value-of>
						<xsl:text>%)</xsl:text>
						<!-- <xsl:value-of select="DiscountPercentage"></xsl:value-of> -->
					</div>
				</xsl:if>
				</div>
			</td>
			<td>
				<div class="quantity input-number">
					<span class="minus">-</span>
					<!-- <input class="quantity-number" type="text" value="1"> -->
					<!-- <input type="text" maxlength="10" class="quantity-number qty-input" onchange="AjaxCart.updatecart();return false;"> -->
					<input type="text" maxlength="10" class="quantity-number qty-input" onchange="AjaxCart.updatecart();return false;">
					<xsl:attribute name="name">
						<xsl:text>itemquantity</xsl:text>
						<xsl:value-of select="ItemGuid"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="value">
						<xsl:value-of select="Quantity"></xsl:value-of>
					</xsl:attribute>
					</input>
					<span class="plus">+</span>
				</div>
			</td>
			<td>
				<xsl:value-of select="ItemSubTotal"></xsl:value-of>
			</td>
		</tr>
	</xsl:template>

  <xsl:template match="Attributes">
    <div class="size">
      <xsl:value-of select="Title"></xsl:value-of>
      <xsl:text>: </xsl:text>
      <xsl:apply-templates select="Options"></xsl:apply-templates>
    </div>
  </xsl:template>
  <xsl:template match="Options">
    <xsl:if test="IsActive='true'">
      <xsl:value-of select="Title"></xsl:value-of>
    </xsl:if>
  </xsl:template>
	<!-- <xsl:template match="CartItem" mode="Gifts">
		<xsl:if test="GiftDescription!=''">
			<div class="row flex flex-wrap">
				<xsl:value-of select="GiftDescription" disable-output-escaping="yes"></xsl:value-of>
			</div>
		</xsl:if>
	</xsl:template> -->

	<!-- <xsl:template match="Quantities">
		<option>
			<xsl:attribute name="value">
				<xsl:value-of select="Quantity"></xsl:value-of>
			</xsl:attribute>
			<xsl:value-of select="Quantity"></xsl:value-of>
		</option>
	</xsl:template> -->

	<!-- <xsl:template match="Attributes">
		<div class="productsize">
			<xsl:value-of select="Title"></xsl:value-of>
			<xsl:text>: </xsl:text>
			<strong>
				<xsl:apply-templates select="Options"></xsl:apply-templates>
			</strong>
		</div>
	</xsl:template> -->

	<!-- <xsl:template match="Options">
		<xsl:if test="IsActive='true'">
			<xsl:value-of select="Title"></xsl:value-of>
		</xsl:if>
	</xsl:template> -->

</xsl:stylesheet>