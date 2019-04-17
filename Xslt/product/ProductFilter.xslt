<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<xsl:template match="/">
		<div class="product-nav product-filter">
			<div class="container">
				<div class="product-category">
					<nav class="category ajaxfilterresponse">
						<xsl:apply-templates select="/ProductFilter/Group"></xsl:apply-templates>
					</nav>
					<nav class="sort">
						<div class="nav-item"><span>Sort by: </span><span>Featured</span><span
								class="lnr lnr-chevron-down"></span>
							<div class="dropdown">
								<div class="list"><a class="ajaxlink" href="#">Featured</a><a class="ajaxlink"
										href="#">A-&gt;Z</a><a class="ajaxlink" href="#">Price</a></div>
							</div>
						</div>
					</nav>
				</div>
			</div>
		</div>
	</xsl:template>

	<xsl:template match="Group">
		<div class="filter-group nav-item">
			<span>
				<xsl:value-of select="Title"></xsl:value-of>
			</span>
			<span class="lnr lnr-chevron-down"></span>
			<div class="dropdown">
				<div class="viewall">
					<a>
						<xsl:attribute name="href">
							<xsl:value-of select="ClearUrl" disable-output-escaping="yes"></xsl:value-of>
						</xsl:attribute>
						View All
					</a>
				</div>
				<div class="list">
					<xsl:apply-templates select="Option" mode="Default"></xsl:apply-templates>
				</div>
			</div>
		</div>
	</xsl:template>

	<xsl:template match="Option" mode="Default">
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