<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:include href="PopulateTemplate.xsl"/>
   <xsl:include href="AddHeader.xsl"/>
   <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:param name="INOLDData" select="$RtnDoc/AmendedReturnChanges"/>
	 <!-- 1120 Common- Amended Return Changes -->
  <xsl:template name="ShowINOLD">
   <div style="padding-left:39mm; font-size:3.5mm;"><b>Taxpayer EIN:</b>
	<span style="padding-left:3mm">
        <xsl:call-template name="PopulateEIN">
            <xsl:with-param name="TargetNode" select="$INOLDData/TaxpayerEIN"/>
        </xsl:call-template>
    </span>         
   </div>
    <table id="INOLDTbl" class="styDepTblLandscape" style="font-size:7pt;">
      <thead class="styTableThead">
        <tr class="styDepTblHdr">           
           <th class="styDepTblCell" scope="col" style="width=15mm;">Line <br/>Number</th>        
           <th class="styDepTblCell" scope="col" style="width=86mm;">Description</th>  
           <th class="styDepTblCell" scope="col" style="width=34mm;">Amount On <br/>Previous Return</th>        
           <th class="styDepTblCell" scope="col" style="width=34mm;">Amount On <br/>Amended Return</th>  
           <th class="styDepTblCell" scope="col" style="width=87mm;">Explanation</th>       
        </tr>
      </thead>
        <tfoot/>
       <tbody>    
        <xsl:for-each select="$INOLDData/AmendedReturnChg">  
          <tr>
            <xsl:attribute name="class">
              <xsl:choose>
                 <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                 <xsl:otherwise>styDepTblRow2</xsl:otherwise>
              </xsl:choose>
            </xsl:attribute>            
            <td class="styDepTblCell" style="text-align:left;width:15mm;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="LineNum"/>
              </xsl:call-template>
              <xsl:if test="CorporationName/BusinessNameLine2 != ''">
                <br/>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="LineNum"/>
                </xsl:call-template>
              </xsl:if>
            </td>
            <td class="styDepTblCell" style="text-align:left;width:86mm;">
              <xsl:if test="Desc">
                <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="Desc"/>
                </xsl:call-template>
               </xsl:if>
            </td>
            <td class="styDepTblCell" style="text-align:right;width:34mm;">            
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="OnPreviousReturnAmt"/>
              </xsl:call-template>            
            </td>
            <td class="styDepTblCell" style="text-align:right;width:34mm;">            
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="OnAmendedReturnAmt"/>
              </xsl:call-template>            
            </td>
            <td class="styDepTblCell" style="text-align:left;width:87mm;">            
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="ExplanationTxt"/>
              </xsl:call-template>            
            </td>    
          </tr>      
        </xsl:for-each>
      </tbody>
    </table>
  </xsl:template>
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$INOLDData"/></xsl:call-template>  
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
         <meta name="Author" content="Ravi Venigalla"/>
         <meta name="Desc" content="{$depDocTitle}"/>
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
        <div class="styDepTitleLineLandscape ">
          <span class="styDepTitle" style="width:80mm">
            <xsl:value-of select="$depDocTitle"/>
          </span>
        </div>
        <!--Adding template for left over data  -->
        <xsl:call-template name="PopulateDepCommonLeftoverLandscape"><xsl:with-param name="TargetNode" select="$INOLDData"/></xsl:call-template>
        <xsl:call-template name="ShowINOLD"/>          
        <br/>                      
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>