<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt"
 exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<xsl:template match="/">
		<!-- <h3 class="title">Địa chỉ nhận hàng</h3> -->
		<div class="cart-title">
			<h3><span class="fas fa-map-marker-alt"></span><span><xsl:value-of select="/CheckoutAddress/ShippingAddress"></xsl:value-of></span></h3>
		</div>
		<div class="cart-address">
			<div class="form-group">
				<label style="flex: 0 0 100%">
					<i><xsl:value-of select="/CheckoutAddress/NoteRequired"></xsl:value-of></i>
				</label>
			</div>
			<div class="address-edit">
				<div class="form-group form-name">
					<label>
						<xsl:value-of select="/CheckoutAddress/FullNameText"></xsl:value-of>
						<xsl:text> (*)</xsl:text>
					</label>
					<input type="text" name="Address_FirstName">
					<xsl:attribute name="placeholder">
						<xsl:value-of select="/CheckoutAddress/plFullText"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="value">
						<xsl:value-of select="/CheckoutAddress/FirstName"></xsl:value-of>
					</xsl:attribute>
					</input>
				</div>
				<div class="form-group form-phone">
					<label>
						<xsl:value-of select="/CheckoutAddress/PhoneText"></xsl:value-of>
						<xsl:text> (*)</xsl:text>
					</label>
					<input type="text" name="Address_Phone">
					<xsl:attribute name="placeholder">
						<xsl:value-of select="/CheckoutAddress/plPhone"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="value">
						<xsl:value-of select="/CheckoutAddress/Phone"></xsl:value-of>
					</xsl:attribute>
					</input>
					<span>
						<xsl:value-of select="/CheckoutAddress/ContactNumberText"></xsl:value-of>
					</span>
				</div>
				<div class="form-group form-email">
					<label>
						<xsl:value-of select="/CheckoutAddress/EmailText"></xsl:value-of>
					</label>
					<input type="text" name="Address_Email" placeholder="Nhập email">
						<xsl:attribute name="placeholder">
							<xsl:value-of select="/CheckoutAddress/plEmail"></xsl:value-of>
						</xsl:attribute>
					</input>
				</div>
				<hr />
				<div class="form-group form-city">
					<label>
						<xsl:value-of select="/CheckoutAddress/ProvinceText"></xsl:value-of>
						<xsl:text> (*)</xsl:text>
					</label>
					<select name="Address_Province" onchange="AjaxCheckout.getdistrictsbyprovinceguid(this, 'Address_District')">
						<option value="">
							<xsl:value-of select="/CheckoutAddress/SelectProvinceText"></xsl:value-of>
						</option>
						<xsl:apply-templates select="/CheckoutAddress/Provinces"></xsl:apply-templates>
					</select>
				</div>
				<div class="form-group form-district">
					<label>
						<xsl:value-of select="/CheckoutAddress/DistrictText"></xsl:value-of>
						<xsl:text> (*)</xsl:text>
					</label>
					<select name="Address_District">
						<option value="">
							<xsl:value-of select="/CheckoutAddress/SelectDistrictText"></xsl:value-of>
						</option>
						<xsl:apply-templates select="/CheckoutAddress/Districts"></xsl:apply-templates>
					</select>
				</div>
				<div class="form-group form-address">
					<label>
						<xsl:value-of select="/CheckoutAddress/AddressText"></xsl:value-of>
						<xsl:text> (*)</xsl:text>
					</label>
					<input type="text" name="Address_Address" placeholder="Vd: 64 đường Hiệp Bình">
					<xsl:attribute name="placeholder">
						<xsl:value-of select="/CheckoutAddress/plAddress"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="value">
						<xsl:value-of select="/CheckoutAddress/Address"></xsl:value-of>
					</xsl:attribute>
					</input>
				</div>
				<div class="form-group form-message">
					<label>
						<!-- <xsl:value-of select="/CheckoutAddress/Node"></xsl:value-of>:
						<span>
							<xsl:value-of select="/CheckoutAddress/NonRequest"></xsl:value-of>
						</span> -->

						<xsl:value-of select="/CheckoutAddress/OrderNote"></xsl:value-of><span>(Không bắt buộc)</span>
					</label>
					<textarea name="OrderNote" cols="30" rows="2" placeholder="Ví dụ: Chuyển hàng ngoài giờ hành chính">
						<xsl:attribute name="placeholder">
						<xsl:value-of select="/CheckoutAddress/plNode"></xsl:value-of>
						</xsl:attribute>
					</textarea>
				</div>
				<div class="check-group">
					<input id="ttmh" type="checkbox" name="Address_SameBilling" checked="checked"></input>
					<label id="btn-ttmh" for="ttmh">
						<!-- <xsl:value-of select="/CheckoutAddress/InfoSameAbove"></xsl:value-of> -->
						<xsl:value-of select="/CheckoutAddress/OrderNote"></xsl:value-of>
					</label>
				</div>
			</div>
			<div class="address-edit-other">
				<div class="form-group form-name">
					<label>
						<xsl:value-of select="/CheckoutAddress/FullNameText"></xsl:value-of>
						<xsl:text> (*)</xsl:text>
					</label>
					<input type="text" name="ShippingAddress_FirstName" placeholder="Nhập họ tên" required="true" aria-required="true">
					<xsl:attribute name="placeholder">
						<xsl:value-of select="/CheckoutAddress/plFullText"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="value">
						<xsl:value-of select="/CheckoutAddress/ShippingFirstName"></xsl:value-of>
					</xsl:attribute>
					</input>
				</div>
				<div class="form-group form-phone">
					<label>
						<xsl:value-of select="/CheckoutAddress/PhoneText"></xsl:value-of>
						<xsl:text> (*)</xsl:text>
					</label>
					<input type="text" name="ShippingAddress_Phone" placeholder="Nhập Số điện thoại" required="true" aria-required="true">
					<xsl:attribute name="placeholder">
						<xsl:value-of select="/CheckoutAddress/plPhone"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="value">
						<xsl:value-of select="/CheckoutAddress/ShippingPhone"></xsl:value-of>
					</xsl:attribute>
					</input>
					<span>
						<xsl:value-of select="/CheckoutAddress/ContactNumberText"></xsl:value-of>
					</span>
				</div>
				<div class="form-group form-email">
					<label>
						<xsl:value-of select="/CheckoutAddress/EmailText"></xsl:value-of>
					</label>
					<input type="text" name="ShippingAddress_Email" placeholder="Nhập email" required="true" aria-required="true">
					<xsl:attribute name="placeholder">
						<xsl:value-of select="/CheckoutAddress/plEmail"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="value">
						<xsl:value-of select="/CheckoutAddress/ShippingEmail"></xsl:value-of>
					</xsl:attribute>
					</input>
				</div>
				<hr />
				<div class="form-group form-city">
					<label>
						<xsl:value-of select="/CheckoutAddress/ProvinceText"></xsl:value-of>
						<xsl:text> (*)</xsl:text>
					</label>
					<select name="ShippingAddress_Province" onchange="AjaxCheckout.getdistrictsbyprovinceguid(this, 'ShippingAddress_District')" required="true" aria-required="true">
						<option value="">
							<xsl:value-of select="/CheckoutAddress/SelectProvinceText"></xsl:value-of>
						</option>
						<xsl:apply-templates select="/CheckoutAddress/Provinces" mode="Shipping"></xsl:apply-templates>
					</select>
				</div>
				<div class="form-group form-district">
					<label>
						<xsl:value-of select="/CheckoutAddress/DistrictText"></xsl:value-of>
						<xsl:text> (*)</xsl:text>
					</label>
					<select name="ShippingAddress_District" required="true" aria-required="true">
						<option value="">
							<xsl:value-of select="/CheckoutAddress/SelectDistrictText"></xsl:value-of>
						</option>
						<xsl:apply-templates select="/CheckoutAddress/Districts" mode="Shipping"></xsl:apply-templates>
					</select>
				</div>
				<div class="form-group form-address">
					<label>
						<xsl:value-of select="/CheckoutAddress/AddressText"></xsl:value-of>
						<xsl:text> (*)</xsl:text>
					</label>
					<input type="text" name="ShippingAddress_Address" placeholder="Vd: 64 đường Hiệp Bình" required="true" aria-required="true">
					<xsl:attribute name="placeholder">
						<xsl:value-of select="/CheckoutAddress/plAddress"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="value">
						<xsl:value-of select="/CheckoutAddress/ShippingAddress"></xsl:value-of>
					</xsl:attribute>
					</input>
				</div>
				<div class="check-group">
					<input id="cntt" type="checkbox" name="" checked="checked"></input>
					<label for="cntt" id="btn-cntt">
						<xsl:value-of select="/CheckoutAddress/UpdateSameTop"></xsl:value-of>
						<!-- Cập nhật thông tin mua hàng giống như trên -->
					</label>
				</div>
			</div>
		</div>
		<div class="cart-bill-export">
			<input id="Invoice_Required" type="checkbox" name="Invoice_Required"></input>
			<label id="btn-xuathd" for="Invoice_Required">
				<xsl:value-of select="/CheckoutAddress/ExportRedBill"></xsl:value-of>
			</label>
		</div>
		<div class="cart-bill-info">
			<p>
				<xsl:value-of select="/CheckoutAddress/ExportRedBill"></xsl:value-of>
			</p>
			<!-- <p>Vui lòng điền đầy đủ thông tin công ty để nhận hóa đơn GTGT</p> -->
			<div class="form-group form-taxcode">
				<label>
					<xsl:value-of select="/CheckoutAddress/CompanyTaxCodeText"></xsl:value-of>
				</label>
				<input type="text" name="Invoice_CompanyTaxCode">
				<xsl:attribute name="value">
					<xsl:value-of select="/CheckoutAddress/CompanyTaxCode"></xsl:value-of>
				</xsl:attribute>
				</input>
			</div>
			<div class="form-group form-company-name">
				<label>
					<xsl:value-of select="/CheckoutAddress/CompanyNameText"></xsl:value-of>
				</label>
				<input type="text" name="Invoice_CompanyName">
				<xsl:attribute name="value">
					<xsl:value-of select="/CheckoutAddress/CompanyName"></xsl:value-of>
				</xsl:attribute>
				</input>
			</div>
			<div class="form-group form-company-address">
				<label for="">
					<xsl:value-of select="/CheckoutAddress/CompanyAddressText"></xsl:value-of>
				</label>
				<input type="text" name="Invoice_CompanyAddress">
				<xsl:attribute name="value">
					<xsl:value-of select="/CheckoutAddress/CompanyAddress"></xsl:value-of>
				</xsl:attribute>
				</input>
			</div>
		</div>
		<div class="cart-title">
			<h3><span class="fas fa-shopping-cart"></span><span><xsl:value-of select="/CheckoutAddress/UsedCoupon" disable-output-escaping="yes"></xsl:value-of></span></h3>
		</div>
		<div class="cart-coupon">

			<xsl:choose>
				<xsl:when test="/CheckoutAddress/CouponCode!=''">
					<span class="code">
						<xsl:value-of select="/CheckoutAddress/CouponCode"></xsl:value-of>
					</span>
					<span class="title">
						<xsl:value-of select="/CheckoutAddress/CouponTitle"></xsl:value-of>
					</span>
					<input type="button" onclick="AjaxCart.removecoupon();return false;" class="remove" value="" runat="server" />
				</xsl:when>


				<xsl:otherwise>
					<p><xsl:value-of select="/CheckoutAddress/ExportRedBill" disable-output-escaping="yes"></xsl:value-of></p>
					<div class="form-group">
						<input type="text" id="couponCode" autocomplete="off" max-length="20" placeholder="Nhập mã giảm giá">
						<xsl:attribute name="placeholder">
							<xsl:value-of select="/CheckoutAddress/plCoupon"></xsl:value-of>
						</xsl:attribute>
						</input>
						<button class="btn-submitcoupon" onclick="AjaxCart.applycoupon();return false;">
							<xsl:value-of select="/CheckoutAddress/ApplyText"></xsl:value-of>
							<!-- Áp Dụng -->
						</button>
						<span class="coupon-apply-error"></span>
					</div>
					<div class="desc"><i><xsl:value-of select="/CheckoutAddress/CouponNote" disable-output-escaping="yes"></xsl:value-of></i>
						<p><xsl:value-of select="/CheckoutAddress/CouponNote2" disable-output-escaping="yes"></xsl:value-of></p>
					</div>
				</xsl:otherwise>
			</xsl:choose>
		</div>
		<div class="cart-button-checkout">
			<a class="btn btn-prev">
				<xsl:attribute name="href">
					<xsl:value-of select="/cart"></xsl:value-of>
				</xsl:attribute>
				<span class="mdi mdi-chevron-left"></span>
				<span><xsl:value-of select="/CheckoutAddress/ContinuteShopping" disable-output-escaping="yes"></xsl:value-of></span>
			</a>
			<a class="btn btn-next" href="javascript:void(0)">
				<xsl:attribute name="onclick">
					<xsl:text>AjaxCheckout.saveorder(false, '</xsl:text>
					<xsl:value-of select="/CheckoutAddress/NextPageUrl"></xsl:value-of>
					<xsl:text>');return false;</xsl:text>
				</xsl:attribute>
				<span>
					<xsl:value-of select="/CheckoutAddress/ContinueShoppingText"></xsl:value-of>
				</span>
				<span class="mdi mdi-chevron-right"></span>
			</a>
		</div>
	</xsl:template>

	<xsl:template match="Provinces">
		<option>
			<xsl:if test="IsActive='true'">
				<xsl:attribute name="selected">
					<xsl:text>selected</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<xsl:attribute name="value">
				<xsl:value-of select="Guid"></xsl:value-of>
			</xsl:attribute>
			<xsl:value-of select="Title"></xsl:value-of>
		</option>
	</xsl:template>

	<xsl:template match="Provinces" mode="Shipping">
		<option>
			<xsl:if test="ShippingIsActive='true'">
				<xsl:attribute name="selected">
					<xsl:text>selected</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<xsl:attribute name="value">
				<xsl:value-of select="Guid"></xsl:value-of>
			</xsl:attribute>
			<xsl:value-of select="Title"></xsl:value-of>
		</option>
	</xsl:template>

	<xsl:template match="Districts">
		<option>
			<xsl:if test="IsActive='true'">
				<xsl:attribute name="selected">
					<xsl:text>selected</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<xsl:attribute name="value">
				<xsl:value-of select="Guid"></xsl:value-of>
			</xsl:attribute>
			<xsl:value-of select="Title"></xsl:value-of>
		</option>
	</xsl:template>
	<xsl:template match="Districts" mode="Shipping">
		<option>
			<xsl:if test="ShippingIsActive='true'">
				<xsl:attribute name="selected">
					<xsl:text>selected</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<xsl:attribute name="value">
				<xsl:value-of select="Guid"></xsl:value-of>
			</xsl:attribute>
			<xsl:value-of select="Title"></xsl:value-of>
		</option>
	</xsl:template>

</xsl:stylesheet>
