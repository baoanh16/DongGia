<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt"
 exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<xsl:template match="/">
		<xsl:if test="/ShoppingCart/Address != ''">
			<div class="cart-title">
				<h3 class="title">
					<xsl:value-of select="/ShoppingCart/AddressText"></xsl:value-of>
				</h3>
				<!-- <a class="btn-edit">
					<xsl:attribute name="href">
						<xsl:text>/checkoutaddress</xsl:text>
					</xsl:attribute>
					<xsl:value-of select="/ShoppingCart/ChangeText"></xsl:value-of>
				</a> -->
			</div>
			<div class="cart-order-summary">
				<table class="table">
					<tbody>
						<tr>
							<td colspan="2">
								<xsl:value-of select="/ShoppingCart/LastName"></xsl:value-of>
								<xsl:value-of select="/ShoppingCart/FirstName"></xsl:value-of>
							</td>
						</tr>
						<tr>
							<td>
								<span>
									<xsl:value-of select="/ShoppingCart/PhoneText" disable-output-escaping="yes"></xsl:value-of>
								</span>
							</td>
							<td>
								<xsl:value-of select="/ShoppingCart/Phone"></xsl:value-of>
							</td>
						</tr>
						<tr>
							<td>
								<span>
									<xsl:value-of select="/ShoppingCart/AddressText" disable-output-escaping="yes"></xsl:value-of>
								</span>
							</td>
							<td>
								<xsl:value-of select="/ShoppingCart/Address"></xsl:value-of>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</xsl:if>
		<div class="cart-title">
			<h3><span class="fas fa-shopping-cart"></span>
				<span>
					<xsl:value-of select="/ShoppingCart/CartText"></xsl:value-of> (
				</span>
				<span>
					<xsl:value-of select="/ShoppingCart/TotalProducts"></xsl:value-of>
				</span>
				<span>
					<xsl:value-of select="/ShoppingCart/ProductText"></xsl:value-of>)
				</span>
			</h3>
		</div>
		<div class="cart-order-summary">
			<table>
				<tbody>
					<xsl:apply-templates select="/ShoppingCart/CartItem"></xsl:apply-templates>
					<tr class="amount price">
						<td><xsl:value-of select="/ShoppingCart/SubTotalText"></xsl:value-of></td>
						<td>
							<xsl:value-of select="/ShoppingCart/SubTotal"></xsl:value-of>
						</td>
					</tr>
					<tr class="amount price">
						<td><xsl:value-of select="/ShoppingCart/DiscountText"></xsl:value-of>
							<span class="fas fa-question-circle" data-toggle="tooltip" data-placement="top" title="Tooltip nội dung ở đây"></span>
						</td>
						<td>
							<xsl:value-of select="/ShoppingCart/DiscountTotal"></xsl:value-of>
						</td>
					</tr>
					<tr class="amount shipping">
						<td><xsl:value-of select="/ShoppingCart/ShippingText"></xsl:value-of></td>
						<td class="shipping-total">
							<xsl:value-of select="/ShoppingCart/ShippingTotal"></xsl:value-of>
						</td>
					</tr>
					<tr class="amount shipping">
						<td>Total Weight</td>
						<td>
							<xsl:value-of select="/ShoppingCart/TotalWeight"></xsl:value-of>
									<xsl:text> gram</xsl:text>
						</td>
					</tr>
					<tr class="amount price">
						<td><xsl:value-of select="/ShoppingCart/TotalText"></xsl:value-of></td>
						<td>
							<xsl:value-of select="/ShoppingCart/Total"></xsl:value-of>
						</td>
					</tr>
				</tbody>
			</table>
			<!-- <p style="font-size: 14px; margin-top: 15px">
				<i>
					<strong>Thời gian giao hàng dự kiến:</strong>
					<br></br>
					- Khu vực TP.HCM: từ 2 - 5 ngày
					<br></br>
					- Các tỉnh thành khác: từ 5 - 7 ngày
					<br></br>
					(không bao gồm thứ Bảy, Chủ nhật và ngày lễ)
					<br></br>
					<span style="color: #ff0000;">*</span> Giao hàng trong giờ hành chính: 8h - 17h, từ thứ Hai tới thứ Sáu
				</i>
			</p> -->
		</div>
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
								<xsl:attribute name="target">
									<xsl:value-of select="target"></xsl:value-of>
								</xsl:attribute>
								<xsl:value-of select="Title"></xsl:value-of>
							</a>
						</h4>
						<p>
							<xsl:value-of select="Code"></xsl:value-of>
						</p>
					</figcaption>
				</figure>
			</td>
			<td>
				<p class="price">
					<xsl:value-of select="OldPrice"></xsl:value-of>
				</p>

				<p class="total-price">
					<xsl:value-of select="OriginalPrice"></xsl:value-of>
				</p>
				<p class="">
					<xsl:value-of select="Weight"></xsl:value-of>
									<xsl:text> gram </xsl:text>
				</p><p> <span>x </span>
					<span class="quantity">
						<xsl:value-of select="Quantity"></xsl:value-of>
					</span></p>
			</td>
		</tr>


	</xsl:template>

</xsl:stylesheet>
