<?xml version="1.0" encoding="UTF-8"?>

<!--
*****************************************************************************************************
Commmon Path Reference stylesheet
*****************************************************************************************************
Description: This file contains parameters that define XPaths or string values that are used in
  the stylesheets and their related support files (e.g. files that contain templates that are used 
  by the stylesheets). Whenever the XPath of a parameter or the value of the parameter is changed,
  edit the parameter in this file and the change will propagate to files that use the parameter.
*****************************************************************************************************
-->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
  <!-- Parameters that define the XPath for the parameters from the framework -->
  <xsl:param name="AppProp" select="/AppData/ApplicationProperties" />
  <xsl:param name="UserPref" select="AppData/UserPreferences" />  
  <xsl:param name="XPath" select="/AppData/Parameters/XPath"/>
  <!-- The Stage parameter indicates the stage of the data -->
  <xsl:param name="StageTest" select="/AppData/Parameters/Stage" />
  <xsl:param name="Stage">
    <xsl:choose>
      <!-- If stage is empty or does not exist, stage is set to 'original' -->
      <xsl:when test="(not($StageTest) or ($StageTest = '') )">original</xsl:when>
      <xsl:otherwise><xsl:value-of select="/AppData/Parameters/Stage" /></xsl:otherwise>
    </xsl:choose>
  </xsl:param> 
  <xsl:param name="Print" select="/AppData/Parameters/Print" />
  <!-- The Location parameter locates the subreturn (consolidated, parent or subsidiary) in
       which the return document is located. -->
  <xsl:param name="Location" select="/AppData/Parameters/Location" />
  <!-- Parameters that define the XPath of the return header data -->
  <xsl:param name="ParRtnHdrData" select="/AppData/SubmissionHeaderAndDocument/ParentSubmission/ReturnHeader" />
  <xsl:param name="SubRtnHdrData" select="/AppData/SubmissionHeaderAndDocument/SubsidiarySubmission/ReturnHeader" />
  <xsl:param name="RtnHdrData" select="/AppData/SubmissionHeaderAndDocument/ReturnHeader" />
  <xsl:param name="RtnDoc" select="/AppData/SubmissionHeaderAndDocument/SubmissionDocument" />
  <xsl:param name="DocId" select="/AppData/Parameters/DocumentId" />
  <!-- Parameters that start with WM are for watermarks --> 
  <xsl:param name="WMTaxpayerA" select="/AppData/ApplicationProperties/FilePathPageWatermarkTaxpayerAccepted" />
  <xsl:param name="WMTaxpayerR" select="/AppData/ApplicationProperties/FilePathPageWatermarkTaxpayerRejected" />  
  <xsl:param name="WMProdA" select="/AppData/ApplicationProperties/FilePathPageWatermarkProdAccepted" />
  <xsl:param name="WMProdR" select="/AppData/ApplicationProperties/FilePathPageWatermarkProdRejected" />
  <xsl:param name="WMTestA" select="/AppData/ApplicationProperties/FilePathPageWatermarkTestAccepted" />
  <xsl:param name="WMTestR" select="/AppData/ApplicationProperties/FilePathPageWatermarkTestRejected" />
  <!-- Parameter indicating whether the stylesheet is being displayed in test or production -->
  <xsl:param name="TP" select="/AppData/ApplicationProperties/SystemMode" />
  <xsl:param name="TaxpayerPrint" select="/AppData/Parameters/TaxpayerPrint" />
  <xsl:param name="ReturnStatus" select="/AppData/Parameters/FilingStatus" />
  <xsl:param name="PageWatermark">
    <xsl:choose>
      <!-- Print watermark for tax payer accepted return or rejected return. -->
      <xsl:when test="(($TaxpayerPrint='true') or ($TaxpayerPrint='1')) and $ReturnStatus='A'"><xsl:value-of select="$WMTaxpayerA" /></xsl:when>
      <xsl:when test="(($TaxpayerPrint='true') or ($TaxpayerPrint='1')) and $ReturnStatus='R'"><xsl:value-of select="$WMTaxpayerR" /></xsl:when>
      <xsl:otherwise>
        <xsl:choose>
          <!-- Print watermark for production accepted, production rejected, test accepted, or test rejected return. -->
          <xsl:when test="$TP='Production' and $ReturnStatus='A'"><xsl:value-of select="$WMProdA" /></xsl:when>
          <xsl:when test="$TP='Production' and $ReturnStatus='R'"><xsl:value-of select="$WMProdR" /></xsl:when>
          <xsl:when test="$TP='Test' and $ReturnStatus='A'"><xsl:value-of select="$WMTestA" /></xsl:when>
          <xsl:when test="$TP='Test' and $ReturnStatus='R'"><xsl:value-of select="$WMTestR" /></xsl:when>
        </xsl:choose>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:param>
  <!-- Parameters that define the absolute path of files. Paths for images, javascript, and CSS stylesheet definition files are defined. -->
  <xsl:param name="ScriptPath"><xsl:value-of select="concat('/mef/rrdprd/sdi/versioned/',$TaxYear,'/scripts')"></xsl:value-of></xsl:param>
  <xsl:param name="ImagePath"><xsl:value-of select="concat('/mef/rrdprd/sdi/versioned/',$TaxYear,'/images')"></xsl:value-of></xsl:param>
  <xsl:param name="NonVersionedImagePath">/mef/rrdprd/common/images</xsl:param>  
  <xsl:param name="CSSPath"><xsl:value-of select="concat('/mef/rrdprd/sdi/versioned/',$TaxYear,'/styles')"></xsl:value-of></xsl:param>
  <!-- The Separated parameter is used in the separated repeating data feature. -->
  <xsl:param name="Separated">separated</xsl:param>
  <!-- The following parameters define data that can be used to categorize the IRS forms being displayed. -->
  <xsl:param name="Version" select="/AppData/Parameters/SubmissionVersion"></xsl:param>
  <xsl:param name="Type" select="/AppData/Parameters/SubmissionType"></xsl:param>
  <xsl:param name="TaxYear" select="substring(/AppData/Parameters/SubmissionVersion,1,4)"></xsl:param>
  <!-- The DisplayName parameter is for displaying the form name (this is different from the stylesheet file name). -->
  <xsl:param name="DisplayName" select="/AppData/Parameters/DisplayName" />
  <!-- The Regulation parameter holds the regulation law data for a given stylesheet. -->
  <xsl:param name="Regulation" select="/AppData/Parameters/Regulation" />
  <xsl:param name="ZoomLevel" select="/AppData/Parameters/ZoomLevel" />
  <xsl:param name="K1SeqNum" select="/AppData/Parameters/K1SeqNum" />
</xsl:stylesheet>