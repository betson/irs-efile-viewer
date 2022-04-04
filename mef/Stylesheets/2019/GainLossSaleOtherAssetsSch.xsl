<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [<!ENTITY nbsp "&#160;">]><xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes" encoding="iso-8859-1"/>
  <xsl:strip-space elements="*"/>
  
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>  
  <xsl:include href="AddOnTable.xsl"/>  
  
  <xsl:param name="DependencyData" select="$RtnDoc/GainLossSaleOtherAssetsSch"/>
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$DependencyData"/></xsl:call-template>  
  </xsl:param>  
  
  <xsl:template name="DependencyTemplate">    
    <table id="GLSATbl" class="styDepTblLandscape" style="margin-top:4mm; font-size:7pt">
      <thead class="styTableThead">
        <tr class="styDepTblHdr">
          <!--th class="styDepTblCell" scope="col">Item No.</th-->
          <th class="styDepTblCell" scope="col">Name</th>
          <th class="styDepTblCell" scope="col">Date Acquired</th>  
          <th class="styDepTblCell" scope="col">How Acquired</th>    
          <th class="styDepTblCell" scope="col">Date Sold</th>
          <th class="styDepTblCell" scope="col">Purchaser Name</th>  
          <th class="styDepTblCell" scope="col">Gross Sales Price</th>  
          <th class="styDepTblCell" scope="col">Basis</th>
          <th class="styDepTblCell" scope="col">Basis Method</th>
          <th class="styDepTblCell" scope="col">Sales Expenses</th>  
          <th class="styDepTblCell" scope="col">Total (net)</th>  
          <th class="styDepTblCell" scope="col">Accumulated Depreciation</th>        
        </tr>    
      </thead>  
      <tfoot/>
      <tbody>          
      <xsl:for-each select="$DependencyData/GainLossSaleOtherAssetGrp">
        <tr>
          <xsl:attribute name="class">
          <xsl:choose>
             <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
             <xsl:otherwise>styDepTblRow2</xsl:otherwise>
          </xsl:choose>
          </xsl:attribute>
          <!--td class="styDepTblCell" valign="top">
            <xsl:value-of select="position()" />
          </td-->    
          <td class="styDepTblCell" align="left" valign="top">          
            <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="AssetDesc"/></xsl:call-template>                       
          </td>              
          <td class="styDepTblCell" nowrap="nowrap" align="left" valign="top">
            <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="AcquiredDt"/></xsl:call-template>             
          </td>      
          <td class="styDepTblCell" align="left" valign="top">
            <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="HowAcquiredTxt"/></xsl:call-template>             
          </td>    
          <td class="styDepTblCell" nowrap="nowrap" align="left" valign="top">
            <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="SoldDt"/></xsl:call-template>             
          </td>    
          <td class="styDepTblCell" align="left" valign="top">
            <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="PurchaserNameGrp/PersonNm"/></xsl:call-template> 
            <xsl:if test="normalize-space(PurchaserNameGrp/BusinessName/BusinessNameLine1Txt) != ''">
              <br/><xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="PurchaserNameGrp/BusinessName/BusinessNameLine1Txt"/></xsl:call-template> 
            </xsl:if>
            <xsl:if test="normalize-space(PurchaserNameGrp/BusinessName/BusinessNameLine2Txt) != ''">
              <br/><xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="PurchaserNameGrp/BusinessName/BusinessNameLine2Txt"/></xsl:call-template> 
            </xsl:if>
          </td>
          <td class="styDepTblCell" align="right" valign="top" nowrap="nowrap">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="GrossSalesPriceAmt"/></xsl:call-template>     
          </td>    
          <td class="styDepTblCell" align="right" valign="top" nowrap="nowrap">          
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="BasisAmt"/></xsl:call-template>             
          </td> 
          
          <td class="styDepTblCell" align="right" valign="top">          
            <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="BasisMethodTxt"/></xsl:call-template>             
          </td>              

          
          
          
                       
          <td class="styDepTblCell" align="right" valign="top" nowrap="nowrap">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="SalesExpenseAmt"/></xsl:call-template>             
          </td>      
          <td class="styDepTblCell" align="right" valign="top" nowrap="nowrap">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="TotalNetAmt"/></xsl:call-template>             
          </td>    
          <td class="styDepTblCell" align="right" valign="top" nowrap="nowrap">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="AccumulatedDepreciationAmt"/></xsl:call-template>             
          </td>                                      
        </tr>
      </xsl:for-each>
      </tbody>    
    </table>
  </xsl:template>
  
  
  <!-- Main template -->
  <xsl:template match="/">
    <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
      <head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
         <title>
           <!--Gain/Loss from Sale of Other Assets Schedule-->
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
          <div class="styDepTitle" style="width:130mm">
            <!--TY 2003 Gain/Loss from Sale of Other Assets Schedule-->
            <xsl:value-of select="$depDocTitle"/>            
          </div>
        </div>        
        
        <xsl:call-template name="PopulateDepCommonLeftoverLandscape"><xsl:with-param name="TargetNode" select="$DependencyData"/></xsl:call-template>    
                                  
        <xsl:call-template name="DependencyTemplate"/>          
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>