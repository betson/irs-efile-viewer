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
			<html>
				<head>
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
				<body class="styBodyClass">
					<form style="font-family:Arial; font-size:8.5pt" name="Form8716">
						<xsl:call-template name="DocumentHeader"/>
						<div class="styTBB" style="width:187mm">
							<div style="float:left; width:31mm; font-size:7pt;">   
								Form
								<span class="styFormNumber" style="margin-left:3mm">8716</span>
								<br/>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Form 8716, Top Left Margin - Backup Election Indicator</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form8716Data/@backupElectionIndicator"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Form 8716, Top Left Margin - Extension 12 Month Indicator</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form8716Data/@extension12MonthIndicator"/>
									<xsl:with-param name="Style">padding-left:3mm;</xsl:with-param>
								</xsl:call-template>
								<br/>(Rev. December 2008)<br/>
								<div style="font-size:6pt; margin-top:.5mm;">Department of the Treasury<br/>Internal Revenue Service </div>
							</div>
							<div class="styMainTitle" style="float:left; border-left:1 solid black; border-right:1 solid black; width:125mm; height:21.5mm; text-align:center; padding-top:4mm;  font-weight:bold">
								Election To Have a Tax Year Other Than a<br/>Required Tax Year
							</div>
							<div style="float:left; font-size:7pt; width:31mm; padding-top:8mm; text-align:center">
								OMB No. 1545-1036
							</div>
						</div>
						<div class="styBB" style="width:187mm; font-size:7pt">
							<div style="float:left; font-size:9pt; height:24mm; font-weight:bold; padding-top:7mm; padding-right:1mm;width:14mm;">
								Type or<br/>Print 
							</div>
							<div style="padding-left:2mm; float:left; width:125mm; height:8mm; border-right:1 solid black;font-weight:normal;font-size:7pt; border-left:1 solid black;">
								Name
								<div style="font-family:verdana;font-size:6pt;">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
									</xsl:call-template>
								</div>
            </div>
            <div style="float:left; padding-left:2mm; height:8mm;font-size:7pt;font-family:verdana;">
              <b>Employer identification number</b>
              <div style=" padding-top:1mm">
                <xsl:call-template name="PopulateReturnHeaderFiler">
                  <xsl:with-param name="TargetNode">EIN</xsl:with-param>
                </xsl:call-template>
              </div>
            </div>
            <div style="float:left; padding-left:2mm; height:8mm; border-bottom:1 solid black; border-top:1 solid black; border-left:1 solid black;width:173mm;">
							Number, street, and room or suite no. (or P.O. box number if mail is not delivered to street address)
							<br/>
              <span style="font-family:verdana;font-size:7pt;">
                <xsl:call-template name="PopulateReturnHeaderFiler">
                  <xsl:with-param name="TargetNode">AddressLine1</xsl:with-param>
                </xsl:call-template>
                <br/>
                <xsl:call-template name="PopulateReturnHeaderFiler">
                  <xsl:with-param name="TargetNode">AddressLine2</xsl:with-param>
                </xsl:call-template>
              </span>
            </div>
            <div style="float:left; padding-left:2mm; border-left:1 solid black;width:173mm;">
							City or town, state, and ZIP code
              <div style="font-family:verdana;font-size:7pt;">
                <xsl:call-template name="PopulateReturnHeaderFiler">
                  <xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param>
                </xsl:call-template>
                <br/>
                <xsl:call-template name="PopulateReturnHeaderFiler">
                  <xsl:with-param name="TargetNode">Country</xsl:with-param>
                </xsl:call-template>
              </div>
            </div>
          </div>
						<div class="styBB" style="width:187mm">
							<div style="float:left; margin-right:3mm; margin-left:1mm; padding-top:1mm; font-weight:bold">1</div>
							<div style="float:left; padding-top:1mm">
								Check applicable box to indicate type of entity:  
								<div style="float:left; width:71mm; padding-top:0.5mm">
									<span style="width:100%">
										<div class="styIRS8716ChxBoxDiv">
											<input type="checkbox" class="styCkbox">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="$Form8716Data/Partnership"/>
													<xsl:with-param name="BackupName">IRS8716Partnership</xsl:with-param>
												</xsl:call-template>
											</input>
										</div>
										<div style="float:left">
											<label>
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="$Form8716Data/Partnership"/>
												  <xsl:with-param name="BackupName">IRS8716Partnership</xsl:with-param>	
												</xsl:call-template>
												Partnership
											</label>
										</div>
									</span>
									<div style="padding-top:0.5mm">
										<div class="styIRS8716ChxBoxDiv">
										  <input type="checkbox" class="styCkbox">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="$Form8716Data/SCorporation"/>
													<xsl:with-param name="BackupName">IRS8716SCorporation</xsl:with-param>
												</xsl:call-template>
											</input>
										</div>
										<div style="float:left">
										  <label>
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="$Form8716Data/SCorporation"/>
												  <xsl:with-param name="BackupName">IRS8716SCorporation</xsl:with-param>	
												</xsl:call-template>
												Partnership
											</label>
										</div>
									</div>
									<div style="padding-top:0.5mm">
										<div class="styIRS8716ChxBoxDiv">
											<input type="checkbox" class="styCkbox">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="$Form8716Data/PersonalServiceCorporation"/>
													<xsl:with-param name="BackupName">IRS8716PersonalServiceCorporation</xsl:with-param>
												</xsl:call-template>
											</input>
										</div>
										<div style="float:left">
											<label>
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="$Form8716Data/PersonalServiceCorporation"/>
												  <xsl:with-param name="BackupName">IRS8716PersonalServiceCorporation</xsl:with-param>
												</xsl:call-template>
												Personal service corporation (PSC)
											</label>
										</div>
									</div>
								</div>
							</div>
							<div style="float:right; padding-right:2mm; border-left:1 solid black; padding-left:3mm; height:21.1mm">
								<div style="float:left; margin-right:4mm; padding-top:1mm; font-weight:bold">2</div>
								<div style="float:left; padding-top:1mm">
									Name and telephone number (including area code) of person who may<br/>be called for information:
									<br/>
									<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form8716Data/NameOfPerson"/>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulatePhoneNumber">
										<xsl:with-param name="TargetNode" select="$Form8716Data/TelephoneNumber"/>
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
            <div style="float:right; border-left:1 solid black; text-align:center; height:8.5mm">
              <div style="float:left; border-bottom:1 solid black">
                <div style="float:left; width:16mm">
									Month
								</div>
                <div style="float:left; width:16mm; border-left:1 solid black; height:4.2mm">
									Day
								</div>
                <div style="float:left; width:16mm; border-left:1 solid black; height:4.2mm">
									Year
								</div>
              </div>
              <div style="clear:left">
                <div style="float:left; width:16mm">
                  <xsl:call-template name="PopulateMonth">
                    <xsl:with-param name="TargetNode" select="$Form8716Data/EndingDateOfLastFiledReturn"/>
                  </xsl:call-template>
                </div>
                <div style="float:left; width:16mm; border-left:1 solid black; height:4.2mm">
                  <xsl:call-template name="PopulateDay">
                    <xsl:with-param name="TargetNode" select="$Form8716Data/EndingDateOfLastFiledReturn"/>
                  </xsl:call-template>
                </div>
                <div style="float:left; width:16mm; border-left:1 solid black; height:4.2mm">
                  <xsl:call-template name="PopulateYear">
                    <xsl:with-param name="TargetNode" select="$Form8716Data/EndingDateOfLastFiledReturn"/>
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
								<span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
							</div>
							<div style="float:right; border-left:1 solid black; text-align:center; height:8.5mm">
								<div style="float:left; text-align:center">
									<div style="width:23.7mm;float:left; border-bottom:1 solid black; height:4.2mm; ">
										Month
									</div>
									<div style="width:23.7mm;border-left:1 solid black; float:left; border-bottom:1 solid black; height:4.2mm; ">
										Day
									</div>
								</div>
								<div style="clear:left">
									<div style="float:left; width:23.7mm">
										<xsl:call-template name="PopulateMonthForMonthDayType">
											<xsl:with-param name="TargetNode" select="$Form8716Data/EndingDateOfRequiredTaxYear"/>
										</xsl:call-template>
									</div>
									<div style="float:left; width:23.7mm; border-left:1 solid black; height:4.2mm">
										<xsl:call-template name="PopulateMonth">
											<xsl:with-param name="TargetNode" select="$Form8716Data/EndingDateOfRequiredTaxYear"/>
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
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$Form8716Data/Adopting"/>
											<xsl:with-param name="BackupName">IRS8716Adopting</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$Form8716Data/Adopting"/>
											<xsl:with-param name="BackupName">IRS8716Adopting</xsl:with-param>
										</xsl:call-template>
										Adopting
									</label>
								</div>
								<div style="float:left; margin-right:14mm">
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$Form8716Data/Retaining"/>
											<xsl:with-param name="BackupName">IRS8716Retaining</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$Form8716Data/Retaining"/>
											<xsl:with-param name="BackupName">IRS8716Retaining</xsl:with-param>
										</xsl:call-template> 
										Retaining
									</label>
								</div>
								<div style="float:left">
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$Form8716Data/ChangingTo"/>
											<xsl:with-param name="BackupName">IRS8716ChangingTo</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$Form8716Data/ChangingTo"/>
											<xsl:with-param name="BackupName">IRS8716ChangingTo</xsl:with-param>
										</xsl:call-template>
										Changing to
									</label>
								</div>
							</div>
							<div style="float:right; border-left:1 solid black; text-align:center; height:12.5mm">
								<div style="float:left; border-bottom:1 solid black">
									<div style="float:left; width:16mm">
										Month
									</div>
									<div style="float:left; width:16mm; border-left:1 solid black; height:4.2mm">
										Day
									</div>
									<div style="float:left; width:16mm; border-left:1 solid black; height:4.2mm">
										Year
									</div>
								</div>
								<div style="clear:left">
									<div style="float:left; width:16mm; padding-top:2mm">
										<xsl:call-template name="PopulateMonth">
											<xsl:with-param name="TargetNode" select="$Form8716Data/EffectiveEndingDate"/>
										</xsl:call-template>
									</div>
									<div style="float:left; width:16mm; border-left:1 solid black; height:8mm; padding-top:2mm">
										<xsl:call-template name="PopulateDay">
											<xsl:with-param name="TargetNode" select="$Form8716Data/EffectiveEndingDate"/>
										</xsl:call-template>
									</div>
									<div style="float:left; width:16mm; border-left:1 solid black; height:8mm; padding-top:2mm">
										<xsl:call-template name="PopulateYear">
											<xsl:with-param name="TargetNode" select="$Form8716Data/EffectiveEndingDate"/>
										</xsl:call-template>
									</div>
								</div>
							</div>
						</div>
						<div class="styBB" style="width:187mm; font-size:7pt">
							<div>
								Under penalties of perjury, I declare that the entity named above has authorized me to make this election under section 444(a), and that the statements made are, to<br/>
								the best of my knowledge and belief, true, correct, and complete.
							</div>
							<div style="float:left">
								<div style="border-bottom:1 solid black; width:119mm; margin-top:3mm; font-size:8.5pt">
									<img src="{$ImagePath}/8716_Bullet.gif" alt="Right Arrow Bullet"/> &nbsp;
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
								<div style="border-bottom:1 solid black; width:58mm; margin-top:3mm; font-size:8.5pt">
									<img src="{$ImagePath}/8716_Bullet.gif" alt="Right Arrow Bullet"/> &nbsp;
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
						<div style="width:187mm; font-size:8pt; border-top:1 solid black">
							<div style="font-weight:bold; float:left; padding-top:1mm">
								For Paperwork Reduction Act Notice, see page 2.
							</div>
							<div style="float:right; font-size:7pt; padding-top:1mm">
								<span style="margin-right:45mm">Cat. No. 64725S</span>
								Form <span style="font-size:9pt; font-weight:bold">8716</span> (Rev. 12-2008)
							</div>
						</div>
						<p style="page-break-before:always"/>
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
								<xsl:with-param name="TargetNode" select="$Form8716Data/@backupElectionIndicator"/>
								<xsl:with-param name="DescWidth" select="100"/>
							</xsl:call-template>
							<xsl:call-template name="PopulateLeftoverRow">
								<xsl:with-param name="Desc">Form 8716, Top Left Margin - Extension 12 Month Indicator</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form8716Data/@extension12MonthIndicator"/>
								<xsl:with-param name="DescWidth" select="100"/>
							</xsl:call-template>
						</table>
					</form>
				</body>
			</html>
		</xsl:template>
	</xsl:stylesheet>
