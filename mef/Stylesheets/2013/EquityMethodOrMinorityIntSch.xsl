<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="PopulateTemplate.xsl"/>
<xsl:output method="html" indent="yes"/>
<xsl:strip-space elements="*"/>
<xsl:param name="DependencyData" select="$RtnDoc/EquityMethodOrMinorityIntSch"/>
<!-- - Common- Additional Information for Equity Method or Minority Interest Schedule-->
<xsl:param name="depDocTitle">
  <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$DependencyData"/></xsl:call-template>  
</xsl:param>
<xsl:template name="EquityMethodOrMinorityIntSchTemp">
    <table id="EquityMethodOrMinorityIntSchTbl" class="styDepTblLandscape" style="font-size: 7pt;">
      <thead class="styTableThead">
        <tr class="styDepTblHdr">
           <th class="styDepTblCell" scope="col" style="width:66mm;">Name</th>
           <th class="styDepTblCell" scope="col" style="width:64mm;">Type of Entity</th>
           <th class="styDepTblCell" scope="col" style="width:24mm;">EIN</th>    
           <th class="styDepTblCell" scope="col" style="width:34mm;">Income (Loss) per Income Statement Amount</th>
           <th class="styDepTblCell" scope="col" style="width:34mm;">Temporary Difference Amount</th>    
           <th class="styDepTblCell" scope="col" style="width:34mm;">Permanent Difference Amount</th>
        </tr>
      </thead>
      <xsl:for-each select="$DependencyData/EquityMethodOrMinorityIntInfo">
        <tr>
          <xsl:attribute name="class">
          <xsl:choose>
             <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
             <xsl:otherwise>styDepTblRow2</xsl:otherwise>
          </xsl:choose>
          </xsl:attribute>
           <td class="styDepTblCell" style="width:66mm;text-align:left;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1"/>
            </xsl:call-template>
            <br/>
            <xsl:call-template name="PopulateText">          
              <xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2"/>
            </xsl:call-template>
          </td>
          <td class="styDepTblCell" style="width:64mm;text-align:left;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="EntityTypeTxt"/>
            </xsl:call-template>
          </td>
          <td class="styDepTblCell" style="width:24mm;text-align:center;">
          <xsl:choose>
            <xsl:when test="EIN">
                       <xsl:call-template name="PopulateEIN">
                          <xsl:with-param name="TargetNode" select="EIN"/>
                      </xsl:call-template>
             </xsl:when>
             <xsl:when test="MissingEINReasonCd">
                    <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
                    </xsl:call-template>
                    </xsl:when>
          </xsl:choose>
         </td>
         <td class="styDepTblCell" style="width:34mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IncomeLossPerIncomeStmtAmt"/>
            </xsl:call-template>
         </td>
         <td class="styDepTblCell" style="width:34mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="TemporaryDifferenceAmt"/>
            </xsl:call-template>
         </td>
		 <td class="styDepTblCell" style="width:34mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="PermanentDifferenceAmt"/>
            </xsl:call-template>
          </td>
       </tr>
      </xsl:for-each>
    </table>
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
       <meta name="Author" content="Polina Zhuravlev: zhuravle@us.ibm.com"/>
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
    <body class="styBodyClass" style="width:187mm;">  
      <xsl:call-template name="DocumentHeaderDependencyLandscape"/>
      <div class="styDepTitleLineLandscape">
        <span class="styDepTitle">
          <span style="width:175mm;">        
            <xsl:value-of select="$depDocTitle"/>
          </span>        
        </span>
      </div>
     <xsl:call-template name="PopulateDepCommonLeftoverLandscape">
        <xsl:with-param name="TargetNode" select="$DependencyData"/>
      </xsl:call-template>
      <xsl:call-template name="EquityMethodOrMinorityIntSchTemp"/>
      <br/>                      
    </body>
  </html>
</xsl:template>
</xsl:stylesheet>