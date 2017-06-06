<?xml version="1.0" encoding="UTF-8"?>
<!-- 06/05/2015 - Changes made for IE11 compatibility - Jeremy Nichols -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="PopulateTemplate.xsl"/>

<xsl:output method="html" indent="yes"/>
<xsl:strip-space elements="*"/>

<xsl:param name="DependencyData" select="$RtnDoc/ExpndAffltGroupAllocnCalcStmt"/>

<xsl:param name="depDocTitle">
  <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$DependencyData"/></xsl:call-template>  
</xsl:param>

<!-- Template to display ExpndAffltGroupAllocnCalcStmt -->
<xsl:template name="ExpndAffltGroupAllocnCalcStmtTemp">
    <table id="ExpndAffltGroupAllocnCalcStmtTbl" class="styDepTblLandscape">
      <thead class="styTableThead">
        <tr class="styDepTblHdr">
<!--          <th class="styTblCell" scope="col">Item No.</th>       -->
           <th class="styDepTblCell" scope="col" style="width:80mm;text-align:center">Name of each Taxpayer in EAG</th>
           <th class="styDepTblCell" scope="col" style="width:30mm;">Taxpayers TIN</th>
           <th class="styDepTblCell" scope="col" style="width:35mm;">Amount Total Section199 Deduction</th>
           <th class="styDepTblCell" scope="col" style="width:35mm;">Allocated amount for each taxpayer in the EAG</th>   
           <th class="styDepTblCell" scope="col" style="width:80mm;">How Allocated Amount Was Calculated</th>                
        </tr>
      </thead>
      <xsl:for-each select="$DependencyData/ExpndAffltGroupAllocnCalc">
        <tr>
          <xsl:attribute name="class">
          <xsl:choose>
             <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
             <xsl:otherwise>styDepTblRow2</xsl:otherwise>
          </xsl:choose>
          </xsl:attribute>
<!--          <td class="styDepTblCell" style="text-align:center;" ><xsl:value-of select="position()" /></td>-->
          <td class="styDepTblCell" style="text-align:left; width:80mm;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="EAGTaxpayerName/BusinessNameLine1Txt"/>
            </xsl:call-template>
            <br/>
            <xsl:call-template name="PopulateText">          
              <xsl:with-param name="TargetNode" select="EAGTaxpayerName/BusinessNameLine2Txt"/>
            </xsl:call-template>
          </td>
          <td class="styDepTblCell" style="text-align:center;width:30mm">
              <xsl:choose>
               <xsl:when test="TaxpayerEIN">                    
                       <xsl:call-template name="PopulateEIN">
                             <xsl:with-param name="TargetNode" select="TaxpayerEIN"/>
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
          <td class="styDepTblCell" style="text-align:right;width:35mm">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="TotalSection199DeductionAmt"/>
              </xsl:call-template>
            </td>
          <td class="styDepTblCell" style="text-align:right;width:35mm">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="EAGTaxpayerAmt"/>
              </xsl:call-template>
          </td>
          <td class="styDepTblCell" style="text-align:left; width:80mm;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="CalculationDesc"/>
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
       <meta name="Author" content="Ravi venigalla :: raviven@us.ibm.com"/>
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

      <xsl:call-template name="DocumentHeaderDependencyLandscape"/>
      
      <div class="styDepTitleLineLandscape " style="width:256mm;">
        <span class="styDepTitle" style="width:256mm;">
          <span style="width:256mm;">        
            <xsl:value-of select="$depDocTitle"/>
          </span>        
        </span>
      </div>
        
      <xsl:call-template name="PopulateDepCommonLeftoverLandscape">
        <xsl:with-param name="TargetNode" select="$DependencyData"/>
      </xsl:call-template>
        
      <xsl:call-template name="ExpndAffltGroupAllocnCalcStmtTemp"/>
      <br/>                      
    </body>
  </html>
</xsl:template>
</xsl:stylesheet>