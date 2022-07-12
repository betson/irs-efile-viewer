<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes" />
  <xsl:strip-space elements="*" />
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>

  <xsl:param name="DependencyData" select="$RtnDoc/ElectToTreatContriPdInPrTYStmt" />
  <!--Display name is Election to Treat Contributions As Paid in Prior Tax Year Statement -->
  
<xsl:template name="RecipientInformationGrpTmp">

		<div class="styTopSectionLine" style="width:187mm;">
          <div style="float:left;clear:none;"><span class="styTopSectionLineLbl">Fiduciary Address:</span></div>
          <div style="float:left;clear:none;">
          
            <xsl:call-template name="PopulateUSAddressTemplate">
              <xsl:with-param name="TargetNode" select="$DependencyData/FiduciaryUSAddress"/>
            </xsl:call-template>
          </div>
        </div>
        <br />
        <div class="styTopSectionLine" style="width:187mm;text-align:center">
			<xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$DependencyData/Section642c1ElectionCd"/>
            </xsl:call-template>
        </div>
        <br />
        <div class="styTopSectionLine" style="width:187mm;text-align:center">Total Contributions for All Organizations: 
			<xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$DependencyData/TotalContributionsForAllOrgAmt"/>
            </xsl:call-template>
        </div>
        <div class="styTopSectionLine" style="width:187mm;text-align:center">Number of Organizations listed below: <xsl:value-of select="count($DependencyData/RecipientInformationGrp/ContributionRecipient)"></xsl:value-of>			
        </div>

   <table id="RecipientInformationGrpTbl" class="styDepTbl">
   				<xsl:for-each select="$DependencyData/RecipientInformationGrp">	
				<tr>
					<td class="styDepTblCell" colspan="3" style="text-align:left;"><span style="float:left;padding-right:1mm;">Contribution Recipient: </span><span style="float:left;">
						<xsl:choose>
									<xsl:when test="ContributionRecipient/PersonNm != ''">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="ContributionRecipient/PersonNm"/>
										</xsl:call-template>
									</xsl:when>
								</xsl:choose>
								<xsl:choose>
									<xsl:when test="ContributionRecipient/BusinessName/BusinessNameLine1Txt != ''">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="ContributionRecipient/BusinessName/BusinessNameLine1Txt"/>
										</xsl:call-template>
									</xsl:when>
								</xsl:choose>
								<xsl:choose>
									<xsl:when test="ContributionRecipient/BusinessName/BusinessNameLine2Txt != ''">
										<br/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="ContributionRecipient/BusinessName/BusinessNameLine2Txt"/>
										</xsl:call-template>
									</xsl:when>
								</xsl:choose>
						</span>
					</td>					
				</tr>
				<tr>
					<td class="styDepTblCell" colspan="3" style="text-align:left;"><span style="float:left;padding-right:1mm;">Address: </span>
								<span style="float:left;"><xsl:if test="ContributionRecipient/USAddress != ''">
									<xsl:call-template name="PopulateUSAddressTemplate">
										<xsl:with-param name="TargetNode" select="ContributionRecipient/USAddress"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="ContributionRecipient/ForeignAddress != ''">									
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="ContributionRecipient/ForeignAddress/AddressLine1Txt"/>
									</xsl:call-template>
									<xsl:if test="ContributionRecipient/ForeignAddress/AddressLine1Txt"><br />
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="ContributionRecipient/ForeignAddress/AddressLine2Txt"/>
									</xsl:call-template>
									</xsl:if><br />
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="ContributionRecipient/ForeignAddress/CityNm"/>
									</xsl:call-template>,<span style="width:2px;"/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="ContributionRecipient/ForeignAddress/ProvinceOrStateNm"/>
									</xsl:call-template>,<span style="width:2px;"/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="ContributionRecipient/ForeignAddress/ForeignPostalCd"/>
									</xsl:call-template><span style="width:7px;"/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="ContributionRecipient/ForeignAddress/CountryCd"/>
									</xsl:call-template>
									
								</xsl:if> </span>
					</td>
				</tr>
				<tr>
					<td class="styDepTblCell" colspan="3"><span style="float:left;padding-right:1mm;">Total Contributions: </span>
						<span style="float:left;"><xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="TotalContributionPerOrgAmt"/>
						</xsl:call-template></span>							
					</td>
				</tr>
				<tr>
					<td class="styDepTblCell" style="width:61mm;">						
					</td>
					<td class="styDepTblCell" style="width:62mm;">Contribution Amount
					</td>
					<td class="styDepTblCell" style="width:62mm;">Payment Date
					</td>
				</tr>
				<xsl:for-each select="ContributionDateAndAmtGrp">
				<tr>
					<td class="styDepTblCell" style="width:61mm;">						
					</td>
					<td class="styDepTblCell" style="width:62mm;text-align:right;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="ContributionAmt"/>
						</xsl:call-template>
					</td>
					<td class="styDepTblCell" style="width:62mm;">
						<xsl:call-template name="PopulateMonthDayYear">
							<xsl:with-param name="TargetNode" select="PaymentTransactionDt"/>
						</xsl:call-template>
					</td>
				</tr>
				</xsl:for-each>
				<tr>
					<td class="styDepTblCell" style="width:61mm;background-color:lightgrey;">						
					</td>
					<td class="styDepTblCell" style="width:62mm;background-color:lightgrey;">
					</td>
					<td class="styDepTblCell" style="width:62mm;background-color:lightgrey;">
					</td>
				</tr>				
				</xsl:for-each>			
		</table>  
                  
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
          <span class="styDepTitle" style="width:170mm;">
            <span><xsl:value-of select="$depDocTitle" /></span>
          </span>
        </div>
        <xsl:call-template name="PopulateDepCommonLeftover">
        	<xsl:with-param name="TargetNode" select="$DependencyData"/>
        </xsl:call-template>
        
	 <xsl:call-template name="RecipientInformationGrpTmp"/>
	
        <br />      
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>







