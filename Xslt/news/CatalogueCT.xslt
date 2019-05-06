<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<xsl:template match="/">
				<div class="container">
					<h2 class="main-title"><xsl:value-of select="/NewsDetail/Title" disable-output-escaping="yes"></xsl:value-of></h2>
					<div class="wowbook-wrapper">
						<div id="wowbook">
							<xsl:apply-templates select="/NewsDetail/NewsImages"></xsl:apply-templates>
						</div>
					</div>
					<xsl:if test="count(/NewsDetail/NewsImages)&gt;0">
						
					<div class="wowbook-control">
						<ul>
							<li><a id="first" href="javascript:void(0)"><span class="lnr lnr-chevron-double-left"></span></a></li>
							<li><a id="back" href="javascript:void(0)"><span class="lnr lnr-chevron-left"></span></a></li>
							<li><a id="zoomout" href="javascript:void(0)"><span class="lnr lnr-chevron-minus"></span></a></li>
							<li><a id="zoomin" href="javascript:void(0)"><span class="lnr lnr-chevron-plus"></span></a></li>
							<li><a id="next" href="javascript:void(0)"><span class="lnr lnr-chevron-right"></span></a></li>
							<li><a id="last" href="javascript:void(0)"><span class="lnr lnr-chevron-double-right"></span></a></li>
						</ul>
					</div>
					</xsl:if>
				</div>
	</xsl:template>

	<xsl:template match="NewsImages">
		<div class="item"><img>
			<xsl:attribute name="src">
				<xsl:value-of select="ImageUrl" disable-output-escaping="yes"></xsl:value-of>
			</xsl:attribute>
			<xsl:attribute name="alt">
				<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
			</xsl:attribute>
		</img></div>
	</xsl:template>

</xsl:stylesheet>