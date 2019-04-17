<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <div class="ajaxresponse">
      <h2 class="title">
        <xsl:value-of select="/ProductList/ZoneTitle"></xsl:value-of>
      </h2>
      <div class="row ajaxresponsewrap">
        <xsl:apply-templates select="/ProductList/Product"></xsl:apply-templates>
      </div>
    </div>
  </xsl:template>

  <xsl:template match="Product">
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
          <img src="./img/product/p_1.png" alt="product 1">
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
          <xsl:value-of select="SubTitle"/>
        </div>
        <a class="name" href="product-detail.html">
          <xsl:value-of select="Title"/>
        </a>
        <div class="price">
          <xsl:value-of select="Price"/>
        </div>
          <a href="#!" class="addcart" onclick="AjaxCart.addproducttocart_catalog(this);return false;">
            <xsl:attribute name="data-productid">
              <xsl:value-of select="ProductId"></xsl:value-of>
            </xsl:attribute>
            <xsl:attribute name="title">
              <xsl:value-of select="Title"></xsl:value-of>
            </xsl:attribute>
            <span>Add to cart</span>
          </a>
      </figcaption>
    </figure>
  </xsl:template>
</xsl:stylesheet>
