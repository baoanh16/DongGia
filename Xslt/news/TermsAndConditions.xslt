<?xml version='1.0' encoding='utf-8'?>
<xsl:stylesheet version='1.0' xmlns:xsl='http://www.w3.org/1999/XSL/Transform'
    xmlns:msxsl='urn:schemas-microsoft-com:xslt' exclude-result-prefixes='msxsl'>
    <xsl:output method='html' indent='yes' />
    <xsl:template match='/'>
        <h1 class="page-title">
            <xsl:value-of disable-output-escaping='yes' select="/NewsList/ZoneTitle"></xsl:value-of>
        </h1>
        <div class="page-desc">
            <xsl:value-of disable-output-escaping='yes' select='/NewsList/ZoneDescription'></xsl:value-of>
        </div>
        <div class="terms">
            <xsl:apply-templates select='/NewsList/News'></xsl:apply-templates>
        </div>
    </xsl:template>

    <xsl:template match='News'>
        <div class="term">
            <div class="title">
                <xsl:value-of disable-output-escaping='yes' select='position()'></xsl:value-of>
                <xsl:text>. </xsl:text>
                <xsl:value-of disable-output-escaping='yes' select='Title'></xsl:value-of>
                <xsl:value-of select='EditLink' disable-output-escaping='yes'></xsl:value-of>
            </div>
            <div class="content">
                <xsl:value-of disable-output-escaping='yes' select='BriefContent'></xsl:value-of>
            </div>
        </div>
    </xsl:template>
</xsl:stylesheet>