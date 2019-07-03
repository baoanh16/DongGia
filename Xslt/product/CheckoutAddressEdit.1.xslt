<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<xsl:template match="/">

		<div class="checkout-title">
			<h3>
				<span class="fas fa-map-marker-alt"></span>
				<span>Địa chỉ nhận hàng</span>
			</h3>
		</div>

		<div class="customer-info">
			<div class="form-info">
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
						<!-- <xsl:value-of select="/CheckoutAddress/EmployeeContactText"></xsl:value-of> -->
						(Nhân viên giao nhận sẽ liên hệ với SĐT này)
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
					<xsl:attribute name="value">
						<xsl:value-of select="/CheckoutAddress/Email"></xsl:value-of>
					</xsl:attribute>
					</input>
				</div>
				<hr />
				<div class="form-group form-city">
					<label>
						<xsl:value-of select="/CheckoutAddress/ProvinceText"></xsl:value-of>
						<xsl:text> (*)</xsl:text>
					</label>
					<select name="Address_Province"
						onchange="AjaxCheckout.getdistrictsbyprovinceguid(this, 'Address_District')">
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
						<span>Lời nhắn</span>
						<span>(Không bắt buộc)</span>
					</label>
					<textarea name="OrderNote" placeholder="Ví dụ: Chuyển hàng ngoài giờ hành chính">
						<xsl:attribute name="placeholder">
						<xsl:value-of select="/CheckoutAddress/plNode"></xsl:value-of>
						</xsl:attribute>
						<xsl:value-of select="/CheckoutAddress/OrderNote"></xsl:value-of>
					</textarea>
				</div>
			</div>
			<div class="form-same">
				<input id="ttmh" type="checkbox" name="Address_SameBilling" checked="checked"></input>
				<label id="btn-ttmh" for="ttmh">Thông tin người mua hàng giống như trên</label>
				<div class="form-wrapper">
					<div class="form-group form-name">
						<label>
							<xsl:value-of select="/CheckoutAddress/FullNameText"></xsl:value-of>
							<xsl:text> (*)</xsl:text>
						</label>
						<input type="text" name="ShippingAddress_FirstName" placeholder="Nhập họ tên">
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
						<input type="text" name="ShippingAddress_Phone" placeholder="Nhập Số điện thoại">
						<xsl:attribute name="placeholder">
							<xsl:value-of select="/CheckoutAddress/plPhone"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="value">
							<xsl:value-of select="/CheckoutAddress/ShippingPhone"></xsl:value-of>
						</xsl:attribute>
						</input>
						<span>
							(Nhân viên giao nhận sẽ liên hệ với SĐT này)
						</span>
					</div>
					<div class="form-group form-email">
						<label>
							<xsl:value-of select="/CheckoutAddress/EmailText"></xsl:value-of>
						</label>
						<input type="text" name="ShippingAddress_Email" placeholder="Nhập email">
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
						<select name="ShippingAddress_Province"
							onchange="AjaxCheckout.getdistrictsbyprovinceguid(this, 'ShippingAddress_District')">
							<option value="">
								<xsl:value-of select="/CheckoutAddress/SelectProvinceText"></xsl:value-of>
							</option>
							<xsl:apply-templates select="/CheckoutAddress/Provinces" mode="Shipping">
							</xsl:apply-templates>
						</select>
					</div>
					<div class="form-group form-district">
						<label>
							<xsl:value-of select="/CheckoutAddress/DistrictText"></xsl:value-of>
							<xsl:text> (*)</xsl:text>
						</label>
						<select name="ShippingAddress_District">
							<option value="">
								<xsl:value-of select="/CheckoutAddress/SelectDistrictText"></xsl:value-of>
							</option>
							<xsl:apply-templates select="/CheckoutAddress/Districts" mode="Shipping">
							</xsl:apply-templates>
						</select>
					</div>
					<div class="form-group form-address">
						<label>
							<xsl:value-of select="/CheckoutAddress/AddressText"></xsl:value-of>
							<xsl:text> (*)</xsl:text>
						</label>
						<input type="text" name="ShippingAddress_Address" placeholder="Vd: 64 đường Hiệp Bình">
						<xsl:attribute name="placeholder">
							<xsl:value-of select="/CheckoutAddress/plAddress"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="value">
							<xsl:value-of select="/CheckoutAddress/ShippingAddress"></xsl:value-of>
						</xsl:attribute>
						</input>
					</div>
					<div class="form-checkbox">
						<input id="cntt" type="checkbox" name="" checked="checked"></input>
						<label for="cntt">
							Cập nhật thông tin mua hàng giống như trên
						</label>
					</div>
				</div>
			</div>
			<div class="bill-export">
				<input id="Invoice_Required" type="checkbox" name="Invoice_Required"></input>
				<label for="Invoice_Required">Xuất hóa đơn</label>
				<div class="form-wrapper">
					<i>Vui lòng điền đầy đủ thông tin công ty để nhận hóa đơn GTGT</i>
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
			</div>
		</div>

		<!-- <div class="cart-button-checkout">
			<a class="btn btn-prev">
				<xsl:attribute name="href">
					<xsl:value-of select="/cart"></xsl:value-of>
				</xsl:attribute>
				<span class="mdi mdi-chevron-left"></span>
				<span>Quay lại</span>
			</a>
			<a class="btn btn-next" href="javascript:void(0)">
				<xsl:attribute name="onclick">
					<xsl:text>AjaxCheckout.saveorder(false, '</xsl:text>
					<xsl:value-of select="/CheckoutAddress/NextPageUrl"></xsl:value-of>
					<xsl:text>');return false;</xsl:text>
				</xsl:attribute>
				<span>Tiếp tục</span>
				<span class="mdi mdi-chevron-right"></span>
			</a>
		</div> -->

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
