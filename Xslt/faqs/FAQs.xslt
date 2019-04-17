<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes" />

  <!--<FAQsList>
    <ModuleTitle>Hỏi đáp</ModuleTitle>
    <PageTitle>Hỏi đáp</PageTitle>
    <SubmitLink>Hỏi đáp</SubmitLink>
    <Culture>vi-VN</Culture>
    <FAQs>
      <Question>Câu hỏi</Question>
      <Answer>Trả lời</Answer>
      <Viewed>0</Viewed>
    </FAQs>
  </FAQsList>-->

  <xsl:template match="/">
    <h1 class="page-title">
      <xsl:value-of disable-output-escaping='yes' select="/FAQsList/ZoneTitle"></xsl:value-of>
    </h1>
    <div class="faqs">
      <xsl:apply-templates select="/FAQsList/FAQs"></xsl:apply-templates>
    </div>
  </xsl:template>

  <xsl:template match="FAQs">
    <div class="faq">
      <div class="question">
        <span>
          <xsl:value-of disable-output-escaping='yes' select='Question'></xsl:value-of>
        </span>
        <em class="lnr lnr-chevron-down"></em>
      </div>
      <div class="answer">
        <xsl:value-of disable-output-escaping='yes' select='Answer'></xsl:value-of>
      </div>
      <xsl:value-of select='EditLink' disable-output-escaping='yes'></xsl:value-of>
    </div>
  </xsl:template>
</xsl:stylesheet>