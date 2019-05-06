<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<xsl:template match="/">
		<div class="product-nav product-filter">
			<div class="container">
				<div class="product-category">
					<nav class="category">
						<xsl:apply-templates select="/ZoneList/Zone"></xsl:apply-templates>
					</nav>
					<nav class="sort">

					</nav>
				</div>
			</div>
		</div>
	</xsl:template>

	<xsl:template match="Zone">
		<div class="filter-group nav-item">
			<span>
				<xsl:value-of select="Title"></xsl:value-of>
			</span>
			<span class="lnr lnr-chevron-down"></span>
			<div class="dropdown">
				<div class="viewall">
					<a>
						<xsl:attribute name="href">
							<xsl:value-of select="Url" disable-output-escaping="yes"></xsl:value-of>
						</xsl:attribute>
						View All
					</a>
				</div>
				<div class="list">
					<xsl:apply-templates select="Zone" mode="Default"></xsl:apply-templates>
				</div>
			</div>
		</div>
	</xsl:template>

	<xsl:template match="Zone" mode="Default">
		<a href="#">
			<xsl:if test="IsActive='true'">
				<xsl:attribute name="class">
					<xsl:text>ajaxlink active</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<xsl:attribute name="href">
				<xsl:value-of select="Url"></xsl:value-of>
			</xsl:attribute>
			<xsl:attribute name="title">
				<xsl:value-of select="Title"></xsl:value-of>
			</xsl:attribute>
			<xsl:value-of select="Title"></xsl:value-of>
		</a>
	</xsl:template>
</xsl:stylesheet>
