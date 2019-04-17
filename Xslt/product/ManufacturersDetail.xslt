<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <h2>
      <xsl:value-of select="/ManufacturerDetail/Title"/>
    </h2>
    <p><xsl:value-of select="/ManufacturerDetail/ModuleTitle"/></p>
    <div class="row">
        <xsl:apply-templates select="/ManufacturerDetail/Product"></xsl:apply-templates>
    </div>
  </xsl:template>

  <xsl:template match="Product">

      <div class="col-6 col-lg-4 colection-item">
        <a href="#">
        <xsl:attribute name="href">
          <xsl:value-of select="Url"></xsl:value-of>
        </xsl:attribute>
        <xsl:attribute name="title">
          <xsl:value-of select="Title"></xsl:value-of>
        </xsl:attribute>
          <div class="img">
            <img src="./img/Collection/colection-1.png" alt="">
              <xsl:attribute name="src">
                <xsl:value-of select="ImageUrl"></xsl:value-of>
              </xsl:attribute>
              <xsl:attribute name="alt">
                <xsl:value-of select="Title"></xsl:value-of>
              </xsl:attribute>

            </img>
          </div>
          <h3>
                <xsl:value-of select="Title"></xsl:value-of></h3></a
          ></div>

  </xsl:template>
</xsl:stylesheet>
