<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes" />
  <xsl:strip-space elements="*" />
  <xsl:include href="PopulateTemplate.xsl"/>
   <xsl:include href="AddHeader.xsl"/>
   <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>  
  <xsl:param name="FormData" select="$RtnDoc/NoncashOrNonW2IncomeStatement" />
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$FormData" /></xsl:call-template>  
  </xsl:param>
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
         <meta name="Author" content="Trin Xue" />
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
		<xsl:call-template name="DocumentHeaderDependency"/>
		<div class="styDepTitleLine">
			<div class="styDepTitle" style="width:92mm">
				<xsl:value-of select="$depDocTitle"/>
			</div>
		</div>
		<xsl:call-template name="PopulateDepCommonLeftover">
			<xsl:with-param name="TargetNode" select="$FormData"/>
		</xsl:call-template>
     <div class="styTopSectionLine">
		<div class="styTopSectionLineLbl" style="float:left">
			<b>Lodging Market Value Explanation: </b>
		</div>
          <div class="styExplanationLine" style="float:left">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$FormData/LodgingMarketValueExpln"/>
            </xsl:call-template>            
          </div>
        </div>    
        <div class="styTopSectionLine">
		<div class="styTopSectionLineLbl" style="float:left">
			<b>Meals Market Value Explanation: </b>
		</div>
          <div class="styExplanationLine" style="float:left">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$FormData/MealsMarketValueExpln"/>
            </xsl:call-template>            
          </div>
        </div>
        <div class="styTopSectionLine">
		<div class="styTopSectionLineLbl" style="float:left">
			<b>Car Market Value Explanation: </b>
		</div>
          <div class="styExplanationLine" style="float:left">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$FormData/CarMarketValueExpln"/>
            </xsl:call-template>            
          </div>
        </div> 
        <xsl:if test="$FormData/OthPropOrFcltsMktValueExplnGrp">
			<div class="styTopSectionLine" style="float:left;font-weight:bold;">Other Property Or Facilities Market Value Explanations</div>
			<table id="NcONW2ISTbl" class="styDepTbl" style="width:187mm;">
				<thead class="styDepTableThead">
					<tr class="styDepTblHdr">
						<th style="width:75%;">Type</th>
						<th style="width:25%;">Amount</th>
					</tr>
				</thead>
				<tbody>
					<xsl:for-each select="$FormData/OthPropOrFcltsMktValueExplnGrp">
						<tr>
							<xsl:attribute name="class">
								<xsl:choose>
									<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
									<xsl:otherwise>styDepTblRow2</xsl:otherwise>
								</xsl:choose>
							</xsl:attribute>
							<td class="styDepTblCell" style="text-align:left;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="Description"/>
								</xsl:call-template>
							</td>
							<td class="styDepTblCell" style="text-align:right;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="Amount"/>
								</xsl:call-template>
							</td>
						</tr>
					</xsl:for-each>
				</tbody>
			</table>
        </xsl:if>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>