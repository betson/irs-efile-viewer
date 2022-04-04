<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes" />
  <xsl:strip-space elements="*" />
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>

  <xsl:param name="DependencyData" select="$RtnDoc/ElectingSmallBusTrustCmptStmt" />
  <!--Display name is Electing Small Business Trust Tax Computation Statement -->
  
<xsl:template name="ESBTTaxCompGrpTmp"> 

   <xsl:for-each select="$DependencyData/ESBTTaxCompGrp">
   
   
        
        <div class="styTopSectionLine" style="width:187mm;">
          <div style="float:left;clear:none;"><span class="styTopSectionLineLbl">Total Taxable Income Amount:</span></div>
          <div style="float:left;clear:none;">          
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="TotalTaxableIncomeAmt"/>
            </xsl:call-template>
          </div>
        </div>
        
        <div class="styTopSectionLine" style="width:187mm;">
          <div style="float:left;clear:none;"><span class="styTopSectionLineLbl">Total Deductions Amount:</span></div>
          <div style="float:left;clear:none;">          
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="TotalDeductionOrCreditsAmt"/>
            </xsl:call-template>
          </div>
        </div>
         <div class="styTopSectionLine" style="width:187mm;">
          <div style="float:left;clear:none;"><span class="styTopSectionLineLbl">Additional Explanation:</span></div>
          <div style="float:left;clear:none;" class="styExplanationLine">          
           <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="AdditionalExplanationTxt"/>
            </xsl:call-template>
          </div>
        </div>
   
		<table id="TaxableIncomeGrpTbl" class="styDepTbl">
			<thead class="styTableThead">
				<tr class="styDepTblHdr">
					<th class="styDepTblCell" scope="col" style="width:61mm;">Taxable Income Type</th>
					<th class="styDepTblCell" scope="col" style="width:36mm;">Amount</th>
					<th class="styDepTblCell" scope="col" style="width:90mm;">Description</th>
				</tr>
			</thead>
			<xsl:for-each select="TaxableIncomeGrp">
				<tr>
					<xsl:attribute name="class">
          <xsl:choose>
             <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
             <xsl:otherwise>styDepTblRow2</xsl:otherwise>
          </xsl:choose>
          </xsl:attribute>
					<td class="styDepTblCell" style="width:61mm;text-align:left;">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="TaxableIncomeTypeAndAmt/Desc"/>
						</xsl:call-template>
					</td>
					<td class="styDepTblCell" style="width: 36mm; text-align:right;">
						<xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="TaxableIncomeTypeAndAmt/Amt" /></xsl:call-template>
					</td>
					<td class="styDepTblCell" style="width: 90mm; text-align:left;">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="TaxableIncomeDesc"/>
						</xsl:call-template>
					</td>
				</tr>
			</xsl:for-each>
		</table>
		
		<table id="DeductionsOrCreditsGrpTbl" class="styDepTbl">
			<thead class="styTableThead">
				<tr class="styDepTblHdr">
					<th class="styDepTblCell" scope="col" style="width:61mm;">Deductions or Credits Type</th>
					<th class="styDepTblCell" scope="col" style="width:36mm;">Amount</th>
					<th class="styDepTblCell" scope="col" style="width:90mm;">Description</th>
				</tr>
			</thead>
			<xsl:for-each select="DeductionsOrCreditsGrp">
				<tr>
					<xsl:attribute name="class">
          <xsl:choose>
             <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
             <xsl:otherwise>styDepTblRow2</xsl:otherwise>
          </xsl:choose>
          </xsl:attribute>
					<td class="styDepTblCell" style="width:61mm;text-align:left;">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="DeductionsOrCreditsTypeAndAmt/Desc"/>
						</xsl:call-template>
					</td>
					<td class="styDepTblCell" style="width: 36mm; text-align:right;">
						<xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="DeductionsOrCreditsTypeAndAmt/Amt" /></xsl:call-template>					
					</td>
					<td class="styDepTblCell" style="width: 90mm; text-align:left;">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="DeductionsOrCreditsDesc"/>
						</xsl:call-template>
					</td>
				</tr>
			</xsl:for-each>
		</table>
		
		</xsl:for-each>		
		
        
	</xsl:template>
  
  
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$DependencyData" /></xsl:call-template>  
  </xsl:param>
  <!-- Main template -->
  <xsl:template match="/" >

    <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
      <head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
         <title><xsl:value-of select="$depDocTitle" /></title>
         <!-- No Browser Caching -->
         <meta http-equiv="Pragma" content="no-cache" />
         <meta http-equiv="Cache-Control" content="no-cache" />
         <meta http-equiv="Expires" content="0" />
         <!-- No Proxy Caching -->
         <meta http-equiv="Cache-Control" content="private" />
         <!-- Define Character Set -->
         <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />         
         <meta name="Description" content="{$depDocTitle}" />
         <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js"></script>
        <xsl:call-template name="InitJS"></xsl:call-template>
        
        <style type="text/css">
                  </style>
        <style type="text/css">
  <xsl:if test="not($Print) or $Print=''">
    <xsl:call-template name="AddOnStyle"></xsl:call-template>    
  </xsl:if>
</style>
      <xsl:call-template name="GlobalStylesDep"/>
</head>    
      <body class="styBodyClass" style="width:187mm;">
  
        <xsl:call-template name="DocumentHeaderDependency"  />  
        <div class="styDepTitleLine">
          <span class="styDepTitle" style="width:150mm;">
            <span><xsl:value-of select="$depDocTitle" /></span>
          </span>
        </div>
        <xsl:call-template name="PopulateDepCommonLeftover">
        	<xsl:with-param name="TargetNode" select="$DependencyData"/>
        </xsl:call-template>
        
	 <xsl:call-template name="ESBTTaxCompGrpTmp"/>
	
        <br />      
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>







