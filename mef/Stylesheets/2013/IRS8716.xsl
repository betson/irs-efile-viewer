<?xml version="1.0"?>
<!DOCTYPE xsl:stylesheet [
	<!ENTITY nbsp "&#160;">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS8716Style.xsl"/>
	<xsl:output method="html" indent="yes" encoding="iso-8859-1"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form8716Data" select="$RtnDoc/IRS8716"/>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form8716Data)"/>
					</xsl:call-template>
				</title>
				<!-- No Browser Caching -->
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private"/>
				<meta name="Description" content="Form 8716"/>
				<meta name="Generator" content="IBM WebSphere Studio"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS8716Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass" style="width:187mm">
				<form style="font-family:Arial; font-size:8.5pt" name="Form8716">
					<xsl:call-template name="DocumentHeader"/>
					<div class="styTBB" style="width:187mm">
						<div style="float:left; width:31mm; font-size:7pt;">
							Form
							<span class="styFormNumber" style="margin-left:3mm">8716</span>
							<br/>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Form 8716, Top Left Margin - Backup Election Indicator</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form8716Data/@backupElectionCd"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Form 8716, Top Left Margin - Extension 12 Month Indicator</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form8716Data/@filedPursuantToSect30191002Ind"/>
								<xsl:with-param name="Style">padding-left:3mm;</xsl:with-param>
							</xsl:call-template>
							<br/>(Rev. December 2013)
							<div style="font-size:6pt; margin-top:.5mm;">Department of the Treasury<br/>Internal Revenue Service </div>
						</div>
						<div class="styMainTitle" style="float:left; border-left:1px solid black; border-right:1px solid black; width:125mm; height:21.5mm; text-align:center; padding-top:4mm;  font-weight:bold">
							Election To Have a Tax Year Other Than a<br/>Required Tax Year<br/>
							<div class="styFST" style="font-size:8pt;margin-left:3mm;font-weight:bold; padding-bottom:4mm;padding-top:4mm;">
								<img src="{$ImagePath}/8858_Bullet_Sm.gif" alt="Bullet"/>
									Information about Form 8716 and its instructions is at <i>
									<a style="text-decoration:none;color:black;" href="http://www.irs.gov/form8716">www.irs.gov/form8716</a>.</i>
							</div>
						</div>
						<div style="float:left; font-size:7pt; width:31mm; padding-top:8mm; text-align:center">
							OMB No. 1545-1036
						</div>
					</div>
					<div class="styBB" style="width:187mm;">
						<div style="width:14mm;height:24mm; float:left; font-size:9pt; font-weight:bold; padding-top:12mm; padding-right:1mm;">
							Type or<br/>Print
						</div>
						<div style="width:111mm; height:10mm;padding-left:2mm; font-size:7pt; float:left;border-right:1px solid black;font-weight:normal;border-left:1px solid black;">
								Name
								<br/>
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
								</xsl:call-template>
								<br/>
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
								</xsl:call-template>
						</div>
						<div style="float:left; padding-left:2mm; height:8mm;">
							<b>Employer identification number</b>
							<br/>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
							  <xsl:with-param name="TargetNode">EIN</xsl:with-param>
							</xsl:call-template>
						</div>
						<div style="float:left; padding-left:2mm; height:11mm; border-bottom:1px solid black; border-top:1px solid black; border-left:1px solid black;width:173mm;">
							Number, street, and room or suite no. (or P.O. box number if mail is not delivered to street address)
							<br/>
							<xsl:choose>
							<!--US Address-->
							  <xsl:when test="$RtnHdrData/Filer/USAddress">
								<xsl:call-template name="PopulateText">
								  <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/AddressLine1"/>
								</xsl:call-template>
								<br/>
								<xsl:call-template name="PopulateText">
								  <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/AddressLine2"/>
								</xsl:call-template>
							  </xsl:when>
							 <!--Foreign Address-->
							  <xsl:when test="$RtnHdrData/Filer/ForeignAddress">
								<xsl:call-template name="PopulateText">
								  <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/AddressLine1"/>
								</xsl:call-template>
								<br/>
								<xsl:call-template name="PopulateText">
								  <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/AddressLine2"/>
								</xsl:call-template>
							  </xsl:when>
							  <xsl:otherwise>							  
							  </xsl:otherwise>
							</xsl:choose>
						</div>
						<div style="width:173mm;height:11mm;float:left; padding-left:2mm; border-left:1px solid black;">
						  City or town, state, and ZIP code <br/>
						    <xsl:choose>
						    <!--US City, state and zipcode-->
							  <xsl:when test="$RtnHdrData/Filer/USAddress">
								<xsl:call-template name="PopulateText">
								  <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/City"/>
								</xsl:call-template>,
								<xsl:call-template name="PopulateText">
								  <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/State"/>
								</xsl:call-template>
								<span style="width:2mm;"/>
								<xsl:call-template name="PopulateText">
								  <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/ZIPCode"/>
								</xsl:call-template>
							  </xsl:when>
							  <!--Foreign city, province or state, postal code and country code-->
							  <xsl:when test="$RtnHdrData/Filer/ForeignAddress">
								<xsl:call-template name="PopulateText">
								  <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/City"/>
								</xsl:call-template>,
								<xsl:call-template name="PopulateText">
								  <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/ProvinceOrState"/>
								</xsl:call-template>,
								<xsl:call-template name="PopulateText">
								  <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/PostalCode"/>
								</xsl:call-template>
								<br/>
								<xsl:call-template name="PopulateText">
								  <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/Country"/>
								</xsl:call-template>
							  </xsl:when>
							</xsl:choose>
						</div>
					</div>
					<div class="styBB" style="width:187mm">
						<div style="float:left; margin-right:3mm; margin-left:1mm; padding-top:1mm; font-weight:bold">1</div>
						<div style="float:left; width:71mm; padding-top:1mm">
							Check applicable box to indicate type of entity:  
							<div style="float:left; width:71mm; padding-top:0.5mm">
								<span style="width:100%">
									<div class="styIRS8716ChxBoxDiv">
										<input type="checkbox" alt="Partnership" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8716Data/PartnershipInd"/>
												<xsl:with-param name="BackupName">IRS8716Partnership</xsl:with-param>
											</xsl:call-template>
										</input>
									</div>
									<div style="float:left">
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$Form8716Data/PartnershipInd"/>
												<xsl:with-param name="BackupName">IRS8716Partnership</xsl:with-param>
											</xsl:call-template>
												Partnership
										</label>
									</div>
								</span>
								<div style="padding-top:0.5mm">
									<div class="styIRS8716ChxBoxDiv">
										<input type="checkbox" alt="S corporation" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8716Data/SCorporationInd"/>
												<xsl:with-param name="BackupName">IRS8716SCorporation</xsl:with-param>
											</xsl:call-template>
										</input>
									</div>
									<div style="float:left;width:60mm;">
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$Form8716Data/SCorporationInd"/>
												<xsl:with-param name="BackupName">IRS8716SCorporation</xsl:with-param>
											</xsl:call-template>
												S corporation (or C corporation electing to be an S corporation)
										</label>
									</div>
								</div>
								<div style="padding-top:0.5mm">
									<div class="styIRS8716ChxBoxDiv">
										<input type="checkbox" alt="Personal service corporation" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8716Data/PersonalServiceCorporationInd"/>
												<xsl:with-param name="BackupName">IRS8716PersonalServiceCorporation</xsl:with-param>
											</xsl:call-template>
										</input>
									</div>
									<div style="float:left">
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$Form8716Data/PersonalServiceCorporationInd"/>
												<xsl:with-param name="BackupName">IRS8716PersonalServiceCorporation</xsl:with-param>
											</xsl:call-template>
												Personal service corporation (PSC)
										</label>
									</div>
								</div>
							</div>
						</div>
						<div style="float:right; padding-right:2mm; border-left:1px solid black; padding-left:3mm; height:23mm">
							<div style="float:left; margin-right:4mm; padding-top:1mm; font-weight:bold">2</div>
							<div style="float:left; padding-top:1mm">
								Name and telephone number (including area code) of person who may<br/>be called for information:
								<br/>
								<br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form8716Data/PersonNm"/>
								</xsl:call-template>
								<br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form8716Data/TelephoneNum"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<div class="styBB" style="width:187mm">
						<div style="float:left; width:5mm; margin-left:1mm; padding-top:0.5mm; font-weight:bold">3</div>
						<div style="float:left; width:130mm; height:8.5mm; padding-top:0.5mm">
								Enter ending date of the tax year for the entity's last filed return. A new entity should enter the
								<span style="float:left">
									ending date of the tax year it is adopting.
								</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">.................</span>
						</div>
						<div style="float:right; width:48.5mm;border-left:1px solid black; text-align:center; height:8.5mm">
							<div style="float:left; border-bottom:1px solid black">
								<div style="float:left; width:16mm">
									Month
								</div>
								<div style="float:left; width:16mm; border-left:1px solid black; height:4.2mm">
									Day
								</div>
								<div style="float:left; width:16mm; border-left:1px solid black; height:4.2mm">
									Year
								</div>
							</div>
							<div style="clear:left">
								<div style="float:left; width:15.5mm">
									<xsl:call-template name="PopulateMonth">
										<xsl:with-param name="TargetNode" select="$Form8716Data/LastFiledReturnEndDt"/>
									</xsl:call-template>
								</div>
								<div style="float:left; width:15.8mm; border-left:1px solid black; height:4.2mm">
									<xsl:call-template name="PopulateDay">
										<xsl:with-param name="TargetNode" select="$Form8716Data/LastFiledReturnEndDt"/>
									</xsl:call-template>
								</div>
								<div style="float:left; width:16mm; border-left:1px solid black; height:4.2mm">
									<xsl:call-template name="PopulateYear">
										<xsl:with-param name="TargetNode" select="$Form8716Data/LastFiledReturnEndDt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
					</div>
					<div class="styBB" style="width:187mm">
						<div style="float:left; width:5mm; margin-left:1mm; padding-top:4mm; font-weight:bold">4</div>
						<div style="float:left; width:130mm; height:8.5mm; padding-top:4mm">
							<span style="float:left">
								Enter ending date of required tax year determined under section 441(i), 706(b), or 1378 
							</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">...</span>
						</div>
						<div style="float:right;width:48.5mm; border-left:1px solid black; text-align:center; height:8.5mm">
							<div style="float:left; text-align:center">
								<div style="width:23.7mm;float:left; border-bottom:1px solid black; height:4.2mm; ">
									Month
								</div>
								<div style="width:23.7mm;border-left:1px solid black; float:left; border-bottom:1px solid black; height:4.2mm; ">
									Day
								</div>
							</div>
							<div style="clear:left">
								<div style="float:left; width:23.1mm">
									<xsl:call-template name="PopulateMonthForMonthDayType">
										<xsl:with-param name="TargetNode" select="$Form8716Data/RequiredTaxYearEndDt"/>
									</xsl:call-template>
								</div>
								<div style="float:left; width:23.7mm; border-left:1px solid black; height:4.2mm">
									<xsl:call-template name="PopulateMonth">
										<xsl:with-param name="TargetNode" select="$Form8716Data/RequiredTaxYearEndDt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
					</div>
					<div class="styBB" style="width:187mm">
						<div style="float:left; width:5mm; margin-left:1mm; padding-top:0.5mm; font-weight:bold">5</div>
						<div style="float:left; width:130mm; height:8.5mm; padding-top:0.5mm">
							<div style="padding-bottom:0.5mm">
								<b>Section 444(a) Election.</b>
								Check the applicable box and enter the ending date of the first tax year<br/>
								for which the election will be effective that the entity is (see instructions):
							</div>
							<div style="float:left; margin-right:14mm">
								<input type="checkbox" alt="Adopting" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form8716Data/AdoptingInd"/>
										<xsl:with-param name="BackupName">IRS8716Adopting</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form8716Data/AdoptingInd"/>
										<xsl:with-param name="BackupName">IRS8716Adopting</xsl:with-param>
									</xsl:call-template>
										Adopting
								</label>
							</div>
							<div style="float:left; margin-right:14mm">
								<input type="checkbox" alt="Retaining" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form8716Data/RetainingInd"/>
										<xsl:with-param name="BackupName">IRS8716Retaining</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form8716Data/RetainingInd"/>
										<xsl:with-param name="BackupName">IRS8716Retaining</xsl:with-param>
									</xsl:call-template>
										Retaining
								</label>
							</div>
							<div style="float:left">
								<input type="checkbox" alt="Changing to" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form8716Data/ChangingToInd"/>
										<xsl:with-param name="BackupName">IRS8716ChangingTo</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form8716Data/ChangingToInd"/>
										<xsl:with-param name="BackupName">IRS8716ChangingTo</xsl:with-param>
									</xsl:call-template>
										Changing to
								</label>
							</div>
						</div>
						<div style="float:right; width:48.5mm;border-left:1px solid black; text-align:center; height:12.5mm">
							<div style="float:left; border-bottom:1px solid black">
								<div style="float:left; width:16mm">
									Month
								</div>
								<div style="float:left; width:16mm; border-left:1px solid black; height:4.2mm">
									Day
								</div>
								<div style="float:left; width:16mm; border-left:1px solid black; height:4.2mm">
									Year
								</div>
							</div>
							<div style="clear:left">
								<div style="float:left; width:15.5mm; padding-top:2mm">
									<xsl:call-template name="PopulateMonth">
										<xsl:with-param name="TargetNode" select="$Form8716Data/EffectiveEndDt"/>
									</xsl:call-template>
								</div>
								<div style="float:left; width:15.8mm; border-left:1px solid black; height:8mm; padding-top:2mm">
									<xsl:call-template name="PopulateDay">
										<xsl:with-param name="TargetNode" select="$Form8716Data/EffectiveEndDt"/>
									</xsl:call-template>
								</div>
								<div style="float:left; width:16mm; border-left:1px solid black; height:8mm; padding-top:2mm">
									<xsl:call-template name="PopulateYear">
										<xsl:with-param name="TargetNode" select="$Form8716Data/EffectiveEndDt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
					</div>
					<div class="styBB" style="width:187mm;">
					  Under penalties of perjury, I declare that the entity named above has authorized me to make this election under section 444(a), and that the statements made are, to the best of my knowledge and belief, true, correct, and complete.
					  <div style="float:left">
							<div style="border-bottom:1px solid black; width:119mm; margin-top:3mm; font-size:8.5pt">
								<img src="{$ImagePath}/8716_Bullet.gif" alt="Right Arrow Bullet"/>
								<span style="text-align:center; width:110mm">
									<xsl:call-template name="PopulateReturnHeaderOfficer">
										<xsl:with-param name="TargetNode">TaxpayerPIN</xsl:with-param>
									</xsl:call-template>
									<span style="width:10mm"/>
									<xsl:call-template name="PopulateReturnHeaderOfficer">
										<xsl:with-param name="TargetNode">Title</xsl:with-param>
									</xsl:call-template>
								</span>
							</div>
							<div style="padding-top:0.5mm; padding-bottom:0.5mm">
								Signature and title (see instructions) 
							</div>
						</div>
						<div style="float:right">
							<div style=" width:58mm; margin-top:3mm; font-size:8.5pt">
								<img src="{$ImagePath}/8716_Bullet.gif" alt="Right Arrow Bullet"/>
								<span style="text-align:center; width:50mm">
									<xsl:call-template name="PopulateReturnHeaderOfficer">
										<xsl:with-param name="TargetNode">DateSigned</xsl:with-param>
									</xsl:call-template>
								</span>
							</div>
							<div style="width:58mm; padding-top:0.5mm; padding-bottom:0.5mm">
								Date
							</div>
						</div>
					</div>
					<div style="width:187mm; font-size:8pt; border-top:1px solid black">
						<div style="font-weight:bold; float:left; padding-top:1mm">
								For Paperwork Reduction Act Notice, see instructions.
							</div>
						<div style="float:right; font-size:7pt; padding-top:1mm">
							<span style="margin-right:45mm">Cat. No. 64725S</span>
							Form <span style="font-size:9pt; font-weight:bold">8716</span> (Rev. 12-2013)
						</div>
					</div>
					<p style=""/>
					<div class="styLeftOverTitleLine" id="LeftoverData" style="font-family:verdana, arial, sans-serif">
						<div class="styLeftOverTitle">
							Additional Data
						</div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage()" tabindex="1"/>
						</div>
					</div>
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$Form8716Data"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Form 8716, Top Left Margin - Backup Election Indicator</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form8716Data/@backupElectionCd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Form 8716, Top Left Margin - Extension 12 Month Indicator</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form8716Data/@filedPursuantToSect30191002Ind"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>