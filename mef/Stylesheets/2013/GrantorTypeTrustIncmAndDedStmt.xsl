<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes" />
  <xsl:strip-space elements="*" />
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>

  <xsl:param name="DependencyData" select="$RtnDoc/GrantorTypeTrustIncmAndDedStmt" />
  <!--Display name is Grantor Type Trust Income and Deductions Statement -->
  
<xsl:template name="GrantorGrpTmp"> 

   <xsl:for-each select="$DependencyData/GrantorGrp">
   
   <div class="styTopSectionLine" style="width:187mm;">
          <div style="float:left;clear:none;"><span class="styTopSectionLineLbl">Grantor or Other Owner Name:</span></div>
          <div style="float:left;clear:none;">          
								<xsl:choose>
									<xsl:when test="GrantorNameAndAddress/PersonName != ''">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="GrantorNameAndAddress/PersonName"/>
										</xsl:call-template>
									</xsl:when>
								</xsl:choose>
								<xsl:choose>
									<xsl:when test="GrantorNameAndAddress/BusinessName/BusinessNameLine1 != ''">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="GrantorNameAndAddress/BusinessName/BusinessNameLine1"/>
										</xsl:call-template>
									</xsl:when>
								</xsl:choose>
								<xsl:choose>
									<xsl:when test="GrantorNameAndAddress/BusinessName/BusinessNameLine2 != ''">
										<br/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="GrantorNameAndAddress/BusinessName/BusinessNameLine2"/>
										</xsl:call-template>
									</xsl:when>
								</xsl:choose>
          </div>
        </div>
        
        <div class="styTopSectionLine" style="width:187mm;">
          <div style="float:left;clear:none;"><span class="styTopSectionLineLbl">Address:</span></div>
          <div style="float:left;clear:none;">          
								<xsl:if test="GrantorNameAndAddress/AddressInUS != ''">
									<xsl:call-template name="PopulateUSAddressTemplate">
										<xsl:with-param name="TargetNode" select="GrantorNameAndAddress/AddressInUS"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="GrantorNameAndAddress/AddressInForeign != ''">
									<xsl:call-template name="PopulateForeignAddressTemplate">
										<xsl:with-param name="TargetNode" select="GrantorNameAndAddress/AddressInForeign"/>
									</xsl:call-template>
								</xsl:if>
          </div>
        </div>
        
        <div class="styTopSectionLine" style="width:187mm;">
          <div style="float:left;clear:none;"><span class="styTopSectionLineLbl">SSN/EIN:</span></div>
          <div style="float:left;clear:none;">          
								<xsl:choose>
									<xsl:when test="SSN != ''">
										<xsl:call-template name="PopulateSSN">
											<xsl:with-param name="TargetNode" select="SSN"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:when test="EIN != ''">
										<xsl:call-template name="PopulateEIN">
											<xsl:with-param name="TargetNode" select="EIN"/>
										</xsl:call-template>
									</xsl:when>									
								</xsl:choose>
          </div>
        </div>
        
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
              <xsl:with-param name="TargetNode" select="TotalDeductionAmt"/>
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
							<xsl:with-param name="TargetNode" select="TaxableIncomeTypeAndAmt/Description"/>
						</xsl:call-template>
					</td>
					<td class="styDepTblCell" style="width: 36mm; text-align:right;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="TaxableIncomeTypeAndAmt/Amount"/>
						</xsl:call-template>
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
							<xsl:with-param name="TargetNode" select="DeductionsOrCreditsTypeAndAmt/Description"/>
						</xsl:call-template>
					</td>
					<td class="styDepTblCell" style="width: 36mm; text-align:right;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="DeductionsOrCreditsTypeAndAmt/Amount"/>
						</xsl:call-template>
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
      <body class="styBodyClass">
  
        <xsl:call-template name="DocumentHeaderDependency"  />  
        <div class="styDepTitleLine">
          <span class="styDepTitle" style="width:88mm;">
            <span><xsl:value-of select="$depDocTitle" /></span>
          </span>
        </div>
        <xsl:call-template name="PopulateDepCommonLeftover">
        	<xsl:with-param name="TargetNode" select="$DependencyData"/>
        </xsl:call-template>
        
	 <xsl:call-template name="GrantorGrpTmp"/>
	
        <br />      
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>







