<?xml version="1.0" encoding="UTF-8"?>
<!--
*******************************************************************************
Name: MasterStyle.xsl
*******************************************************************************
Description: All paper form display-based stylesheets (known as "PDF 
  stylesheets") have a separate, corresponding CSS style file. The CSS style 
  file defines the form-specific CSS styles that will be repeatedly used in the 
  stylesheet. Whenever a PDF stylesheet is displayed, the associated CSS style 
  file is included at the top of the PDF stylesheet's XSL code. The print 
  application requires multiple pages to be printed at once, and to do this the 
  HTML from multiple PDF stylesheets are put one-on-top-of-another into one 
  large HTML file that can be printed in one call to the printer. When 
  conglomerating multiple HTML pages into one big file, the unique CSS styles 
  for each PDF stylesheet is embedded throughout the main body of the HTML. This 
  causes a problem since HTML has a problem reading CSS style files embedded in 
  the body of HTML. MasterStyle.xsl fixes the problem by extracting all of the 
  appropriate CSS style files and include them at the top of the large HTML file 
  to be printed, thus ensuring that all CSS styles are read properly by the print 
  application.
*******************************************************************************  
Update when: When a new PDF stylesheet is created, include the style file and 
  add a new condition for the style file to the template.
*******************************************************************************  
IMPORTANT NOTE: In MasterStyle.xsl, DocumentName actually refers to the root element 
of the schema used by the stylesheet. It DOES NOT refer to the literal DocumentName 
attribute from the schema.
*******************************************************************************  
Log: 
*******************************************************************************
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRS2290Schedule1Style.xsl"/>
  <xsl:include href="IRS2290Style.xsl"/>
  <xsl:include href="IRS6197Style.xsl"/>
  <xsl:include href="IRS6627Style.xsl"/>
  <xsl:include href="IRS720Style.xsl"/>
  <xsl:include href="IRS8833Style.xsl"/>
  <xsl:include href="IRS8849Schedule1Style.xsl"/>
  <xsl:include href="IRS8849Schedule2Style.xsl"/>
  <xsl:include href="IRS8849Schedule3Style.xsl"/>
  <xsl:include href="IRS8849Schedule5Style.xsl"/>
  <xsl:include href="IRS8849Schedule6Style.xsl"/>
  <xsl:include href="IRS8849Schedule8Style.xsl"/>
  <xsl:include href="IRS8849Style.xsl"/>
  <xsl:include href="IRS8974Style.xsl"/>
  <xsl:include href="IRS941ScheduleBStyle.xsl"/>
  <xsl:include href="IRS941ScheduleDStyle.xsl"/>
  <xsl:include href="IRS941ScheduleRStyle.xsl"/>
  <xsl:include href="IRS941SSPRStyle.xsl"/>
  <xsl:include href="IRS941Style.xsl"/>
  <xsl:include href="IRS94xPINRegistrationStyle.xsl"/>
  <!-- This template extracts the appropriate CSS style files and include them before the large HTML file which contains 
all PDF stylesheets that are selected for print. -->
  <xsl:template match="/">
    <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
    <html>
      <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <title/>
        <link rel="stylesheet" type="text/css" name="HeaderStyleSheet" href="{$CSSPath}/header.css"/>
        <link rel="stylesheet" type="text/css" name="BodyStyleSheet" href="{$CSSPath}/body.css"/>
        <link rel="stylesheet" type="text/css" name="General" href="{$CSSPath}/general.css"/>
        <style type="text/css">
          <xsl:call-template name="AddOnStyle"/>
          <xsl:for-each select="/AppData/PrintDocuments/Document">
            <xsl:choose>
              <xsl:when test="@documentName='IRS2290Schedule1'">
                <xsl:call-template name="IRS2290Schedule1Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS2290'">
                <xsl:call-template name="IRS2290Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS6197'">
                <xsl:call-template name="IRS6197Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS6627'">
                <xsl:call-template name="IRS6627Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS720'">
                <xsl:call-template name="IRS720Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8833'">
                <xsl:call-template name="IRS8833Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8849Schedule1'">
                <xsl:call-template name="IRS8849Schedule1Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8849Schedule2'">
                <xsl:call-template name="IRS8849Schedule2Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8849Schedule3'">
                <xsl:call-template name="IRS8849Schedule3Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8849Schedule5'">
                <xsl:call-template name="IRS8849Schedule5Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8849Schedule6'">
                <xsl:call-template name="IRS8849Schedule6Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8849Schedule8'">
                <xsl:call-template name="IRS8849Schedule8Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8849'">
                <xsl:call-template name="IRS8849Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8974'">
                <xsl:call-template name="IRS8974Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS941ScheduleB'">
                <xsl:call-template name="IRS941ScheduleBStyle"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS941ScheduleD'">
                <xsl:call-template name="IRS941ScheduleDStyle"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS941ScheduleR'">
                <xsl:call-template name="IRS941ScheduleRStyle"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS941SSPR'">
                <xsl:call-template name="IRS941SSPRStyle"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS941'">
                <xsl:call-template name="IRS941Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS94xPINRegistration'">
                <xsl:call-template name="IRS94xPINRegistrationStyle"/>
              </xsl:when>
              <xsl:otherwise/>
            </xsl:choose>
          </xsl:for-each>
        </style>
      </head>
      <body/>
    </html>
  </xsl:template>
</xsl:stylesheet>
