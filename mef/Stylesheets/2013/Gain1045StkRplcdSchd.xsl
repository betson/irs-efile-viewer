<?xml version="1.0" encoding="UTF-8"?>
<!-- Last Modified by James Ganzy on 05/28/2015 -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="PopulateTemplate.xsl"/>

<xsl:output method="html" indent="yes"/>
<xsl:strip-space elements="*"/>

<xsl:param name="DependencyData" select="$RtnDoc/Gain1045StkRplcdSchd"/>

  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$DependencyData"/></xsl:call-template>  
  </xsl:param>
  
  <xsl:template name="Gain1045StkRplcdSchdTemp">
  	<div class="styDepTitleLineLandscape" style="display:block;">
		<table id="Gain1045StkRplcdSchdTbl1" class="styDepTblLandscape">
		  <thead class="styTableThead">
			<tr class="styDepTblHdr" style="font-size:7pt;">
	<!--          <th class="styTblCell" scope="col">Item No.</th>       -->
			   <th class="styDepTblCell" scope="col">Name of Corporation That Issued Stock</th>
			   <th class="styDepTblCell" scope="col">Partner’s Share of Partnership’s Adjusted Basis</th>
			   <th class="styDepTblCell" scope="col">Sales Price of Stock</th>           
			   <th class="styDepTblCell" scope="col">Date Stock Purchased</th>
			   <th class="styDepTblCell" scope="col">Date Stock Sold</th>
			</tr>
		  </thead>
		  <xsl:for-each select="$DependencyData/Gain1045StkRplcdGrp">
			<tr>
			  <xsl:attribute name="class">
			  <xsl:choose>
				 <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
				 <xsl:otherwise>styDepTblRow2</xsl:otherwise>
			  </xsl:choose>
			  </xsl:attribute>
	<!--          <td class="styDepTblCell" style="text-align:center;" >
				<xsl:value-of select="position()" />
			  </td> -->
			<span style="font-size:6pt;">  
			  <td class="styDepTblCell" style="text-align:left;width:58mm;font-size:6pt;">
				<xsl:call-template name="PopulateText">
				  <xsl:with-param name="TargetNode" select="CorporationThatIssuedStockName/BusinessNameLine1"/>
				</xsl:call-template>
				<br/>
				<xsl:call-template name="PopulateText">
				  <xsl:with-param name="TargetNode" select="CorporationThatIssuedStockName/BusinessNameLine2"/>
				</xsl:call-template>
			  </td>
			  <td class="styDepTblCell" style="text-align:right;width:24mm;font-size:6pt;">
			  <br/>
				<xsl:call-template name="PopulateAmount">
				  <xsl:with-param name="TargetNode" select="PartnersSharePrtshpsAdjBssAmt"/>
				</xsl:call-template>
			  </td>
			  <td class="styDepTblCell" style="text-align:right;width:24mm;font-size:6pt;">
			  <br/>
				<xsl:call-template name="PopulateAmount">
				  <xsl:with-param name="TargetNode" select="SalesPriceOfStockAmt"/>
				</xsl:call-template>          
			  </td>                    
			  <td class="styDepTblCell" style="text-align:center;width:18mm;font-size:6pt;">
			  <br/>
				<xsl:call-template name="PopulateMonthDayYear">
				  <xsl:with-param name="TargetNode" select="StockPurchaseDt"/>
				</xsl:call-template>
			  </td>
			  <td class="styDepTblCell" style="text-align:center;width:18mm;font-size:6pt;">
			  <br/>
				<xsl:call-template name="PopulateMonthDayYear">
				  <xsl:with-param name="TargetNode" select="StockSoldDt"/>
				</xsl:call-template>
			  </td>
			  </span>
			</tr>
		  </xsl:for-each>
		</table>		
		
		<table id="Gain1045StkRplcdSchdTbl2" class="styDepTblLandscape">
		  <thead class="styTableThead">
			<tr class="styDepTblHdr" style="font-size:7pt;">
			   <th class="styDepTblCell" scope="col">Name of corporation that issue the replacement QSB Stock</th>
			   <th class="styDepTblCell" scope="col">Partner’s Distributive Share of Gain from Sales</th>
			   <th class="styDepTblCell" scope="col">Partner’s Distributive Share of Gain Deferred</th>           
			   <th class="styDepTblCell" scope="col">Date Replacement Stock Distributed</th>
			   <th class="styDepTblCell" scope="col">Partner’s Share of Partnership’s FMV of Replacement Stock</th>
			   <th class="styDepTblCell" scope="col">Partner’s Share of Partnership’s Adjusted Basis of Replacement Stock Stock</th>
			</tr>
		  </thead>
		  <xsl:for-each select="$DependencyData/Gain1045StkRplcdGrp">
			<tr>
			  <xsl:attribute name="class">
			  <xsl:choose>
				 <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
				 <xsl:otherwise>styDepTblRow2</xsl:otherwise>
			  </xsl:choose>
			  </xsl:attribute>
    		  <span style="font-size:6pt;">  
			  <td class="styDepTblCell" style="text-align:left;width:80mm;font-size:6pt;">
				<xsl:call-template name="PopulateText">
				  <xsl:with-param name="TargetNode" select="CorpThatIssueQSBStockName/BusinessNameLine1"/>
				</xsl:call-template>
				<br/>
				<xsl:call-template name="PopulateText">
				  <xsl:with-param name="TargetNode" select="CorpThatIssueQSBStockName/BusinessNameLine2"/>
				</xsl:call-template>
			  </td>
			  <td class="styDepTblCell" style="text-align:right;width:24mm;font-size:6pt;">
			  <br/>
				<xsl:call-template name="PopulateAmount">
				  <xsl:with-param name="TargetNode" select="PartnerDistriShrOfGainSaleAmt"/>
				</xsl:call-template>
			  </td>
			  <td class="styDepTblCell" style="text-align:right;width:24mm;font-size:6pt;">
			  <br/>
				<xsl:call-template name="PopulateAmount">
				  <xsl:with-param name="TargetNode" select="PartnerDistriShrOfGainDefrdAmt"/>
				</xsl:call-template>          
			  </td>                    
			  <td class="styDepTblCell" style="text-align:center;width:18mm;font-size:6pt;">
			  <br/>
				<xsl:call-template name="PopulateMonthDayYear">
				  <xsl:with-param name="TargetNode" select="ReplacementStockDistributedDt"/>
				</xsl:call-template>
			  </td>
			  <td class="styDepTblCell" style="text-align:right;width:24mm;font-size:6pt;">
			  <br/>
				<xsl:call-template name="PopulateAmount">
				  <xsl:with-param name="TargetNode" select="PrtnrShrOfPrtshpFMVRplcStkAmt"/>
				</xsl:call-template>
			  </td>
			  <td class="styDepTblCell" style="text-align:right;width:24mm;font-size:6pt;">
			  <br/>
				<xsl:call-template name="PopulateAmount">
				  <xsl:with-param name="TargetNode" select="PrtnrShrPrtshpAdjBssRplcStkAmt"/>
				</xsl:call-template>          
			  </td>
       </span>
			</tr>
		  </xsl:for-each>
		</table>
		

	</div>	
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
				<span class="styDepTitle">
					<span style="width:120mm;">
						<xsl:value-of select="$depDocTitle"/>
					</span>
				</span>
			</div>
			<xsl:call-template name="PopulateDepCommonLeftoverLandscape">
				<xsl:with-param name="TargetNode" select="$DependencyData"/>
			</xsl:call-template>
			<xsl:call-template name="Gain1045StkRplcdSchdTemp"/>
		</body> 
     </html>
  </xsl:template>
</xsl:stylesheet>