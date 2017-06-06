<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>    
  <xsl:include href="AddOnTable.xsl"/>  

  <xsl:param name="DependencyData" select="$RtnDoc/Owned10PctIntForeignPrtshpStmt"/>
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$DependencyData"/></xsl:call-template>  
  </xsl:param>    
  
  <xsl:template name="DependencyTemplate">    
    <table id="OPFPTbl" class="styDepTblLandscape" style="margin-top:4mm; font-size:8pt; font-family:Arial">
      <thead class="styTableThead">
        <tr class="styDepTblHdr">
           <!--th class="styDepTblCell" scope="col" rowspan="2">Foreign Partnership Item No.</th-->
           <th class="styDepTblCell" scope="col" rowspan="2" style="width:39mm;">Name</th>
           <th class="styDepTblCell" scope="col" rowspan="2" style="width:21mm;">Entity EIN<br/>(if any)</th>
           <th class="styDepTblCell" scope="col" rowspan="2">Forms Filed (if any) (F1042,<br/>1065or 1065-B, or 8804)</th>
           <th class="styDepTblCell" scope="col" rowspan="2" style="width:39mm;">Name of Tax Matters Partner<br/>(if any)</th>
           <th class="styDepTblCell" scope="col" colspan="2">Foreign Partnership's Tax Year</th>                          
        </tr>
        <tr class="styDepTblHdr">
           <th class="styDepTblCell" scope="col" nowrap="nowrap">Beginning Date</th>
           <th class="styDepTblCell" scope="col" nowrap="nowrap">Ending Date</th>
        </tr>
      </thead>  
      <tfoot/>
      <tbody>    
      <xsl:for-each select="$DependencyData/Owned10PctForeignPartnership">
        <tr>
          <xsl:attribute name="class">
          <xsl:choose>
             <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
             <xsl:otherwise>styDepTblRow2</xsl:otherwise>
          </xsl:choose>
          </xsl:attribute>
          <!--td class="styDepTblCell">
            <xsl:value-of select="position()" />
          </td-->          
          <td class="styDepTblCell" align="left" valign="top" style="width:39mm;">
            <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1"/></xsl:call-template> 
            <xsl:if test="normalize-space(BusinessName/BusinessNameLine2) != ''">
              <br/><xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2"/></xsl:call-template> 
            </xsl:if>
          </td>          
<!--          <td class="styDepTblCell" align="left" valign="top"> -->
        <td class="styDepTblCell" style="text-align:center;witth:21mm">  
             <xsl:if test="EIN">
                 <xsl:call-template name="PopulateEIN"><xsl:with-param name="TargetNode" select="EIN"/></xsl:call-template> 
            </xsl:if>
           <xsl:if test="MissingEINReasonCd">
            <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
            </xsl:call-template> 
            </xsl:if>
          </td>            
          <td class="styDepTblCell" align="left" valign="top">
            <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="FormsFiledTxt"/></xsl:call-template> 
          </td>
          <td class="styDepTblCell" align="left" valign="top" style="width:39mm;">            
            <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="TaxMatterPartnerName/BusinessNameLine1"/></xsl:call-template> 
            <xsl:if test="normalize-space(TaxMatterPartnerName/BusinessNameLine2) != ''">
              <br/><xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="TaxMatterPartnerName/BusinessNameLine2"/></xsl:call-template> 
            </xsl:if>
          </td>
          <td class="styDepTblCell" align="center" valign="top">
            <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="TaxYearBeginDt"/></xsl:call-template> 
          </td>
          <td class="styDepTblCell" align="center" valign="top">
            <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="TaxYearEndDt"/></xsl:call-template> 
          </td>
        </tr>
      </xsl:for-each>
      </tbody>    
    </table>
  </xsl:template>
  
  
  <!-- Main template -->
  <xsl:template match="/">
    <html>
      <head>
         <title>
           <!--10% Interest Owned in Foreign Partnership Statement-->
          <xsl:value-of select="$depDocTitle"/>
        </title>
         <!-- No Browser Caching -->
         <meta http-equiv="Pragma" content="no-cache"/>
         <meta http-equiv="Cache-Control" content="no-cache"/>
         <meta http-equiv="Expires" content="0"/>
         <!-- No Proxy Caching -->
         <meta http-equiv="Cache-Control" content="private"/>
         <!-- Define Character Set -->
         <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>        
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
        <div class="styDepTitleLineLandscape">
          <div class="styDepTitle" style="width:145mm">
            <!--TY 2003 10% Interest Owned in Foreign Partnership Statement-->
            <xsl:value-of select="$depDocTitle"/>
          </div>
        </div>        
        
        <xsl:call-template name="PopulateDepCommonLeftoverLandscape"><xsl:with-param name="TargetNode" select="$DependencyData"/></xsl:call-template>    
                              
        <xsl:call-template name="DependencyTemplate"/>          
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>