<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
    <xsl:output method="html" indent="yes" />
    <xsl:template match="/">
        <xsl:apply-templates select="/ZoneList/Zone" mode="Zone1"></xsl:apply-templates>
    </xsl:template>
    <xsl:template match="Zone" mode="Zone1">
        <xsl:if test="IsActive='true'">
            <div class="zone-1">
                <a>
                    <xsl:attribute name="href">
                        <xsl:value-of select="Url"></xsl:value-of>
                    </xsl:attribute>
                    <xsl:attribute name="target">
                        <xsl:value-of select="Target"></xsl:value-of>
                    </xsl:attribute>
                    <xsl:attribute name="title">
                        <xsl:value-of select="Title"></xsl:value-of>
                    </xsl:attribute>
                    <xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
                </a>
            </div>
            <div class="zone-2">
                <xsl:apply-templates select="Zone" mode="Zone2"></xsl:apply-templates>
            </div>
            <div class="zone-mobile">
                <select id="customerSupportNav">
                    <xsl:apply-templates select='Zone' mode="ZoneMobile"></xsl:apply-templates>
                </select>
            </div>
        </xsl:if>
    </xsl:template>
    <xsl:template match="Zone" mode="Zone2">
        <a>
            <xsl:if test="IsActive='true'">
                <xsl:attribute name="class">
                    <xsl:text>active</xsl:text>
                </xsl:attribute>
            </xsl:if>
            <xsl:attribute name="href">
                <xsl:value-of select="Url"></xsl:value-of>
            </xsl:attribute>
            <xsl:attribute name="target">
                <xsl:value-of select="Target"></xsl:value-of>
            </xsl:attribute>
            <xsl:attribute name="title">
                <xsl:value-of select="Title"></xsl:value-of>
            </xsl:attribute>
            <xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
        </a>
    </xsl:template>

    <xsl:template match='Zone' mode="ZoneMobile">
        <option>
            <xsl:if test="IsActive='true'">
                <xsl:attribute name='selected'>
                    <xsl:text></xsl:text>
                </xsl:attribute>
            </xsl:if>
            <xsl:attribute name='value'>
                <xsl:value-of disable-output-escaping='yes' select='Url'></xsl:value-of>
            </xsl:attribute>
            <xsl:value-of disable-output-escaping='yes' select='Title'></xsl:value-of>
        </option>
    </xsl:template>
</xsl:stylesheet>