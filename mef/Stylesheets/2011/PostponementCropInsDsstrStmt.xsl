<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [<!ENTITY nbsp "&#160;">]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="PopulateTemplate.xsl"/>

  <xsl:output method="html" indent="yes" />
  <xsl:strip-space elements="*" />

  <xsl:param name="DependencyData" select="$RtnDoc//PostponementCropInsDsstrStmt" />

  <xsl:param name="depDocTitle">
  <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$DependencyData" /></xsl:call-template>  
  </xsl:param>
  
  <xsl:template match="PostponementCropInsDsstrStmt" name="PostponementCropInsDsstrStmtTemp">
    <div class="styTopSectionLine">
      <span class="styTopSectionLineLbl"  style="vertical-align:top;">Name:</span>      
      <span style="font-size:10pt;width:100mm;">
        <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="$DependencyData/Name/BusinessNameLine1" />
        </xsl:call-template>
        <xsl:if test="$DependencyData/Name/BusinessNameLine2 != ''">
          <br />
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$DependencyData/Name/BusinessNameLine2" />
          </xsl:call-template>
        </xsl:if>
      </span>  
    </div>
    <div class="styTopSectionLine">
      <span class="styTopSectionLineLbl"  style="vertical-align:top;">Address:</span>      
      <span style="font-size:10pt;width:100mm;">
        <xsl:call-template name="PopulateUSAddressTemplate">
          <xsl:with-param name="TargetNode" select="$DependencyData/Address" />
        </xsl:call-template>        
      </span>  
    </div>
    <div class="styTopSectionLine">
      <span class="styTopSectionLineLbl"  style="vertical-align:top;">A statement that you are making a choice under section 451(d) of the Internal Revenue Code and section 1451-6 of the regulations:</span>      
      <span style="font-size:10pt;width:100mm;">
        <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="$DependencyData/Sect451dChoiceStatement" />
        </xsl:call-template>
      </span>  
    </div>
    <div class="styTopSectionLine">
      <span class="styTopSectionLineLbl"  style="vertical-align:top;">A statement that under your normal business practice you would have included income from the destroyed or damaged crops in gross income for a tax year following the year the crops were destroyed or damaged:</span>      
      <span style="font-size:10pt;width:100mm;">
        <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="$DependencyData/NormalBusPracticeStatement" />
        </xsl:call-template>
      </span>  
    </div>
  </xsl:template>
  
  <xsl:template match="DestructionOrDamageOfCropsInfo" name="DestructionOrDamageOfCropsInfoTemp">
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
            <xsl:with-param name="TargetNode" select="DateOfDestructionOrDamage" />
          </xsl:call-template>
        </td>
        <td class="styDepTblCell" style="text-align:left">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="CauseOfDestructionOrDamage" />
          </xsl:call-template>
        </td>
        <td class="styDepTblCell" style="text-align:left">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="DescOfDestroyedOrDamagedCrop" />
          </xsl:call-template>
        </td>
      </tr>
    </tbody>
  </xsl:template>
  
  <xsl:template match="InsurancePaymentsForCropInfo" name="InsurancePaymentsForCropInfoTemp">
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
            <xsl:with-param name="TargetNode" select="DescOfDestroyedOrDamagedCrop" />
          </xsl:call-template>
        </td>
        <td class="styDepTblCell" style="text-align:center">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="InsurancePayment/Date" />
          </xsl:call-template>
        </td>
        <td class="styDepTblCell" style="text-align:right;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="InsurancePayment/Amount" />
          </xsl:call-template>
        </td>
        <td class="styDepTblCell" style="text-align:left">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="InsuranceCarrierName/BusinessNameLine1" />
          </xsl:call-template>
          <xsl:if test="InsuranceCarrierName/BusinessNameLine2 != ''">
            <br />
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="InsuranceCarrierName/BusinessNameLine2" />
            </xsl:call-template>
          </xsl:if>          
        </td>
      </tr>
    </tbody>
  </xsl:template>

  <!-- Main template -->
  <xsl:template match="/">
    <html>
      <head>
         <title><xsl:value-of select="$depDocTitle" /></title>
         <!-- No Browser Caching -->
         <meta http-equiv="Pragma" content="no-cache" />
         <meta http-equiv="Cache-Control" content="no-cache" />
         <meta http-equiv="Expires" content="0" />
         <!-- No Proxy Caching -->
         <meta http-equiv="Cache-Control" content="private" />
         <!-- Define Character Set -->
         <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
         <meta name="Author" content="Alex Hurtt:: ahurtt@us.ibm.com" />
         <meta name="Description" content= "{$depDocTitle}" />
         
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"></script>
        <xsl:call-template name="InitJS"></xsl:call-template>
        <style type="text/css">
          <xsl:if test="not($Print) or $Print=''">
            <xsl:call-template name="AddOnStyle"></xsl:call-template>    
          </xsl:if>
        </style>
        <xsl:call-template name="GlobalStylesDep"/>
      </head>
    
      <body class="styBodyClass">
        <xsl:call-template name="DocumentHeaderDependency" />
        <div class="styDepTitleLine">
          <span class="styDepTitle">
            <span style="width:95mm;"><xsl:value-of select="$depDocTitle" /></span>    
          </span>
        </div>

        <xsl:call-template name="PopulateDepCommonLeftover"><xsl:with-param name="TargetNode" select="$DependencyData" /></xsl:call-template>
        <xsl:apply-templates select="$DependencyData" />

        <!-- Begin Destruction or Damage of Crops Info Table -->
        <table id="DestructionOrDamageOfCropsInfoTbl" class="styDepTbl">
          <thead class="styDepTableThead">
          <tr class="styDepTblHdr">
            <th class="styDepTblCell" scope="col" style="width: 25mm">Date of destruction or damage</th>
            <th class="styDepTblCell" scope="col">Cause of destruction or damage</th>
            <th class="styDepTblCell" scope="col">Description of destroyed or damaged crop</th>
          </tr>
        </thead>
          <xsl:apply-templates select="$DependencyData/DestructionOrDamageOfCropsInfo" />
        </table>
        <!-- End Destruction or Damage of Crops Info Table -->

        <div style="height:3mm;"></div>

        <!-- Begin Insurance Payment for Crops Info Table -->
        <table id="InsurancePaymentsForCropInfoTbl" class="styDepTbl">
          <thead class="styDepTableThead">
            <tr class="styDepTblHdr">
              <th class="styDepTblCell" rowspan="2" scope="col" >Description of destroyed or damaged crop</th>
              <th class="styDepTblCell" colspan="2" scope="col" style="width:65mm;">Insurance Payment</th>
              <th class="styDepTblCell" rowspan="2" scope="col">Name of insurance carrier from whom you received payments</th>
            </tr>
            <tr class="styDepTblHdr">
              <th class="styDepTblCell" scope="col" style="width:25mm">Date</th>
              <th class="styDepTblCell" scope="col" style="width:40mm">Amount</th>
            </tr>
          </thead>
          <xsl:apply-templates select="$DependencyData/InsurancePaymentsForCropInfo" />
        </table>
        <!-- End Insurance Payment for Crops Info Table -->
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>







