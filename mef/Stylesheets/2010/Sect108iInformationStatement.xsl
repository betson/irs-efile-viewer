<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:output method="html" indent="yes" />
  <xsl:strip-space elements="*" />
  <xsl:param name="DependencyData" select="$RtnDoc/Sect108iInformationStatement" />
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$DependencyData" />
    </xsl:call-template>  
  </xsl:param>
    <xsl:template name="Sect108iInformationStatementTemp">
    <!--1120 Common - Section 108(i) Information Statement -->
  <!-- Updated 9/01/2010 (RLW) -->
    <table id="Sect108iInformationStatement" class="styDepTbl" cellspacing="0">
      <thead class="styTableThead">
        <tr class="styDepTblHdr">
		  <th class="styTblCell" scope="col" style="width:58mm;">Description of Debt Instrument to Which 108(i) Applies</th>       
          <th class="styDepTblCell"  scope="col" style="width:36mm;">COD Income Deferred Under 108(i) Included in Income in Current TY Under 108(i)(1)</th>
          <th class="styDepTblCell"  scope="col" style="width:36mm;">COD Income Deferred Under 108(i) Included in Income in Current TY Under 108(i)(5)(D)</th>
          <th class="styDepTblCell"  scope="col" style="width:57mm;">Description of Acceleration Event Described in 108(i)(5)(D)</th>                  
        </tr>
      </thead>
      <xsl:for-each select="$DependencyData/Section108iInformation">
        <tr>
          <xsl:attribute name="class">
          <xsl:choose>
             <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
             <xsl:otherwise>styDepTblRow2</xsl:otherwise>
          </xsl:choose>
          </xsl:attribute>
        <!-- Column 1 -->
        <td class="styDepTblCell" style="width: 94mm;text-align:left;" >
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="DebtInstrumentDescription" />
            </xsl:call-template>
        </td>
        <!-- Column 2 -->
        <td class="styDepTblCell" style="width:34mm;text-align:right;" >
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="DeferredCODIncInclCurrTY108i" />
          </xsl:call-template>
        </td>
        <!-- Column 3 -->
        <td class="styDepTblCell" style="width:34mm;text-align:right;" >
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="DeferredCODIncInclCurrTY108i5D" />
          </xsl:call-template>
        </td>
        <!-- Column 4 -->
        <td class="styDepTblCell" style="width:94mm;text-align:left;" >
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="DescAccelerationEvent108i5D" />
          </xsl:call-template>      
        </td>
      </tr>
      </xsl:for-each>
    </table>
    <br/>
    <table id="Sect108iInformationStatement" class="styDepTbl" cellspacing="0">
      <thead class="styTableThead">
        <tr class="styDepTblHdr">
          <th class="styDepTblCell" scope="col" style="width:43mm;">Date of the Acceleration Event Described in 108(i)(5)(D)</th>
          <th class="styDepTblCell" scope="col" style="width:36mm;">COD Income Deferred Under 108(i) not Included in Income in Current or Prior TYs </th>
          <th class="styDepTblCell" scope="col" style="width:36mm;">OID Deduction Deferred Under 108(i)(2)(A)(i) Allowable as Deduction in Current Taxable Year Under 108(i)(2)(A)(ii) </th>
          <th class="styDepTblCell" scope="col" style="width:36mm;">OID Deduction Deferred Under Section 108(i)(2)(A)(i) That is Allowable as a Deduction in the Current Taxable Year Under Section 108(i)(5)(D)  </th>
          <th class="styDepTblCell" scope="col" style="width:36mm;">OID Deduction Deferred Under Section 108(i)(2)(A)(i) That has not Been Deducted in the Current or Prior Taxable Years </th>
        </tr>
      </thead>
      <xsl:for-each select="$DependencyData/Section108iInformation">
        <tr>
          <xsl:attribute name="class">
          <xsl:choose>
             <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
             <xsl:otherwise>styDepTblRow2</xsl:otherwise>
          </xsl:choose>
          </xsl:attribute>
        <!-- Column 5 -->
        <td class="styDepTblCell" style="width:43mm;text-align:center;" >
            <xsl:call-template name="PopulateMonthDayYear">
              <xsl:with-param name="TargetNode" select="DateAccelerationEvent108i5D" />
            </xsl:call-template>
        </td>
        <!-- Column 6 -->
        <td class="styDepTblCell" style="width:36mm;text-align:right;" >
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="CODIncNotInclCurrPriorTY108i" />
          </xsl:call-template>      
        </td>
        <!-- Column 7 -->
        <td class="styDepTblCell" style="width:36mm;text-align:right;" >
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="OIDAllowableCurrentTY108i2Aii" />
          </xsl:call-template>      
        </td>
        <!-- Column 8 -->
        <td class="styDepTblCell" style="width:36mm;text-align:right;" >
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="OIDAllowableCurrentTY108i5D" />
          </xsl:call-template>      
        </td>
        <!-- Column 9 -->
        <td class="styDepTblCell" style="width:36mm;text-align:right;" >
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="OIDDed108i2AiNotDedCurrPriorTY" />
          </xsl:call-template>      
        </td>
      </tr>
      </xsl:for-each>
    </table>
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
         <meta name="Author" content="Ku Lee :: kutlee@us.ibm.com" />
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
        <xsl:call-template name="DocumentHeaderDependency"></xsl:call-template>    
          <div class="styDepTitleLine">
            <span class="styDepTitle">
              <span style="width:103mm;">
                <xsl:value-of select="$depDocTitle" />
              </span>
            </span>
          </div>        
          <xsl:call-template name="PopulateDepCommonLeftover">
          <xsl:with-param  name="TargetNode" select="$DependencyData" />
          </xsl:call-template>
          <xsl:call-template name="Sect108iInformationStatementTemp" />
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>







