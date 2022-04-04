<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [<!ENTITY nbsp "&#160;">]><xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"> 
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:param name="DependencyData" select="$RtnDoc/PostponementCropInsDsstrStmt"/>
	  <!--  - Form 1040 Schedule F Displays as - Postponement Of Crop Insurance and Disaster Payments Statement - -->
  <xsl:param name="depDocTitle">
  <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$DependencyData"/></xsl:call-template>  
  </xsl:param>
  <xsl:template match="PostponementCropInsDsstrStmt" name="PostponementCropInsDsstrStmtTemp">
    <div class="styTopSectionLine">
      <span class="styTopSectionLineLbl" style="vertical-align:top;">Name:</span>      
      <span style="font-size:10pt;width:100mm;">
        <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="$DependencyData/BusinessName/BusinessNameLine1Txt"/>
        </xsl:call-template>
        <xsl:if test="$DependencyData/BusinessName/BusinessNameLine2Txt != ''">
          <br/>
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$DependencyData/BusinessName/BusinessNameLine2Txt"/>
          </xsl:call-template>
        </xsl:if>
      </span>  
    </div>
    <div class="styTopSectionLine">
      <span class="styTopSectionLineLbl" style="vertical-align:top;">Address:</span>      
      <span style="width:100mm;font-size:10pt;">
        <xsl:call-template name="PopulateUSAddressTemplate">
          <xsl:with-param name="TargetNode" select="$DependencyData/USAddress"/>
        </xsl:call-template>        
      </span>  
    </div>
    <div class="styTopSectionLine">
      <span class="styTopSectionLineLbl" style="vertical-align:top;">A statement that you are making a choice under section 451(d) of the Internal Revenue Code and section 1451-6 of the regulations:</span>      
      <span style="width:100mm;font-size:10pt;">
        <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="$DependencyData/SectionChoiceStatementTxt"/>
        </xsl:call-template>
      </span>  
    </div>
    <div class="styTopSectionLine">
      <span class="styTopSectionLineLbl" style="vertical-align:top;">A statement that under your normal business practice you would have included income from the destroyed or damaged crops in gross income for a tax year following the year the crops were destroyed or damaged:</span>      
      <span style="width:100mm;font-size:10pt;">
        <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="$DependencyData/NormalBusPracticeStatementTxt"/>
        </xsl:call-template>
      </span>  
    </div>
  </xsl:template>
  <xsl:template match="DestructionOrDamageCropsGrp" name="DestructionOrDamageOfCropsInfoTemp">
    <tbody>
      <tr>
        <xsl:attribute name="class">
          <xsl:choose>
             <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
             <xsl:otherwise>styDepTblRow2</xsl:otherwise>
          </xsl:choose>
        </xsl:attribute>
        <td class="styDepTblCell" style="text-align:center">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="DestructionOrDamageDt"/>
          </xsl:call-template>
        </td>
        <td class="styDepTblCell" style="text-align:left">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="DestructionOrDamageCauseTxt"/>
          </xsl:call-template>
        </td>
        <td class="styDepTblCell" style="text-align:left">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="DestroyedOrDamagedCropDsc"/>
          </xsl:call-template>
        </td>
      </tr>
    </tbody>
  </xsl:template>
  <xsl:template match="InsurancePaymentsForCropGrp" name="InsurancePaymentsForCropInfoTemp">
    <tbody>  
      <tr>
        <xsl:attribute name="class">
          <xsl:choose>
             <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
             <xsl:otherwise>styDepTblRow2</xsl:otherwise>
          </xsl:choose>
        </xsl:attribute>
        <td class="styDepTblCell" style="text-align:left">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="DestroyedOrDamagedCropDsc"/>
          </xsl:call-template>
        </td>
        <td class="styDepTblCell" style="text-align:center">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="InsurancePaymentGrp/Dt"/>
          </xsl:call-template>
        </td>
        <td class="styDepTblCell" style="text-align:right;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="InsurancePaymentGrp/Amt"/>
          </xsl:call-template>
        </td>
        <td class="styDepTblCell" style="text-align:left">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="InsuranceCarrierName/BusinessNameLine1Txt"/>
          </xsl:call-template>
          <xsl:if test="InsuranceCarrierName/BusinessNameLine2Txt != ''">
            <br/>
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="InsuranceCarrierName/BusinessNameLine2Txt"/>
            </xsl:call-template>
          </xsl:if>          
        </td>
      </tr>
    </tbody>
  </xsl:template>
  <!-- Main template -->
  <xsl:template match="/">
    <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
      <head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
         <title><xsl:value-of select="$depDocTitle"/></title>
         <!-- No Browser Caching -->
         <meta http-equiv="Pragma" content="no-cache"/>
         <meta http-equiv="Cache-Control" content="no-cache"/>
         <meta http-equiv="Expires" content="0"/>
         <!-- No Proxy Caching -->
         <meta http-equiv="Cache-Control" content="private"/>
         <!-- Define Character Set -->
         <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
         <meta name="Author" content="Alex Hurtt:: ahurtt@us.ibm.com"/>
         <meta name="Description" content="{$depDocTitle}"/>
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
        <xsl:call-template name="InitJS"/>
        <style type="text/css">
          <xsl:if test="not($Print) or $Print=''">
            <xsl:call-template name="AddOnStyle"/>    
          </xsl:if>
        </style>
        <xsl:call-template name="GlobalStylesDep"/>
      </head>
      <body class="styBodyClass">
        <xsl:call-template name="DocumentHeaderDependency"/>
         <div class="styDepTitleLine">
        <span class="styDepTitle"  style="padding-right:2mm;">
            <xsl:value-of select="$depDocTitle"/>
          </span>        
      </div>
        <xsl:call-template name="PopulateDepCommonLeftover"><xsl:with-param name="TargetNode" select="$DependencyData"/></xsl:call-template>
        <xsl:apply-templates select="$DependencyData"/>
        <!-- Begin Destruction or Damage of Crops Info Table -->
        <table id="DestructionOrDamageOfCropsInfoTbl" class="styDepTbl">
          <thead class="styDepTableThead">
          <tr class="styDepTblHdr">
            <th class="styDepTblCell" scope="col" style="width: 25mm">Date of Destruction or Damage</th>
            <th class="styDepTblCell" scope="col">Cause of Destruction or Damage</th>
            <th class="styDepTblCell" scope="col">Description of Destroyed or Damaged Crop</th>
          </tr>
        </thead>
          <xsl:apply-templates select="$DependencyData/DestructionOrDamageCropsGrp"/>
        </table>
        <!-- End Destruction or Damage of Crops Info Table -->
        <div style="height:3mm;"/>
        <!-- Begin Insurance Payment for Crops Info Table -->
        <table id="InsurancePaymentsForCropInfoTbl" class="styDepTbl">
          <thead class="styDepTableThead">
            <tr class="styDepTblHdr">
              <th class="styDepTblCell" rowspan="2" scope="col">Description of Destroyed or Damaged Crop</th>
              <th class="styDepTblCell" colspan="2" scope="col" style="width:65mm;">Insurance Payment</th>
              <th class="styDepTblCell" rowspan="2" scope="col">Name of Insurance Carrier from Whom You Received Payments</th>
            </tr>
            <tr class="styDepTblHdr">
              <th class="styDepTblCell" scope="col" style="width:25mm">Date</th>
              <th class="styDepTblCell" scope="col" style="width:40mm">Amount</th>
            </tr>
          </thead>
          <xsl:apply-templates select="$DependencyData/InsurancePaymentsForCropGrp"/>
        </table>
        <!-- End Insurance Payment for Crops Info Table -->
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>