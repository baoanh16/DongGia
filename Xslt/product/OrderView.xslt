<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <section class="user-page">
      <div class="user-order">
        <div class="order-detail">
          <div class="order-name">
            Đơn hàng <strong>
              #<xsl:value-of select="/OrderDetail/OrderCode"></xsl:value-of>
            </strong>
          </div>
          <div class="order-list">
            <div class="item">
              <div class="order-item">
                <div class="order-title">
                  <div class="des">
                    Đặt ngày <xsl:value-of select="/OrderDetail/CreatedDate"></xsl:value-of>
                  </div>
                  <div class="status alert-success">
                    <xsl:choose>
                      <xsl:when test="/OrderDetail/PaymentStatus='Chưa thanh toán'">
                        <xsl:attribute name="class">
                          <xsl:text>status alert-secondary</xsl:text>
                        </xsl:attribute>
                      </xsl:when>
                    </xsl:choose>
                    <xsl:value-of select="/OrderDetail/PaymentStatus"></xsl:value-of>
                  </div>
                </div>
                <div class="row row-s">
                  <div class="col-12 col-md-6 mt-2 mb-2">
                    <div class="order-information">
                      <div class="title">Thông tin đặt hàng</div>
                      <ul>
                        <li>
                          <strong>
                            <xsl:value-of select="/OrderDetail/BillingFirstName"></xsl:value-of>
                          </strong>
                        </li>
                        <li>
                          Địa chỉ: <xsl:value-of select="/OrderDetail/BillingAddress"></xsl:value-of>
                          <xsl:if test="/OrderDetail/BillingDistrict!=''">
                            <xsl:text>, </xsl:text>
                            <xsl:value-of select="/OrderDetail/BillingDistrict"></xsl:value-of>
                          </xsl:if>
                          <xsl:if test="/OrderDetail/BillingProvince!=''">
                            <xsl:text>, </xsl:text>
                            <xsl:value-of select="/OrderDetail/BillingProvince"></xsl:value-of>
                          </xsl:if>
                        </li>
                        <li>
                          Điện thoại: <xsl:value-of select="/OrderDetail/BillingPhone"></xsl:value-of>
                        </li>
                        <li>
                          Phương thức vận chuyển: <xsl:value-of select="/OrderDetail/ShippingMethod"></xsl:value-of>
                          <xsl:if test="/OrderDetail/TrackingFrameUrl!=''">
                            <a target="_blank" style="color:#2cbde5;font-weight:bold">
                              <xsl:attribute name="href">
                                <xsl:value-of select="/OrderDetail/TrackingFrameUrl"></xsl:value-of>
                              </xsl:attribute>
                              Lịch trình đơn hàng
                            </a>
                          </xsl:if>
                          <xsl:if test="/OrderDetail/ShippingFee!=''">
                            <p>
                              Phí vận chuyển: <xsl:value-of select="/OrderDetail/ShippingFee"></xsl:value-of>
                            </p>
                          </xsl:if>
                        </li>
                        <li>
                          Phương thức thanh toán: <xsl:value-of select="/OrderDetail/PaymentMethod"></xsl:value-of>
                          <p class="payment-status">
                            <xsl:value-of select="/OrderDetail/PaymentStatus"></xsl:value-of>
                          </p>
                          <xsl:choose>
                            <xsl:when test="/OrderDetail/AllowRepaid='true'">
                              <!--<a class="userpanel-btn repaid-order-btn" href="#">Thanh toán lại</a>-->
                              <div class="popup-tragop">
                                <div class="bank-list">
                                  <div class="content clearfix">
                                    <h3 class="title">Chọn phương thức thanh toán lại</h3>
                                    <div class="cart-form clearfix">
                                      <xsl:apply-templates select="/OrderDetail/Payment"></xsl:apply-templates>
                                    </div>
                                  </div>
                                  <div class="btn-wrap clearfix">
                                    <a class="userpanel-btn btn-success repaid-button" onclick="AjaxCheckout.repaidorder(this);return false;" href="#">
                                      <xsl:attribute name="data-orderid">
                                        <xsl:value-of select="/OrderDetail/OrderId"></xsl:value-of>
                                      </xsl:attribute>
                                      Thanh toán
                                    </a>
                                  </div>
                                </div>
                              </div>
                            </xsl:when>
                          </xsl:choose>
                        </li>
                      </ul>
                    </div>
                  </div>
                  <div class="col-12 col-md-6 mt-2 mb-2">
                    <div class="order-information">
                      <div class="title">Thông tin người nhận hàng</div>
                      <ul>
                        <li>
                          <strong>
                            <xsl:value-of select="/OrderDetail/ShippingFirstName"></xsl:value-of>
                          </strong>
                        </li>
                        <li>
                          Địa chỉ: <xsl:value-of select="/OrderDetail/ShippingAddress"></xsl:value-of>
                          <xsl:if test="/OrderDetail/ShippingDistrict!=''">
                            <xsl:text>, </xsl:text>
                            <xsl:value-of select="/OrderDetail/ShippingDistrict"></xsl:value-of>
                          </xsl:if>
                          <xsl:if test="/OrderDetail/ShippingProvince!=''">
                            <xsl:text>, </xsl:text>
                            <xsl:value-of select="/OrderDetail/ShippingProvince"></xsl:value-of>
                          </xsl:if>
                        </li>
                        <li>
                          Điện thoại: <xsl:value-of select="/OrderDetail/ShippingPhone"></xsl:value-of>
                        </li>
                      </ul>
                    </div>
                  </div>
                  <xsl:if test="/OrderDetail/InvoiceCompanyTaxCode !=''">
                    <div class="col-12">
                      <h3>Thông tin xuất hóa đơn</h3>
                      <div class="address-col">
                        <p>
                          <span>Mã số thuế: </span>
                          <xsl:value-of select="/OrderDetail/InvoiceCompanyTaxCode"></xsl:value-of>
                        </p>
                        <p>
                          <span>Tên công ty: </span>
                          <xsl:value-of select="/OrderDetail/InvoiceCompanyName"></xsl:value-of>
                        </p>
                        <p>
                          <span>Địa chỉ: </span>
                          <xsl:value-of select="/OrderDetail/InvoiceCompanyAddress"></xsl:value-of>
                        </p>
                      </div>
                    </div>
                  </xsl:if>
                </div>
                <div class="order-product">
                  <xsl:apply-templates select="/OrderDetail/Product"></xsl:apply-templates>
                </div>
                <div class="order-total">
                  <div class="group">
                    <div class="label">
                      <xsl:text>Tạm tính</xsl:text>
                    </div>
                    <div class="value">
                      <xsl:value-of select="/OrderDetail/OrderSubTotal"></xsl:value-of>
                    </div>
                  </div>
                  <div class="group">
                    <div class="label">
                      <xsl:text>Giảm giá</xsl:text>
                    </div>
                    <div class="value discount-total">
                      <xsl:value-of select="/OrderDetail/OrderDiscount"></xsl:value-of>
                    </div>
                  </div>
                  <div class="group">
                    <div class="label">
                      Phí vận chuyển
                    </div>
                    <div class="value shipping-total">
                      <xsl:value-of select="/OrderDetail/ShippingFee"></xsl:value-of>
                    </div>
                  </div>
                  <div class="group total">
                    <div class="label">
                      Tổng tiền
                    </div>
                    <div class="value order-total">
                      <xsl:value-of select="/OrderDetail/OrderTotal"></xsl:value-of>
                    </div>
                  </div>
                  <xsl:if test="/OrderDetail/Link != ''">
                    <div class="group ">
                      <div class="label">
                        Hóa đơn VAT cho đơn hàng này :
                      </div>
                      <div class="value">
                        <a>
                          <xsl:attribute name="href">
                            <xsl:value-of select="/OrderDetail/Link"></xsl:value-of>
                          </xsl:attribute>
                          Link
                        </a>
                      </div>
                    </div>
                  </xsl:if>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  </xsl:template>

  <xsl:template match="Product">
    <a class="product">
      <xsl:attribute name="href">
        <xsl:value-of select="Url"></xsl:value-of>
      </xsl:attribute>
      <div class="img">
        <img>
          <xsl:attribute name="src">
            <xsl:value-of select="ImageUrl"></xsl:value-of>
          </xsl:attribute>
          <xsl:attribute name="alt">
            <xsl:value-of select="Title"></xsl:value-of>
          </xsl:attribute>
        </img>
      </div>
      <div class="caption">
        <div class="name">
          <xsl:value-of select="Title"></xsl:value-of>
          <xsl:if test="Code!=''">
            <div class="serial">
              Serial: <xsl:value-of select="Code"></xsl:value-of>
            </div>
          </xsl:if>
        </div>
        <div class="amount">
          Số lượng: <xsl:value-of select="Quantity"></xsl:value-of>
        </div>
        <div class="price">
          Tổng tiền:
          <div class="new">
            <xsl:value-of select="ItemTotal"></xsl:value-of>
          </div>
        </div>
      </div>
    </a>
  </xsl:template>

  <xsl:template match="Payment">
    <div class="payment-method">
      <div class="select-group checkbox">
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
          <div class="method-info">
            <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
          </div>
        </label>
      </div>
    </div>
  </xsl:template>

</xsl:stylesheet>