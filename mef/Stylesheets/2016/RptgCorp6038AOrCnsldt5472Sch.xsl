<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:param name="DependencyData" select="$RtnDoc/RptgCorp6038AOrCnsldt5472Sch"/>
  <!-- - Form 5472 - Displays as Reporting Corporations Under Section 6038A or on a Consolidated Form 5472 Schedule - -->
  <xsl:template name="DependencyTemplate">
    <table id="RCCSTbl" class="styDepTbl">
      <thead class="styDepTableThead">
        <tr class="styDepTblHdr">
           <th class="styDepTblCell" scope="col" style="width:65mm;padding-top:3mm;">Name of the Reporting Corporation</th>
           <th class="styDepTblCell" scope="col" style="width:84mm;padding-top:5mm;">Street Address</th>
           <th class="styDepTblCell" scope="col" style="width:23mm;" >Employer Identification Number</th>
           <th class="styDepTblCell" scope="col" style="width:15mm;">Included on Consolidated Form 5472?</th>
        </tr>
      </thead>
      <tfoot/>
      <tbody>
        <xsl:for-each select="$DependencyData/ReportingCorp6038AOrCnsldt5472">
          <tr>
            <xsl:attribute name="class">
            <xsl:choose>
               <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
               <xsl:otherwise>styDepTblRow2</xsl:otherwise>
            </xsl:choose>
            </xsl:attribute>
            <td class="styDepTblCell" style="width:65mm;text-align:left">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="CorporationName/BusinessNameLine1Txt"/>
              </xsl:call-template>
              <xsl:if test="CorporationName/BusinessNameLine2Txt != ''">
                <br/><xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="CorporationName/BusinessNameLine2Txt"/>
                </xsl:call-template>
              </xsl:if>
            </td>
            <td class="styDepTblCell" style="width:84mm;text-align:left">
            <xsl:choose>
	          <xsl:when test="USAddress">
	               <xsl:call-template name="PopulateUSAddressTemplate">
	                    <xsl:with-param name="TargetNode" select="USAddress"/>
               </xsl:call-template>
	          </xsl:when>
	          <xsl:otherwise>
	               <xsl:call-template name="PopulateForeignAddressTemplate">
	                    <xsl:with-param name="TargetNode" select="ForeignAddress"/>
	               </xsl:call-template>
	          </xsl:otherwise>
	     </xsl:choose>
            </td>
            <td class="styDepTblCell" style="width:23mm;text-align:center;">
              <xsl:choose>
               <xsl:when test="normalize-space(CorporationEIN)">                    
                       <xsl:call-template name="PopulateEIN">
                             <xsl:with-param name="TargetNode" select="CorporationEIN"/>
                       </xsl:call-template>  
                       <span style="width: 2px"/>
               </xsl:when>  
              <xsl:otherwise> 
	            	<xsl:call-template name="PopulateText">
		            	<xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
		            </xsl:call-template>    
		           <span style="width: 2px"/>
	          </xsl:otherwise>   
          </xsl:choose>
            </td>
            <td class="styDepTblCell" style="width:15mm;text-align:center;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="TrRptConsolidatedFrm5472Ind"/>
              </xsl:call-template>
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="TrRptConsolidatedFrm5472Ind"/>
              </xsl:call-template>
            </td>
          </tr>
        </xsl:for-each>
      </tbody>
    </table>
  </xsl:template> 
  <!-- Main template -->
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$DependencyData"/></xsl:call-template>  
  </xsl:param>
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
         <meta name="Description" content="{$depDocTitle}"/>
         <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js"/>
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
          <span class="styDepTitle">
            <span style="width:183mm;"><xsl:value-of select="$depDocTitle"/></span>    
          </span>
        </div>
        <xsl:call-template name="PopulateDepCommonLeftover"><xsl:with-param name="TargetNode" select="$DependencyData"/></xsl:call-template>
        <span style="height:5px;"/>
        <xsl:call-template name="DependencyTemplate"/>
        <br/>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>