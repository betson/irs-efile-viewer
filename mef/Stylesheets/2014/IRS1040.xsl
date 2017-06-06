<?xml version="1.0" encoding="UTF-8"?>
<!-- Last Modified by Steven Fook on 9/23/2014 -->
<!-- Last Modified by James Ganzy on 11/20/2014 -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS1040Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="FormData" select="$RtnDoc/IRS1040"/>
	<xsl:template match="/">
		<html lang="EN-US">
			<head>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($FormData)"/>
					</xsl:call-template>
				</title>
				<!-- No Browser Caching -->
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private"/>
				<!-- Define Character Set -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Description" content="IRS Form 1040"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS1040Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form id="Form1040">
					<!-- *****************************Start Page Header -->
					<xsl:call-template name="DocumentHeader"/>
					<div class="styTBB" style="width:187mm;">
						<!-- Extra data line -->
						<div class="styGenericDiv" style="width:187mm;padding-top:2px;">
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Top Left Margin - Special Condition Description</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/SpecialConditionDesc"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Top Left Margin - Primary Date Of Death</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/PrimaryDeathDt"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Top Left Margin - Spouse Date Of Death</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/SpouseDeathDt"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Top Left Margin - Special Processing Literal Code</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/SpecialProcessingLiteralCd"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Top Left Margin - Special Processing Literal Code 2</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/CombatZoneCd"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Top Left Margin - Combat Zone Date</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/CombatZoneCd/@combatZoneDt"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Top Left Margin - Special Processing Code Text</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/SpecialProcessingCodeTxt"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Top Left Margin - Community Property Return Indicator</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/CommPropStateRtnInd"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Top Left Margin - Signed by Power Of Attorney Checkbox</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/PowerOfAttorneySignedByInd"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Top Left Margin - Power Of Attorney Name</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/PowerOfAttorneyNm"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Top Left Margin - Surviving Spouse Indicator</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/SurvivingSpouseInd"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Top Left Margin - Personal Representative</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/PersonalRepresentativeInd"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Top Left Margin - Non Paid Preparer Code</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/NonPaidPreparerCd"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Top Left Margin - Refund Anticipation Loan Code</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/RefundAnticipationLoanCd"/>
							</xsl:call-template>
						</div>
						<div class="styGenericDiv" style="width:24.8mm;height:42px;padding-top:4px;">
							<img alt="Form" src="{$ImagePath}/1040_Form.gif" height="34" width="19"/>
							<span class="styFormNumber">1040</span>
						</div>
						<div class="styGenericDiv" style="width:65mm;padding-right:1mm;padding-top:6px;height:42px;">
							<span class="styAgency">Department of the Treasury&#8212;Internal Revenue Service</span>
							<span style="width:4mm;"/>(99)<br/>
							<span class="styMainTitle" style="font-family:Arial Narrow;">U.S. Individual Income Tax Return</span>
						</div>
						<div class="styTYBox" style="width:18mm;border-right-width:1px;height:42px;padding-top:7px;">
							<span class="styTaxYear">20<span class="styTYColor">14</span>
							</span>
						</div>
						<div class="styOMB" style="width:31.5mm;height:42px;padding:25px 1mm 1mm 1mm;float:left;border-width:0px 1px 0px 0px;vertical-align:bottom;">
							OMB No. 1545-0074
						</div>
						<div class="styGenericDiv" style="width:47.5mm;height:42px;font-family:Arial Narrow;padding:27px 0px 1mm 1mm;">
							IRS Use Only&#8212;Do not write or staple in this space.
						</div>
					</div>
					<!-- ************************End Page Header *************************** -->
					<!-- Entity Data -->
					<div class="styTBB" style="width:187mm;">
						<!-- Line 0 -->
						<div class="styIRS1040HeaderCell" style="width:141.8mm;height:4mm;">
							For the year Jan. 1&#8211;Dec. 31, 2014, or other tax year beginning <span style="width:2mm;"/>
							<xsl:call-template name="PopulateReturnHeaderTaxPeriodBeginDate"/>
							, ending <span style="width:2mm;"/>
							<xsl:call-template name="PopulateReturnHeaderTaxPeriodEndDate"/>
						</div>
						<div class="styIRS1040HeaderCell" style="width:45mm;height:4mm;border-right-width:0px;">
							See separate instructions.
						</div>
						<!-- Line i -->
						<div class="styIRS1040HeaderCell" style="width:67mm;">
							Your first name and initial<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">Name</xsl:with-param>
							</xsl:call-template>
							<span style="width:4px;"/>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Header - Primary Name Control</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PrimaryNameControlTxt"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Header - In Care Of Name</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/InCareOfNm"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1040HeaderCell" style="width:74.8mm;">
							Last name <br/>
						</div>
						<div class="styIRS1040HeaderCell" style="width:45mm;border-right-width:0px;">
							<span class="styBoldText">Your social security number</span>
							<br/>
							<span style="width:100%;text-align:center;">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
									<xsl:with-param name="EINChanged">true</xsl:with-param>
								</xsl:call-template>
							</span>
						</div>
						<!-- Line ii -->
						<div class="styIRS1040HeaderCell" style="width:67mm;">
							If a joint return, spouse's first name and initial<br/>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Header - Spouse Name Control</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/SpouseNameControlTxt"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1040HeaderCell" style="width:74.8mm;">
							Last name <br/>
						</div>
						<div class="styIRS1040HeaderCell" style="width:45mm;border-right-width:0px;">
							<span class="styBoldText" style="font-family:Arial Bold;font-size:7.5pt;">Spouse's social security number</span>
							<br/>
							<span style="width:100%;text-align:center;">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">SpouseSSN</xsl:with-param>
									<xsl:with-param name="EINChanged">true</xsl:with-param>
								</xsl:call-template>
							</span>
						</div>
						<!-- Line iii -->
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styIRS1040HeaderCell" style="width:120mm;height:10mm;">
								Home address (number and street). If you have a P.O. box, see instructions.<br/>
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
								</xsl:call-template>
								<br/>
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
								</xsl:call-template>
							</div>
							<div class="styIRS1040HeaderCell" style="width:21.8mm;height:10mm;">
								Apt. no.<br/>
								<span style="width:0px;"/>
							</div>
							<div class="styIRS1040HeaderCell" style="width:45mm;height:10mm;padding-top:6px;border-right-width:0px;">
								<div class="styGenericDiv" style="width:5mm;padding-top:0.5mm;">
									<img alt="Up-pointing triangle" src="{$ImagePath}/1040_Bullet_Up2.gif" height="22" width="22"/>
								</div>
								<div class="styGenericDiv" style="text-align:center;width:35mm;font-family:arial;">Make sure the SSN(s) above <br/>and on line 6c are correct.</div>
							</div>
						</div>
						<!-- Line iv -->
						<div class="styIRS1040HeaderCell" style="width:141.8mm;height:10mm;">
							<span style="font-family:Arial;">City, town or post office, state, and ZIP code. If you have a foreign address, also complete spaces below (see instructions).</span>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styIRS1040HeaderCell" style="width:45mm;height:20mm;float:right;font-family:Arial Narrow;border-right-width:0px;">
							<span style="font-family:Arial;font-weight:bold;padding-left:4px;">Presidential Election Campaign</span>
							<br/>
							<span style="font-size:4pt;">
								<br/>
							</span>
							Check here if you, or your spouse if filing<br/>
							jointly, want $3 to go to this fund. Checking <br/>
							a box below will not change your tax or <br/>
							<span style="float:left;">refund.</span>
							<span style="float:right;">
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/PECFPrimaryInd"/>
										<xsl:with-param name="BackupName" select="IRS1040PECFPrimaryInd"/>
									</xsl:call-template>
								</input>
								<span style="width:4px;"/>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/PECFPrimaryInd"/>
										<xsl:with-param name="BackupName" select="IRS1040PECFPrimaryInd"/>
									</xsl:call-template>
									<b>You</b>
								</label>
								<span style="width:4px;"/>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/PECFSpouseInd"/>
										<xsl:with-param name="BackupName" select="IRS1040PECFSpousend"/>
									</xsl:call-template>
								</input>
								<span style="width:4px;"/>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/PECFSpouseInd"/>
										<xsl:with-param name="BackupName" select="IRS1040PECFSpouseInd"/>
									</xsl:call-template>
									<b>Spouse</b>
								</label>
								<span style="width:4px;"/>
							</span>
						</div>
						<!-- Line v -->
						<div class="styIRS1040HeaderCell" style="width:64mm;height:10mm;">
							Foreign country name<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">CountryCd</xsl:with-param>
								<xsl:with-param name="MainForm">true</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styIRS1040HeaderCell" style="width:47mm;height:10mm;">
							Foreign province/state/county<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">ProvinceOrStateNm</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styIRS1040HeaderCell" style="width:30.8mm;height:10mm;">
							<span style="font-family:arial;">Foreign postal code</span>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">ForeignPostalCd</xsl:with-param>
							</xsl:call-template>
						</div>
					</div>
					<!-- End Entity Data -->
					<!-- Filing status area -->
					<div style="width:187mm; border-style:solid; border-color: black; border-width: 0px 0px 1px 0px;">
						<div style="width:26mm;float:left;clear:none;">
							<div style="padding-top:4mm;padding-bottom:1mm;">
								<span class="styMainTitle" style="font-size:11pt;">Filing Status</span>
							</div>
                     Check only one<br/>
                      box.
                  </div>
						<!-- Filing Status Single Indicator -->
						<div style="width:80mm;float:left;clear:none;">
							<div style="width:80mm;">
								<div class="styLNLeftNumBox" style="width:4mm;">1</div>
								<div style="float:left;clear:none;padding-top:.5mm;">
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateEnumeratedCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
											<xsl:with-param name="DisplayedCheckboxValue" select="'1'"/>
											<xsl:with-param name="BackupName">IRS1040IndividualReturnFilingStatusCd[1]</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
											<xsl:with-param name="DisplayedCheckboxValue" select="'1'"/>
											<xsl:with-param name="BackupName">IRS1040IndividualReturnFilingStatusCd[1]</xsl:with-param>
										</xsl:call-template>
										 Single
								  </label>
								</div>
							</div>
							<!-- Filing Status Married Filing Jointly Indicator -->
							<div style="width:80mm;">
								<div class="styLNLeftNumBox" style="width:4mm;">2</div>
								<div style="float:left;clear:none;padding-top:.5mm;">
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateEnumeratedCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
											<xsl:with-param name="DisplayedCheckboxValue" select="'2'"/>
											<xsl:with-param name="BackupName">IRS1040IndividualReturnFilingStatusCd[2]</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
											<xsl:with-param name="DisplayedCheckboxValue" select="'2'"/>
											<xsl:with-param name="BackupName">IRS1040IndividualReturnFilingStatusCd[2]</xsl:with-param>
										</xsl:call-template>
										 Married filing jointly (even if only one had income)
								  </label>
								</div>
							</div>
							<!-- Filing Status Married Filing Separately Indicator -->
							<div style="width:80mm;">
								<div class="styLNLeftNumBox" style="width:4mm;">3</div>
								<div style="float:left;clear:none;padding-top:.5mm;">
									<div style="float:left;clear:none;">
										<input type="checkbox" class="styCkbox">
											<xsl:call-template name="PopulateEnumeratedCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
												<xsl:with-param name="DisplayedCheckboxValue" select="'3'"/>
												<xsl:with-param name="BackupName">IRS1040IndividualReturnFilingStatusCd[3]</xsl:with-param>
											</xsl:call-template>
										</input>
									</div>
									<div style="float:left;clear:none;width:72mm;padding-left:1mm;">
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
												<xsl:with-param name="DisplayedCheckboxValue" select="'3'"/>
												<xsl:with-param name="BackupName">IRS1040IndividualReturnFilingStatusCd[3]</xsl:with-param>
											</xsl:call-template>
										   Married filing separately. Enter spouse's SSN above
										   and full name here.
								  </label>
										<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
										<span style="width:7px;"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/SpouseNm"/>
											<xsl:with-param name="BackupName">IRS1040SpousesName</xsl:with-param>
										</xsl:call-template>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/NRALiteralCd"/>
										</xsl:call-template>
									</div>
								</div>
							</div>
						</div>
						<!-- Filing Status Head Of Household Indicator -->
						<div style="width:80mm;float:left;clear:none;">
							<div style="width:80mm;">
								<div class="styLNLeftNumBox" style="width:4mm;">4</div>
								<div style="float:left;clear:none;padding-top:.5mm;">
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateEnumeratedCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
											<xsl:with-param name="DisplayedCheckboxValue" select="'4'"/>
											<xsl:with-param name="BackupName">IRS1040IndividualReturnFilingStatusCd[4]</xsl:with-param>
										</xsl:call-template>
									</input>
								</div>
								<div class="styArialText" style="font-size:7pt;float:left;clear:none;width:72mm;padding-left:1mm;padding-top:.5mm;">
									<div style="float:none;clear:none;">
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
												<xsl:with-param name="DisplayedCheckboxValue" select="'4'"/>
												<xsl:with-param name="BackupName">IRS1040IndividualReturnFilingStatusCd[4]</xsl:with-param>
											</xsl:call-template>
										   Head of household (with qualifying person). (See instructions.) If
										   the qualifying person is a child but not your dependent, enter
										   this child's name here.
								  </label>
										<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
										<span class="styBB" style="width:40mm;float:none;clear:none;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/QualifyingHOHNm"/>
												<xsl:with-param name="BackupName">IRS1040QualifyingNameForHOH</xsl:with-param>
											</xsl:call-template>
											<xsl:call-template name="LinkToLeftoverDataTableInline">
												<xsl:with-param name="Desc">Line 4 - Qualifying HOH SSN</xsl:with-param>
												<xsl:with-param name="TargetNode" select="$FormData/QualifyingHOHSSN"/>
											</xsl:call-template>
										</span>
									</div>
								</div>
							</div>
							<!-- Filing Status Qualifying Widow Indicator -->
							<div style="width:80mm;">
								<div class="styLNLeftNumBox" style="width:4mm;">5</div>
								<div style="float:left;clear:none;padding-top:.5mm;">
									<div style="float:left;clear:none;">
										<input type="checkbox" class="styCkbox">
											<xsl:call-template name="PopulateEnumeratedCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
												<xsl:with-param name="DisplayedCheckboxValue" select="'5'"/>
												<xsl:with-param name="BackupName">IRS1040IndividualReturnFilingStatusCd[5]</xsl:with-param>
											</xsl:call-template>
										</input>
									</div>
									<div style="float:left;clear:none;width:72mm;padding-left:1mm;">
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
												<xsl:with-param name="DisplayedCheckboxValue" select="'5'"/>
												<xsl:with-param name="BackupName">IRS1040IndividualReturnFilingStatusCd[5]</xsl:with-param>
											</xsl:call-template>
											<span class="styArialText" style="font-size:7.5pt;">
										  Qualifying widow(er) with dependent child
										  </span>
										</label>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- End Filing status area -->
					<!-- Exemptions area -->
					<div style="width:187mm; border-style:solid; border-color: black; border-width: 0px 0px 1px 0px;">
						<div style="width:25.5mm;float:left;clear:none;">
							<div style="padding-top:4mm;padding-bottom:10mm;">
								<span class="styMainTitle" style="font-size:11pt;">Exemptions</span>
							</div>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/MoreDependentsInd"/>
									<xsl:with-param name="BackupName">IRS1040NumOfOtherDepdListedInd</xsl:with-param>
								</xsl:call-template>
												  If more than four<br/>
												 dependents, see<br/>
												 instructions and <br/>check here 
									 </label>
							<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
							<span style="width:2px;"/>
							<input type="Checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/MoreDependentsInd"/>
									<xsl:with-param name="BackupName">IRS1040NumOfOtherDepdListedInd</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
						<div style="width:126.5mm;float:left;clear:none;">
							<div style="width:126mm;float:left;clear:none;">
								<div style="width:123mm;float:left;clear:none;">
									<div style="width:122mm;float:left;clear:none;">
										<div class="styLNLeftNumBox" style="width:4mm;">6a</div>
										<div style="float:left;clear:none;padding-top:.5mm;padding-left:2mm;">
											<span style="float:left;clear:none;">
												<input type="Checkbox" class="styCkbox">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="$FormData/ExemptPrimaryInd"/>
														<xsl:with-param name="BackupName">IRS1040ExemptPrimaryInd</xsl:with-param>
													</xsl:call-template>
												</input>
											</span>
											<div style="width:112mm;padding-left:1.5mm;float:left;clear:none;">
												<span style="float:left;clear:none;">
													<label>
														<xsl:call-template name="PopulateLabel">
															<xsl:with-param name="TargetNode" select="$FormData/ExemptPrimaryInd"/>
															<xsl:with-param name="BackupName">IRS1040ExemptPrimaryInd</xsl:with-param>
														</xsl:call-template>
														<b>Yourself. </b> If someone can claim you as a dependent, <b>do not</b> check box 6a
                                     </label>
												</span>
												<span class="styDotLn" style="float:right;padding-right:2mm;">...</span>
											</div>
										</div>
									</div>
									<div style="width:123mm;float:left;clear:none;">
										<div class="styLNLeftNumBox" style="width:4mm;padding-left:2.75mm;">b</div>
										<div style="float:left;clear:none;padding-top:.5mm;padding-left:2mm;">
											<span style="float:left;clear:none;">
												<input type="Checkbox" class="styCkbox">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="$FormData/ExemptSpouseInd"/>
														<xsl:with-param name="BackupName">IRS1040ExemptSpouseInd</xsl:with-param>
													</xsl:call-template>
												</input>
											</span>
											<div style="width:113.5mm;padding-left:1.5mm;float:left;clear:none;">
												<span style="float:left;clear:none;">
													<label>
														<xsl:call-template name="PopulateLabel">
															<xsl:with-param name="TargetNode" select="$FormData/ExemptSpouseInd"/>
															<xsl:with-param name="BackupName">IRS1040ExemptSpouseInd</xsl:with-param>
														</xsl:call-template>
														<b>Spouse</b>
													</label>
												</span>
													<xsl:call-template name="LinkToLeftoverDataTableInline">
														<xsl:with-param name="Desc">Line 6b - Exempt Spouse Name</xsl:with-param>
														<xsl:with-param name="TargetNode" select="$FormData/ExemptSpouseNm"/>
													</xsl:call-template>
													<xsl:call-template name="LinkToLeftoverDataTableInline">
														<xsl:with-param name="Desc">Line 6b - Exempt Spouse Name Control</xsl:with-param>
														<xsl:with-param name="TargetNode" select="$FormData/ExemptSpouseNameControlTxt"/>
													</xsl:call-template>
												<span class="styDotLn" style="float:none;clear:none;padding-right:0mm;">.......................</span>
											</div>
										</div>
									</div>
								</div>
								<div style="width:1mm;float:right;clear:none;">
									<img src="{$ImagePath}/1040_Bracket_Small.gif" alt="Bracket"/>
								</div>
								<!-- Table expand/collapse toggle button -->
								<div class="styGenericDiv" style="width:3.2mm;height:4mm;float:right;clear:none;">
									<xsl:call-template name="SetDynamicTableToggleButton">
										<xsl:with-param name="TargetNode" select="$FormData/DependentDetail"/>
										<xsl:with-param name="containerHeight" select="4"/>
										<xsl:with-param name="headerHeight" select="1"/>
										<xsl:with-param name="containerID" select=" 'depdContainerId'  "/>
									</xsl:call-template>
								</div>
							</div>
							<div style="width:127.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;padding-left:2.75mm;padding-top:0mm;">c</div>
								<!-- Dependents table -->
								<!-- Column widths used 
49.4
30.2 c/to 26.2
20.6 c/to 18.6
18.6 c/to 22.6 to 24.6
-->
								<!-- Generated Table (Start) -->
								<div class="sty1040DepdContainer" style="height:27mm;width: 120mm;" id="depdContainerId">
									<!-- print logic -->
									<xsl:call-template name="SetInitialState"/>
									<!-- end -->
									<table class="styTable" cellspacing="0">
										<thead class="styTableThead">
											<tr>
												<th class="styTableCellHeader" scope="col" style="text-align:left;width:49.4mm;border-right-width:1px;vertical-align:top;">
													<div style="float:left;clear:none;width:44mm;vertical-align:top;">
														<span style="width:7px;"/>
														<span style="font-weight:bold;">Dependents:</span>
														<br/>
														<div class="styNormalText" style="float:left;clear:none;padding-top:3mm;padding-left:1mm;">
															<span class="styBoldText">(1)</span> First name
                                             <span style="width:27px;"/> 
                                             Last name
                                          </div>
													</div>
												</th>
												<th class="styTableCellHeader" scope="col" style="width:26.2mm;border-right-width:1px;vertical-align:top;">
													<!-- uncomment and change table header literals here or use 'cellpad' -->
													<span style="font-weight:bold;">(2)</span>
													<span class="styNormalText">
                                       Dependent's<span style="width:4mm"/>
                                       social security number
                                       </span>
													<!-- span class="styTableCellPad"></span -->
												</th>
												<th class="styTableCellHeader" scope="col" style="width:18.6mm;border-right-width:1px;vertical-align:top;">
													<!-- uncomment and change table header literals here or use 'cellpad' -->
													<span style="font-weight:bold;">(3)</span>
													<span class="styNormalText">
                                       Dependent's
                                       relationship to
                                       you
                                       </span>
													<!-- span class="styTableCellPad"></span -->
												</th>
												<th class="styTableCellHeader" scope="col" style="width:24.6mm;border-right-width:0px;">
													<b>(4) </b>
													<img src="{$ImagePath}/1040_Check.gif" alt="Check"/>
													<span class="styNormalText">
												   if child under age 17 qualifying
												   for child tax
												   credit (see instructions)
												   </span>
												</th>
											</tr>
										</thead>
										<tbody>
											<xsl:if test="($Print != $Separated) or (count($FormData/DependentDetail) &lt;= 4)">
												<xsl:for-each select="$FormData/DependentDetail">
													<tr>
														<!-- Column 1 -->
														<td class="styTableCell" style="width:49.4mm;height:4mm;float:left;clear:none;border-right-width:1px;">
															<!-- insert Populate template call here (and remove group level reference) -->
															<!--<span style="width:5mm;align:left;float:left;clear:none;">
                                                <xsl:call-template name="PopulateText">
                                                   <xsl:with-param name="TargetNode" select="DependentNameControl" />
                                                   <xsl:with-param name="BackupName">IRS1040DependentInformationsDependentNameControl</xsl:with-param>
                                                </xsl:call-template>
                                             </span>-->
															<label>
																<xsl:call-template name="PopulateLabel">
																	<xsl:with-param name="TargetNode" select="EligibleForChildTaxCreditInd"/>
																	<xsl:with-param name="BackupName">IRS1040DependentInformationsEligibleForChildTaxCreditInd</xsl:with-param>
																</xsl:call-template>
																<span style="width:25mm;text-align:left;float:left;clear:none;">
																	<xsl:call-template name="PopulateText">
																		<xsl:with-param name="TargetNode" select="DependentFirstNm"/>
																		<xsl:with-param name="BackupName">IRS1040DependentInformationsDependentFirstName</xsl:with-param>
																	</xsl:call-template>
																</span>
																<span style="width:18mm;text-align:left;float:left;clear:none;">
																	<xsl:call-template name="PopulateText">
																		<xsl:with-param name="TargetNode" select="DependentLastNm"/>
																		<xsl:with-param name="BackupName">IRS1040DependentInformationsDependentLastName</xsl:with-param>
																	</xsl:call-template>
																</span>
															</label>
															<span style="width:4mm;align:left;float:none;clear:none;">
																<xsl:call-template name="LinkToLeftoverDataTableInline">
																	<xsl:with-param name="Desc">Line 6c - Dependent <xsl:number value="position()"/> Name Control</xsl:with-param>
																	<xsl:with-param name="TargetNode" select="DependentNameControlTxt"/>
																</xsl:call-template>
															</span>
														</td>
														<!-- Column 2 -->
														<td class="styTableCell" style="text-align:center;width:26.2mm;height:4mm;float:left;clear:none;border-right-width:1px;">
															<xsl:choose>
																<xsl:when test="DiedLiteralCd">
																	<xsl:call-template name="PopulateText">
																		<xsl:with-param name="TargetNode" select="DiedLiteralCd"/>
																	</xsl:call-template>
																</xsl:when>
																<xsl:otherwise>
																	<xsl:call-template name="PopulateSSN">
																		<xsl:with-param name="TargetNode" select="DependentSSN"/>
																	</xsl:call-template>
																</xsl:otherwise>
															</xsl:choose>
														</td>
														<!-- Column 3 -->
														<td class="styTableCell" style="width:18.6mm;height:4mm;text-align:left;float:left;clear:none;border-right-width:1px;">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="DependentRelationshipCd"/>
																<xsl:with-param name="BackupName">IRS1040DependentInformationsDependentRelationship</xsl:with-param>
															</xsl:call-template>
														</td>
														<!-- Column 4 -->
														<td class="styTableCell" style="text-align:center;width:24.6mm;height:4mm;float:left;clear:none;border-right-width:0px;">
															<!-- Checkbox -->
															<input type="Checkbox" class="styCkbox">
																<xsl:call-template name="PopulateCheckbox">
																	<xsl:with-param name="TargetNode" select="EligibleForChildTaxCreditInd"/>
																	<xsl:with-param name="BackupName">IRS1040DependentInformations<xsl:number value="position()"/>EligibleForChildTaxCreditInd</xsl:with-param>
																</xsl:call-template>
															</input>
															<label>
																<xsl:call-template name="PopulateLabel">
																	<xsl:with-param name="TargetNode" select="EligibleForChildTaxCreditInd"/>
																	<xsl:with-param name="BackupName">IRS1040DependentInformations<xsl:number value="position()"/>EligibleForChildTaxCreditInd</xsl:with-param>
																</xsl:call-template>
															</label>
														</td>
													</tr>
												</xsl:for-each>
											</xsl:if>
											<!-- Table Filler Rows -->
											<xsl:if test="count($FormData/DependentDetail) &lt; 1 or ((count($FormData/DependentDetail) &gt; 4) and ($Print = $Separated))">
												<tr>
													<td class="styTableCell" style="width:49.4mm;text-align:left;height:4mm;float:left;clear:none;border-right-width:1px;">
														<xsl:call-template name="PopulateAdditionalDataTableMessage">
															<xsl:with-param name="TargetNode" select="$FormData/DependentDetail"/>
														</xsl:call-template>
														<span class="styTableCellPad"/>
													</td>
													<td class="styTableCell" style="width:26.2mm;height:4mm;float:left;clear:none;border-right-width:1px;">
														<span class="styTableCellPad"/>
													</td>
													<td class="styTableCell" style="width:18.6mm;height:4mm;float:left;clear:none;border-right-width:1px;">
														<span class="styTableCellPad"/>
													</td>
													<td class="styTableCell" style="width:24.6mm;height:4mm;float:left;clear:none;border-right-width:0px;">
														<span class="styTableCellPad"/>
													</td>
												</tr>
											</xsl:if>
											<xsl:if test="count($FormData/DependentDetail) &lt; 2 or ((count($FormData/DependentDetail) &gt; 4) and ($Print = $Separated))">
												<tr>
													<td class="styTableCell" style="width:49.4mm;height:4mm;float:left;clear:none;border-right-width:1px;">
														<span class="styTableCellPad"/>
													</td>
													<td class="styTableCell" style="width:26.2mm;height:4mm;float:left;clear:none;border-right-width:1px;">
														<span class="styTableCellPad"/>
													</td>
													<td class="styTableCell" style="width:18.6mm;height:4mm;float:left;clear:none;border-right-width:1px;">
														<span class="styTableCellPad"/>
													</td>
													<td class="styTableCell" style="width:24.6mm;height:4mm;float:left;clear:none;border-right-width:0px;">
														<span class="styTableCellPad"/>
													</td>
												</tr>
											</xsl:if>
											<xsl:if test="count($FormData/DependentDetail) &lt; 3 or ((count($FormData/DependentDetail) &gt; 4) and ($Print = $Separated))">
												<tr>
													<td class="styTableCell" style="width:49.4mm;height:4mm;float:left;clear:none;border-right-width:1px;">
														<span class="styTableCellPad"/>
													</td>
													<td class="styTableCell" style="width:26.2mm;height:4mm;float:left;clear:none;border-right-width:1px;">
														<span class="styTableCellPad"/>
													</td>
													<td class="styTableCell" style="width:18.6mm;height:4mm;float:left;clear:none;border-right-width:1px;">
														<span class="styTableCellPad"/>
													</td>
													<td class="styTableCell" style="width:24.6mm;height:4mm;float:left;clear:none;border-right-width:0px;">
														<span class="styTableCellPad"/>
													</td>
												</tr>
											</xsl:if>
											<xsl:if test="count($FormData/DependentDetail) &lt; 4 or ((count($FormData/DependentDetail) &gt; 4) and ($Print = $Separated))">
												<tr>
													<td class="styTableCell" style="width:49.4mm;height:4mm;float:left;clear:none;border-right-width:1px;">
														<span class="styTableCellPad"/>
													</td>
													<td class="styTableCell" style="width:26.2mm;height:4mm;float:left;clear:none;border-right-width:1px;">
														<span class="styTableCellPad"/>
													</td>
													<td class="styTableCell" style="width:18.6mm;height:4mm;float:left;clear:none;border-right-width:1px;">
														<span class="styTableCellPad"/>
													</td>
													<td class="styTableCell" style="width:24.6mm;height:4mm;float:left;clear:none;border-right-width:0px;">
														<span class="styTableCellPad"/>
													</td>
												</tr>
											</xsl:if>
											<!-- End of filler rows -->
										</tbody>
									</table>
								</div>
							</div>
							<!-- Set Initial Height of Above Table -->
							<!-- xsl:call-template name="SetInitialDynamicTableHeight">
                <xsl:with-param name="TargetNode" select="$FormData/DependentInformations"/>
                <xsl:with-param name="containerHeight" select="4"/>
                <xsl:with-param name="containerID" select=" 'depdContainerId' "/>
              </xsl:call-template -->
							<!-- Generated Table (End) -->
							<!-- End Dependents table -->
							<div style="width:127mm;height:4mm;padding-top:1mm;">
								<div class="styLNLeftNumBox" style="width:4mm;padding-left:2mm;">d</div>
								<div style="float:left;clear:none;padding-left:1mm;">
									<div style="width:120mm;padding-left:0mm;float:left;clear:none;">
										<span style="float:left;padding-top:.5mm;clear:none;">
                              Total number of exemptions claimed
                              </span>
										<span class="styDotLn" style="padding-top:.5mm;float:right;padding-right:2mm;">..................</span>
									</div>
								</div>
							</div>
						</div>
						<!-- Boxes checked area -->
						<div style="width:34mm;height:8mm;float:left;clear:none;">
							<div style="width:26mm;float:left;clear:none;">
								<b>Boxes checked<br/>
                        on 6a and 6b</b>
							</div>
							<div class="styBB" style="padding-top:2mm;text-align:right;float:right;clear:none;width:8mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalExemptPrimaryAndSpouseCnt"/>
									<xsl:with-param name="BackupName">IRS1040TotalExemptPrimaryAndSpouseCnt</xsl:with-param>
								</xsl:call-template>
							</div>
							<div style="width:26mm;float:left;clear:none;">
								<b>No. of children<br/>
                        on 6c who:<br/>
									<img src="{$ImagePath}/1040_Bullet_Round.gif" alt="Round bullet image"/>
									<span style="width:5px;"/>
                        lived with you</b>
							</div>
							<div class="styBB" style="padding-top:6mm;text-align:right;float:right;clear:none;width:8mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/ChldWhoLivedWithYouCnt"/>
									<xsl:with-param name="BackupName">IRS1040NumOfChildWhoLivedWithYouCnt</xsl:with-param>
								</xsl:call-template>
							</div>
							<div style="width:26mm;float:left;clear:none;">
								<img src="{$ImagePath}/1040_Bullet_Round.gif" alt="Round bullet image"/>
								<span style="width:5px;"/>
								<b>did not live with
                        you due to divorce
                        or separation<br/>
                        (see instructions)</b>
							</div>
							<div class="styBB" style="padding-top:8mm;text-align:right;float:right;clear:none;width:8mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/ChldNotLivingWithYouCnt"/>
									<xsl:with-param name="BackupName">IRS1040NumOfChildNotLivingWithYouCnt</xsl:with-param>
								</xsl:call-template>
							</div>
							<div style="width:26mm;padding-top:1mm;float:left;clear:none;">
								<b>Dependents on 6c<br/>
                        not entered above</b>
							</div>
							<div class="styBB" style="padding-top:2mm;text-align:right;float:right;clear:none;width:8mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/OtherDependentsListedCnt"/>
									<xsl:with-param name="BackupName">IRS1040NumOfOtherDepdListedCnt</xsl:with-param>
								</xsl:call-template>
							</div>
							<div style="width:26mm;padding-top:2mm;float:left;clear:none;">
								<b>Add numbers on
                     lines above</b>
								<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
							</div>
							<div class="styDblBox" style="padding-top:4mm;text-align:right;float:right;clear:none;width:8mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalExemptionsCnt"/>
									<xsl:with-param name="BackupName">IRS1040TotalExemptionsCnt</xsl:with-param>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- End Exemptions area -->
					<!-- Income -->
					<!--<div class="styBB" style="width:187mm;">-->
					<div style="width:187mm;border-style: solid; border-color: black;border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;">
						<div style="width:24.5mm;float:left;clear:none;">
							<div style="padding-top:4mm;padding-bottom:4mm;">
								<span class="styMainTitle" style="font-size:11pt;">Income</span>
							</div>
							<span class="styBoldText">
						 Attach Form(s)
						 W-2 here. Also
						 attach Forms<span style="width:4mm;"/>
                         W-2G and<span style="width:8mm;"/>
                         1099-R if tax<span style="width:4mm;"/>
                         was withheld.</span>
							<br/>
							<br/>
							<br/>
							<br/>        
                     If you did not<br/>
                     get a W-2,<br/>
                     see instructions.<br/>
							<br/>
							<br/>
						</div>
						<div style="width:162.5mm;float:left;clear:none;">
							<!-- Line 7 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;padding-left:2.5mm;">7</div>
								<div style="width:118mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
                           Wages, salaries, tips, etc. Attach Form(s) W-2
                           </span>
									<div style="float:left;clear:none;padding-left:1mm">
										<!-- Form to Form Link -->
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/WagesSalariesAndTipsAmt"/>
										</xsl:call-template>
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Line 7 - Wages Not Shown Literal Only Code</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$FormData/WagesSalariesAndTipsAmt/@wagesNotShownLitOnlyCd"/>
										</xsl:call-template>
									</div>
									<span class="styDotLn" style="float:right;padding-right:2mm;">...........</span>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="">7</div>
									<div class="styLNAmountBox" style="">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/WagesSalariesAndTipsAmt"/>
											<xsl:with-param name="BackupName">IRS1040WagesSalariesAndTipsAmt</xsl:with-param>
										</xsl:call-template>
									</div>
								</span>
							</div>
							<!--End Line 7 -->
							<!-- Line 8a -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;padding-left:2.5mm;">8a</div>
								<div style="width:116.5mm;padding-top:.5mm;padding-left:1.5mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
										<span class="styBoldText">Taxable</span> interest. Attach Schedule B if required
                           </span>
									<div style="float:left;clear:none;padding-left:1mm">
										<!-- Form to Form Link -->
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/TaxableInterestAmt"/>
										</xsl:call-template>
									</div>
									<span class="styDotLn" style="float:right;padding-right:2mm;">...........</span>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="">8a</div>
									<div class="styLNAmountBox" style="">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TaxableInterestAmt"/>
											<xsl:with-param name="BackupName">IRS1040TaxableInterestAmt</xsl:with-param>
										</xsl:call-template>
									</div>
								</span>
							</div>
							<!--End Line 8a -->
							<!-- Line 8b -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;padding-left:4.25mm;">b</div>
								<div style="width:76.4mm;padding-top:.5mm;padding-left:1.5mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
										<b>Tax-exempt</b> interest. <b>Do not</b> include on line 8a
                           </span>
									<span class="styDotLn" style="float:right;padding-right:2mm;">...</span>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="height:16px;padding-bottom:0mm;padding-top:.5mm">8b</div>
									<div class="styLNAmountBox" style="height:16px;padding-bottom:0mm;border-right-width:0px;padding-top:.5mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TaxExemptInterestAmt"/>
											<xsl:with-param name="BackupName">IRS1040TaxExemptInterestAmt</xsl:with-param>
										</xsl:call-template>
									</div>
									<div class="styShadingCell" style="height:16px;width:8mm;border-left-width:0px;border-left-width:1px"/>
									<div class="styLNAmountBox" style="height:16px;border-bottom-width:0px; border-left-width:1px;"/>
								</span>
							</div>
							<!--End Line 8b -->
							<!-- Line 9a -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;padding-left:2.5mm;">9a</div>
								<div style="width:116.5mm;float:left;clear:none;padding-top:.5mm;padding-left:1.5mm;">
									<div style="width:77mm;padding-left:0mm;float:left;clear:none;">
                           
                           Ordinary dividends. Attach Schedule B if required
                           
                           <!--<div style="float:left;clear:none;padding-left:1mm;">-->
										<!--Form to Form Link-->
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/OrdinaryDividendsAmt"/>
										</xsl:call-template>
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Line 9a - Ordinary F8814 Code</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$FormData/OrdinaryF8814Cd"/>
										</xsl:call-template>
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Line 9a - Ordinary F8814 Amount</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$FormData/OrdinaryF8814Amt"/>
										</xsl:call-template>
									</div>
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.........</span>
									<!--<div class="styFixedUnderline" style="text-align:height:4mm;width:40.2mm;padding-top:0mm;padding-left:0mm;padding-right:0mm;border-style:dotted;font-size:6.5pt;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/OrdinaryF8814Cd"/>
											<xsl:with-param name="BackupName">IRS1040$FormData/OrdinaryF8814Cd</xsl:with-param>
										</xsl:call-template>,
										 <xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/OrdinaryF8814Amt"/>
											<xsl:with-param name="BackupName">IRS1040OrdinaryF8814Amt</xsl:with-param>
										</xsl:call-template>
									</div>-->
									<!--</div>-->
								</div>
								<span style="float:right;padding-right:0px;">
									<div class="styLNRightNumBox" style="">9a</div>
									<div class="styLNAmountBox" style="">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/OrdinaryDividendsAmt"/>
											<xsl:with-param name="BackupName">IRS1040OrdinaryDividendsAmt</xsl:with-param>
										</xsl:call-template>
									</div>
								</span>
							</div>
							<!--End Line 9a -->
							<!-- Line 9b -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;padding-left:4.25mm;">b</div>
								<div style="width:76.4mm;padding-top:.5mm;padding-left:.5mm;float:left;clear:none;">
									<span style="padding-left:1mm;float:left;clear:none;">
                           Qualified dividends 
                           </span>
									<span style="float:left;clear:none;">
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Line 9b - Qualified Form 8814 Code</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$FormData/QualifiedF8814Cd"/>
										</xsl:call-template>
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="TargetNode" select="$FormData/QualifiedF8814Amt"/>
											<xsl:with-param name="Desc">Line 9b - Qualified Form 8814 Amount</xsl:with-param>
										</xsl:call-template>
									</span>
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">..........</span>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="height:16px;padding-bottom:0mm;padding-top:.5mm;">9b</div>
									<div class="styLNAmountBox" style="border-right-width:0px;height:16px;padding-bottom:0mm;padding-top:.5mm;border-right-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/QualifiedDividendsAmt"/>
											<xsl:with-param name="BackupName">IRS1040QualifiedDividendsAmt</xsl:with-param>
										</xsl:call-template>
									</div>
									<div class="styShadingCell" style="height:16px;width:8mm;border-right-width:0px;border-left-width:1px;"/>
									<div class="styLNAmountBox" style="height:16px;border-left-width:0px;border-bottom-width:0px;border-left-width:1px;"/>
								</span>
							</div>
							<!--End Line 9b -->
							<!-- Line 10 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;">10</div>
								<div style="width:117.8mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
                           Taxable refunds, credits, or offsets of state and local income taxes 
                           </span>
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.......</span>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="">10</div>
									<div class="styLNAmountBox" style="">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/StateLocalIncomeTaxRefundAmt"/>
											<xsl:with-param name="BackupName">IRS1040StateLocalIncomeTaxRefundAmt</xsl:with-param>
										</xsl:call-template>
									</div>
								</span>
							</div>
							<!--End Line 10 -->
							<!-- Line 11 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;">11</div>
								<div style="width:117.8mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
                           Alimony received
                           </span>
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">......................</span>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="">11</div>
									<div class="styLNAmountBox" style="">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AlimonyReceivedAmt"/>
											<xsl:with-param name="BackupName">IRS1040AlimonyReceivedAmt</xsl:with-param>
										</xsl:call-template>
									</div>
								</span>
							</div>
							<!--End Line 11 -->
							<!-- Line 12 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;">12</div>
								<div style="width:117.8mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
                           Business income or (loss). Attach Schedule C or C-EZ
                           </span>
									<div style="float:left;clear:none;padding-left:1mm">
										<!-- Form to Form Link -->
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/BusinessIncomeLossAmt"/>
										</xsl:call-template>
									</div>
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.........</span>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="">12</div>
									<div class="styLNAmountBox" style="">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/BusinessIncomeLossAmt"/>
											<xsl:with-param name="BackupName">IRS1040BusinessIncomeLossAmt</xsl:with-param>
										</xsl:call-template>
									</div>
								</span>
							</div>
							<!--End Line 12 -->
							<!-- Line 13 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;">13</div>
								<div style="width:117.8mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
									<span style="float:left;clear:none;font-size:6pt">
                           Capital gain or (loss). Attach Schedule D if required.</span>
									<div style="float:left;clear:none;padding-left:1mm">
										<!-- Form to Form Link -->
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/CapitalGainLossAmt"/>
										</xsl:call-template>
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Line 13 - Form F8814 Code</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$FormData/Form8814Cd"/>
										</xsl:call-template>
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="TargetNode" select="$FormData/Form8814Amt"/>
											<xsl:with-param name="Desc">Line 13 - Form F8814 Amount</xsl:with-param>
										</xsl:call-template>
									</div>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/CapitalDistributionInd"/>
											<xsl:with-param name="BackupName">IRS1040CapitalDistributionInd</xsl:with-param>
										</xsl:call-template>
										<span style="float:left;clear:none;font-size:6.5pt;padding-left:.5mm">
										If not required, check here</span>
										<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
										<span style="width:15px;"/>
									</label>
									<!-- Checkbox -->
									<input type="Checkbox" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/CapitalDistributionInd"/>
											<xsl:with-param name="BackupName">IRS1040CapitalDistributionInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="">13</div>
									<div class="styLNAmountBox" style="">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CapitalGainLossAmt"/>
											<xsl:with-param name="BackupName">IRS1040CapitalGainLossAmt</xsl:with-param>
										</xsl:call-template>
									</div>
								</span>
							</div>
							<!--End Line 13 -->
							<!-- Line 14 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;">14</div>
								<div style="width:117.8mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
                           Other gains or (losses). Attach Form 4797 
                           <xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/OtherGainLossAmt"/>
										</xsl:call-template>
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Line 14 - Form 4684 Code</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$FormData/OtherGainLossAmt/@form4684Cd"/>
										</xsl:call-template>
									</span>
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">............</span>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="">14</div>
									<div class="styLNAmountBox" style="">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/OtherGainLossAmt"/>
										</xsl:call-template>
									</div>
								</span>
							</div>
							<!--End Line 14 -->
							<!-- Line 15 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:5mm;padding-top:1mm;">15a</div>
								<div style="width:116.2mm;padding-top:1mm;padding-left:1.5mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
										<span style="width:25.1mm;float:left;clear:none;">
										IRA distributions
									</span>
										<!-- Form to Form Link -->
										<!-- **** -->
										<span class="styDotLn" style="float:left;clear:none;padding-right:1mm">.</span>
										<div class="styLNRightNumBox" style="width:6mm;padding-bottom:0mm;padding-top:.5mm">15a</div>
										<div class="styLNAmountBox" style="border-right-width:1px;padding-bottom:0mm;padding-top:.5mm">
											<!-- **** -->
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/IRADistributionsAmt"/>
												<xsl:with-param name="BackupName">IRS1040IRADistributionsAmt</xsl:with-param>
											</xsl:call-template>
										</div>
										<!-- **** -->
										<span style="width:3mm;"/>
										<span class="styBoldText">b</span> Taxable amount
									<span style="width:4px;"/>
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="TargetNode" select="$FormData/IRADistributionsLiteralCd"/>
											<xsl:with-param name="Desc">Line 15b - IRA Distributions Literal Code</xsl:with-param>
										</xsl:call-template>
										<span style="width:2px;"/>
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/TaxableIRAAmt"/>
										</xsl:call-template>
									</span>
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">...</span>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="padding-top:1.3mm;">15b</div>
									<div class="styLNAmountBox" style="padding-top:1.3mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TaxableIRAAmt"/>
											<xsl:with-param name="BackupName">IRS1040TaxableIRAAmt</xsl:with-param>
										</xsl:call-template>
									</div>
								</span>
							</div>
							<!--End Line 15 -->
							<!-- Line 16 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;padding-top:0.5mm;">16a</div>
								<div style="width:116.2mm;padding-left:1.5mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
										<span style="width:27mm;font-size:6pt;float:left;clear:none;padding-top:0.7mm;">
										Pensions and annuities
									</span>
										<div class="styLNRightNumBox" style="width:6mm;padding-bottom:0mm;padding-top:0mm">16a</div>
										<div class="styLNAmountBox" style="border-right-width:1px;padding-bottom:0mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/PensionsAnnuitiesAmt"/>
												<xsl:with-param name="BackupName">IRS1040PensionsAnnuitiesAmt</xsl:with-param>
											</xsl:call-template>
										</div>
										<span style="width:3mm;"/>
										<span style="padding-top:1mm;">
											<span class="styBoldText">b</span> Taxable amount</span>
										<span style="width:4px;"/>
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Line 16b - Pensions Annuities Literal Code</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$FormData/TotalTaxablePensionsAmt/@pensionsAnnuitiesLiteralCd"/>
										</xsl:call-template>
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Line 16b - Foreign Employer Pension Code</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$FormData/ForeignEmployerPensionCd"/>
										</xsl:call-template>
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Line 16b - Taxable Foreign Pensions Total Amount</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$FormData/TaxableForeignPensionsTotalAmt"/>
										</xsl:call-template>
									</span>
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;padding-top:0.8mm;">..</span>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="padding-top:.5mm;padding-top:1.3mm;">16b</div>
									<div class="styLNAmountBox" style="padding-top:1.3mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalTaxablePensionsAmt"/>
											<xsl:with-param name="BackupName">IRS1040TotalTaxablePensionsAmt</xsl:with-param>
										</xsl:call-template>
									</div>
								</span>
							</div>
							<!--End Line 16 -->
							<!-- Line 17 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;padding-top:0px;">17</div>
								<div style="width:117.8mm;padding-left:3mm;float:left;clear:none;">
									<span style="padding-top:0.5mm;float:left;clear:none;font-size:6pt">
                           Rental real estate, royalties, partnerships, S corporations, trusts, etc. 
                             Attach Schedule E</span>
									<div style="float:left;clear:none;padding-left:1mm">
										<!-- Form to Form Link -->
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/RentalRealEstateIncomeLossAmt"/>
										</xsl:call-template>
									</div>
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm">....</span>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="">17</div>
									<div class="styLNAmountBox" style="">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/RentalRealEstateIncomeLossAmt"/>
											<xsl:with-param name="BackupName">IRS1040RentalRealESTAmt</xsl:with-param>
										</xsl:call-template>
									</div>
								</span>
							</div>
							<!--End Line 17 -->
							<!-- Line 18 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;">18</div>
								<div style="width:117.8mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
                           Farm income or (loss). Attach Schedule F  
                           <xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/NetFarmProfitLossAmt"/>
										</xsl:call-template>
									</span>
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.............</span>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="">18</div>
									<div class="styLNAmountBox" style="">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NetFarmProfitLossAmt"/>
										</xsl:call-template>
									</div>
								</span>
							</div>
							<!--End Line 18 -->
							<!-- Line 19 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;">19</div>
								<div style="width:117.8mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
									<span style="width:40mm;float:left;clear:none;">
                           Unemployment compensation
                           </span>
									<div style="float:left;clear:none;">
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Line 19 - Repayment Code</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$FormData/UnemploymentCompAmt/@repaymentCd"/>
										</xsl:call-template>
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Line 19 - Repayment Amount</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$FormData/UnemploymentCompAmt/@repaymentAmt"/>
										</xsl:call-template>
									</div>
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">................</span>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="">19</div>
									<div class="styLNAmountBox" style="">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/UnemploymentCompAmt"/>
											<xsl:with-param name="BackupName">IRS1040UnemploymentCompAmt</xsl:with-param>
										</xsl:call-template>
									</div>
								</span>
							</div>
							<!--End Line 19 -->
							<!-- Line 20 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;padding-top:1mm;">20a</div>
								<div style="width:116.2mm;padding-top:1mm;padding-left:1.5mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
                           Social security benefits
                           </span>
									<div style="float:left;clear:none;">
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Line 20a - Social Security Benefits Code</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$FormData/SocSecBnftAmt/@socSecBnftCd"/>
										</xsl:call-template>
									</div>
									<div style="float:left;padding-left:.5mm;">
										<div class="styLNRightNumBox" style="height:2mm;width:6mm;padding-bottom:0mm;">20a</div>
										<div class="styLNAmountBox" style="border-right-width:1px;height:2mm;padding-bottom:0mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/SocSecBnftAmt"/>
												<xsl:with-param name="BackupName">IRS1040SocSecBnftAmt</xsl:with-param>
											</xsl:call-template>
										</div>
										<span style="width:3mm;"/>
										<span class="styBoldText">b</span> Taxable amount
											<span style="width:4px;"/>
									</div>
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">...</span>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="padding-top:1mm;">20b</div>
									<div class="styLNAmountBox" style="padding-top:1mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TaxableSocSecAmt"/>
											<xsl:with-param name="BackupName">IRS1040TaxableSocSecAmt</xsl:with-param>
										</xsl:call-template>
									</div>
								</span>
							</div>
							<!--End Line 20 -->
							<!-- Line 21 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;">21</div>
								<div style="width:117.8mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
										Other income. List type and amount 
									</span>
									<div style="float:left;clear:none;padding-left:1mm">
										<!-- Form to Form Link -->
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/TotalOtherIncomeAmt"/>
										</xsl:call-template>
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/OtherIncomeLitCd"/>
										</xsl:call-template>
									</div>
									<div class="styUnderlineAmount" style="width:58mm;float:left;clear:none;padding-top:0mm;padding-left:3mm;border-style:dotted;text-align:left;">
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Line 21 - Protective Sec108i ELCRecord Indicator</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$FormData/ProtectiveSec108iELCRecordInd"/>
										</xsl:call-template>
										<!-- what goes here? -->
									</div>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="padding-top:1mm;">21</div>
									<div class="styLNAmountBox" style="padding-top:1mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalOtherIncomeAmt"/>
											<xsl:with-param name="BackupName">IRS1040TotalOtherIncomeAmt</xsl:with-param>
										</xsl:call-template>
									</div>
								</span>
							</div>
							<!--End Line 21 -->
							<!-- Line 22 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;">22</div>
								<div style="width:117.8mm;padding-left:3mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
                           Combine the amounts 
                              <span class="styAgency" style="font-size:8pt;">in the far right column for lines 7 through 21.</span> This is your 
                              <b> total income</b>
										<span style="width:4px;"/>
										<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
									</span>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="border-bottom-width:0px;">22</div>
									<div class="styLNAmountBox" style="border-bottom-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalIncomeAmt"/>
											<xsl:with-param name="BackupName">IRS1040TotalIncomeAmt</xsl:with-param>
										</xsl:call-template>
									</div>
								</span>
								<!--End Line 22 -->
							</div>
						</div>
					</div>
					<!-- End Income -->
					<!-- AGI -->
					<div style="width:187mm; border-style:solid; border-color: black; border-width: 0px 0px 1px 0px;">
						<div style="width:24.5mm;float:left;clear:none;">
							<div style="padding-top:4mm;padding-bottom:4mm;">
								<span class="styMainTitle" style="font-size:11pt;">
                     Adjusted
                     Gross
                     Income
                     </span>
							</div>
						</div>
						<div style="width:162.5mm;float:left;clear:none;">
							<!-- Line 23 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;padding-top:1mm;padding-left:1mm;padding-bottom:0mm;">23</div>
								<div style="width:77mm;float:left;clear:none;padding-top:1mm;padding-left:3mm;">
									<span style="float:left;clear:none;">
										Educator expenses
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Line 23 - Educator Literal Code</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$FormData/EducatorExpensesAmt/@educatorLiteralCd"/>
										</xsl:call-template>
									</span>
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">............</span>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="height:19px;padding-top:1mm;">23</div>
									<div class="styLNAmountBox" style="height:19px;padding-top:1mm;border-right-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/EducatorExpensesAmt"/>
											<xsl:with-param name="BackupName">IRS1040EducatorExpensesAmt</xsl:with-param>
										</xsl:call-template>
									</div>
									<div class="styShadingCell" style="width:8mm;height:19px;border-right-width:0px;border-left-width:1px;"/>
									<div class="styLNAmountBox" style="height:19px;border-bottom-width:0px;border-left-width:1px;"/>
								</span>
							</div>
							<div>
								<!--End Line 23 -->
								<!-- Line 24 -->
								<div style="width:162.5mm;">
									<div class="styLNLeftNumBox" style="width:4mm;padding-left:1mm;">24</div>
									<div style="width:76mm;float:left;clear:none;padding-top:1mm;padding-left:3mm;">
										<span style="float:left;clear:none;font-size:6pt">
                           Certain business expenses of reservists, performing artists, and<br/>
                           fee-basis government officials. Attach Form 2106 or 2106-EZ
                               <!-- Form to Form Link -->
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/BusExpnsReservistsAndOthersAmt"/>
											</xsl:call-template>
										</span>
									</div>
									<span style="float:right;">
										<div class="styLNRightNumBox" style="height:7.2mm;padding-top:2.8mm;">24</div>
										<div class="styLNAmountBox" style="height:7.2mm;padding-top:2.8mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/BusExpnsReservistsAndOthersAmt"/>
												<xsl:with-param name="BackupName">IRS1040BusExpnsReservistsAndOthersAmt</xsl:with-param>
											</xsl:call-template>
										</div>
										<div class="styShadingCell" style="height:7.2mm;width:8mm;padding-top:3.8mm;border-left-width:1px;"/>
										<div class="styLNAmountBox" style="height:7.2mm;border-bottom-width:0px;border-left-width:1px;"/>
									</span>
								</div>
							</div>
							<!--End Line 24 -->
							<!-- Line 25 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;padding-left:1mm;padding-top:1mm;">25</div>
								<div style="width:77mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
                           Health savings account deduction. 
                              <span class="styAgency" style="font-size:8pt;">Attach Form 8889 </span>
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/HealthSavingsAccountDedAmt"/>
										</xsl:call-template>
									</span>
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.</span>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="height:19px;padding-top:1mm;">25</div>
									<div class="styLNAmountBox" style="height:19px;padding-top:1mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/HealthSavingsAccountDedAmt"/>
										</xsl:call-template>
									</div>
									<div class="styShadingCell" style="height:19px;width:8mm;padding-top:1.8mm;border-left-width:1px;"/>
									<div class="styLNAmountBox" style="height:19px;border-bottom-width:0px;border-left-width:1px;"/>
								</span>
							</div>
							<!--End Line 25 -->
							<!-- Line 26 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;padding-left:1mm;">26</div>
								<div style="width:77mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
                           Moving expenses. Attach Form 3903
                           <xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/MovingExpenseAmt"/>
										</xsl:call-template>
									</span>
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.....</span>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="height:19px;padding-top:1mm;">26</div>
									<div class="styLNAmountBox" style="height:19px;padding-top:1mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/MovingExpenseAmt"/>
										</xsl:call-template>
									</div>
									<div class="styShadingCell" style="height:19px;width:8mm;padding-top:1.8mm;border-right-width:0px;"/>
									<div class="styLNAmountBox" style="height:19px;border-bottom-width:0px;border-left-width:1px;"/>
								</span>
							</div>
							<!--End Line 26 -->
							<!-- Line 27 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;padding-left:1mm;padding-top:1mm;">27</div>
								<div style="width:77mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
										<span class="styAgency" style="font-size:8pt;">
										Deductible part of self-employment tax. 
										Attach Schedule SE</span>
										<!-- Form to Form Link -->
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/DeductibleSelfEmploymentTaxAmt"/>
										</xsl:call-template>
									</span>
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.</span>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="height:19px;padding-top:1mm;">27</div>
									<div class="styLNAmountBox" style="height:19px;padding-top:1mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/DeductibleSelfEmploymentTaxAmt"/>
										</xsl:call-template>
									</div>
									<div class="styShadingCell" style="height:19px;width:8mm;padding-top:1.8mm;border-right-width:0px;"/>
									<div class="styLNAmountBox" style="height:19px;border-bottom-width:0px;border-left-width:1px;"/>
								</span>
							</div>
							<!--End Line 27 -->
							<!-- Line 28 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;padding-left:1mm;">28</div>
								<div style="width:77mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
                           Self-employed SEP, SIMPLE, and qualified plans
                           </span>
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">..</span>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="height:19px;padding-top:1mm;">28</div>
									<div class="styLNAmountBox" style="height:19px;padding-top:1mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SelfEmpldSepSimpleQlfyPlansAmt"/>
											<xsl:with-param name="BackupName">IRS1040SelfEmpldSepSimpleQlfyPlansAmt</xsl:with-param>
										</xsl:call-template>
									</div>
									<div class="styShadingCell" style="height:19px;width:8mm;padding-top:1.8mm;border-right-width:0px;"/>
									<div class="styLNAmountBox" style="height:19px;border-bottom-width:0px;border-left-width:1px;"/>
								</span>
							</div>
							<!--End Line 28 -->
							<!-- Line 29 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;padding-left:1mm;">29</div>
								<div style="width:77mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
                           Self-employed health insurance deduction 
									</span>
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">....</span>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="height:19px;padding-top:1mm;">29</div>
									<div class="styLNAmountBox" style="height:19px;padding-top:1mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SelfEmpldHealthInsDedAmt"/>
											<xsl:with-param name="BackupName">IRS1040SelfEmpldHealthInsDedAmt</xsl:with-param>
										</xsl:call-template>
									</div>
									<div class="styShadingCell" style="height:19px;width:8mm;padding-top:1.8mm;border-right-width:0px;"/>
									<div class="styLNAmountBox" style="height:19px;border-bottom-width:0px;border-left-width:1px;"/>
								</span>
							</div>
							<!--End Line 29 -->
							<!-- Line 30 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;padding-left:1mm;">30</div>
								<div style="width:77mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
                           Penalty on early withdrawal of savings
					   </span>
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">......</span>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="height:19px;padding-top:1mm;">30</div>
									<div class="styLNAmountBox" style="height:19px;padding-top:1mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PnltyOnErlyWthdrwOfSavingsAmt"/>
											<xsl:with-param name="BackupName">IRS1040PnltyOnErlyWthdrwOfSavingsAmt</xsl:with-param>
										</xsl:call-template>
									</div>
									<div class="styShadingCell" style="height:19px;width:8mm;padding-top:1.8mm;border-right-width:0px;"/>
									<div class="styLNAmountBox" style="height:19px;border-bottom-width:0px;border-left-width:1px;"/>
								</span>
							</div>
							<!--End Line 30 -->
							<!-- Line 31a -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:2mm;padding-left:1mm;">31a</div>
								<div style="width:76mm;padding-top:.5mm;padding-left:1mm;float:left;clear:none;">
									<div style="width:48mm;float:left;clear:none;">
                               Alimony paid
                               <span style="width:4px;"/>
										<b>b</b> Recipient's SSN
                              <img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
									</div>
									<div class="styUnderlineAmount" style="width:22mm;padding-top:0mm;padding-bottom:0mm;                            text-align:center;height:2mm;">
										<xsl:if test="count($FormData/AlimonyAmountGrp) = 1">
											<xsl:call-template name="PopulateSSN">
												<xsl:with-param name="TargetNode" select="$FormData/AlimonyAmountGrp/RecipientSSN"/>
												<xsl:with-param name="BackupName">IRS1040AlimonyAmountGrpRecipientsSSN</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="count($FormData/AlimonyAmountGrp) &gt; 1">
											<xsl:call-template name="LinkToLeftoverDataTableInline">
												<xsl:with-param name="Desc">Line 31a - Alimony Paid and SSN</xsl:with-param>
												<xsl:with-param name="TargetNode" select="$FormData/AlimonyAmountGrp"/>
											</xsl:call-template>
										</xsl:if>
									</div>
									<xsl:if test="count($FormData/AlimonyAmountGrp) = 1">
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Line 31a - Alimony Amount</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$FormData/AlimonyAmountGrp/AlimonyPaidAmt"/>
										</xsl:call-template>
									</xsl:if>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="height:20px;padding-top:1mm;">31a</div>
									<div class="styLNAmountBox" style="height:20px;padding-top:1mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalAlimonyPaidAmt"/>
											<xsl:with-param name="BackupName">IRS1040TotalAlimonyPaidAmt</xsl:with-param>
										</xsl:call-template>
									</div>
									<div class="styShadingCell" style="height:20px;width:8mm;border-bottom-width:0px;padding-top:1.8mm;border-right-width:0px;"/>
									<div class="styLNAmountBox" style="height:20px;border-bottom-width:0px;border-left-width:1px;"/>
								</span>
							</div>
							<!--End Line 31a -->
							<!-- Line 32 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;padding-left:1mm;">32</div>
								<div style="width:77mm;float:left;clear:none;padding-top:.5mm;padding-left:3mm;">
									<div style="width:25mm;padding-left:0mm;float:left;clear:none;">
                            IRA deduction 
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Line 32 - IRA Deduction Code</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$FormData/IRADeductionCd"/>
									</xsl:call-template>
									</div>
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">............</span>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="height:19px;padding-top:1mm;">32</div>
									<div class="styLNAmountBox" style="height:19px;padding-top:1mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRADeductionAmt"/>
											<xsl:with-param name="BackupName">IRS1040IRADeductionAmt</xsl:with-param>
										</xsl:call-template>
									</div>
									<div class="styShadingCell" style="height:19px;width:8mm;border-top-width:0px;padding-top:1.8mm;border-right-width:0px;"/>
									<div class="styLNAmountBox" style="height:19px;border-bottom-width:0px;border-left-width:1px;"/>
								</span>
							</div>
							<!--End Line 32 -->
							<!-- Line 33 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;padding-left:1mm;">33</div>
								<div style="width:77mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
                           Student loan interest deduction 
                           </span>
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.......</span>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="height:19px;padding-top:1mm;">33</div>
									<div class="styLNAmountBox" style="height:19px;padding-top:1mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/StudentLoanInterestDedAmt"/>
											<xsl:with-param name="BackupName">IRS1040StudentLoanInterestDedAmt</xsl:with-param>
										</xsl:call-template>
									</div>
									<div class="styShadingCell" style="height:19px;width:8mm;padding-top:1.8mm;border-right-width:0px;"/>
									<div class="styLNAmountBox" style="height:19px;border-bottom-width:0px;border-left-width:1px;"/>
								</span>
							</div>
							<!--End Line 33 -->
							<!-- Line 34 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;padding-left:1mm;">34</div>
								<div style="width:77mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
							   Tuition and fees. Attach Form 8917
							   <xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/TuitionAndFeesDedAmt"/>
										</xsl:call-template>
									</span>
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.....</span>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="height:19px;padding-top:1mm;">34</div>
									<div class="styLNAmountBox" style="height:19px;padding-top:1mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TuitionAndFeesDedAmt"/>
										</xsl:call-template>
									</div>
									<div class="styShadingCell" style="height:19px;width:8mm;padding-top:1.8mm;border-right-width:0px;"/>
									<div class="styLNAmountBox" style="height:19px;border-bottom-width:0px;border-left-width:1px;"/>
								</span>
							</div>
							<!--End Line 34 -->
							<!-- Line 35 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;padding-left:1mm;padding-top:1mm;">35</div>
								<div style="width:77mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
										<span class="styAgency" style="font-size:8pt;">
                              Domestic production activities deduction. 
                              Attach Form 8903 </span>
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/DomesticProductionActDedAmt"/>
										</xsl:call-template>
										<span style="width:2px;"/>
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Line 35 - Domestic Production Activities Literal Code</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$FormData/DomesticProductionActDedAmt/@domesticProductionActLitCd"/>
										</xsl:call-template>
									</span>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="padding-top:1.2mm;">35</div>
									<div class="styLNAmountBox" style="padding-top:1.2mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/DomesticProductionActDedAmt"/>
										</xsl:call-template>
									</div>
									<div class="styShadingCell" style="height:4.5mm;width:8mm;border-bottom-width:1px;padding-top:1.8mm;border-right-width:0px;"/>
									<div class="styLNAmountBox" style="height:4.9mm;border-bottom-width:0px;border-left-width:1px;"/>
								</span>
							</div>
							<!--End Line 35 -->
							<!-- Line 36 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;">36</div>
								<div style="width:117.8mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
                           Add lines 23 through 35
                              <!-- Form to Form Link -->
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/OtherAdjustmentsTotalAmt"/>
										</xsl:call-template>
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Line 36 - Other Adjustments Total Amount</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$FormData/OtherAdjustmentsTotalAmt"/>
										</xsl:call-template>
									</span>
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">..................</span>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="padding-top:1mm;">36</div>
									<div class="styLNAmountBox" style="padding-top:1mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalAdjustmentsAmt"/>
											<xsl:with-param name="BackupName">IRS1040TotalAdjustmentsAmt</xsl:with-param>
										</xsl:call-template>
									</div>
								</span>
							</div>
							<!--End Line 36 -->
							<!-- Line 37 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;">37</div>
								<div style="width:117.8mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
                           Subtract line 36 from line 22. This is your <b>adjusted gross income</b>
									</span>
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">....
									<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
									</span>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="border-bottom-width:0px;">37</div>
									<div class="styLNAmountBox" style="border-bottom-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AdjustedGrossIncomeAmt"/>
											<xsl:with-param name="BackupName">IRS1040AdjustedGrossIncomeAmt</xsl:with-param>
										</xsl:call-template>
									</div>
								</span>
							</div>
							<!--End Line 37 -->
						</div>
					</div>
					<!-- end AGI -->
					<!-- page 1 footer -->
					<div class="pageEnd" style="width:187mm;">
						<span class="styBoldText" style="width:127mm;padding-top:.5mm;float:left;clear:none;font-size:6.5pt;">For Disclosure, Privacy Act, and Paperwork Reduction Act Notice, see separate instructions.</span>
						<span class="styNormalText" style="padding-top:.5mm;float:left;clear:none;">Cat. No. 11320B</span>
						<span style="float:right;clear:none;">
               Form <span class="styBoldText" style="font-size:10pt;">1040</span> (2014)
               </span>
					</div>
					<!-- end page 1 footer -->
					<!-- page 2 -->
					<div class="styTBB" style="width:187mm;padding-top:.5mm;">
						<span class="" style="float:left;clear:none;">Form 1040 (2014)</span>
						<span style="float:right;clear:none;">Page <span class="styBoldText" style="font-size:8pt;">2</span>
						</span>
					</div>
					<!-- tax and credits -->
					<div class="styBB" style="width:187mm;padding-top:0mm;padding-bottom:0mm;">
						<div style="width:24.5mm;float:left;clear:none;">
							<div style="padding-top:10px;padding-bottom:9px;">
								<div class="styMainTitle" style="font-size:11pt;">
									Tax and<br/>
									Credits
								</div>
							</div>
							<div class="styGenericDiv" style="width:24.5mm;padding-left:8px;border-color:black;border-style:solid;border-top-width:1px; border-left-width:1px;border-right-width:1px;border-bottom-width:0px;height:14px;padding-bottom:1px;">
								<b>Standard</b>
								<br/>
							</div>
							<div class="styGenericDiv" style="width:24.5mm;padding-left:8px;border-color:black;border-style:solid;border-top-width:0px; border-left-width:1px;border-right-width:1px;border-bottom-width:0px;height:13px;padding-bottom:0px;padding-top:1px;">
								<b>Deduction</b>
								<br/>
							</div>
							<div class="styGenericDiv" style="width:24.5mm;padding-left:8px;padding-top:2px;border-color:black;border-style:solid;border-top-width:0px; border-left-width:1px;border-right-width:0px;border-bottom-width:0px;height:18px;">
								<b>for&#8211;</b>
								<br/>
							</div>
							<div class="styGenericDiv" style="width:24.5mm;padding-left:8px;border-color:black;border-style:solid;border-top-width:0px; border-left-width:1px;border-right-width:1px;border-bottom-width:1px;">
								&#8226; People who<br/>
								check any<br/>
								box on line<br/>
								39a or 39b <b>or</b>
								<br/>
								who can be<br/>
								claimed as a<br/>
								dependent,<br/>
								see<br/>
								instructions.<br/>
								&#8226; All others:<br/>
								Single or<br/>
								Married filing<br/>
								separately,<br/>
								$6,200<br/>
								<span style="font-size:2pt;">
									<br/>
								</span>
								Married filing<br/>
								jointly or<br/>
								Qualifying<br/>
								widow(er),<br/>
								$12,400<br/>
								<span style="font-size:2pt;">
									<br/>
								</span>
								Head of<br/>
								household,<br/>
								$9,100
							</div>
						</div>
						<div style="height:8mm;width:162.5mm;float:left;clear:none;">
							<!-- Line 38 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;">38</div>
								<div style="width:117.8mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
									<span style="padding-right:1mm;float:left;clear:none;">
										Amount from line 37 (adjusted gross income)
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Line 38 - Excluded Section 933 Puerto Rico Income Code</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$FormData/ExcldSect933PuertoRicoIncmAmt/@excldSect933PuertoRicoIncmCd"/>
										</xsl:call-template>
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Line 38 - Excluded Section 933 Puerto Rico Income Amount</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$FormData/ExcldSect933PuertoRicoIncmAmt"/>
										</xsl:call-template>
									</span>
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">............</span>
									<!--<div class="styFixedUnderline" style="height:4mm;width:53mm;text-align:left;float:left;clear:none;padding-top:0mm;padding-left:.5mm;border-style:dotted;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/ExcldSect933PuertoRicoIncmAmt/@excldSect933PuertoRicoIncmCd"/>
											<xsl:with-param name="BackupName">IRS1040ExcldSect933PuertoRicoIncmAmt@excldSect933PuertoRicoIncmCd</xsl:with-param>
										</xsl:call-template>,
										 <span style="width:2px;"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/ExcldSect933PuertoRicoIncmAmt"/>
											<xsl:with-param name="BackupName">IRS1040ExcldSect933PuertoRicoIncmAmt</xsl:with-param>
										</xsl:call-template>
									</div>-->
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="">38</div>
									<div class="styLNAmountBox" style="">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AdjustedGrossIncomeAmt"/>
											<xsl:with-param name="BackupName">IRS1040AdjustedGrossIncomeAmt</xsl:with-param>
										</xsl:call-template>
									</div>
								</span>
							</div>
							<!--End Line 38 -->
							<!-- Line 39a -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;padding-top:1.25mm;">39a</div>
								<div style="width:116.2mm;padding-top:.5mm;padding-left:1mm;float:left;clear:none;">
									<div style="width:9mm;float:left;clear:none;">
										<div style="padding-top:1mm;">Check</div>
										<div style="padding-top:1mm;">if:</div>
									</div>
									<div style="float:left;clear:none;padding-right:1mm;">
										<img src="{$ImagePath}/1040_LeftBracket.gif" alt="Left bracket image"/>
									</div>
									<div style="padding-top:1mm;padding-left:0mm;float:left;clear:none;">
										<div style="width:59mm;float:left;clear:none;">
											<!-- Checkbox -->
											<input type="Checkbox" class="styCkbox">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="$FormData/Primary65OrOlderInd"/>
													<xsl:with-param name="BackupName">IRS1040Primary65OrOlderInd</xsl:with-param>
												</xsl:call-template>
											</input>
											<label>
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="$FormData/Primary65OrOlderInd"/>
													<xsl:with-param name="BackupName">IRS1040Primary65OrOlderInd</xsl:with-param>
												</xsl:call-template>
												<span style="width:3px;"/>
												<b>You </b> were born before January 2, 1950,
								  </label>
										</div>
										<div style="width:59mm;float:left;clear:none;padding-top:1mm;">
											<!-- Checkbox -->
											<input type="Checkbox" class="styCkbox">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="$FormData/Spouse65OrOlderInd"/>
													<xsl:with-param name="BackupName">IRS1040Spouse65OrOlderInd</xsl:with-param>
												</xsl:call-template>
											</input>
											<label>
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="$FormData/Spouse65OrOlderInd"/>
													<xsl:with-param name="BackupName">IRS1040Spouse65OrOlderInd</xsl:with-param>
												</xsl:call-template>
												<span style="width:3px;"/>
												<b>Spouse </b> was born before January 2, 1950,
								  </label>
										</div>
									</div>
									<div style="width:12mm;padding-top:1mm;padding-left:0mm;float:left;clear:none;">
										<div style="float:left;clear:none;">
											<!-- Checkbox -->
											<input type="Checkbox" class="styCkbox">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="$FormData/PrimaryBlindInd"/>
													<xsl:with-param name="BackupName">IRS1040PrimaryBlindInd</xsl:with-param>
												</xsl:call-template>
											</input>
											<label>
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="$FormData/PrimaryBlindInd"/>
													<xsl:with-param name="BackupName">IRS1040PrimaryBlindInd</xsl:with-param>
												</xsl:call-template>
												<span style="width:2px;"/>
									 Blind.
								  </label>
										</div>
										<div style="float:left;clear:none;padding-top:1mm;">
											<!-- Checkbox -->
											<input type="Checkbox" class="styCkbox">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="$FormData/SpouseBlindInd"/>
													<xsl:with-param name="BackupName">IRS1040SpouseBlindInd</xsl:with-param>
												</xsl:call-template>
											</input>
											<label>
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="$FormData/SpouseBlindInd"/>
													<xsl:with-param name="BackupName">IRS1040SpouseBlindInd</xsl:with-param>
												</xsl:call-template>
												<span style="width:2px;"/>
									 Blind.
								  </label>
										</div>
									</div>
									<div style="float:left;clear:none;padding-right:1mm;">
										<img src="{$ImagePath}/1040_RightBracket.gif" alt="Right bracket image"/>
									</div>
									<div style="float:left;clear:none;width:18mm;padding-top:1mm;">
										<div style="float:left;clear:none;">
											<span class="styBoldText">Total boxes</span>
										</div>
										<div style="float:left;clear:none;padding-top:1mm;">
											<span class="styBoldText">checked</span>
											<span style="width:3px;"/>
											<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
										</div>
									</div>
									<div style="height:4mm;width:4mm;float:left;clear:none;">
										<div class="styBoldText" style="height:4mm;padding-right:.5mm;padding-top:5mm;">39a</div>
									</div>
									<div class="styDblBox" style="height:4mm;width:6mm;">
										<div style="padding-top:4mm;text-align:center;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/TotalBoxesCheckedCnt"/>
												<xsl:with-param name="BackupName">IRS1040TotalBoxesCheckedCnt</xsl:with-param>
											</xsl:call-template>
										</div>
									</div>
								</div>
								<span style="float:right;">
									<div class="styShadingCell" style="height:11.6mm;width:8mm;border-right-width:0px;"/>
									<div class="styLNAmountBox" style="height:11.6mm;border-left-width:1px;border-bottom-width:0px;"/>
								</span>
							</div>
							<!--End Line 39a -->
							<!-- Line 39b -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;padding-left:4.25mm;border-color:black;border-style:solid;border-left-width:0px;border-right-width:0px;border-top-width:0px;border-bottom-width:0px;height:20px;">b</div>
								<div style="width:116.25mm;padding-top:.7mm;padding-left:1.5mm;float:left;clear:none;height:20px;">
									<div style="float:left;clear:none;font-size:6pt">
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$FormData/MustItemizeInd"/>
												<xsl:with-param name="BackupName">IRS1040MustItemizeInd</xsl:with-param>
											</xsl:call-template>
											<span style="float:left;clear:none;">
												If your spouse itemizes on a separate return or you were a dual-status alien, check here
											</span>
										</label>
										<!--<span class="styDotLn" style="float:left;clear:none;padding-right:1mm;">..........................</span>-->
										<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
										<span style="width:1mm;"/>
										<span style="font-size:6.5pt">
											<b>39b</b>
										</span>
										<span style="width:4mm;"/>
										<!-- Checkbox -->
										<input type="Checkbox" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/MustItemizeInd"/>
												<xsl:with-param name="BackupName">IRS1040MustItemizeInd</xsl:with-param>
											</xsl:call-template>
										</input>
									</div>
								</div>
								<span style="float:right;">
									<div class="styShadingCell" style="height:20px;width:8mm;border-right-width:0px;"/>
									<div class="styLNAmountBox" style="height:20px;border-left-width:1px;border-bottom-width:0px;"/>
								</span>
							</div>
							<!--End Line 39b -->
							<!-- Line 40 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;border-color:black;border-style:solid;border-width:1px 0px;height:18px;">40</div>
								<div style="width:117.8mm;font-size:6.3pt;padding-top:.7mm;padding-left:3mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
										<b>Itemized deductions</b> (from Schedule A) <b>or</b> your <b>standard deduction</b> (see left margin)
								   </span>
									<div style="float:left;clear:none;">
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Line 40 - Modified Standard Deduction Ind</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$FormData/TotalItemizedOrStandardDedAmt/@modifiedStandardDeductionInd"/>
										</xsl:call-template>
										<span class="styDotLn" style="float:none;clear:none;padding-right:0mm;letter-spacing:2mm;">...</span>
									</div>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="height:18px;">40</div>
									<div class="styLNAmountBox" style="height:18px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalItemizedOrStandardDedAmt"/>
											<xsl:with-param name="BackupName">IRS1040TotalItemizedOrStandardDedAmt</xsl:with-param>
										</xsl:call-template>
									</div>
								</span>
							</div>
							<!--End Line 40 -->
							<!-- Line 41 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;border-color:black;border-style:solid;border-left-width:0px;border-right-width:0px;border-top-width:0px;border-bottom-width:0px;height:4.3mm;">41</div>
								<div style="width:117.7mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
                           Subtract line 40 from line 38
                           </span>
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">...................</span>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="height:4.3mm;">41</div>
									<div class="styLNAmountBox" style="height:4.3mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AGILessDeductionsAmt"/>
											<xsl:with-param name="BackupName">IRS1040AGILessDeductionsAmt</xsl:with-param>
										</xsl:call-template>
									</div>
								</span>
							</div>
							<!--End Line 41 -->
							<!-- Line 42 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;border-color:black;border-style:solid;border-left-width:0px;border-right-width:0px;border-top-width:0px;border-bottom-width:0px;height:4.4mm;">42</div>
								<div style="width:117.7mm;float:left;clear:none;padding-bottom:0mm;padding-top:.5mm;padding-left:3mm;">
									<div style="padding-left:0mm;float:left;clear:none;">
										<span style="float:left;clear:none;">
											<b>Exemptions.</b> If line 38 is $152,525 or less, multiply $3,950 by the number on line 6d. Otherwise, see instructions
										<span class="styDotLn" style="float:none;clear:none;padding-left:2mm;">...................</span>
										</span>
									</div>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="height: 6.8mm;padding-top:3mm;">42</div>
									<div class="styLNAmountBox" style="height: 6.8mm;padding-top:3mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/ExemptionAmt"/>
											<xsl:with-param name="BackupName">IRS1040ExemptionAmt</xsl:with-param>
										</xsl:call-template>
									</div>
								</span>
							</div>
							<!--End Line 42 -->
							<!--James-border-style:solid;border-color:black;border-width:1px 1px 1px 1px;-->
							<!-- Line 43 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;padding-top:0.8mm;border-color:black;border-style:solid;border-left-width:0px;border-right-width:0px;border-top-width:0px;border-bottom-width:0px;height:5.5mm;">43</div>
								<div style="width:117.7mm;padding-top:1.1mm;padding-left:3mm;float:left;clear:none;font-size:6pt">
									<span style="float:left;clear:none;padding-top:.7mm;font-size:6pt;">
										<span class="styBoldText">Taxable income</span>. Subtract line 42 from line 41. If line 42 is more than line 41, enter -0-
                           </span>
									<div style="float:left;clear:none;padding-left:1mm;padding-bottom:0mm">
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Line 43 - Capital Construction Fund Code</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$FormData/TaxableIncomeAmt/@capitalConstructionFundCd"/>
										</xsl:call-template>
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Line 43 - Capital Construction Fund Amt</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$FormData/TaxableIncomeAmt/@capitalConstructionFundAmt"/>
										</xsl:call-template>
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Line 43 - IRS Schedule Q Code</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$FormData/ScheduleQCd"/>
										</xsl:call-template>
									</div>
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">..</span>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="height:5.5mm;padding-top:1.5mm;">43</div>
									<div class="styLNAmountBox" style="height:5.5mm;padding-top:1.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TaxableIncomeAmt"/>
											<xsl:with-param name="BackupName">IRS1040TaxableIncomeAmt</xsl:with-param>
										</xsl:call-template>
									</div>
								</span>
							</div>
							<!--End Line 43 -->
							<!-- Line 44 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;padding-top:0.8mm;width:4mm;border-color:black;border-style:solid;border-left-width:0px;border-right-width:0px;border-top-width:0px;border-bottom-width:0px;height:4mm;">44</div>
								<div style="font-size:6pt;width:117.7mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
									<b>Tax</b>
									<span style="width:3px;"/>
									<span style="font-family:Arial ;">
										<span class="styNormal">(see instructions).</span>
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/TaxAmt"/>
										</xsl:call-template>
										<span style="width:2px;"/>
										<span class="styNormal">Check if any from:</span>
										<span style="width:2px;"/>
										<span class="styBoldText">a</span>
										<span style="width:2px;"/>
										<!-- Checkbox -->
										<input type="Checkbox" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/Form8814Ind"/>
												<xsl:with-param name="BackupName">IRS1040Form8814Ind</xsl:with-param>
											</xsl:call-template>
										</input>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$FormData/Form8814Ind"/>
												<xsl:with-param name="BackupName">IRS1040Form8814Ind</xsl:with-param>
											</xsl:call-template>
											<span style="width:2px;"/>
											<span class="styAgency" style="font-size:7pt;">Form(s) 8814</span>
										</label>
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/Form8814Ind"/>
										</xsl:call-template>
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Line 44a - Child Interest and Dividend Tax Amount</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$FormData/Form8814Ind/@childInterestAndDividendTaxAmt"/>
										</xsl:call-template>
										<span style="width:4px;"/>
										<span class="styBoldText">b</span>
										<span style="width:2px;"/>
										<!-- Checkbox -->
										<input type="Checkbox" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/Form4972Ind"/>
												<xsl:with-param name="BackupName">IRS1040Form4972Ind</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:2px;"/>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$FormData/Form4972Ind"/>
												<xsl:with-param name="BackupName">IRS1040Form4972Ind</xsl:with-param>
											</xsl:call-template>
											<span class="styAgency" style="font-size:7pt;clear:none;float:none;">Form 4972</span>
										</label>
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/Form4972Ind"/>
										</xsl:call-template>
										<span style="width:4px;"/>
										<span class="styBoldText">c</span>
										<span style="width:2px;"/>
										<!-- Checkbox -->
										<input type="Checkbox" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/OtherTaxAmtInd"/>
												<xsl:with-param name="BackupName">IRS1040OtherTaxAmtInd</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:2px;"/>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$FormData/OtherTaxAmtInd"/>
												<xsl:with-param name="BackupName">IRS1040OtherTaxAmtInd</xsl:with-param>
											</xsl:call-template>
											<span class="styFixedUnderline" style="padding-top:0mm;padding-bottom:0mm;float:none;width:10mm;">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/OtherTaxAmtInd"/>
										</xsl:call-template>
											</span>
										</label>
										<!-- Form to Form Link -->
									</span>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="height:4mm">44</div>
									<div class="styLNAmountBox" style="height:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TaxAmt"/>
											<xsl:with-param name="BackupName">IRS1040TaxAmt</xsl:with-param>
										</xsl:call-template>
									</div>
								</span>
							</div>
							<!--End Line 44 -->
							<!-- Line 45 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;width:4mm;border-color:black;border-style:solid;border-left-width:0px;border-right-width:0px;border-top-width:0px;border-bottom-width:0px;height:4.5mm;padding-top:0.8mm;">45</div>
								<div style="width:117.7mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
										<span class="styBoldText">Alternative minimum tax</span> (see instructions). Attach Form 6251 
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/AlternativeMinimumTaxAmt"/>
										</xsl:call-template>
									</span>
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.......</span>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="height:4.5mm;">45</div>
									<div class="styLNAmountBox" style="height:4.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AlternativeMinimumTaxAmt"/>
										</xsl:call-template>
									</div>
								</span>
							</div>
							<!--End Line 45 -->
							<!-- Line 46 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;width:4mm;border-color:black;border-style:solid;border-left-width:0px;border-right-width:0px;border-top-width:0px;border-bottom-width:0px;height:4.5mm;padding-top:0.8mm;">46</div>
								<div style="width:117.7mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
										Excess advance premium tax credit repayment. Attach Form 8962 
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/PremiumTaxCreditTaxLiabAmt"/>
										</xsl:call-template>
									</span>
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.....</span>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="height:4.5mm;">46</div>
									<div class="styLNAmountBox" style="height:4.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PremiumTaxCreditTaxLiabAmt"/>
										</xsl:call-template>
									</div>
								</span>
							</div>
							<!--End Line 46 -->
							<!-- Line 47 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;border-color:black;border-style:solid;border-left-width:0px;border-right-width:0px;border-top-width:0px;border-bottom-width:0px;height:4.4mm;">47</div>
								<div style="width:117.7mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
                           Add lines 44, 45, and 46
                           </span>
									<span class="styDotLn" style="clear:none;padding-right:3mm;">..................</span>
									<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="height:4.4mm">47</div>
									<div class="styLNAmountBox" style="height:4.4mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalTaxBeforeCrAndOthTaxesAmt"/>
											<xsl:with-param name="BackupName">IRS1040TotalTxBeforeCrAndOtherTxsAmt</xsl:with-param>
										</xsl:call-template>
									</div>
								</span>
							</div>
							<!--End Line 47 -->
							<!-- Line 48 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;padding-top:.5mm;padding-left:1mm;width:4mm;border-color:black;border-style:solid;border-left-width:0px;border-right-width:0px;border-top-width:0px;border-bottom-width:0px;height:5.2mm;">48</div>
								<div class="styLNDesc" style="width:77mm;padding-top:.5mm;padding-left:3mm;">
									<span style="float:left;">
                           Foreign tax credit. Attach Form 1116 if required
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/ForeignTaxCreditAmt"/>
										</xsl:call-template>
									</span>
									<span class="styDotLn" style="float:right;padding-right:2mm;">.</span>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="height:20px;padding-top:1mm;">48</div>
									<div class="styLNAmountBox" style="height:20px;padding-top:1mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/ForeignTaxCreditAmt"/>
										</xsl:call-template>
									</div>
									<div class="styShadingCell" style="height:20px;width:8mm;padding-top:1.8mm;border-right-width:0px;"/>
									<div class="styLNAmountBox" style="height:20px;border-left-width:1px;border-bottom-width:0px;"/>
								</span>
							</div>
							<!--End Line 48 -->
							<!-- Line 49 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;padding-left:1mm;width:4mm;border-color:black;border-style:solid;border-left-width:0px;border-right-width:0px;border-top-width:0px;border-bottom-width:0px;height:5mm;">49</div>
								<div style="width:77mm;padding-top:1mm;padding-left:3mm;float:left;clear:none;">
									<span style="float:left;clear:none;font-size:6pt">
                           Credit for child and dependent care expenses. Attach Form 2441
                           </span>
									<div style="float:left;clear:none;padding-left:1mm">
										<!-- Form to Form Link -->
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/CreditForChildAndDepdCareAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="height:19px;padding-top:1mm;">49</div>
									<div class="styLNAmountBox" style="height:19px;padding-top:1mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CreditForChildAndDepdCareAmt"/>
											<xsl:with-param name="BackupName">IRS1040CrForChildAndDEPDCareAmt</xsl:with-param>
										</xsl:call-template>
									</div>
									<div class="styShadingCell" style="height:19px;width:8mm;padding-top:1.8mm;border-right-width:0px;"/>
									<div class="styLNAmountBox" style="height:19px;border-left-width:1px;border-bottom-width:0px;"/>
								</span>
							</div>
							<!--End Line 49 -->
							<!-- Line 50 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;padding-left:1mm;width:4mm;border-color:black;border-style:solid;border-left-width:0px;border-right-width:0px;border-top-width:0px;border-bottom-width:0px;height:5.3mm;">50</div>
								<div style="width:77mm;padding-top:.6mm;padding-left:3mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
                           Education credits from Form 8863, line 19
                           </span>
									<div style="float:left;clear:none;padding-left:1mm">
										<!-- Form to Form Link -->
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/EducationCreditAmt"/>
										</xsl:call-template>
									</div>
									<span class="styDotLn" style="float:right;padding-right:2mm;clear:none;">...</span>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="height:20px;padding-top:1mm;">50</div>
									<div class="styLNAmountBox" style="height:20px;padding-top:1mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/EducationCreditAmt"/>
											<xsl:with-param name="BackupName">IRS1040EducationCreditAmt</xsl:with-param>
										</xsl:call-template>
									</div>
									<div class="styShadingCell" style="height:20px;width:8mm;padding-top:1.8mm;border-right-width:0px;"/>
									<div class="styLNAmountBox" style="height:20px;border-left-width:1px;border-bottom-width:0px;"/>
								</span>
							</div>
							<!--End Line 50 -->
							<!-- Line 51 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;padding-left:1mm;padding-top:0.7mm;width:4mm;border-color:black;border-style:solid;border-left-width:0px;border-right-width:0px;border-top-width:0px;border-bottom-width:0px;height:4.9mm;">51</div>
								<div style="width:77mm;padding-top:1mm;padding-left:3mm;float:left;clear:none;">
									<span style="float:left;clear:none;font-size:6pt">
                           Retirement savings contributions credit.                     
                           
                            Attach Form 8880</span>
									<div style="float:left;clear:none;padding-left:1mm">
										<!-- Form to Form Link -->
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/RtrSavingsContributionsCrAmt"/>
										</xsl:call-template>
									</div>
									<span class="styDotLn" style="padding-left:2mm;float:left;clear:none;"/>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="height:19px;padding-top:1mm;">51</div>
									<div class="styLNAmountBox" style="height:19px;padding-top:1mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/RtrSavingsContributionsCrAmt"/>
											<xsl:with-param name="BackupName">IRS1040RtrSavingsContributionsCrAmt</xsl:with-param>
										</xsl:call-template>
									</div>
									<div class="styShadingCell" style="height:19px;width:8mm;padding-top:1.8mm;border-right-width:0px;"/>
									<div class="styLNAmountBox" style="height:19px;border-left-width:1px;border-bottom-width:0px;"/>
								</span>
							</div>
							<!--End Line 51 -->
							<!-- Line 52 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;padding-left:1mm;padding-top:1mm;width:4mm;border-color:black;border-style:solid;border-left-width:0px;border-right-width:0px;border-top-width:0px;border-bottom-width:0px;height:5mm;">52</div>
								<div style="width:77mm;padding-top:1mm;padding-left:3mm;float:left;clear:none;">
									<span style="float:left;clear:none;font-size:6.5pt;padding-top:0.4mm;">
                           Child tax credit. Attach Schedule 8812, if required
                           </span>
									<div style="float:left;clear:none;padding-left:1mm">
										<!-- Form to Form Link -->
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/ChildTaxCreditAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="height:19px;padding-top:1mm;">52</div>
									<div class="styLNAmountBox" style="height:19px;padding-top:1mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/ChildTaxCreditAmt"/>
											<xsl:with-param name="BackupName">IRS1040ChildTaxCreditAmt</xsl:with-param>
										</xsl:call-template>
									</div>
									<div class="styShadingCell" style="height:19px;width:8mm;padding-top:1.8mm;border-right-width:0px;"/>
									<div class="styLNAmountBox" style="height:19px;border-left-width:1px;border-bottom-width:0px;"/>
								</span>
							</div>
							<!--End Line 52 -->
							<!-- Line 53 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;padding-left:1mm;padding-top:1.2mm;width:4mm;border-color:black;border-style:solid;border-left-width:0px;border-right-width:0px;border-top-width:0px;border-bottom-width:0px;height:5.1mm;">53</div>
								<div style="width:77mm;padding-top:1mm;padding-left:3mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
							Residential energy credits. Attach Form 5695 
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/ResidentialEnergyCreditAmt"/>
										</xsl:call-template>
									</span>
									<span class="styDotLn" style="float:right;padding-right:2mm;clear:none;">..</span>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="height:20px;padding-top:1mm;">53</div>
									<div class="styLNAmountBox" style="height:20px;padding-top:1mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/ResidentialEnergyCreditAmt"/>
										</xsl:call-template>
									</div>
									<div class="styShadingCell" style="height:20px;width:8mm;padding-top:1.8mm;border-right-width:0px;"/>
									<div class="styLNAmountBox" style="height:20px;border-left-width:1px;border-bottom-width:0px;"/>
								</span>
							</div>
							<!--End Line 53 -->
							<!-- Line 54 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;padding-left:1mm;padding-top:1mm;width:4mm;border-color:black;border-style:solid;border-left-width:0px;border-right-width:0px;border-top-width:0px;border-bottom-width:0px;height:5.3mm;">54</div>
								<div style="width:77mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
										<span class="styAgency" style="font-size:7pt">Other credits from Form:</span>
										<span style="width:1px;"/>
										<span class="styBoldText">a</span>
										<span style="width:1px;"/>
										<!-- Checkbox -->
										<input type="Checkbox" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/Form3800Ind"/>
												<xsl:with-param name="BackupName">IRS1040Form3800Ind</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:1px;"/>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$FormData/Form3800Ind"/>
												<xsl:with-param name="BackupName">IRS1040Form3800Ind</xsl:with-param>
											</xsl:call-template>
											<span class="styAgency" style="font-size:7pt;">3800</span>
										</label>
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/Form3800Ind"/>
										</xsl:call-template>
										<span style="width:4px;"/>
										<span class="styBoldText">b</span>
										<span style="width:1px;"/>
										<!-- Checkbox -->
										<input type="Checkbox" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/Form8801Ind"/>
												<xsl:with-param name="BackupName">IRS1040TaxAndCredits8801Ind</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:1px;"/>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$FormData/Form8801Ind"/>
												<xsl:with-param name="BackupName">IRS1040TaxAndCredits8801Ind</xsl:with-param>
											</xsl:call-template>
											<span class="styAgency" style="font-size:7pt;">8801</span>
										</label>
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/Form8801Ind"/>
										</xsl:call-template>
										<span style="width:4px;"/>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$FormData/SpecificOtherCreditsInd"/>
												<xsl:with-param name="BackupName">IRS1040SpecificOtherCreditsInd</xsl:with-param>
											</xsl:call-template>
											<b>c</b>
										</label>
										<span style="width:1px;"/>
										<!-- Checkbox -->
										<input type="Checkbox" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/SpecificOtherCreditsInd"/>
												<xsl:with-param name="BackupName">IRS1040SpecificOtherCreditsInd</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:2px;"/>
										<span class="styFixedUnderline" style="padding-top:0mm;padding-bottom:0mm;float:none;width:7mm;">
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/SpecificOtherCreditsInd"/>
											</xsl:call-template>
											<xsl:if test="count($FormData/SpecificOtherCreditsInd/@*) &lt;= 4">
												<xsl:call-template name="LinkToLeftoverDataTableInline">
													<xsl:with-param name="Desc">Line 54c - Credit Forms Statement Schedule R</xsl:with-param>
													<xsl:with-param name="TargetNode" select="$FormData/SpecificOtherCreditsInd/@creditFormsStatementSchRCd"/>
												</xsl:call-template>
												<xsl:call-template name="LinkToLeftoverDataTableInline">
													<xsl:with-param name="Desc">Line 54c - Credit Forms Statement 8396</xsl:with-param>
													<xsl:with-param name="TargetNode" select="$FormData/SpecificOtherCreditsInd/@creditFormsStatement8396Cd"/>
												</xsl:call-template>
												<xsl:call-template name="LinkToLeftoverDataTableInline">
													<xsl:with-param name="Desc">Line 54c - Credit Forms Statement 8834</xsl:with-param>
													<xsl:with-param name="TargetNode" select="$FormData/SpecificOtherCreditsInd/@creditFormsStatement8834Cd"/>
												</xsl:call-template>
												<xsl:call-template name="LinkToLeftoverDataTableInline">
													<xsl:with-param name="Desc">Line 54c - Credit Forms Statement 8839</xsl:with-param>
													<xsl:with-param name="TargetNode" select="$FormData/SpecificOtherCreditsInd/@creditFormsStatement8839Cd"/>
												</xsl:call-template>
												<xsl:call-template name="LinkToLeftoverDataTableInline">
													<xsl:with-param name="Desc">Line 54c - Credit Forms Statement 8859</xsl:with-param>
													<xsl:with-param name="TargetNode" select="$FormData/SpecificOtherCreditsInd/@creditFormsStatement8859Cd"/>
												</xsl:call-template>
												<xsl:call-template name="LinkToLeftoverDataTableInline">
													<xsl:with-param name="Desc">Line 54c - Credit Forms Statement 8910</xsl:with-param>
													<xsl:with-param name="TargetNode" select="$FormData/SpecificOtherCreditsInd/@creditFormsStatement8910Cd"/>
												</xsl:call-template>
												<xsl:call-template name="LinkToLeftoverDataTableInline">
													<xsl:with-param name="Desc">Line 54c - Credit Forms Statement 8911</xsl:with-param>
													<xsl:with-param name="TargetNode" select="$FormData/SpecificOtherCreditsInd/@creditFormsStatement8911Cd"/>
												</xsl:call-template>
												<xsl:call-template name="LinkToLeftoverDataTableInline">
													<xsl:with-param name="Desc">Line 54c - Credit Forms Statement 8912</xsl:with-param>
													<xsl:with-param name="TargetNode" select="$FormData/SpecificOtherCreditsInd/@creditFormsStatement8912Cd"/>
												</xsl:call-template>
												<xsl:call-template name="LinkToLeftoverDataTableInline">
													<xsl:with-param name="Desc">Line 54c - Credit Forms Statement 8936</xsl:with-param>
													<xsl:with-param name="TargetNode" select="$FormData/SpecificOtherCreditsInd/@creditFormsStatement8936Cd"/>
												</xsl:call-template>
											</xsl:if>
										</span>
									</span>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="height:20px;padding-top:1mm;">54</div>
									<div class="styLNAmountBox" style="height:20px;padding-top:1mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/OtherCreditsAmt"/>
											<xsl:with-param name="BackupName">IRS1040OtherCreditsAmt</xsl:with-param>
										</xsl:call-template>
									</div>
									<div class="styShadingCell" style="height:31px;width:8mm;padding-top:1.8mm;border-right-width:0px;"/>
									<div class="styLNAmountBox" style="height:31px;border-width:0px;text-align:left;border-left-width:1px;border-bottom-width:1px;">
										<xsl:if test="count($FormData/SpecificOtherCreditsInd/@*) &gt; 4">
											<xsl:call-template name="LinkToLeftoverDataTableInline">
												<xsl:with-param name="Desc">Line 54c - Credit Forms Statement Schedule R</xsl:with-param>
												<xsl:with-param name="TargetNode" select="$FormData/SpecificOtherCreditsInd/@creditFormsStatementSchRCd"/>
											</xsl:call-template>
											<xsl:call-template name="LinkToLeftoverDataTableInline">
												<xsl:with-param name="Desc">Line 54c - Credit Forms Statement 8396</xsl:with-param>
												<xsl:with-param name="TargetNode" select="$FormData/SpecificOtherCreditsInd/@creditFormsStatement8396Cd"/>
											</xsl:call-template>
											<xsl:call-template name="LinkToLeftoverDataTableInline">
												<xsl:with-param name="Desc">Line 54c - Credit Forms Statement 8834</xsl:with-param>
												<xsl:with-param name="TargetNode" select="$FormData/SpecificOtherCreditsInd/@creditFormsStatement8834Cd"/>
											</xsl:call-template>
											<xsl:call-template name="LinkToLeftoverDataTableInline">
												<xsl:with-param name="Desc">Line 54c - Credit Forms Statement 8839</xsl:with-param>
												<xsl:with-param name="TargetNode" select="$FormData/SpecificOtherCreditsInd/@creditFormsStatement8839Cd"/>
											</xsl:call-template>
											<xsl:call-template name="LinkToLeftoverDataTableInline">
												<xsl:with-param name="Desc">Line 54c - Credit Forms Statement 8859</xsl:with-param>
												<xsl:with-param name="TargetNode" select="$FormData/SpecificOtherCreditsInd/@creditFormsStatement8859Cd"/>
											</xsl:call-template>
											<xsl:call-template name="LinkToLeftoverDataTableInline">
												<xsl:with-param name="Desc">Line 54c - Credit Forms Statement 8910</xsl:with-param>
												<xsl:with-param name="TargetNode" select="$FormData/SpecificOtherCreditsInd/@creditFormsStatement8910Cd"/>
											</xsl:call-template>
											<xsl:call-template name="LinkToLeftoverDataTableInline">
												<xsl:with-param name="Desc">Line 54c - Credit Forms Statement 8911</xsl:with-param>
												<xsl:with-param name="TargetNode" select="$FormData/SpecificOtherCreditsInd/@creditFormsStatement8911Cd"/>
											</xsl:call-template>
											<xsl:call-template name="LinkToLeftoverDataTableInline">
												<xsl:with-param name="Desc">Line 54c - Credit Forms Statement 8912</xsl:with-param>
												<xsl:with-param name="TargetNode" select="$FormData/SpecificOtherCreditsInd/@creditFormsStatement8912Cd"/>
											</xsl:call-template>
											<xsl:call-template name="LinkToLeftoverDataTableInline">
												<xsl:with-param name="Desc">Line 54c - Credit Forms Statement 8936</xsl:with-param>
												<xsl:with-param name="TargetNode" select="$FormData/SpecificOtherCreditsInd/@creditFormsStatement8936Cd"/>
											</xsl:call-template>
										</xsl:if>
									</div>
								</span>
							</div>
							<!--End Line 54 -->
							<!-- Line 55 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;width:4mm;border-color:black;border-style:solid;border-left-width:0px;border-right-width:0px;border-top-width:0px;border-bottom-width:0px;height:4.8mm;">55</div>
								<div style="width:117.7mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
                           Add lines 48 through 54. These are your <span class="styBoldText">total credits</span>
									</span>
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">...........</span>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="height:4.8mm;">55</div>
									<div class="styLNAmountBox" style="height:4.8mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalCreditsAmt"/>
											<xsl:with-param name="BackupName">IRS1040TotalCreditsAmt</xsl:with-param>
										</xsl:call-template>
									</div>
								</span>
							</div>
							<!--End Line 55 -->
							<!-- Line 56 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;width:4mm;border-color:black;border-style:solid;border-left-width:0px;border-right-width:0px;border-top-width:0px;border-bottom-width:0px;">56</div>
								<div style="width:117.7mm;padding-left:3mm;padding-top:0.5mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
                           Subtract line 55 from line 47. If line 55 is more than line 47, enter -0-
                           </span>
									<span class="styDotLn" style="clear:none;padding-right:2mm;">....</span>
									<span style="width:7px;"/>
									<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="border-bottom-width:0px;">56</div>
									<div class="styLNAmountBox" style="border-bottom-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TaxLessCreditsAmt"/>
											<xsl:with-param name="BackupName">IRS1040TaxLessCreditsAmt</xsl:with-param>
										</xsl:call-template>
									</div>
								</span>
							</div>
							<!--End Line 56 -->
						</div>
					</div>
					<!-- end tax and credits -->
					<!--Other taxes -->
					<div class="styBB" style="width:187mm;">
						<div style="width:24.5mm;height:23mm;float:left;clear:none;">
							<div style="padding-top:3mm;padding-bottom:0mm;">
								<span class="styMainTitle" style="width:8mm;font-size:11pt;">
                     Other
                     Taxes
                     </span>
							</div>
						</div>
						<div style="float:left;clear:none;height:8mm;width:162.5mm;">
							<!-- Line 56 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;">57</div>
								<div style="width:117.8mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
                           Self-employment tax. Attach Schedule SE
                           </span>
									<div style="float:left;clear:none; padding-left:2mm">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/SelfEmploymentTaxAmt"/>
										</xsl:call-template>
										<!-- Form to Form Link -->
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Line 57 -  Exempt SE Tax Literal Code</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$FormData/SelfEmploymentTaxAmt/@exemptSETaxLiteralCd"/>
										</xsl:call-template>
									</div>
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">............</span>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="">57</div>
									<div class="styLNAmountBox" style="">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SelfEmploymentTaxAmt"/>
											<xsl:with-param name="BackupName">IRS1040SelfEmploymentTaxAmt</xsl:with-param>
										</xsl:call-template>
									</div>
								</span>
							</div>
							<!--End Line 57 -->
							<!-- Line 58 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;padding-top:1mm;">58</div>
								<div style="width:117.8mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
									<span style="font-size:6pt;float:left;clear:none;">
                           Unreported social security and Medicare tax from Form:
                              <span style="width:2px;"/>
										<span class="styBoldText">a</span>
										<span style="width:4px;"/>
										<!-- Checkbox -->
										<input type="Checkbox" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/Form4137Ind"/>
												<xsl:with-param name="BackupName">IRS1040Form4137Ind</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:4px;"/>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$FormData/Form4137Ind"/>
												<xsl:with-param name="BackupName">IRS1040Form4137Ind</xsl:with-param>
											</xsl:call-template>
											<span class="styAgency" style="font-size:8pt;">4137 </span>
										</label>
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/Form4137Ind"/>
										</xsl:call-template>
										<span style="width:6px;"/>
										<span class="styBoldText">b</span>
										<span style="width:4px;"/>
										<!-- Checkbox -->
										<input type="Checkbox" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/Form8919Ind"/>
												<xsl:with-param name="BackupName">IRS1040Form8919Ind</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:4px;"/>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$FormData/Form8919Ind"/>
												<xsl:with-param name="BackupName">IRS1040Form8919Ind</xsl:with-param>
											</xsl:call-template>
											<span class="styAgency" style="font-size:8pt;padding-right:1mm;">8919</span>
										</label>
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/Form8919Ind"/>
										</xsl:call-template>
										<span style="width:2px;"/>
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Line 58 - Railroad Retirement Code</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$FormData/RailroadRetirementCd"/>
										</xsl:call-template>
									</span>
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">...</span>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="padding-top:1mm;">58</div>
									<div class="styLNAmountBox" style="padding-top:1mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/UnrprtdSocSecAndMedcrTaxAmt"/>
										</xsl:call-template>
									</div>
								</span>
							</div>
							<!--End Line 58 -->
							<!-- Line 59 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;padding-top:1mm;">59</div>
								<div style="width:117.8mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
									<span style="float:left;clear:none;font-family:Arial;">
                           Additional tax on IRAs, other qualified retirement plans, etc. Attach Form 5329 if required
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/TaxOnIRAsAmt"/>
										</xsl:call-template>
										<span style="width:2px;"/>
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Line 59 - Retirement Tax Plan Literal Code</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$FormData/TaxOnIRAsAmt/@retirementTaxPlanLiteralCd"/>
										</xsl:call-template>
									</span>
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">..</span>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="padding-top:1mm;">59</div>
									<div class="styLNAmountBox" style="padding-top:1mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TaxOnIRAsAmt"/>
											<xsl:with-param name="BackupName">IRS1040TaxOnIRAsAmt</xsl:with-param>
										</xsl:call-template>
									</div>
								</span>
							</div>
							<!--End Line 59 -->
							<!-- Line 60 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;">60a</div>
								<div style="width:116.2mm;padding-left:1mm;padding-top:1px;float:left;clear:none;">
									<span style="float:left;clear:none;">
										Household employment taxes from Schedule H 
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/HouseholdEmploymentTaxAmt"/>
										</xsl:call-template>
									</span>
									<span class="styDotLn" style="float:right;padding-right:2mm;clear:none;">............</span>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="">60a</div>
									<div class="styLNAmountBox" style="">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/HouseholdEmploymentTaxAmt"/>
										</xsl:call-template>
									</div>
								</span>
							</div>
							<!--End Line 60a -->
							<!-- Line 60b -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="padding-left:17px;width:4mm;">b</div>
								<div style="width:116.2mm;padding-left:1mm;padding-top:1px;float:left;clear:none;">
									<span style="float:left;clear:none;">
										First-time homebuyer credit repayment. Attach Form 5405 if required 
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/FirstTimeHmByrRepaymentAmt"/>
										</xsl:call-template>
									</span>
									<span class="styDotLn" style="float:right;padding-right:1.7mm;clear:none;">.....</span>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="">60b</div>
									<div class="styLNAmountBox" style="">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/FirstTimeHmByrRepaymentAmt"/>
										</xsl:call-template>
									</div>
								</span>
							</div>
							<!--End Line 60b -->
							<!-- Line 61 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;">61</div>
								<div style="width:117.8mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
										Health care: individual responsibility (see instructions)
		                             <span style="width:10px;"/>
		                         <label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/HealthCareRspnsCoverageInd"/>
										<xsl:with-param name="BackupName">IRS1040HealthCareRspnsCoverageInd</xsl:with-param>
									</xsl:call-template>
									<span class="styAgency" style="font-size:8pt;padding-right:1mm;">Full-year coverage</span>
								</label>
									<!-- Checkbox -->
										<input type="Checkbox" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/HealthCareRspnsCoverageInd"/>
												<xsl:with-param name="BackupName">IRS1040HealthCareRspnsCoverageInd</xsl:with-param>
											</xsl:call-template>
										</input>
									</span>
									<span class="styDotLn" style="float:right;padding-right:1.7mm;clear:none;">...</span>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="padding-top:1mm;">61</div>
									<div class="styLNAmountBox" style="padding-top:1mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/HealthCareRspnsPenaltyAmt"/>
											<xsl:with-param name="BackupName">IRS1040HealthCareRspnsPenaltyAmt</xsl:with-param>
										</xsl:call-template>
									</div>
								</span>
							</div>
							<!--End Line 61 -->
							<!-- Line 62 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;">62</div>
								<div style="width:117.8mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
										Taxes from: 
		                             <span style="width:2px;"/>
										<span class="styBoldText">a</span>
										<span style="width:4px;"/>
										<!-- Checkbox -->
										<input type="Checkbox" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/Form8959Ind"/>
												<xsl:with-param name="BackupName">IRS1040Form8959Ind</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:2px;"/>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$FormData/Form8959Ind"/>
												<xsl:with-param name="BackupName">IRS1040Form8959Ind</xsl:with-param>
											</xsl:call-template>
											<span class="styAgency" style="font-size:8pt;">Form 8959</span>
										</label>
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/Form8959Ind"/>
										</xsl:call-template>
										<span style="width:2px;"/>
										<span class="styBoldText">b</span>
										<span style="width:2px;"/>
										<!-- Checkbox -->
										<input type="Checkbox" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/Form8960Ind"/>
												<xsl:with-param name="BackupName">IRS1040Form8960Ind</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:2px;"/>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$FormData/Form8960Ind"/>
												<xsl:with-param name="BackupName">IRS1040Form8960Ind</xsl:with-param>
											</xsl:call-template>
											<span class="styAgency" style="font-size:8pt;padding-right:1mm;">Form 8960</span>
										</label>
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/Form8960Ind"/>
										</xsl:call-template>
										<span style="width:4px;"/>
										<span class="styBoldText">c</span>
										<span style="width:2px;"/>
										<!-- Checkbox -->
										<input type="Checkbox" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/OtherTaxCdInd"/>
												<xsl:with-param name="BackupName">IRS1040OtherTaxCdInd</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:2px;"/>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$FormData/OtherTaxCdInd"/>
												<xsl:with-param name="BackupName">IRS1040OtherTaxCdInd</xsl:with-param>
											</xsl:call-template>
											<span class="styAgency" style="font-size:8pt;padding-right:1mm;">Instructions; enter codes(s)</span>
										</label>
									</span>
									<div class="styUnderlineAmount" style="width:12mm;float:left;clear:none;padding-top:0mm;padding-left:0mm;border-style:dashed;text-align:left;">
									
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/TotalOtherTaxAmt"/>
									</xsl:call-template>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Line 62 - Form 8693 Approved Indicator</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$FormData/TotalOtherTaxAmt/@form8693ApprovedInd"/>
									</xsl:call-template>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Line 62 - Form 8693 Approved Date</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$FormData/TotalOtherTaxAmt/@form8693ApprovedDt"/>
									</xsl:call-template>
									</div>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="height:5mm;">62</div>
									<div class="styLNAmountBox" style="height:5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalOtherTaxAmt"/>
											<xsl:with-param name="BackupName">IRS1040TotalOtherTaxAmt</xsl:with-param>
										</xsl:call-template>
									</div>
								</span>
							</div>
							<!--End Line 62 -->
							<!-- Line 63 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;">63</div>
								<div style="width:117.8mm;height:4mm;float:left;clear:none;padding-left:3mm;">
									<div style="padding-left:0mm;float:left;clear:none;">
										<span style="float:left;clear:none;">
                           Add lines 56 through 62. This is your<b> total tax</b>
										</span>
									</div>
									<div class="styDotLn" style="float:right;padding-right:2mm;clear:none;">
										..........
										<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
									</div>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="border-bottom-width:0px;">63</div>
									<div class="styLNAmountBox" style="border-bottom-width:0px;">
										<!-- Form to Form Link -->
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalTaxAmt"/>
											<xsl:with-param name="BackupName">IRS1040TotalTaxAmt</xsl:with-param>
										</xsl:call-template>
									</div>
								</span>
							</div>
							<!--End Line 63 -->
						</div>
					</div>
					<!--End Other taxes -->
					<!-- Payments -->
					<div class="styBB" style="width:187mm;">
						<div style="width:24.5mm;height:50mm;float:left;clear:none;">
							<div style="padding-top:2mm;padding-bottom:1mm;height:9mm;">
								<span class="styMainTitle" style="font-size:11pt;">
									Payments
								</span>
							</div>
							<div style="height:5px;border-style: solid; border-color: black;    border-top-width: 1px; border-bottom-width: 0px; border-left-width: 1px; border-right-width: 1px;font-size:1pt;"/>
							<div style="border-style:solid; border-color:black;border-width: 0px 0px 0px 1px;padding-top:4px;">
                     If you have a</div>
							<div style="padding-bottom:4mm;border-style:solid;border-color:black;border-width: 0px 1px 1px 1px;">
                     qualifying<br/>
                     child, attach<br/>
                     Schedule EIC.
                     </div>
						</div>
						<div style="float:left;clear:none;height:8mm;width:162.5mm;">
							<!-- Line 64 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;padding-left:1mm;">64</div>
								<div style="width:77mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
										<span class="styAgency" style="font-size:8pt;float:left;">
                           Federal income tax withheld from Forms W-2 and 1099
                           
                               <!-- Form to Form Link -->
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/WithholdingTaxAmt"/>
											</xsl:call-template>
										</span>
										<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">..</span>
									</span>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="height:19px;padding-top:1mm;">64</div>
									<div class="styLNAmountBox" style="height:19px;padding-top:1mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/WithholdingTaxAmt"/>
											<xsl:with-param name="BackupName">IRS1040WithholdingTaxAmt</xsl:with-param>
										</xsl:call-template>
									</div>
									<div class="styShadingCell" style="height:19px;width:8mm;padding-top:1.8mm;border-right-width:0px;"/>
									<div class="styLNAmountBox" style="height:19px;border-left-width:1px;border-bottom-width:0px;"/>
								</span>
							</div>
							<!--End Line 64 -->
							<!-- Line 65 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;padding-left:1mm;padding-top:1mm;">65</div>
								<div style="width:77mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
										<span style="font-family:Arial Narrow;font-size:7.5pt;">2014 estimated tax payments and amount applied from 2013 return</span>
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/EstimatedTaxPaymentsAmt"/>
										</xsl:call-template>
									</span>
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.</span>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="padding-top:1mm;height:4.9mm">65</div>
									<div class="styLNAmountBox" style="padding-top:1mm;height:4.9mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/EstimatedTaxPaymentsAmt"/>
											<xsl:with-param name="BackupName">IRS1040EstimatedTaxPaymentsAmt</xsl:with-param>
										</xsl:call-template>
									</div>
									<div class="styShadingCell" style="height:4.9mm;width:8mm;padding-top:1.8mm;border-right-width:0px;"/>
									<div class="styLNAmountBox" style="height:4.9mm;border-bottom-width:0px;border-left-width:1px;text-align:left;">
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Line 65 - Divorced Spouse SSN</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$FormData/EstimatedTaxPaymentsAmt/@divorcedSpouseSSN"/>
										</xsl:call-template>
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Line 65 - Divorced Literal Code</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$FormData/EstimatedTaxPaymentsAmt/@divorcedLiteralCd"/>
										</xsl:call-template>
									</div>
								</span>
							</div>
							<!--End Line 65 -->
							<!-- Line 66a -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;padding-left:1mm;border-color:black;border-style:solid;border-width:1px 0px;">66a</div>
								<div style="width:76mm;padding-top:.5mm;padding-left:1mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
										<span class="styBoldText" style="float:left;clear:none;">Earned income credit (EIC)</span>
										<div style="float:left;clear:none;padding-left:1mm">
											<!-- Form to Form Link -->
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/EarnedIncomeCreditAmt"/>
											</xsl:call-template>
											<xsl:call-template name="LinkToLeftoverDataTableInline">
												<xsl:with-param name="TargetNode" select="$FormData/EICEligibilityLiteralCd"/>
												<xsl:with-param name="Desc">Line 66a - EIC Eligibility Literal Code</xsl:with-param>
											</xsl:call-template>
										</div>
									</span>
									<span class="styDotLn" style="float:right;padding-right:2mm;clear:none;">.......</span>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="height:19px;padding-top:1mm;width:8mm;">66a</div>
									<div class="styLNAmountBox" style="height:19px;padding-top:1mm;width:32mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/EarnedIncomeCreditAmt"/>
											<xsl:with-param name="BackupName">IRS1040EarnedIncomeCreditAmt</xsl:with-param>
										</xsl:call-template>
									</div>
									<div class="styShadingCell" style="height:19px;width:8mm;padding-top:1.8mm;border-right-width:0px;"/>
									<div class="styLNAmountBox" style="height:19px;border-bottom-width:0px;border-left-width:1px;"/>
								</span>
							</div>
							<!--End Line 66a -->
							<!-- Line 66b -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;padding-left:4.5mm;padding-top:1mm;">b</div>
								<div style="width:36.05mm;padding-top:1mm;padding-left:1mm;float:left;clear:none;">
									<span class="styAgency" style="font-size:7.5pt;">Nontaxable combat pay election</span>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="">66b</div>
									<div class="styLNAmountBox" style="border-right:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NontxCombatPayElectionAmt"/>
											<xsl:with-param name="BackupName">IRS1040NontxCombatPayElectionAmt</xsl:with-param>
										</xsl:call-template>
									</div>
									<div class="styShadingCell" style="height:4.8mm;width:8.05mm;margin-bottom:0.3mm"/>
									<div class="styLNAmountBox" style="height:4.8mm;border-bottom-width:0px;"/>
									<div class="styShadingCell" style="height:4.8mm;width:8mm;border-right-width:0px;"/>
									<div class="styLNAmountBox" style="height:4.8mm;border-bottom-width:0px;border-left-width:1px;"/>
								</span>
							</div>
							<!--End Line 66b -->
							<!-- Line 67 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;padding-left:1mm;padding-top:1mm;">67</div>
								<div style="width:77mm;padding-top:.8mm;padding-left:3mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
                            Additional child tax credit. Attach Schedule 8812 
                               <!-- Form to Form Link -->
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/AdditionalChildTaxCreditAmt"/>
										</xsl:call-template>
									</span>
									<span class="styDotLn" style="float:right;padding-right:2mm;clear:none;">.</span>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="height:19px;padding-top:1mm;">67</div>
									<div class="styLNAmountBox" style="height:19px;padding-top:1mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AdditionalChildTaxCreditAmt"/>
											<xsl:with-param name="BackupName">IRS1040AdditionalChildTaxCreditAmt</xsl:with-param>
										</xsl:call-template>
									</div>
									<div class="styShadingCell" style="height:19px;width:8mm;padding-top:1.8mm;border-right-width:0px;"/>
									<div class="styLNAmountBox" style="height:19px;border-bottom-width:0px;border-left-width:1px;"/>
								</span>
							</div>
							<!--End Line 67 -->
							<!-- Line 68 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;padding-top:1mm;padding-left:1mm;">68</div>
								<div style="width:77.2mm;font-size:6.5pt;padding-top:.8mm;padding-left:3mm;float:left;clear:none;">
							   American opportunity credit from Form 8863, line 8
                               <!-- Form to Form Link -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/RefundableAmerOppCreditAmt"/>
									</xsl:call-template>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="height:19px;padding-top:1mm;">68</div>
									<div class="styLNAmountBox" style="height:19px;padding-top:1mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/RefundableAmerOppCreditAmt"/>
											<xsl:with-param name="BackupName">IRS1040RefundableAmerOppCreditAmt</xsl:with-param>
										</xsl:call-template>
									</div>
									<div class="styShadingCell" style="height:19px;width:8mm;padding-top:1.8mm;border-right-width:0px;"/>
									<div class="styLNAmountBox" style="height:19px;border-bottom-width:0px;border-left-width:1px;"/>
								</span>
							</div>
							<!--End Line 68 -->
							<!-- Line 69 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;padding-left:1mm;">69</div>
								<div style="width:77mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
                               Net premium tax credit.  Attach Form 8962 
                               	<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/ReconciledPremiumTaxCreditAmt"/>
									</xsl:call-template>
									<span class="styDotLn" style="float:none;clear:none;">....</span>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="height:19px;padding-top:1mm;">69</div>
									<div class="styLNAmountBox" style="height:19px;padding-top:1mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/ReconciledPremiumTaxCreditAmt"/>
											<xsl:with-param name="BackupName">IRS1040Form8962Amtt</xsl:with-param>
										</xsl:call-template>
									</div>
									<div class="styShadingCell" style="height:19px;width:8mm;padding-top:1.8mm;border-right-width:0px;"/>
									<div class="styLNAmountBox" style="height:19px;border-bottom-width:0px;border-left-width:1px;"/>
								</span>
							</div>
							<!--End Line 69 -->
							<!-- Line 70 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;padding-left:1mm;">70</div>
								<div style="width:77mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
                            Amount paid with request for extension to file 
                              <span class="styDotLn" style="float:none;clear:none;">....</span>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="height:19px;padding-top:1mm;">70</div>
									<div class="styLNAmountBox" style="height:19px;padding-top:1mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/RequestForExtensionAmt"/>
											<xsl:with-param name="BackupName">IRS1040RequestForExtensionAmt</xsl:with-param>
										</xsl:call-template>
									</div>
									<div class="styShadingCell" style="height:19px;width:8mm;padding-top:1.8mm;border-right-width:0px;"/>
									<div class="styLNAmountBox" style="height:19px;border-bottom-width:0px;border-left-width:1px;"/>
								</span>
							</div>
							<!--End Line 70 -->
							<!-- Line 71 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;padding-top:1mm;padding-left:1mm;">71</div>
								<div style="width:77mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
										<span class="styAgency" style="font-size:8pt;">Excess social security and tier 1 RRTA tax withheld</span>
									</span>
									<span class="styDotLn" style="float:none;padding-left:2mm;padding-right:0mm;">....</span>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="height:19px;padding-top:1mm;">71</div>
									<div class="styLNAmountBox" style="height:19px;padding-top:1mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/ExcessSocSecAndTier1RRTATaxAmt"/>
											<xsl:with-param name="BackupName">IRS1040ExcessSocSecAndTier1RRTATaxAmt</xsl:with-param>
										</xsl:call-template>
									</div>
									<div class="styShadingCell" style="height:19px;width:8mm;padding-top:1.8mm;border-right-width:0px;"/>
									<div class="styLNAmountBox" style="height:19px;border-bottom-width:0px;border-left-width:1px;"/>
								</span>
							</div>
							<!--End Line 71 -->
							<!-- Line 72 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;padding-left:1mm;">72</div>
								<div style="width:77mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
                               Credit for federal tax on fuels. Attach Form 4136
                               <xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/TotalFuelTaxCreditAmt"/>
										</xsl:call-template>
									</span>
									<span class="styDotLn" style="float:right;padding-left:2mm;float:none;clear:none;">.</span>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="height:19px;padding-top:1mm;">72</div>
									<div class="styLNAmountBox" style="height:19px;padding-top:1mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalFuelTaxCreditAmt"/>
											<xsl:with-param name="BackupName">IRS1040TotalFuelTaxCreditAmt</xsl:with-param>
										</xsl:call-template>
									</div>
									<div class="styShadingCell" style="height:19px;width:8mm;padding-top:1.8mm;border-right-width:0px;"/>
									<div class="styLNAmountBox" style="height:19px;border-bottom-width:0px;border-left-width:1px;"/>
								</span>
							</div>
							<!--End Line 72 -->
							<!-- Line 73 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;padding-top:1mm;padding-left:1mm;">73</div>
								<div style="width:77mm;padding-top:.8mm;padding-left:3mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
										<span class="styAgency">Credits from Form:</span>
										<span style="width:1px;"/>
										<span class="styBoldText">a</span>
										<span style="width:1px;"/>
										<!-- Checkbox -->
										<input type="Checkbox" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/Form2439Ind"/>
												<xsl:with-param name="BackupName">IRS1040Form2439Ind</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:1px;"/>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$FormData/Form2439Ind"/>
												<xsl:with-param name="BackupName">IRS1040Form2439Ind</xsl:with-param>
											</xsl:call-template>
											<span class="styAgency" style="font-size:6pt;">2439</span>
										</label>
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/Form2439Ind"/>
										</xsl:call-template>
										<span style="width:1px;"/>
										<span class="styBoldText">b</span>
										<span style="width:1px;"/>
										<!-- Checkbox -->
										<img src="{$ImagePath}/1040_GrayCheckbox.gif" alt="Gray Checkbox"/>
										<span style="width:1px;"/>
										<label>
											<span class="styAgency" style="font-size:6pt;">Reserved</span>
										</label>
										<span style="width:1px;"/>
										<span class="styBoldText">c</span>
										<span style="width:1px;"/>
										<!-- Checkbox -->
										<img src="{$ImagePath}/1040_GrayCheckbox.gif" alt="Gray Checkbox"/>
										<span style="width:1px;"/>
										<label>
											<span class="styAgency" style="font-size:6pt;">Reserved</span>
										</label>
										<span style="width:1px;"/>
										<span class="styBoldText">d</span>
										<span style="width:1px;"/>
										<!-- Checkbox -->
										<input type="Checkbox" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/OtherPaymentsInd"/>
												<xsl:with-param name="BackupName">IRS1040OtherPaymentsInd</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:1px;"/>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$FormData/OtherPaymentsInd"/>
												<xsl:with-param name="BackupName">IRS1040OtherPaymentsInd</xsl:with-param>
											</xsl:call-template>
											<span class="styFixedUnderline" style="padding-top:0mm;padding-bottom:0mm;float:none;width:2mm;"/>
										</label>
									</span>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="padding-top:1mm;">73</div>
									<div class="styLNAmountBox" style="padding-top:1mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/OtherPaymentsAmt"/>
											<xsl:with-param name="BackupName">IRS1040OtherPaymentsAmt</xsl:with-param>
										</xsl:call-template>
									</div>
									<div class="styShadingCell" style="height:4mm;width:8mm;padding-top:1.8mm;border-right-width:0px;"/>
									<div class="styLNAmountBox" style="text-align:left;border-left-width:1px;">
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Line 73 - Credit for Repayment Code</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$FormData/CreditForRepaymentCd"/>
										</xsl:call-template>
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Line 73 - Credit for Repayment Amount</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$FormData/CreditForRepaymentAmt"/>
										</xsl:call-template>
									</div>
								</span>
							</div>
							<!--End Line 73 -->
							<!-- Line 74 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;">74</div>
								<div style="width:117.8mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
                           Add lines 64, 65, 66a, and 67 through 73.  These are your<b> total payments </b>
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Line 74 - Form 8689 Code</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$FormData/TotalPaymentsAmt/@form8689Cd"/>
										</xsl:call-template>
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Line 74 - Form 8689 Amount</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$FormData/TotalPaymentsAmt/@form8689Amt"/>
										</xsl:call-template>
									</span>
									<span class="styDotLn" style="clear:none;padding-left:3.5mm;">.</span>
									<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="border-bottom-width:0px;">74</div>
									<div class="styLNAmountBox" style="border-bottom-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalPaymentsAmt"/>
											<xsl:with-param name="BackupName">IRS1040TotalPaymentsAmt</xsl:with-param>
										</xsl:call-template>
									</div>
								</span>
							</div>
							<!--End Line 74 -->
						</div>
					</div>
					<!-- end Payments -->
					<!-- Refund -->
					<div style="width:187mm;">
						<div style="width:21.5mm;float:left;clear:none;">
							<div style="padding-top:0mm;">
								<span class="styMainTitle" style="font-size:11pt;">
                     Refund
                     </span>
								<div style="padding-top:7mm;">
                        Direct deposit?<br/>
                        See<br/> instructions.
                     </div>
							</div>
						</div>
						<div style="width:165.5mm;float:left;clear:none;">
							<!-- Line 75 -->
							<div style="width:165.5mm;">
								<div class="styLNLeftNumBox" style="padding-left:4.3mm;padding-top:0mm;">75</div>
								<div style="width:117.3mm;padding-left:2.5mm;float:left;float:left;clear:none;">
                            If line 74 is more than line 63, 
                              <span class="styAgency" style="font-size:7.5pt;">subtract line 63 from line 74.</span> 
                              This is the amount you <b>overpaid</b>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="">75</div>
									<div class="styLNAmountBox" style="">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/OverpaidAmt"/>
											<xsl:with-param name="BackupName">IRS1040OverpaidAmt</xsl:with-param>
										</xsl:call-template>
									</div>
								</span>
							</div>
							<!--End Line 75 -->
							<!-- Line 76a -->
							<div style="width:165.5mm;">
								<div class="styLNLeftNumBox" style="padding-left:4mm;">76a</div>
								<div style="width:116.3mm;padding-top:.5mm;padding-left:1.5mm;float:left;clear:none;">
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/Form8888Ind"/>
											<xsl:with-param name="BackupName">IRS1040Form8888Ind</xsl:with-param>
										</xsl:call-template>
										<span class="styAgency" style="font-size:8pt;">
								   Amount of line 75 you want <b>refunded to you. </b> If Form 8888 is attached, check here</span>
									</label>
									<span class="styDotLn" style="padding-left:0.75mm;float:none;clear:none;">..</span>
									<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
									<span style="width:2px;"/>
									<!-- Checkbox -->
									<input type="Checkbox" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/Form8888Ind"/>
											<xsl:with-param name="BackupName">IRS1040Form8888Ind</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="padding-left:2mm">
										<!-- Form to Form Link -->
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/Form8888Ind"/>
										</xsl:call-template>
									</span>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="padding-top:1mm;float:left;clear:none;">76a</div>
									<div class="styLNAmountBox" style="padding-top:1mm;float:left;clear:none;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/RefundAmt"/>
											<xsl:with-param name="BackupName">IRS1040RefundAmt</xsl:with-param>
										</xsl:call-template>
									</div>
								</span>
							</div>
							<!--End Line 76a -->
							<!-- Line 76b -->
							<div style="width:165.5mm;">
								<div class="styLNLeftNumBox" style="width:9.5mm;padding-left:1mm;">
									<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
									<span style="width:3.2mm;"/>b
					</div>
								<div style="width:116mm;padding-top:.5mm;padding-left:1mm;float:left;clear:none;">
									<span style="width:25mm;float:left;clear:none;">
                           Routing number
                           </span>
										<span class="styLNCtrNumBox" style="width:34mm;border-top-width:1px;padding-top:0mm;padding-bottom:0mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/RoutingTransitNum"/>
											<xsl:with-param name="BackupName">IRS1040RoutingTransitNumber</xsl:with-param>
										</xsl:call-template>
									</span>
									<span style="width:7px;"/>
									<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
									<span style="width:4px;"/>
									<span class="styBoldText">c</span> Type:
                           <span style="width:4px;"/>
									<!-- Checkbox  1=checking, 2 = savings -->
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateEnumeratedCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/BankAccountTypeCd"/>
											<xsl:with-param name="DisplayedCheckboxValue" select="'1'"/>
											<xsl:with-param name="BackupName">IRS1040BankAccountTypeCd[1]</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/BankAccountTypeCd"/>
											<xsl:with-param name="DisplayedCheckboxValue" select="1"/>
											<xsl:with-param name="BackupName">IRS1040BankAccountTypeCd[1]</xsl:with-param>
										</xsl:call-template>
								Checking
							</label>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateEnumeratedCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/BankAccountTypeCd"/>
											<xsl:with-param name="DisplayedCheckboxValue" select="'2'"/>
											<xsl:with-param name="BackupName">IRS1040BankAccountTypeCd[2]</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/BankAccountTypeCd"/>
											<xsl:with-param name="DisplayedCheckboxValue" select="'2'"/>
											<xsl:with-param name="BackupName">IRS1040BankAccountTypeCd[2]</xsl:with-param>
										</xsl:call-template>
								Savings
							</label>
								</div>
								<span style="float:right;">
									<div class="styShadingCell" style="height:19px;width:8mm;padding-top:1.8mm;border-right-width:0px;"/>
									<div class="styLNAmountBox" style="height:19px;border-bottom-width:0px;border-left-width:1px;"/>
								</span>
							</div>
							<!--End Line 76b -->
							<!-- Line 76d -->
							<div style="width:165.5mm;">
								<div class="styLNLeftNumBox" style="width:9.5mm;padding-left:1mm;">
									<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
									<span style="width:3.2mm;"/>d
					</div>
								<div style="width:116mm;padding-top:.5mm;padding-left:1mm;float:left;clear:none;">
									<span style="width:25mm;float:left;clear:none;">
                           Account number
                           </span>
									<span class="styLNCtrNumBox" style="width:84mm;border-top-width:1px;padding-top:0mm;padding-bottom:0mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/DepositorAccountNum"/>
											<xsl:with-param name="BackupName">IRS1040DepositorAccountNumber</xsl:with-param>
										</xsl:call-template>
									</span>
								</div>
								<span style="float:right;">
									<div class="styShadingCell" style="height:19px;width:8mm;padding-top:1.8mm;border-right-width:0px;"/>
									<div class="styLNAmountBox" style="height:19px;border-bottom-width:0px;border-left-width:1px;"/>
								</span>
							</div>
							<!--End Line 76d -->
							<!-- Line 77 -->
							<div style="width:165.5mm;">
								<div class="styLNLeftNumBox" style="padding-left:4.3mm;border-bottom-width:0mm;">77</div>
								<div style="height:4mm;width:77.3mm;padding-left:2.5mm;border-bottom-width:0mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
										<span class="styAgency" style="font-size:7.8pt;">Amount of line 75 you want<b> applied to your 2015 estimated tax</b>
										</span>
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/AppliedToEsTaxAmt"/>
										</xsl:call-template>
										<span style="width:1px;padding-left:1mm;"/>
										<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
									</span>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="border-bottom-width:0mm;">77</div>
									<div class="styLNAmountBox" style="border-bottom-width:0mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AppliedToEsTaxAmt"/>
											<xsl:with-param name="BackupName">IRS1040AppliedToEsTaxAmt</xsl:with-param>
										</xsl:call-template>
									</div>
									<div class="styShadingCell" style="height:4mm;width:8mm;padding-top:1.2mm;border-right-width:0px;"/>
									<div class="styLNAmountBox" style="height:4.4mm;border-bottom-width:0px;border-left-width:1px;text-align:left;"/>
								</span>
							</div>
							<!--End Line 77 -->
						</div>
					</div>
					<!-- Owe -->
					<div class="styBB" style="width:187mm;">
						<div style="width:24.5mm;float:left;clear:none;border-style:solid;border-color:black;border-width:1px 0px 0px 0px;">
							<div style="padding-top:0mm;padding-bottom:0mm;">
								<span class="styMainTitle" style="width:16mm;font-size:10pt;height:7mm;">
                     Amount
                     You Owe
                     </span>
							</div>
						</div>
						<div style="width:162.5mm;float:left;clear:none;height:8mm;">
							<!-- Line 78 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;border-style:solid;border-color:black;border-width:1px 0px 0px 0px;">78</div>
								<div style="width:117.8mm;padding-top:.5mm;padding-left:3mm;border-style:solid;border-color:black;border-width:1px 0px 0px 0px;float:left;clear:none;">
									<b>Amount you owe.</b> Subtract line 74 from line 63. 
                              <span class="styAgency" style="font-size:7.5pt;">For details on how to pay, </span>
                              see instructions
                              
                           <img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="padding-top:1mm;bording-width-top:0mm;float:left;clear:none;">78</div>
									<div class="styLNAmountBox" style="padding-top:1mm;bording-width-top:0mm;float:left;clear:none;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/OwedAmt"/>
											<xsl:with-param name="BackupName">IRS1040AmountOwedAmt</xsl:with-param>
										</xsl:call-template>
									</div>
								</span>
							</div>
							<!--End Line 78 -->
							<!-- Line 79 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;padding-left:1mm;">79</div>
								<div style="width:77.8mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
                            Estimated tax penalty (see instructions) 
                           <span class="styDotLn" style="padding-left:2mm;float:none;clear:none;">.....</span>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="border-bottom-width:0px;">79</div>
									<div class="styLNAmountBox" style="border-bottom-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/EsPenaltyAmt"/>
											<xsl:with-param name="BackupName">IRS1040EsPenaltyAmt</xsl:with-param>
										</xsl:call-template>
									</div>
									<div class="styShadingCell" style="height:4mm;width:40mm;padding-top:1mm;float:left;clear:none;"/>
								</span>
							</div>
							<!--End Line 79 -->
						</div>
					</div>
					<!-- 3rd party -->
					<div style="width:187mm;padding-top:.5mm;border-style:solid;border-color:black;border-width:0px 0px 1px 0px;float:none;clear:both;">
						<div style="width:22mm;float:left;clear:none;">
							<div style="padding-top:1mm;padding-bottom:0mm;">
								<span class="styMainTitle" style="font-size:11pt;">
                     Third Party
                     Designee                
                     </span>
							</div>
						</div>
						<div style="float:left;clear:none;width:165mm;">
							<div style="font-size:7pt;float:left;clear:none;padding-left:2mm;">Do you want to allow another person to discuss this return with the IRS
								(see instructions)?
							</div>
							<div style="float:left;clear:none;padding-left:1mm;">
								<!-- Checkbox -->
								<input type="Checkbox" class="styCkbox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/ThirdPartyDesigneeInd"/>
										<xsl:with-param name="BackupName">IRS1040ThirdPartyDesigneeInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$FormData/ThirdPartyDesigneeInd"/>
										<xsl:with-param name="BackupName">IRS1040ThirdPartyDesigneeInd</xsl:with-param>
									</xsl:call-template>
									<span class="styBoldText" style="padding-left:1mm;">Yes.</span> 
							 Complete below.
                    </label>
							</div>
							<div style="float:left;clear:none;padding-left:1mm;">
								<!-- Checkbox -->
								<input type="Checkbox" class="styCkbox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/ThirdPartyDesigneeInd"/>
										<xsl:with-param name="BackupName">IRS1040ThirdPartyDesigneeInd</xsl:with-param>
									</xsl:call-template>
									<!-- To Do: insert populate code and uncomment -->
								</input>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$FormData/ThirdPartyDesigneeInd"/>
										<xsl:with-param name="BackupName">IRS1040ThirdPartyDesigneeInd</xsl:with-param>
									</xsl:call-template>
									<span class="styBoldText" style="padding-left:1mm;">No</span>
								</label>
							</div>
						</div>
						<div style="height:9mm;float:left;clear:none;width:165mm;padding-top:2mm;">
							<div style="height:7mm;float:left;clear:none;width:18mm;padding-left:2mm;">
                  Designee's
                  name
                     <span style="width:18px;"/>
								<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
							</div>
							<div style="width:46mm;float:left;clear:none;padding-top:3mm;">
								<xsl:if test="$FormData/ThirdPartyDesigneeNm">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/ThirdPartyDesigneeNm"/>
										<xsl:with-param name="BackupName">IRS1040ThirdPartyDesigneeName</xsl:with-param>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$FormData/Preparer">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/Preparer"/>
										<xsl:with-param name="BackupName">IRS1040Preparer</xsl:with-param>
									</xsl:call-template>
								</xsl:if>
							</div>
							<div style="float:left;clear:none;width:13mm;padding-left:.5mm;">
                  Phone<br/>
                     no.
                     <span style="width:18px;"/>
								<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
							</div>
							<div style="float:left;clear:none;width:29mm;padding-top:3mm;">
								<xsl:call-template name="PopulatePhoneNumber">
									<xsl:with-param name="TargetNode" select="$FormData/ThirdPartyDesigneePhoneNum"/>
									<xsl:with-param name="BackupName">IRS1040ThirdPartyDesigneePhone</xsl:with-param>
								</xsl:call-template>
							</div>
							<div style="float:left;clear:none;width:35mm;padding-left:.5mm;">
                  Personal identification
                  number (PIN)
                     <span style="width:12mm;"/>
								<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
							</div>
							<div style="height:5mm;width:24mm;float:left;clear:none;">
								<div class="styLNCtrNumBox" style="float:right;width:23mm;border-top-width:1px;padding-top:1mm;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/ThirdPartyDesigneePIN"/>
										<xsl:with-param name="BackupName">IRS1040ThirdPartyDesigneePIN</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
					</div>
					<!-- this page break added so Paid Preparer would print!
            <div class="pageEnd" style="width:187mm;" /> -->
					<!-- signature -->
					<div class="styBB" style="width:187mm;padding-top:0mm;float:none;clear:both;">
						<div style="width:23mm;float:left;clear:none;">
							<div style="width:18mm;float:left;clear:none;">
								<div style="float:left;clear:none;">
									<span class="styMainTitle" style="font-size:11pt;float:left;clear:none;">
                        Sign
                        Here
                        </span>
									<br/>
									<br/>
									<br/>
                        Joint return?<br/>
                        See instructions.<br/>
                        Keep a copy<br/>
                        for your<br/>
                        records.                
                     </div>
							</div>
							<div style="padding-top:12.7mm;padding-left:8px;padding-right:0px;float:left;clear:none;width:4mm;">
								<img src="{$ImagePath}/1040_Bullet_SuperLg.gif" alt="Right pointing arrowhead image" height="48" width="10"/>
							</div>
						</div>
						<div style="float:left;clear:none;width:164mm;">
							<div class="" style="width:164mm;font-size:6pt;font-family:Arial-Narrow;float:left;clear:none;">
                  Under penalties of perjury, I declare that I have examined this return and accompanying schedules and statements, and to the best of my knowledge and
                  belief, they are true, correct, and complete. Declaration of preparer (other than taxpayer) is based on all information of which preparer has any knowledge.
                  </div>
							<!-- <div class="" style="float:left;clear:none;height:1mm;width:162mm;">
                  <span style="width:1mm;height:.25mm;background-color:blue;"></span> 
                  </div>-->
                  			<div style="width:164mm;float:left;clear:none;"/>
							<div class="styBB" style="width:164mm;float:left;clear:none;">
								<div style="width:71mm;float:left;clear:none;">
									<div class="styFNBox" style="width:71mm;float:left;clear:none;">
                        Your signature
                        </div>
									<div class="styFNBox" style="height:8mm;width:71mm;padding-top:1.5mm;float:left;clear:none;">
										<xsl:call-template name="PopulatePin">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/PrimarySignaturePIN"/>
											<xsl:with-param name="BackupName">$RtnHdrDataPrimarySignature</xsl:with-param>
										</xsl:call-template>
									</div>
								</div>
								<div class="styFNBox" style="width:18mm;float:left;clear:none;">
									<div style="width:16mm;padding-left:2mm;float:left;clear:none;">
                        Date
                        </div>
									<div style="height:8mm;width:18mm;padding-top:1.5mm;text-align:center;float:left;clear:none;">
										<xsl:call-template name="PopulateMonthDayYear">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/PrimarySignatureDt"/>
											<xsl:with-param name="BackupName">$RtnHdrDataPrimarySignatureDate</xsl:with-param>
										</xsl:call-template>
									</div>
								</div>
								<div class="styFNBox" style="width:36mm;float:left;clear:none;">
									<div style="width:36.8mm;padding-left:2mm;float:left;clear:none;">
                        Your occupation
                        </div>
									<div style="height:8mm;width:36mm;padding-top:1.5mm;padding-left:2mm;float:left;clear:none;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/PrimaryOccupationTxt"/>
											<xsl:with-param name="BackupName">IRS1040PrimaryOccupation</xsl:with-param>
										</xsl:call-template>
									</div>
								</div>
								<div class="" style="width:35mm;float:left;clear:none;">
									<div style="width:35mm;padding-left:2mm;float:left;clear:none;">
                        Daytime phone number
                        </div>
									<div style="height:8mm;width:35mm;padding-top:1.5mm;padding-left:2mm;float:left;clear:none;">
										<!-- Taxpayer Daytime Telephone Number -->
										<xsl:call-template name="PopulatePhoneNumber">
											<xsl:with-param name="TargetNode" select="$FormData/DaytimePhoneNum"/>
											<xsl:with-param name="BackupName">IRS1040DaytimePhoneNumber</xsl:with-param>
										</xsl:call-template>
										<!-- Optional Foreign Telephone Number -->
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/OptionalForeignTelephoneNum"/>
											<xsl:with-param name="BackupName">IRS1040OptionalForeignTelephoneNumber</xsl:with-param>
										</xsl:call-template>
									</div>
								</div>
							</div>
							<div class="" style="width:164mm;float:left;clear:none;">
								<div style="width:71mm;float:left;clear:none;">
									<div class="styFNBox" style="width:71mm;float:left;clear:none;">
                        Spouse's signature. If a joint return,<span class="styBoldText"> both</span> must sign.
                        </div>
									<div class="styFNBox" style="height:9mm;width:71mm;padding-top:1.5mm;float:left;clear:none;">
										<xsl:call-template name="PopulatePin">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/SpouseSignaturePIN"/>
											<xsl:with-param name="BackupName">$RtnHdrDataSpouseSignature</xsl:with-param>
										</xsl:call-template>
									</div>
								</div>
								<div class="styFNBox" style="width:18mm;height:12mm;float:left;clear:none;">
									<div style="width:16mm;padding-left:2mm;float:left;clear:none;">
                        Date
                        </div>
									<div style="height:8mm;width:18mm;padding-top:1.5mm;text-align:center;float:left;clear:none;">
										<xsl:call-template name="PopulateMonthDayYear">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/SpouseSignatureDt"/>
											<xsl:with-param name="BackupName">$RtnHdrDataSpouseSignatureDate</xsl:with-param>
										</xsl:call-template>
									</div>
								</div>
								<div class="styFNBox" style="width:36mm;height:12mm;float:left;clear:none;">
									<div style="width:36.8mm;padding-left:2mm;float:left;clear:none;">
                        Spouse's occupation
                        </div>
									<div style="height:8mm;width:36mm;padding-top:1.5mm;padding-left:2mm;float:left;clear:none;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/SpouseOccupationTxt"/>
											<xsl:with-param name="BackupName">IRS1040SpouseOccupation</xsl:with-param>
										</xsl:call-template>
									</div>
								</div>
								<div class="styGenericDiv" style="height:11mm;width:37mm;border-left-width:0px;">
									<span style="width:100%;padding-left:4px;font-family:Arial Narrow;font-size:larger;">If the IRS sent you an Identity Protection PIN, enter it here (see </span>
									<br/>
									<span style="width:20%;padding-left:4px;font-family:Arial Narrow;font-size:larger;float:left;">
										inst.)
									</span>
									<span style="width:80%;padding-top:0px;padding-right:5mm;float:right;text-align:center;">
										<div class="styLNCtrNumBox" style="float:right;height:2mm;width:23mm;border-top-width:1px;">
											<xsl:call-template name="PopulatePin">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/IdentityProtectionPIN"/>
											</xsl:call-template>
										</div>
									</span>
								</div>
							</div>
						</div>
					</div>
					<!-- paid preparer -->
					<div class="styBB" style="width:187mm;font-size:6pt;float:none;clear:both;">
						<div style="width:22.75mm;padding-top:4mm;float:left;clear:none;">
							<span class="styMainTitle" style="font-size:11pt;">
									Paid
									Preparer
									Use Only
									</span>
						</div>
						<div style="width:164mm;float:left;clear:none;">
							<div style="width:164mm;float:left;clear:none;border-style:solid;border-color:black;border-width:0px 0px 1px 0px;">
								<div class="styLNDesc" style="height:6mm;width:46.8mm;padding-top:0mm;border-right:1 solid black;">
								Print/Type preparer's name<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerPersonNm"/>
										<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPreparerPersonName</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styLNDesc" style="height:6mm;width:46.5mm;padding-top:0mm;border-right:1 solid black;padding-left:1mm;">
								Preparer's signature
							</div>
								<div class="styLNDesc" style="height:6mm;width:15mm;border-right:1 solid black;padding-top:0mm;padding-left:1mm;">Date <br/>
									<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
										<xsl:with-param name="TargetNode">DateSigned</xsl:with-param>
										<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationDateSigned</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styLNDesc" style="height:6mm;width:18mm;border-right:1 solid black;padding-top:.5mm;padding-bottom:0mm;padding-left:1mm;">
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/SelfEmployedInd"/>
											<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationSelfEmployed</xsl:with-param>
										</xsl:call-template>
										Check 
										<input class="styCkbox" type="checkbox" style="width:4mm;">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/SelfEmployedInd"/>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationSelfEmployed</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:4px;"/>if<br/>self-employed
									</label>
								</div>
								<div class="styLNDesc" style="height:6mm;width:16mm;padding-top:0mm;padding-left:1mm;">PTIN
                             <br/>
									<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerSSN">
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">PreparerSSN</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPreparerSSN</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PTIN">
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">PTIN</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPTIN</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/STIN">
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">STIN</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationSTIN</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
								</div>
							</div>
							<div style="width:164mm;float:left;clear:none;border-style:solid;border-color:black;border-width:0px 0px 1px 0px;">
								<div class="styLNDesc" style="height:6mm;width:108.5mm;border-right:1 solid black;">
									<span class="styGenericDiv" style="">Firm's name 
									<span style="width:2.2mm;"/>
										<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
										<span style="width:4px;"/>
									</span>
									<div class="styGenericDiv" style="padding-right:.5mm;">
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPreparerBusinessName1</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPreparerBusinessName2</xsl:with-param>
										</xsl:call-template>
									</div>
								</div>
								<div class="styLNDesc" style="height:6mm;width:32mm;padding-left:1mm;">Firm's EIN
								<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
									<span style="width:4px;"/>
									<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerFirmEIN">
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">PreparerFirmIDNumber</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPreparerFirmIDNumber</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/MissingEINReason">
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">MissingEINReason</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationMissingEINReason</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
								</div>
							</div>
							<div style="width:164mm;float:left;clear:none;">
								<div class="styLNDesc" style="width:108.5mm;border-right:1 solid black;">
									<div class="styGenericDiv" style="padding-right:.5mm;">Firm's address 
									<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
									</div>
									<div class="styGenericDiv" style="padding-right:.5mm;">
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationAddressLine1</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationAddressLine2</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress">
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">CityNm</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationUSAddressCity</xsl:with-param>
											</xsl:call-template>,
											<span style="width:2px;"/>
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">StateAbbreviationCd</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationUSAddressState</xsl:with-param>
											</xsl:call-template>,
											<span style="width:2px;"/>
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">ZIPCd</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationUSAddressZip</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress">
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">CityNm</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationForeignAddressCity</xsl:with-param>
											</xsl:call-template>,
											<span style="width:2px;"/>
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">ProvinceOrStateNm</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationForeignProvinceOrState</xsl:with-param>
											</xsl:call-template>,
											<span style="width:2px;"/>
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">ForeignPostalCd</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationForeignPostalCd</xsl:with-param>
											</xsl:call-template>,
											<span style="width:2px;"/>
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">CountryCd</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationForeignCountryCd</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
									</div>
								</div>
								<div class="styLNDesc" style="width:32mm;padding-left:1mm;"> Phone no. 
 								<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
										<xsl:with-param name="TargetNode">Phone</xsl:with-param>
										<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPhone</xsl:with-param>
									</xsl:call-template>
									<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
										<xsl:with-param name="TargetNode">ForeignPhone</xsl:with-param>
										<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationForeignPhone</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
					</div>
					<!-- END PREPARER SIGNATURE SECTION -->
					<!-- page 2 footer -->
					<div class="pageEnd" style="width:187mm;">
						<span style="float:right;clear:none;">
               Form <span class="styBoldText" style="font-size:10pt;">1040</span> (2014)
               </span>
					</div>
					<!-- end page 2 footer -->
					<!-- Additonal Data Title Bar and Button -->
					<div class="styLeftOverTitleLine" id="LeftoverData">
						<div class="styLeftOverTitle">
               Additional Data        
               </div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" type="button" TabIndex="-1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<!-- Additional Data Table -->
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$FormData"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Header - Primary Name Control</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PrimaryNameControlTxt"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Header - In Care Of Name</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/InCareOfNm"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Header - Spouse Name Control</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/SpouseNameControlTxt"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<!--<xsl:if test="$FormData/IndividualReturnFilingStatusCd = 4">-->
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 4 - Qualifying HOH SSN</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/QualifyingHOHSSN"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<!--</xsl:if>-->
						<!--<xsl:if test="$FormData/IndividualReturnFilingStatusCd = 4 and $FormData/ExemptSpouseInd = 'X' ">
				<xsl:call-template name="PopulateLeftoverRow">
				   <xsl:with-param name="Desc">Line 6b - Exempt Spouse Name</xsl:with-param>
				   <xsl:with-param name="TargetNode" select="$FormData/ExemptSpouseName" />
				   <xsl:with-param name="DescWidth" select="100"/>
				</xsl:call-template>
				
            </xsl:if>-->
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 6b - Exempt Spouse Name</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/ExemptSpouseNm"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 6b - Exempt Spouse Name Control</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/ExemptSpouseNameControlTxt"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:if test="($Print != $Separated) or (count($FormData/DependentDetail) &lt;= 4)">
							<xsl:for-each select="$FormData/DependentDetail">
								<xsl:call-template name="PopulateLeftoverRow">
									<xsl:with-param name="Desc">Line 6c - Dependent <xsl:number value="position()" format="1"/> Name Control</xsl:with-param>
									<xsl:with-param name="TargetNode" select="DependentNameControlTxt"/>
									<xsl:with-param name="DescWidth" select="100"/>
								</xsl:call-template>
							</xsl:for-each>
						</xsl:if>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 7 - Wages Not Shown Lit Only Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/WagesSalariesAndTipsAmt/@wagesNotShownLitOnlyCd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 9a - Ordinary Form 8814 Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/OrdinaryF8814Cd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Line 9a - Ordinary Form 8814 Amt</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/OrdinaryF8814Amt"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 9b - Qualified Form 8814 Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/QualifiedF8814Cd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="TargetNode" select="$FormData/QualifiedF8814Amt"/>
							<xsl:with-param name="Desc">Line 9b - Qualified Form 8814 Amount</xsl:with-param>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 13 - Form F8814 Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/Form8814Cd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Line 13 - Form F8814 Amt</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/Form8814Amt"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 14 - Form 4684 Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/OtherGainLossAmt/@form4684Cd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:if test="(count($FormData/IRADistributionsLiteralCd) &lt; 2)">
							<xsl:call-template name="PopulateLeftoverRow">
								<xsl:with-param name="Desc">Line 15b - IRA Distributions Literal Code</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/IRADistributionsLiteralCd"/>
								<xsl:with-param name="DescWidth" select="100"/>
							</xsl:call-template>
						</xsl:if>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 16b - Pensions Annuities Literal Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/TotalTaxablePensionsAmt/@pensionsAnnuitiesLiteralCd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 16b - Foreign Employer Pension Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/ForeignEmployerPensionCd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Line 16b - Taxable Foreign Pensions Total Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/TaxableForeignPensionsTotalAmt"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 19 - Repayment Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/UnemploymentCompAmt/@repaymentCd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Line 19 - Repayment Amt</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/UnemploymentCompAmt/@repaymentAmt"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 20a - Social Security Benefits Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/SocSecBnftAmt/@socSecBnftCd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 21 - Other Income Loss Literal Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/OtherIncomeLitCd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<!-- Had to hardcode the table as a checkbox has to be represented.  There is no predefined template to represent the checkbox -->
						<xsl:if test="$FormData/ProtectiveSec108iELCRecordInd">
							<tr>
								<td class="styLeftOverTableRowDesc" style="width:100mm;" scope="row">
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/ProtectiveSec108iELCRecordInd"/>
											<xsl:with-param name="BackupName">IRS1040ProtectiveSec108iELCRecordInd</xsl:with-param>
										</xsl:call-template>
									Line 21 - Protective Sec108i ELCRecord Indicator:
                        </label>
								</td>
								<td class="PopulateLeftoverRow" style="width:87mm;">
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/ProtectiveSec108iELCRecordInd"/>
											<xsl:with-param name="BackupName">IRS1040ProtectiveSec108iELCRecordInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</td>
							</tr>
						</xsl:if>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 23 - Educator Expenses Literal Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/EducatorExpensesAmt/@educatorLiteralCd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:if test="count($FormData/AlimonyAmountGrp) = 1">
							<xsl:call-template name="PopulateLeftoverRowAmount">
								<xsl:with-param name="Desc">Line 31a - Alimony Amount</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/AlimonyAmountGrp/AlimonyPaidAmt"/>
								<xsl:with-param name="DescWidth" select="100"/>
							</xsl:call-template>
						</xsl:if>
						<xsl:call-template name="PopulateLeftoverRow">
						   <xsl:with-param name="Desc">Line 32 - IRA Deduction Code</xsl:with-param>
						   <xsl:with-param name="TargetNode" select="$FormData/IRADeductionCd" />
						   <xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 35 - Domestic Production Activities Literal Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/DomesticProductionActDedAmt/@domesticProductionActLitCd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Line 36 - Other Adjustments Total Amt</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/OtherAdjustmentsTotalAmt"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 38 - Excluded Sect 933 Puerto Rico Income Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/ExcldSect933PuertoRicoIncmAmt/@excldSect933PuertoRicoIncmCd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Line 38 - Excluded Sect 933 Puerto Rico Income Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/ExcldSect933PuertoRicoIncmAmt"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 40 - Modified Standard Deduction Ind</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/TotalItemizedOrStandardDedAmt/@modifiedStandardDeductionInd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<!-- Had to hardcode the table as a checkbox has to be represented.  There is no predefined template to represent the checkbox -->
						<!--<xsl:if test="$FormData/HousedMidwestDisplacedIndCtr">
				<tr>
					<td class="styLeftOverTableRowDesc" style="width:100mm;" scope="row">
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$FormData/HousedMidwestDisplacedIndCtr"/>
								<xsl:with-param name="BackupName">IRS1040HousedMidwestDisplacedIndCtr</xsl:with-param>
							</xsl:call-template>
              Line 42 - Housed Midwestern Displaced Individual Indicator:
                        </label>
					</td>
					<td class="PopulateLeftoverRow" style="width:87mm;">
						<input type="checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/HousedMidwestDisplacedIndCtr"/>
								<xsl:with-param name="BackupName">IRS1040HousedMidwestDisplacedIndCtr</xsl:with-param>
							</xsl:call-template>
						</input>
					</td>
				</tr>
			</xsl:if>-->
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 43 - Capital Construction Fund Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/TaxableIncomeAmt/@capitalConstructionFundCd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Line 43 - Capital Construction Fund Amt</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/TaxableIncomeAmt/@capitalConstructionFundAmt"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 43 - Schedule Q Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/ScheduleQCd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Line 44a - Child Interest and Divident Tax Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/Form8814Ind/@childInterestAndDividendTaxAmt"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 49 - Credit For Elderly Literal Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/CrForElderlyOrDisabledAmt/@creditForElderlyLiteralCd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 54c - Credit Forms Statement Schedule R</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/SpecificOtherCreditsInd/@creditFormsStatementSchRCd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 54c - Credit Forms Statement 8396</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/SpecificOtherCreditsInd/@creditFormsStatement8396Cd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 54c - Credit Forms Statement 8834</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/SpecificOtherCreditsInd/@creditFormsStatement8834Cd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 54c - Credit Forms Statement 8839</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/SpecificOtherCreditsInd/@creditFormsStatement8839Cd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 54c - Credit Forms Statement 8859</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/SpecificOtherCreditsInd/@creditFormsStatement8859Cd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 54c - Credit Forms Statement 8910</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/SpecificOtherCreditsInd/@creditFormsStatement8910Cd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 54c - Credit Forms Statement 8911</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/SpecificOtherCreditsInd/@creditFormsStatement8911Cd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 54c - Credit Forms Statement 8912</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/SpecificOtherCreditsInd/@creditFormsStatement8912Cd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 54c - Credit Forms Statement 8936</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/SpecificOtherCreditsInd/@creditFormsStatement8936Cd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 57 - Exempt SE Tax Literal Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/SelfEmploymentTaxAmt/@exemptSETaxLiteralCd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 58 - Railroad Retirement Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/RailroadRetirementCd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 59 - Retirement Tax Plan Literal Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/TaxOnIRAsAmt/@retirementTaxPlanLiteralCd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<!-- Had to hardcode the table as a checkbox has to be represented.  There is no predefined template to represent the checkbox -->
						<xsl:if test="$FormData/TotalOtherTaxAmt/@form8693ApprovedInd">
							<tr>
								<td class="styLeftOverTableRowDesc" style="width:100mm;" scope="row">
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/TotalOtherTaxAmt/@form8693ApprovedInd"/>
											<xsl:with-param name="BackupName">IRS1040TotalOtherTaxAmtForm8693ApprovedInd</xsl:with-param>
										</xsl:call-template>
									Line 62 - Form 8693 Approved Indicator:
                        </label>
								</td>
								<td class="PopulateLeftoverRow" style="width:87mm;">
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/TotalOtherTaxAmt/@form8693ApprovedInd"/>
											<xsl:with-param name="BackupName">IRS1040TotalOtherTaxAmtForm8693ApprovedInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</td>
							</tr>
						</xsl:if>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 62 - Form 8693 Approved Date</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/TotalOtherTaxAmt/@form8693ApprovedDt"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 65 - Divorced Spouse SSN</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/EstimatedTaxPaymentsAmt/@divorcedSpouseSSN"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 65 - Divorced Literal Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/EstimatedTaxPaymentsAmt/@divorcedLiteralCd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 66a - EIC Eligibility Literal Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/EICEligibilityLiteralCd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 73 - Credit for Repayment Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/CreditForRepaymentCd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Line 73 - Credit for Repayment Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/CreditForRepaymentAmt"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 74 - Form 8689 Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/TotalPaymentsAmt/@form8689Cd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Line 74 - Form 8689 Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/TotalPaymentsAmt/@form8689Amt"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<!-- Stuff w/out line references in the XSD -->
						<!--Community Property Return Indicator  -->
						<xsl:if test="$FormData/CommPropStateRtnInd">
							<tr>
								<td class="styLeftOverTableRowDesc" style="width:100mm;" scope="row">
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/CommPropStateRtnInd"/>
											<xsl:with-param name="BackupName">IRS1040CommPropStateRtnInd</xsl:with-param>
										</xsl:call-template>
										Top Left Margin - Community Property Return Indicator:
                        </label>
								</td>
								<td class="PopulateLeftoverRow" style="width:87mm;">
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/CommPropStateRtnInd"/>
											<xsl:with-param name="BackupName">IRS1040CommPropStateRtnInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</td>
							</tr>
						</xsl:if>
						<!-- Signed by Power Of Attorney Checkbox -->
						<xsl:if test="$FormData/PowerOfAttorneySignedByInd">
							<tr>
								<td class="styLeftOverTableRowDesc" style="width:100mm;" scope="row">
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/PowerOfAttorneySignedByInd"/>
											<xsl:with-param name="BackupName">IRS1040PowerOfAttorneySignedBy</xsl:with-param>
										</xsl:call-template>
										Top Left Margin - Signed by Power Of Attorney Checkbox:
                        </label>
								</td>
								<td class="PopulateLeftoverRow" style="width:87mm;">
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/PowerOfAttorneySignedByInd"/>
											<xsl:with-param name="BackupName">IRS1040PowerOfAttorneySignedBy</xsl:with-param>
										</xsl:call-template>
									</input>
								</td>
							</tr>
						</xsl:if>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Top Left Margin - Power Of Attorney Name</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/PowerOfAttorneyNm"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Top Left Margin - Primary Date of Death</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/PrimaryDeathDt"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Top Left Margin - Spouse Date Of Death</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/SpouseDeathDt"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<!-- Special Processing Literal -->
						<xsl:if test="$FormData/SpecialProcessingLiteralCd">
							<xsl:call-template name="PopulateLeftoverRow">
								<xsl:with-param name="Desc">Top Left Margin - Special Processing Literal Code</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/SpecialProcessingLiteralCd"/>
								<xsl:with-param name="DescWidth" select="100"/>
							</xsl:call-template>
						</xsl:if>
						<xsl:if test="$FormData/CombatZoneCd">
							<xsl:call-template name="PopulateLeftoverRow">
								<xsl:with-param name="Desc">Top Left Margin - Special Processing Literal Code 2</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/CombatZoneCd"/>
								<xsl:with-param name="DescWidth" select="100"/>
							</xsl:call-template>
							<xsl:call-template name="PopulateLeftoverRow">
								<xsl:with-param name="Desc">Top Left Margin - Combat Zone Date</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/CombatZoneCd/@combatZoneDt"/>
								<xsl:with-param name="DescWidth" select="100"/>
							</xsl:call-template>
						</xsl:if>
						<!-- Special Processing Code Text -->
						<xsl:if test="$FormData/SpecialProcessingCodeTxt">
							<xsl:call-template name="PopulateLeftoverRow">
								<xsl:with-param name="Desc">Top Left Margin - Special Processing Code Text</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/SpecialProcessingCodeTxt"/>
								<xsl:with-param name="DescWidth" select="100"/>
							</xsl:call-template>
						</xsl:if>
						<!-- Surviving Spouse Indicator -->
						<xsl:if test="$FormData/SurvivingSpouseInd">
							<tr>
								<td class="styLeftOverTableRowDesc" style="width:100mm;" scope="row">
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/SurvivingSpouseInd"/>
											<xsl:with-param name="BackupName">IRS1040SurvivingSpouseInd</xsl:with-param>
										</xsl:call-template>
										Top Left Margin - Surviving Spouse Ind:
                        </label>
								</td>
								<td class="PopulateLeftoverRow" style="width:87mm;">
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/SurvivingSpouseInd"/>
											<xsl:with-param name="BackupName">IRS1040SurvivingSpouseInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</td>
							</tr>
						</xsl:if>
						<!-- Personal Representative Indicator -->
						<xsl:if test="$FormData/PersonalRepresentativeInd">
							<tr>
								<td class="styLeftOverTableRowDesc" style="width:100mm;" scope="row">
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/PersonalRepresentativeInd"/>
											<xsl:with-param name="BackupName">IRS1040PersonalRepresentativeInd</xsl:with-param>
										</xsl:call-template>
										Top Left Margin - Personal Representative Ind:
                        </label>
								</td>
								<td class="PopulateLeftoverRow" style="width:87mm;">
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/PersonalRepresentativeInd"/>
											<xsl:with-param name="BackupName">IRS1040PersonalRepresentativeInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</td>
							</tr>
						</xsl:if>
						<!-- Non-Paid Preparer -->
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Top Left Margin - Non Paid Preparer Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/NonPaidPreparerCd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<!-- Refund Anticipation Loan Code -->
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Top Left Margin - Refund Anticipation Loan Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/RefundAnticipationLoanCd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<!-- New Code should be prior to this -->
						<!--<xsl:call-template name="PopulateLeftoverRow">
               <xsl:with-param name="Desc">Preparer</xsl:with-param>
               <xsl:with-param name="TargetNode" select="$FormData/Preparer" />
               <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>-->
					</table>
					<br/>
					<!-- Column widths used 
49.4
30.2
20.6
18.6
-->
					<!-- Column widths used 
91.5
91.5
-->
					<!-- Begin Separated Repeating data table for Special Condition Description-->
					<xsl:if test="$FormData/SpecialConditionDesc">
						<span class="styRepeatingDataTitle">Top Left Margin - Special Condition Description</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" rowspan="1" style="width:91.5mm;">
                           Special Condition Description
                        </th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/SpecialConditionDesc">
									<tr style="border-color:black;height:6mm;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellText" style="width:91.5mm;">
											<div style="width:6.5mm;" class="styGenericDiv">
												<div style="width:6mm;font-weight:bold;float:right;clear:none;">
													<span class="styBoldText" style="float:right;text-align:right;padding-right:2mm;">
														<xsl:value-of select="position()"/>
													</span>
												</div>
											</div>
											<div style="width:80mm;float:none;clear:none;">
												<xsl:variable name="pos" select="position()"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
													<xsl:with-param name="BackupName">IRS1040SpecialConditionDescription</xsl:with-param>
												</xsl:call-template>
											</div>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- End Separated Repeating data table for Special Condition Description-->
					<br/>
					<!-- Begin Separated Repeating data table for DependentInformations -->
					<xsl:if test="($Print = $Separated) and (count($FormData/DependentDetail) &gt; 4)">
						<span class="styRepeatingDataTitle">Form 1040 Line 6c - Dependents</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" rowspan="2" style="text-align:left;width:74.4mm;">
										<span style="font-weight:bold;">Dependents:</span>
										<br/>
										<br/>
										<br/>
										<span class="styNormalText">
                           (1) First name
                              <span style="width:32px;"/> 
                              Last name
                              <span style="width:27px;"/> 
                              Name Control
                           </span>
									</th>
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:30.2mm;">
										<br/>
										<span style="font-weight:bold;">(2)</span>
										<span class="styNormalText">
                           Dependent's
                           social security number
                           </span>
									</th>
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:20.6mm;">
										<span style="font-weight:bold;">(3)</span>
										<span class="styNormalText">
                           Dependent's
                           relationship to
                           you
                           </span>
									</th>
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:18.6mm;">
										<span style="font-weight:bold;">(4)</span>
										<span class="styNormalText">
                           if child under age 17 qualifying for child tax credit (see instructions) 
                           </span>
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/DependentDetail">
									<tr style="border-color:black;height:6mm;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellText" style="width:75.4mm;">
											<div style="float:left;clear:none;width:5mm;">
												<span style="text-align:right;float:left;width:4.25mm;font-weight:bold;" class="styGenericDiv">
													<xsl:number value="position()" format="1"/>
												</span>
											</div>
											<div style="padding-left:1mm;float:left;clear:none;width:70mm;">
												<span style="width:22mm;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="DependentFirstNm"/>
														<xsl:with-param name="BackupName">IRS1040DependentInformationsDependentFirstName</xsl:with-param>
													</xsl:call-template>
												</span>
												<span style="width:5px;"/>
												<span style="width:25mm;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="DependentLastNm"/>
														<xsl:with-param name="BackupName">IRS1040DependentInformationsDependentLastName</xsl:with-param>
													</xsl:call-template>
												</span>
												<span style="width:5px;"/>
												<span style="width:5mm;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="DependentNameControlTxt"/>
														<xsl:with-param name="BackupName">IRS1040DependentInformationsDependentNameControl</xsl:with-param>
													</xsl:call-template>
												</span>
												<!-- xsl:call-template name="PopulateText">
                         <xsl:with-param name="TargetNode" select="DependentName" />
                            <xsl:with-param name="BackupName">IRS1040DependentInformationsDependentName</xsl:with-param>
                         </xsl:call-template>
                        <span style="width:5px;"></span>
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="DependentName/@dependentNameControl"/>
                          <xsl:with-param name="BackupName">IRS1040DependentInformationsDependentNameControl</xsl:with-param>
                        </xsl:call-template -->
											</div>
										</td>
										<td class="styTableCellText" style="text-align:center;width:30.2mm;">
											<xsl:choose>
												<xsl:when test="DiedLiteralCd">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="DiedLiteralCd"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateSSN">
														<xsl:with-param name="TargetNode" select="DependentSSN"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<td class="styTableCellText" style="width:20.6mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="DependentRelationshipCd"/>
												<xsl:with-param name="BackupName">IRS1040DependentInformationsDependentRelationship</xsl:with-param>
											</xsl:call-template>
										</td>
										<td class="styTableCellText" style="text-align:center;width:18.6mm;">
											<!-- Checkbox -->
											<input type="Checkbox" class="styCkbox">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="EligibleForChildTaxCreditInd"/>
													<xsl:with-param name="BackupName">IRS1040DependentInformations<xsl:number value="position()"/>EligibleForChildTaxCreditInd</xsl:with-param>
												</xsl:call-template>
											</input>
											<label>
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="EligibleForChildTaxCreditInd"/>
													<xsl:with-param name="BackupName">IRS1040DependentInformations<xsl:number value="position()"/>EligibleForChildTaxCreditInd</xsl:with-param>
												</xsl:call-template>
											</label>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- End Separated Repeating Dependent data table -->
					<br/>
					<!-- Begin Separated Repeating data table for  IRADistributionsLiteralCd-->
					<xsl:if test="(count($FormData/IRADistributionsLiteralCd) &gt; 1)">
						<span class="styRepeatingDataTitle">Line 15b - IRA Distributions Literal Codes</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" rowspan="1" style="width:91.5mm;">
                           IRA Distributions Literal Cd
                        </th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/IRADistributionsLiteralCd">
									<tr style="border-color:black;height:6mm;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellText" style="width:91.5mm;">
											<div style="width:6.5mm;" class="styGenericDiv">
												<div style="width:6mm;font-weight:bold;float:right;clear:none;">
													<span class="styBoldText" style="float:right;text-align:right;padding-right:2mm;">
														<xsl:value-of select="position()"/>
													</span>
												</div>
											</div>
											<div style="width:80mm;float:none;clear:none;">
												<xsl:variable name="pos" select="position()"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
													<xsl:with-param name="BackupName">IRS1040IRADistributionsLiteralCd</xsl:with-param>
												</xsl:call-template>
											</div>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- End Separated Repeating data table for  IRADistributionsLiteralCd-->
					<br/>
					<!-- Begin Separated Repeating data table for AlimonyAmountGrp -->
					<xsl:if test="(count($FormData/AlimonyAmountGrp) &gt; 1)">
						<span class="styRepeatingDataTitle">Form 1040 Line 31a - Alimony Amount</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:91.5mm;">
										<span style="font-weight:bold;">(a)</span>
                           SSN
                        </th>
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:91.5mm;">
										<span style="font-weight:bold;">(b)</span>
                           Alimony Paid
                        </th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/AlimonyAmountGrp">
									<tr style="border-color:black;height:6mm;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellText" style="width:91.5mm;">
											<div style="width:6.5mm;" class="styGenericDiv">
												<div style="width:6mm;font-weight:bold;float:right;clear:none;">
													<span class="styBoldText" style="float:right;text-align:right;padding-right:2mm;">
														<xsl:value-of select="position()"/>
													</span>
												</div>
											</div>
											<div style="width:80mm;float:none;clear:none;text-align:center;">
												<xsl:call-template name="PopulateSSN">
													<xsl:with-param name="TargetNode" select="RecipientSSN"/>
													<xsl:with-param name="BackupName">IRS1040AlimonyAmountGrpRecipientsSSN</xsl:with-param>
												</xsl:call-template>
											</div>
										</td>
										<td class="styTableCellText" style="width:91.5mm;float:right;clear:none;text-align:right;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="AlimonyPaidAmt"/>
												<xsl:with-param name="BackupName">IRS1040AlimonyAmountGrpAlimonyPaidAmt</xsl:with-param>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- End Separated Repeating data table for AlimonyAmountGrp -->
					<!-- End Separated Repeating data table -->
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
