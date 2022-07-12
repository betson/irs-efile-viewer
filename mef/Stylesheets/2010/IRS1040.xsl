<?xml version="1.0" encoding="UTF-8"?>
<!-- Last Modified by James Ganzy on 12/22/2010 -->
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
						<div class="" style="width:32mm;height:11mm;float:left;clear:none;">
							<div style="height:11mm;">
								<!-- span class="verticaltext" style="padding-bottom:2mm;">Form</span -->
								<div style="float:left;clear:none;width:4mm;">
									<span style="padding-top:0mm;float:left;clear:none;">
										<img src="{$ImagePath}/1040_Form.gif" alt="Form image"/>
									</span>
								</div>
								<div class="styFormNumber" style="padding-top:1mm;width:18mm;float:left;clear:none;">1040</div>
								<div style="width:32mm;float:left;clear:none;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData"/>
									</xsl:call-template>
									<xsl:if test="$FormData/SpecialConditionDescription">
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Special Condition Description</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$FormData/SpecialConditionDescription"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$FormData/PrimaryDateOfDeath">
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Primary Date Of Death</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$FormData/PrimaryDateOfDeath"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$FormData/SpouseDateOfDeath">
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Spouse Date Of Death</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$FormData/SpouseDateOfDeath"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$FormData/SpecialProcessingLiteralCd">
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Special Processing Literal Code</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$FormData/SpecialProcessingLiteralCd"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$FormData/SpecialProcessingLiteralCd2">
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Special Processing Literal Code 2</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$FormData/SpecialProcessingLiteralCd2"/>
										</xsl:call-template>
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Combat Zone Date</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$FormData/SpecialProcessingLiteralCd2/@combatZoneDate"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$FormData/SpecialProcessingCodeTxt">
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Special Processing Code Text</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$FormData/SpecialProcessingCodeTxt"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$FormData/PowerOfAttorneySignedBy">
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Signed by Power Of Attorney Checkbox</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$FormData/PowerOfAttorneySignedBy"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$FormData/PowerOfAttorneyName">
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Power Of Attorney Name</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$FormData/PowerOfAttorneyName"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$FormData/NonPaidPreparerCd">
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Non Paid Preparer Code</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$FormData/NonPaidPreparerCd"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$FormData/RefundAnticipationLoanCd">
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Refund Anticipation Loan Code</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$FormData/RefundAnticipationLoanCd"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$FormData/CommPropStateRtnInd">
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Community Property Return Indicator</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$FormData/CommPropStateRtnInd"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$FormData/SurvivingSpouseInd">
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Surviving Spouse Indicator</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$FormData/SurvivingSpouseInd"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$FormData/PersonalRepresentativeInd">
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Personal Representative</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$FormData/PersonalRepresentativeInd"/>
										</xsl:call-template>
									</xsl:if>
								</div>
							</div>
						</div>
						<div class="styFTBox" style="width:88mm;height:8mm;">
							<div style="float:left;clear:none;width:70mm;padding-top:1mm;">
								<span class="styAgency" style="font-size:7.5pt;font-family:Arial;width:70mm;">Department of the Treasury<img src="{$ImagePath}/1040_Short_Line.gif" alt="Line image"/>Internal Revenue Service</span>
								<span class="styMainTitle" style="font-size:12pt;width:70mm;">U.S. Individual Income Tax Return</span>
							</div>
							<div class="styTY" style="float:right;clear:none;height:3mm;font-size:25pt;padding-top:1mm;padding-right:1mm;">
                     20<span class="stytycolor">10</span>
							</div>
						</div>
						<div class="styTYBox" style="width:65mm;height:13.5mm;text-align:left;">
							<div style="padding-top:7mm;padding-left:2mm;">
								<span class="styAgency" style="font-size:7.5pt;">(99)</span>
								<span class="styAgency" style="font-size:7.5pt;padding-left:4mm;">IRS Use Only<img src="{$ImagePath}/1040_Short_Line.gif" alt="Line image"/>Do not write or staple in this space.</span>
							</div>
						</div>
					</div>
					<!-- ************************End Page Header *************************** -->
					<!-- Entity Data -->
					<div class="styBB" style="height:40mm;width:187mm;">
						<!-- Left Side -->
						<div style="width:24.5mm;float:left;clear:none;">
							<div style="width:18.5mm;float:left;clear:none;">
								<div class="styBoldText" style="font-size:10pt;padding-top:4mm;padding-bottom:1mm;">Name,<br/>Address,<br/>and SSN</div>
								<div class="styBoldText" style="height:26mm;width:18.5mm;padding-top:4mm;">See separate<br/>instructions.
                        </div>
								<div style="height:4mm;float:left;clear:none;">
									<span class="styBoldText">Presidential</span>
								</div>
							</div>
							<div style="float:left;clear:none;width:4mm;">
								<div class="styDblBox" style="float:left;clear:none;width:4mm;height:4mm;border-top-width:0px;border-left-width:0px;border-right-width:0px;border-bottom-width:0px;">
									<img src="{$ImagePath}/1040_TopLeftRounded_P_Corner_1.gif" alt="Top Left Rounded corner"/>
								</div>
								<div class="styDblBox" style="width:4mm;height:33.5mm;border-top-width:0px;border-bottom-width:0px;border-right-width:0px;">
									<div class="styBoldText" style="font-size:7.5pt;padding-left:1.8mm;padding-bottom:.5mm;">
                           R<br/>I<br/>N<br/>T<br/>
										<br/>C<br/>L<br/>E<br/>A<br/>R<br/>L
                           </div>
								</div>
								<div class="styDblBox" style="float:left;clear:none;width:4mm;height:4mm;border-top-width:0px;border-left-width:0px;border-right-width:0px;border-bottom-width:0px;">
									<img src="{$ImagePath}/1040_BottomLeftRounded_Y_Corner_1.gif" alt="Rounded bottom left corner"/>
								</div>
							</div>
						</div>
						<!-- End Left Side -->
						<!-- Address fields -->
						<div class="" style="width:120mm;height:45mm;float:left;clear:none;">
							<div class="styBB" style="height:4.5mm;width:119.75mm;padding-left:1mm;padding-top:.5mm;clear:none;border-right-width:1px;">
								<span class="styArialText" style="font-size:7pt;">For the year Jan. 1-Dec. 31, 2010, or other tax year beginning </span>
								<span style="width:5px;"/>
								<xsl:call-template name="PopulateReturnHeaderTaxPeriodBeginDate">
									<xsl:with-param name="TargetNode">TaxPeriodBeginDate</xsl:with-param>
									<xsl:with-param name="BackupName">$RtnHdrDataTaxPeriodBeginDate</xsl:with-param>
								</xsl:call-template>
								<!-- xsl:call-template name="PopulateMonthDayYear">
                           <xsl:with-param name="TargetNode" select="$RtnHdrData/TaxPeriodBeginDate" />
                           <xsl:with-param name="BackupName">$RtnHdrDataTaxPeriodBeginDate</xsl:with-param>
                        </xsl:call-template -->
								<span style="width:5px;"/>ending 
                        <!-- span class="styBoldText" style="color:red;">!No Entry!</span -->
								<span style="width:5px;"/>
								<xsl:call-template name="PopulateReturnHeaderTaxPeriodEndDate">
									<xsl:with-param name="TargetNode">TaxPeriodEndDate</xsl:with-param>
									<xsl:with-param name="BackupName">$RtnHdrDataTaxPeriodEndDate</xsl:with-param>
								</xsl:call-template>
								<!-- xsl:call-template name="PopulateMonthDayYear">
                           <xsl:with-param name="TargetNode" select="$RtnHdrData/TaxPeriodEndDate" />
                           <xsl:with-param name="BackupName">$RtnHdrDataTaxPeriodEndDate</xsl:with-param>
                        </xsl:call-template -->
								<!--span class="styBoldText" style="color:red;">!No Entry!</span 
                        , 20-->
							</div>
							<div class="styBB" style="height:10mm;width:120mm;padding-left:1mm;clear:none;border-right-width:0px;">
								<div class="styFNBox" style="height:9.75mm;width:59mm;padding-top:.5mm;">
									<div style="width:59mm;">
										<span class="styArialText" style="font-size:7pt;">Your first name and initial</span>
									</div>
									<div style="width:59mm;padding-top:1mm;">
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">Name</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataFilerName</xsl:with-param>
										</xsl:call-template>
									</div>
								</div>
								<div class="styDotBox" style="height:9.75mm;width:59.5mm;padding-top:.5mm;border-top-width:0px;border-bottom-width:0px;border-left-width:0px;">
									<div class="" style="width:59.25mm;">
										<span class="styArialText" style="font-size:7pt;padding-left:1mm;">Last name</span>
									</div>
									<div style="width:59.25mm;padding-top:1mm;float:left;clear:none;padding-left:1mm;">
										<!-- Last Name goes here -->
										<!--<span class="styBoldText" style="color:red;">!No Entry!</span>-->
									</div>
								</div>
							</div>
							<div class="styBB" style="height:10mm;width:120mm;padding-left:1mm;border-right-width:0px;">
								<!-- spouse's name (?) -->
								<div class="styFNBox" style="height:9.75mm;width:59mm;padding-top:.5mm;">
									<div style="width:59mm;padding-top:.5mm;">
										<span class="styArialText" style="font-size:7pt;">If a joint return, spouse's first name and initial</span>
									</div>
									<div style="width:59mm;padding-top:1mm;">
										<!--<span class="styBoldText" style="color:red;">!No Entry!</span>-->
									</div>
								</div>
								<div class="styDotBox" style="height:9.75mm;width:59.5mm;border-top-width:0px;border-bottom-width:0px;border-left-width:0px;">
									<div style="width:59mm;padding-left:1mm;padding-top:.5mm;">
										<span class="styArialText" style="font-size:7pt;">Last name</span>
									</div>
									<div style="width:59mm;padding-top:1mm;padding-left:1mm;">
										<!-- Last Name goes here -->
										<!--<span class="styBoldText" style="color:red;">!No Entry!</span>-->
									</div>
								</div>
							</div>
							<div class="styBB" style="height:10mm;width:120mm;">
								<div class="styFNBox" style="height:9.75mm;width:96mm;">
									<div style="width:96mm;padding-top:.5mm;padding-left:1mm;">
										<span class="styArialText" style="font-size:7pt;">Home address (number and street). If you have a P.O. box, see page 14.</span>
									</div>
									<div style="width:96mm;padding-top:.5mm;padding-left:1mm;">
										<xsl:if test="$RtnHdrData/Filer/USAddress">
											<xsl:call-template name="PopulateReturnHeaderFiler">
												<xsl:with-param name="TargetNode">AddressLine1</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataFilerUSAddressLine1</xsl:with-param>
											</xsl:call-template>
											<br/>
											<xsl:call-template name="PopulateReturnHeaderFiler">
												<xsl:with-param name="TargetNode">AddressLine2</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataFilerUSAddressLine2</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="$RtnHdrData/Filer/ForeignAddress">
											<xsl:call-template name="PopulateReturnHeaderFiler">
												<xsl:with-param name="TargetNode">AddressLine1</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataFilerForeignAddressLine1</xsl:with-param>
											</xsl:call-template>
											<br/>
											<xsl:call-template name="PopulateReturnHeaderFiler">
												<xsl:with-param name="TargetNode">AddressLine2</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataFilerForeignAddressLine2</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
									</div>
								</div>
								<div class="styDotBox" style="height:9mm;width:23.5mm;border-top-width:0px;border-bottom-width:0px;border-left-width:0px;">
									<div style="width:22mm;padding-top:.5mm;padding-left:1mm;">
										<span class="styArialText" style="font-size:7pt;">Apt. no.</span>
									</div>
									<div style="width:22mm;padding-top:.5mm;padding-left:1mm;">
										<!-- <span class="styBoldText" style="color:red;">!No Entry!</span>-->
									</div>
								</div>
							</div>
							<div style="width:120mm;">
								<div class="styTBB" style="height:10.8mm;width:112mm;float:left;clear:none;">
									<div style="width:111mm;padding-top:.5mm;padding-left:1mm;">
										<span class="styArialText" style="font-size:7pt;">City, town or post office, state, and ZIP code. If you have a foreign address, see page 14.</span>
									</div>
									<div style="width:111mm;padding-top:.5mm;padding-left:1mm;">
										<xsl:if test="$RtnHdrData/Filer/USAddress">
											<xsl:call-template name="PopulateReturnHeaderFiler">
												<xsl:with-param name="TargetNode">City</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataFilerUSAddressCity</xsl:with-param>
											</xsl:call-template>,
									<span style="width:2px;"/>
											<xsl:call-template name="PopulateReturnHeaderFiler">
												<xsl:with-param name="TargetNode">State</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataFilerUSAddressState</xsl:with-param>
											</xsl:call-template>,
									<span style="width:2px;"/>
											<xsl:call-template name="PopulateReturnHeaderFiler">
												<xsl:with-param name="TargetNode">ZIPCode</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataFilerUSAddressZip</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="$RtnHdrData/Filer/ForeignAddress">
											<xsl:call-template name="PopulateReturnHeaderFiler">
												<xsl:with-param name="TargetNode">City</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataFilerForeignAddressCity</xsl:with-param>
											</xsl:call-template>,
									<span style="width:2px;"/>
											<xsl:call-template name="PopulateReturnHeaderFiler">
												<xsl:with-param name="TargetNode">ProvinceOrState</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataFilerForeignAddressProvinceOrState</xsl:with-param>
											</xsl:call-template>,
									<span style="width:2px;"/>
											<xsl:call-template name="PopulateReturnHeaderFiler">
												<xsl:with-param name="TargetNode">PostalCode</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataFilerForeignAddressZip</xsl:with-param>
											</xsl:call-template>,
									<span style="width:2px;"/>
											<xsl:call-template name="PopulateReturnHeaderFiler">
												<xsl:with-param name="TargetNode">Country</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataFilerForeignAddressCountry</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
									</div>
								</div>
								<div style="height:11.8mm;width:8mm;float:right;clear:none;padding-top:0mm;">
									<img src="{$ImagePath}/1040_BottomRightRoundedCorner1.gif" alt="bottom right rounded corner"/>
								</div>
							</div>
						</div>
						<!-- End Address fields -->
						<!-- SSN fields -->
						<div class="styTBB" style="width:40mm;height:34.75mm;clear:none;border-left-width:0px;">
							<div class="styBB" style="height:4.5mm;width:40mm;padding-top:.5mm;padding-left:1mm;clear:none;">
								<span class="" style="text-align:center;width:39mm;">OMB No. 1545-0074</span>
							</div>
							<div class="styBB" style="height:10mm;width:40mm;padding-left:1mm;">
								<span class="styArialText" style="font-size:7pt;text-align:center;width:39mm;">Your social security number</span>
								<div style="float:left;clear:none;text-align:center;width:39mm;padding-top:2mm;">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
										<xsl:with-param name="BackupName">$RtnHdrDataFilerPrimarySSN</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
							<div class="styBB" style="height:10mm;width:40mm;padding-left:1mm;">
								<span class="styArialText" style="font-size:7pt;text-align:center;width:39mm;">Spouse's social security number</span>
								<div style="float:left;clear:none;text-align:center;width:39mm;padding-top:2mm;">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">SpouseSSN</xsl:with-param>
										<xsl:with-param name="BackupName">$RtnHdrDataFilerSpouseSSN</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
							<div class="" style="height:9.5mm;width:41mm;padding-top:1mm;padding-left:1mm;">
								<div style="width:4mm;float:left;clear:none;">
									<img src="{$ImagePath}/1040_Bullet_Up2.gif" alt="up pointing arrowhead image"/>
								</div>
								<div style="width:32mm;padding-top:1mm;float:left;clear:none;">
									<div class="styArialText" style="font-size:7pt;text-align:center;width:32mm;">
                            Make sure the SSN(s) above<br/>
                           and on line 6c are correct.
                           </div>
								</div>
							</div>
						</div>
						<!-- End SSN fields -->
						<div class="" style="width:40mm;height:9mm;float:left;clear:none;">
							<span class="styArialText" style="font-size:7.5pt;text-align:left;width:39mm;padding-top:2mm;padding-left:1mm;">
                     Checking a box below will not
                     change your tax or refund.
                     </span>
						</div>
						<div class="" style="height:4mm;width:187mm;padding-top:0mm;">
							<b>Election Campaign</b>
							<span style="width:7px;"/>
							<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
                     Check here if you, or your spouse if filing jointly, want $3 to go to this fund 
                     <img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
							<span style="width:17px;"/>
							<input type="Checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/PECFPrimaryInd"/>
									<xsl:with-param name="BackupName">IRS1040PECFPrimaryInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:5px;"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/PECFPrimaryInd"/>
									<xsl:with-param name="BackupName">IRS1040PECFPrimaryInd</xsl:with-param>
								</xsl:call-template>
								<b>You</b>
							</label>
							<span style="width:7mm;"/>
							<input type="Checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/PECFSpouseInd"/>
									<xsl:with-param name="BackupName">IRS1040PECFSpouseInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:5px;"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/PECFSpouseInd"/>
									<xsl:with-param name="BackupName">IRS1040PECFSpouseInd</xsl:with-param>
								</xsl:call-template>
								<b>Spouse</b>
							</label>
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
										<!--<xsl:if test="$FormData/IndividualReturnFilingStatusCd = 3">-->
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/SpousesName"/>
											<xsl:with-param name="BackupName">IRS1040SpousesName</xsl:with-param>
										</xsl:call-template>
										<!--</xsl:if>-->
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
								<div class="styArialText" style="font-size:7pt;float:left;clear:none;width:70mm;padding-left:1mm;padding-top:.5mm;">
									<div style="float:none;clear:none;">
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
												<xsl:with-param name="DisplayedCheckboxValue" select="'4'"/>
												<xsl:with-param name="BackupName">IRS1040IndividualReturnFilingStatusCd[4]</xsl:with-param>
											</xsl:call-template>
										   Head of household (with qualifying person). (See page 15.) If
										   the qualifying person is a child but not your dependent, enter
										   this child&apos;s name here.
								  </label>
										<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
										<span class="styBB" style="width:40mm;float:none;clear:none;">
											<!--<xsl:if test="$FormData/IndividualReturnFilingStatusCd = 4">-->
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/QualifyingNameForHOH"/>
												<xsl:with-param name="BackupName">IRS1040QualifyingNameForHOH</xsl:with-param>
											</xsl:call-template>
											<xsl:call-template name="LinkToLeftoverDataTableInline">
												<xsl:with-param name="Desc">Line 4 - Qualifying HOH SSN</xsl:with-param>
												<xsl:with-param name="TargetNode" select="$FormData/QualifyingHOHSSN"/>
											</xsl:call-template>
											<!--</xsl:if>-->
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
										  Qualifying widow(er) with dependent child (see page 16)
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
									<xsl:with-param name="TargetNode" select="$FormData/NumOfOtherDepdListedInd"/>
									<xsl:with-param name="BackupName">IRS1040NumOfOtherDepdListedInd</xsl:with-param>
								</xsl:call-template>
												  If more than four<br/>
												 dependents, see<br/>
												 page 17 and <br/>check here 
									 </label>
							<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
							<span style="width:2px;"/>
							<input type="Checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/NumOfOtherDepdListedInd"/>
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
											<div style="width:112mm;padding-left:1.5mm;float:left;clear:none;">
												<span style="padding-right:1mm;float:left;clear:none;">
													<label>
														<xsl:call-template name="PopulateLabel">
															<xsl:with-param name="TargetNode" select="$FormData/ExemptSpouseInd"/>
															<xsl:with-param name="BackupName">IRS1040ExemptSpouseInd</xsl:with-param>
														</xsl:call-template>
														<b>Spouse</b>
													</label>
												</span>
												<!--<xsl:choose>
                                <xsl:when test="$FormData/IndividualReturnFilingStatusCd = 4 and $FormData/ExemptSpouseInd = 'X' ">-->
												<div class="styUnderlineAmount" style="text-align:left;float:left;clear:none;height:4mm;width:98 mm;padding-top:0mm;padding-left:.5mm;border-style:dotted;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$FormData/ExemptSpouseName"/>
														<xsl:with-param name="BackupName">IRS1040ExemptSpouseName</xsl:with-param>
													</xsl:call-template>,
										 <span style="width:2px;"/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$FormData/ExemptSpouseNameControl"/>
														<xsl:with-param name="BackupName">IRS1040ExemptSpouseNameControl</xsl:with-param>
													</xsl:call-template>
												</div>
												<!--</xsl:when>
								<xsl:otherwise>
										 <span class="styDotLn" style="float:none;clear:none;padding-left:1.25mm;">.........................</span>
								</xsl:otherwise>
							 </xsl:choose>
                       
										<xsl:choose>
											<xsl:when test="$FormData/IndividualReturnFilingStatusCd = 4 and $FormData/ExemptSpouseInd = 'X' ">
											  <xsl:call-template name="LinkToLeftoverDataTableInline">
												<xsl:with-param name="Desc">Line 6b - Exempt Spouse Name</xsl:with-param>
												<xsl:with-param name="TargetNode" select="$FormData/ExemptSpouseName" />
											 </xsl:call-template>
											  <xsl:call-template name="LinkToLeftoverDataTableInline">
												<xsl:with-param name="Desc">Line 6b - Exempt Spouse Name Control</xsl:with-param>
												<xsl:with-param name="TargetNode" select="$FormData/ExemptSpouseNameControl" />
											 </xsl:call-template>-->
												<!--Dotted Line
													 <span class="styDotLn" style="float:none;clear:none;padding-left:1.25mm;">.......................</span>
											</xsl:when>
											<xsl:otherwise>
													 <span class="styDotLn" style="float:none;clear:none;padding-left:0mm;">.........................</span>
											</xsl:otherwise>
										 </xsl:choose>-->
											</div>
										</div>
									</div>
								</div>
								<div style="width:3mm;float:right;clear:none;">
									<img src="{$ImagePath}/1040_Bracket_Small.gif" alt="Bracket"/>
								</div>
								<!-- Table expand/collapse toggle button -->
								<div class="styGenericDiv" style="width:3.2mm;height:4mm;float:right;clear:none;">
									<xsl:call-template name="SetDynamicTableToggleButton">
										<xsl:with-param name="TargetNode" select="$FormData/DependentInformations"/>
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
												<th class="styTableCellHeader" scope="col" style="text-align:left;width:49.4mm;border-right-width:1px;">
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
													<!--<div class="styGenericDiv" style="width:3.2mm;height:4mm;float:right;clear:none;">
                                            <xsl:call-template name="SetDynamicTableToggleButton">
                                             <xsl:with-param name="TargetNode" select="$FormData/DependentInformations"/>
                                             <xsl:with-param name="containerHeight" select="4"/>
                                             <xsl:with-param name="headerHeight" select="1"/>
                                             <xsl:with-param name="containerID" select=" 'depdContainerId'  "/>
                                          </xsl:call-template>
                                       </div>-->
												</th>
												<th class="styTableCellHeader" scope="col" style="width:26.2mm;border-right-width:1px;padding-top:1mm;">
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
													<b>(4)</b>
													<img src="{$ImagePath}/1040_Check.gif" alt="Check"/>
													<span class="styNormalText">
												   if qualifying
												   child for child tax
												   credit (see page 17)
												   </span>
												</th>
											</tr>
										</thead>
										<tbody>
											<xsl:if test="($Print != $Separated) or (count($FormData/DependentInformations) &lt;= 4)">
												<xsl:for-each select="$FormData/DependentInformations">
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
																		<xsl:with-param name="TargetNode" select="DependentFirstName"/>
																		<xsl:with-param name="BackupName">IRS1040DependentInformationsDependentFirstName</xsl:with-param>
																	</xsl:call-template>
																</span>
																<span style="width:18mm;text-align:left;float:left;clear:none;">
																	<xsl:call-template name="PopulateText">
																		<xsl:with-param name="TargetNode" select="DependentLastName"/>
																		<xsl:with-param name="BackupName">IRS1040DependentInformationsDependentLastName</xsl:with-param>
																	</xsl:call-template>
																</span>
															</label>
															<span style="width:5mm;align:left;float:none;clear:none;">
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="DependentNameControl"/>
																	<xsl:with-param name="BackupName">IRS1040DependentInformationsDependentNameControl</xsl:with-param>
																</xsl:call-template>
															</span>
														</td>
														<!-- Column 2 -->
														<td class="styTableCell" style="text-align:center;width:26.2mm;height:4mm;float:left;clear:none;border-right-width:1px;">
															<xsl:call-template name="PopulateSSN">
																<xsl:with-param name="TargetNode" select="DependentSSN"/>
																<xsl:with-param name="BackupName">IRS1040DependentInformationsDependentSSN</xsl:with-param>
															</xsl:call-template>
														</td>
														<!-- Column 3 -->
														<td class="styTableCell" style="width:18.6mm;height:4mm;text-align:left;float:left;clear:none;border-right-width:1px;">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="DependentRelationship"/>
																<xsl:with-param name="BackupName">IRS1040DependentInformationsDependentRelationship</xsl:with-param>
															</xsl:call-template>
														</td>
														<!-- Column 4 -->
														<td class="styTableCell" style="text-align:center;width:24.6mm;height:4mm;float:left;clear:none;border-right-width:0px;">
															<!-- Checkbox -->
															<input type="Checkbox" class="styCkbox">
																<xsl:call-template name="PopulateCheckbox">
																	<xsl:with-param name="TargetNode" select="EligibleForChildTaxCreditInd"/>
																	<xsl:with-param name="BackupName">IRS1040DependentInformationsEligibleForChildTaxCreditInd</xsl:with-param>
																</xsl:call-template>
															</input>
														</td>
													</tr>
												</xsl:for-each>
											</xsl:if>
											<!-- Table Filler Rows -->
											<xsl:if test="count($FormData/DependentInformations) &lt; 1 or ((count($FormData/DependentInformations) &gt; 4) and ($Print = $Separated))">
												<tr>
													<td class="styTableCell" style="width:49.4mm;text-align:left;height:4mm;float:left;clear:none;border-right-width:1px;">
														<xsl:call-template name="PopulateAdditionalDataTableMessage">
															<xsl:with-param name="TargetNode" select="$FormData/DependentInformations"/>
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
											<xsl:if test="count($FormData/DependentInformations) &lt; 2 or ((count($FormData/DependentInformations) &gt; 4) and ($Print = $Separated))">
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
											<xsl:if test="count($FormData/DependentInformations) &lt; 3 or ((count($FormData/DependentInformations) &gt; 4) and ($Print = $Separated))">
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
											<xsl:if test="count($FormData/DependentInformations) &lt; 4 or ((count($FormData/DependentInformations) &gt; 4) and ($Print = $Separated))">
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
									<xsl:with-param name="TargetNode" select="$FormData/NumOfChildWhoLivedWithYouCnt"/>
									<xsl:with-param name="BackupName">IRS1040NumOfChildWhoLivedWithYouCnt</xsl:with-param>
								</xsl:call-template>
							</div>
							<div style="width:26mm;float:left;clear:none;">
								<img src="{$ImagePath}/1040_Bullet_Round.gif" alt="Round bullet image"/>
								<span style="width:5px;"/>
								<b>did not live with
                        you due to divorce
                        or separation<br/>
                        (see page 18)</b>
							</div>
							<div class="styBB" style="padding-top:8mm;text-align:right;float:right;clear:none;width:8mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/NumOfChildNotLivingWithYouCnt"/>
									<xsl:with-param name="BackupName">IRS1040NumOfChildNotLivingWithYouCnt</xsl:with-param>
								</xsl:call-template>
							</div>
							<div style="width:26mm;padding-top:1mm;float:left;clear:none;">
								<b>Dependents on 6c<br/>
                        not entered above</b>
							</div>
							<div class="styBB" style="padding-top:2mm;text-align:right;float:right;clear:none;width:8mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/NumOfOtherDepdListedCnt"/>
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
                     see page 22.<br/>
							<br/>
							<br/>
                  Enclose, but do<br/>          
                  not attach, any<br/>
                  payment. Also,<br/>
                  please use<br/>
							<span class="styBoldText">Form 1040-V.</span>
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
								<div class="styLNRightNumBox" style="">7</div>
								<div class="styLNAmountBox" style="">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/WagesSalariesAndTipsAmt"/>
										<xsl:with-param name="BackupName">IRS1040WagesSalariesAndTipsAmt</xsl:with-param>
									</xsl:call-template>
								</div>
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
								<div class="styLNRightNumBox" style="">8a</div>
								<div class="styLNAmountBox" style="">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxableInterestAmt"/>
										<xsl:with-param name="BackupName">IRS1040TaxableInterestAmt</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
							<!--End Line 8a -->
							<!-- Line 8b -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;padding-left:4.25mm;">b</div>
								<div style="width:76.3mm;padding-top:.5mm;padding-left:1.5mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
										<b>Tax-exempt</b> interest. <b>Do not</b> include on line 8a
                           </span>
									<span class="styDotLn" style="float:right;padding-right:2mm;">...</span>
								</div>
								<div class="styLNRightNumBox" style="padding-bottom:0mm;padding-top:.5mm">8b</div>
								<div class="styLNAmountBox" style="padding-bottom:0mm;border-right-width:0px;padding-top:.5mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptInterestAmt"/>
										<xsl:with-param name="BackupName">IRS1040TaxExemptInterestAmt</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styShadingCell" style="height:4.3mm;width:8.3mm;border-right-width:1px"/>
							</div>
							<!--End Line 8b -->
							<!-- Line 9a -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;padding-left:2.5mm;">9a</div>
								<div style="width:116.5mm;float:left;clear:none;padding-top:.5mm;padding-left:1.5mm;">
									<div style="width:74mm;padding-left:0mm;float:left;clear:none;">
                           
                           Ordinary dividends. Attach Schedule B if required
                           
                           <!--<div style="float:left;clear:none;padding-left:1mm;">-->
										<!--Form to Form Link-->
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/OrdinaryDividendsAmt"/>
										</xsl:call-template>
										<!--<xsl:call-template name="LinkToLeftoverDataTableInline">
                              <xsl:with-param name="Desc">Line 9a - Ordinary F8814 Code</xsl:with-param>
                              <xsl:with-param name="TargetNode" select="$FormData/OrdinaryF8814Cd" />
                           </xsl:call-template>
                           <xsl:call-template name="LinkToLeftoverDataTableInline">
                              <xsl:with-param name="Desc">Line 9a - Ordinary F8814 Amount</xsl:with-param>
                              <xsl:with-param name="TargetNode" select="$FormData/OrdinaryF8814Amt" />
                           </xsl:call-template>-->
									</div>
									<!--<span class="styDotLn" style="clear:none;padding-left:3.5mm;">........</span>-->
									<div class="styFixedUnderline" style="text-align:height:4mm;width:40.2mm;padding-top:0mm;padding-left:0mm;padding-right:0mm;border-style:dotted;font-size:6.5pt;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/OrdinaryF8814Cd"/>
											<xsl:with-param name="BackupName">IRS1040$FormData/OrdinaryF8814Cd</xsl:with-param>
										</xsl:call-template>,
										 <xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/OrdinaryF8814Amt"/>
											<xsl:with-param name="BackupName">IRS1040OrdinaryF8814Amt</xsl:with-param>
										</xsl:call-template>
									</div>
									<!--</div>-->
								</div>
								<div class="styLNRightNumBox" style="">9a</div>
								<div class="styLNAmountBox" style="">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/OrdinaryDividendsAmt"/>
										<xsl:with-param name="BackupName">IRS1040OrdinaryDividendsAmt</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
							<!--End Line 9a -->
							<!-- Line 9b -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;padding-left:4.25mm;">b</div>
								<div style="width:76.3mm;padding-top:.5mm;padding-left:.5mm;float:left;clear:none;">
									<span style="padding-left:1mm;float:left;clear:none;">
                           Qualified dividends (see page 22)
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
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">......</span>
								</div>
								<div class="styLNRightNumBox" style="height:2mm;padding-bottom:0mm;padding-top:.5mm;">9b</div>
								<div class="styLNAmountBox" style="border-right-width:0px;height:2mm;padding-bottom:0mm;padding-top:.5mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/QualifiedDividendsAmt"/>
										<xsl:with-param name="BackupName">IRS1040QualifiedDividendsAmt</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styShadingCell" style="height:4.3mm;width:8.3mm;border-right-width:1px;"/>
							</div>
							<!--End Line 9b -->
							<!-- Line 10 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;">10</div>
								<div style="width:117.8mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
                           Taxable refunds, credits, or offsets of state and local income taxes (see page 23)
                           </span>
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">..</span>
								</div>
								<div class="styLNRightNumBox" style="">10</div>
								<div class="styLNAmountBox" style="">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/StateLocalIncomeTaxRefundAmt"/>
										<xsl:with-param name="BackupName">IRS1040StateLocalIncomeTaxRefundAmt</xsl:with-param>
									</xsl:call-template>
								</div>
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
								<div class="styLNRightNumBox" style="">11</div>
								<div class="styLNAmountBox" style="">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AlimonyReceivedAmt"/>
										<xsl:with-param name="BackupName">IRS1040AlimonyReceivedAmt</xsl:with-param>
									</xsl:call-template>
								</div>
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
								<div class="styLNRightNumBox" style="">12</div>
								<div class="styLNAmountBox" style="">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/BusinessIncomeLossAmt"/>
										<xsl:with-param name="BackupName">IRS1040BusinessIncomeLossAmt</xsl:with-param>
									</xsl:call-template>
								</div>
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
											<xsl:with-param name="TargetNode" select="$FormData/FormF8814Cd"/>
										</xsl:call-template>
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="TargetNode" select="$FormData/FormF8814Amt"/>
											<xsl:with-param name="Desc">Line 13 - Form F8814 Amount</xsl:with-param>
										</xsl:call-template>
									</div>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/CapitalDistributionInd"/>
											<xsl:with-param name="BackupName">IRS1040CapitalDistributionInd</xsl:with-param>
										</xsl:call-template>
										<span style="float:left;clear:none;font-size:6pt;padding-left:.5mm">
										If not required, check here</span>
										<span class="styDotLn" style="clear:none;padding-left:2.0mm;padding-right:1mm">.</span>
										<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
										<span style="width:1.5px;"/>
									</label>
									<!-- Checkbox -->
									<input type="Checkbox" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/CapitalDistributionInd"/>
											<xsl:with-param name="BackupName">IRS1040CapitalDistributionInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</div>
								<div class="styLNRightNumBox" style="">13</div>
								<div class="styLNAmountBox" style="">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CapitalGainLossAmt"/>
										<xsl:with-param name="BackupName">IRS1040CapitalGainLossAmt</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
							<!--End Line 13 -->
							<!-- Line 14 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;">14</div>
								<div style="width:117.8mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
                           Other gains or (losses). Attach Form 4797
                           </span>
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">..............</span>
								</div>
								<div class="styLNRightNumBox" style="">14</div>
								<div class="styLNAmountBox" style=""/>
							</div>
							<!--End Line 14 -->
							<!-- Line 15 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;padding-top:1mm;">15a</div>
								<div style="width:116.2mm;padding-top:1mm;padding-left:1.5mm;float:left;clear:none;">
									<span style="width:25mm;float:left;clear:none;">
                           IRA distributions
                           </span>
									<!-- Form to Form Link -->
									<!-- **** -->
									<span class="styDotLn" style="clear:none;padding-right:1mm">.</span>
									<div class="styLNRightNumBox" style="width:6mm;padding-bottom:0mm;padding-top:.5mm">15a</div>
									<div class="styLNAmountBox" style="border-right-width:1px;padding-bottom:0mm;padding-top:.5mm">
										<!-- **** -->
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRADistributionsAmt"/>
											<xsl:with-param name="BackupName">IRS1040IRADistributionsAmt</xsl:with-param>
										</xsl:call-template>
									</div>
									<!-- **** -->
									<span class="styBoldText">b</span> Taxable amount
                              <span style="width:4px;"/>
									<span class="styAgency">(see page 24)</span>
									<xsl:if test="count($FormData/IRADistributionsLiteralCd) = 1">
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="TargetNode" select="$FormData/IRADistributionsLiteralCd"/>
											<xsl:with-param name="Desc">Line 15b - IRA Distributions Literal Code</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="count($FormData/IRADistributionsLiteralCd) &gt; 1">
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="TargetNode" select="$FormData/IRADistributionsLiteralCd"/>
											<xsl:with-param name="Desc">Line 15b - IRA Distributions Literal Code</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/TaxableIRAAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNRightNumBox" style="padding-top:1.3mm;">15b</div>
								<div class="styLNAmountBox" style="padding-top:1.3mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxableIRAAmt"/>
										<xsl:with-param name="BackupName">IRS1040TaxableIRAAmt</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
							<!--End Line 15 -->
							<!-- Line 16 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;padding-top:1mm;">16a</div>
								<div style="width:116.2mm;padding-top:1mm;padding-left:1.5mm;float:left;clear:none;">
									<span style="width:27mm;font-size:6pt;padding-top:1mm;float:left;clear:none;">
                           Pensions and annuities
                           </span>
									<div class="styLNRightNumBox" style="width:6mm;padding-bottom:0mm;padding-top:0mm">16a</div>
									<div class="styLNAmountBox" style="border-right-width:1px;padding-bottom:0mm;padding-top:.5mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PensionsAnnuitiesAmt"/>
											<xsl:with-param name="BackupName">IRS1040PensionsAnnuitiesAmt</xsl:with-param>
										</xsl:call-template>
									</div>
									<span class="styBoldText">b</span> Taxable amount
                              <span style="width:4px;"/>
									<span class="styAgency">(see page 25)</span>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Line 16b - Pensions Annuities Literal Code</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$FormData/pensionsAnnuitiesLiteralCd"/>
									</xsl:call-template>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Line 16b - Foreign Employer Pension Code</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$FormData/ForeignEmployerPensionCd"/>
									</xsl:call-template>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Line 16b - Taxable Foreign Pensions Total Amount</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$FormData/TaxableForeignPensionsTotalAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNRightNumBox" style="padding-top:.5mm;padding-top:1.3mm;">16b</div>
								<div class="styLNAmountBox" style="padding-top:1.3mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TotalTaxablePensionsAmt"/>
										<xsl:with-param name="BackupName">IRS1040TotalTaxablePensionsAmt</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
							<!--End Line 16 -->
							<!-- Line 17 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;">17</div>
								<div style="width:117.8mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
									<span style="padding-top:1mm;float:left;clear:none;font-size:6pt">
                           Rental real estate, royalties, partnerships, S corporations, trusts, etc. 
                             Attach Schedule E</span>
									<div style="float:left;clear:none;padding-left:1mm">
										<!-- Form to Form Link -->
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/RentalRealESTAmt"/>
										</xsl:call-template>
									</div>
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm">....</span>
								</div>
								<div class="styLNRightNumBox" style="">17</div>
								<div class="styLNAmountBox" style="">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/RentalRealESTAmt"/>
										<xsl:with-param name="BackupName">IRS1040RentalRealESTAmt</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
							<!--End Line 17 -->
							<!-- Line 18 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;">18</div>
								<div style="width:117.8mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
                           Farm income or (loss). Attach Schedule F
                           </span>
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">..............</span>
								</div>
								<div class="styLNRightNumBox" style="">18</div>
								<div class="styLNAmountBox" style=""/>
							</div>
							<!--End Line 18 -->
							<!-- Line 19 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;">19</div>
								<div style="width:117.8mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
									<span style="width:58.5mm;float:left;clear:none;">
                           Unemployment compensation (see page 27)
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
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">............</span>
								</div>
								<div class="styLNRightNumBox" style="">19</div>
								<div class="styLNAmountBox" style="">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/UnemploymentCompAmt"/>
										<xsl:with-param name="BackupName">IRS1040UnemploymentCompAmt</xsl:with-param>
									</xsl:call-template>
								</div>
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
										<span class="styBoldText">b</span> Taxable amount
                              <span style="width:4px;"/>
										<span class="styAgency">(see page 27)</span>
									</div>
								</div>
								<div class="styLNRightNumBox" style="padding-top:1mm;">20b</div>
								<div class="styLNAmountBox" style="padding-top:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxableSocSecAmt"/>
										<xsl:with-param name="BackupName">IRS1040TaxableSocSecAmt</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
							<!--End Line 20 -->
							<!-- Line 21 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;">21</div>
								<div style="width:117.8mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
                           Other income. List type and amount (see page 29)
                           </span>
									<div style="float:left;clear:none;padding-left:1mm">
										<!-- Form to Form Link -->
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/TotalOtherIncomeAmt"/>
										</xsl:call-template>
									</div>
									<div class="styUnderlineAmount" style="float:left;clear:none;padding-top:0mm;padding-left:3mm;border-style:dotted;text-align:left;">
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Line 21 - Protective Sec108i ELCRecord Indicator</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$FormData/ProtectiveSec108iELCRecordInd"/>
										</xsl:call-template>
										<!-- what goes here? -->
									</div>
								</div>
								<div class="styLNRightNumBox" style="padding-top:1mm;">21</div>
								<div class="styLNAmountBox" style="padding-top:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TotalOtherIncomeAmt"/>
										<xsl:with-param name="BackupName">IRS1040TotalOtherIncomeAmt</xsl:with-param>
									</xsl:call-template>
								</div>
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
								<div class="styLNRightNumBox" style="border-bottom-width:0px;">22</div>
								<div class="styLNAmountBox" style="border-bottom-width:0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TotalIncomeAmt"/>
										<xsl:with-param name="BackupName">IRS1040TotalIncomeAmt</xsl:with-param>
									</xsl:call-template>
								</div>
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
								<div style="width:77.8mm;float:left;clear:none;padding-top:1mm;padding-left:3mm;">
									<span style="float:left;clear:none;">
                            Educator Expenses
                         </span>
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">............</span>
								</div>
								<div class="styLNRightNumBox" style="padding-top:1mm;">23</div>
								<div class="styLNAmountBox" style="padding-top:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/EducatorExpensesAmt"/>
										<xsl:with-param name="BackupName">IRS1040EducatorExpensesAmt</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styShadingCell" style="width:8.3mm;padding-top:1.8mm;border-right-width:1px;"/>
							</div>
							<div>
								<!--End Line 23 -->
								<!-- Line 24 -->
								<div style="width:162.5mm;">
									<div class="styLNLeftNumBox" style="width:4mm;padding-left:1mm;">24</div>
									<div style="float:left;clear:none;padding-top:.5mm;padding-left:3mm;">
										<div style="width:75mm;font-size:6pt;">
                           Certain business expenses of reservists, performing artists, and<br/>
                           fee-basis government officials. Attach Form 2106 or 2106-EZ
                               <!-- Form to Form Link -->
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/BusExpnsReservistsAndOthersAmt"/>
											</xsl:call-template>
										</div>
									</div>
									<div class="styLNRightNumBox" style="height:4mm;padding-top:2.8mm;">24</div>
									<div class="styLNAmountBox" style="height:4mm;padding-top:2.8mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/BusExpnsReservistsAndOthersAmt"/>
											<xsl:with-param name="BackupName">IRS1040BusExpnsReservistsAndOthersAmt</xsl:with-param>
										</xsl:call-template>
									</div>
									<div class="styShadingCell" style="height:4mm;width:8.3mm;padding-top:3.8mm;border-right-width:1px;"/>
								</div>
							</div>
							<!--End Line 24 -->
							<!-- Line 25 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;padding-left:1mm;padding-top:1mm;">25</div>
								<div style="width:77.8mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
                           Health savings account deduction. 
                              <span class="styAgency" style="font-size:8pt;">Attach Form 8889</span>
									</span>
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">..</span>
								</div>
								<div class="styLNRightNumBox" style="padding-top:1mm;">25</div>
								<div class="styLNAmountBox" style="padding-top:1mm;"/>
								<div class="styShadingCell" style="height:4mm;width:8.3mm;padding-top:1.8mm;border-right-width:1px;"/>
							</div>
							<!--End Line 25 -->
							<!-- Line 26 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;padding-left:1mm;">26</div>
								<div style="width:77.8mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
                           Moving expenses. Attach Form 3903
                           </span>
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">......</span>
								</div>
								<div class="styLNRightNumBox" style="padding-top:1mm;">26</div>
								<div class="styLNAmountBox" style="padding-top:1mm;"/>
								<div class="styShadingCell" style="height:4mm;width:8.3mm;padding-top:1.8mm;border-right-width:1px;"/>
							</div>
							<!--End Line 26 -->
							<!-- Line 27 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;padding-left:1mm;padding-top:1mm;">27</div>
								<div style="width:77.8mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
                           One-half of self-employment tax. 
                              <span class="styAgency" style="font-size:8pt;">Attach Schedule SE</span>
										<!-- Form to Form Link -->
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/OneHalfSelfEmploymentTaxAmt"/>
										</xsl:call-template>
									</span>
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.</span>
								</div>
								<div class="styLNRightNumBox" style="padding-top:1mm;">27</div>
								<div class="styLNAmountBox" style="padding-top:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/OneHalfSelfEmploymentTaxAmt"/>
										<xsl:with-param name="BackupName">IRS1040OneHalfSelfEmploymentTaxAmt</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styShadingCell" style="height:4mm;width:8.3mm;padding-top:1.8mm;border-right-width:1px;"/>
							</div>
							<!--End Line 27 -->
							<!-- Line 28 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;padding-left:1mm;">28</div>
								<div style="width:77.8mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
                           Self-employed SEP, SIMPLE, and qualified plans
                           </span>
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">...</span>
								</div>
								<div class="styLNRightNumBox" style="padding-top:1mm;">28</div>
								<div class="styLNAmountBox" style="padding-top:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/SelfEmpldSepSimpleQlfyPlansAmt"/>
										<xsl:with-param name="BackupName">IRS1040SelfEmpldSepSimpleQlfyPlansAmt</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styShadingCell" style="height:4mm;width:8.3mm;padding-top:1.8mm;border-right-width:1px;"/>
							</div>
							<!--End Line 28 -->
							<!-- Line 29 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;padding-left:1mm;">29</div>
								<div style="width:77.8mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
                           Self-employed health insurance deduction 
                              <span class="styAgency ">(see page 30)</span>
									</span>
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">..</span>
								</div>
								<div class="styLNRightNumBox" style="padding-top:1mm;">29</div>
								<div class="styLNAmountBox" style="padding-top:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/SelfEmpldHealthInsDedAmt"/>
										<xsl:with-param name="BackupName">IRS1040SelfEmpldHealthInsDedAmt</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styShadingCell" style="height:4mm;width:8.3mm;padding-top:1.8mm;border-right-width:1px;"/>
							</div>
							<!--End Line 29 -->
							<!-- Line 30 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;padding-left:1mm;">30</div>
								<div style="width:77.8mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
                           Penalty on early withdrawal of savings
					   </span>
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">......</span>
								</div>
								<div class="styLNRightNumBox" style="padding-top:1mm;">30</div>
								<div class="styLNAmountBox" style="padding-top:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/PnltyOnErlyWthdrwOfSavingsAmt"/>
										<xsl:with-param name="BackupName">IRS1040PnltyOnErlyWthdrwOfSavingsAmt</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styShadingCell" style="height:4mm;width:8.3mm;padding-top:1.8mm;border-right-width:1px;"/>
							</div>
							<!--End Line 30 -->
							<!-- Line 31a -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:2mm;padding-left:1mm;">31a</div>
								<div style="width:76.2mm;padding-top:.5mm;padding-left:1mm;float:left;clear:none;">
									<div style="width:48mm;float:left;clear:none;">
                               Alimony paid
                               <span style="width:4px;"/>
										<b>b</b> Recipient's SSN
                              <img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
									</div>
									<div class="styUnderlineAmount" style="width:22mm;padding-top:0mm;padding-bottom:0mm;
                           text-align:center;height:2mm;">
										<xsl:if test="count($FormData/AlimonyAmountGrp/AlimonyPaidAmt) = 1">
											<xsl:call-template name="PopulateSSN">
												<xsl:with-param name="TargetNode" select="$FormData/AlimonyAmountGrp/RecipientsSSN"/>
												<xsl:with-param name="BackupName">IRS1040AlimonyAmountGrpRecipientsSSN</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="count($FormData/AlimonyAmountGrp/AlimonyPaidAmt) &gt; 1">
											<xsl:call-template name="LinkToLeftoverDataTableInline">
												<xsl:with-param name="Desc">Line 31a - Alimony Paid and SSN</xsl:with-param>
												<xsl:with-param name="TargetNode" select="$FormData/AlimonyAmountGrp/AlimonyPaidAmt"/>
											</xsl:call-template>
										</xsl:if>
									</div>
								</div>
								<div class="styLNRightNumBox" style="padding-top:1mm;">31a</div>
								<div class="styLNAmountBox" style="padding-top:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TotalAlimonyPaidAmt"/>
										<xsl:with-param name="BackupName">IRS1040TotalAlimonyPaidAmt</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styShadingCell" style="height:4mm;width:8.3mm;border-bottom-width:0px;padding-top:1.8mm;border-right-width:1px;"/>
							</div>
							<!--End Line 31a -->
							<!-- Line 32 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;padding-left:1mm;">32</div>
								<div style="width:77.8mm;float:left;clear:none;padding-top:.5mm;padding-left:3mm;">
									<div style="width:40mm;padding-left:0mm;float:left;clear:none;">
                            IRA deduction (see page 31)
                        </div>
									<div class="styFixedUnderline" style="text-align:left;float:left;clear:none;height:4mm;width:30mm;padding-top:0mm;padding-left:.5mm;border-style:dotted;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/IRADeductionCd"/>
											<xsl:with-param name="BackupName">IRS1040IRADeductionCd</xsl:with-param>
										</xsl:call-template>
									</div>
								</div>
								<div class="styLNRightNumBox" style="padding-top:1mm;">32</div>
								<div class="styLNAmountBox" style="padding-top:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/IRADeductionAmt"/>
										<xsl:with-param name="BackupName">IRS1040IRADeductionAmt</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styShadingCell" style="height:4.25mm;width:8.3mm;border-top-width:0px;padding-top:1.8mm;border-right-width:1px;"/>
							</div>
							<!--End Line 32 -->
							<!-- Line 33 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;padding-left:1mm;">33</div>
								<div style="width:77.8mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
                           Student loan interest deduction (see page 34)
                           </span>
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">...</span>
								</div>
								<div class="styLNRightNumBox" style="padding-top:1mm;">33</div>
								<div class="styLNAmountBox" style="padding-top:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/StudentLoanInterestDedAmt"/>
										<xsl:with-param name="BackupName">IRS1040StudentLoanInterestDedAmt</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styShadingCell" style="height:4mm;width:8.3mm;padding-top:1.8mm;border-right-width:1px;"/>
							</div>
							<!--End Line 33 -->
							<!-- Line 34 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;padding-left:1mm;">34</div>
								<div style="width:77.8mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
							   Tuition and fees. Attach Form 8917
                           </span>
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.......</span>
								</div>
								<div class="styLNRightNumBox" style="padding-top:1mm;">34</div>
								<div class="styLNAmountBox" style="padding-top:1mm;">
									<!--No Entry Available in Phase III-->
								</div>
								<div class="styShadingCell" style="height:4mm;width:8.3mm;padding-top:1.8mm;border-right-width:1px;"/>
							</div>
							<!--End Line 34 -->
							<!-- Line 35 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;padding-left:1mm;padding-top:1mm;">35</div>
								<div style="width:77.8mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
										<span class="styAgency" style="font-size:8pt;">
                              Domestic production activities deduction. 
                              Attach Form 8903</span>
									</span>
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">..</span>
								</div>
								<div class="styLNRightNumBox" style="padding-top:1.2mm;">35</div>
								<div class="styLNAmountBox" style="padding-top:1.2mm;">
									<!--No Entry-->
								</div>
								<div class="styShadingCell" style="height:4.5mm;width:8.3mm;border-bottom-width:1px;padding-top:1.8mm;border-right-width:1px;"/>
							</div>
							<!--End Line 35 -->
							<!-- Line 36 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;">36</div>
								<div style="width:117.8mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
                           Add lines 23 through 31a and 32 through 35
                              <!-- Form to Form Link -->
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/TotalAdjustmentsAmt"/>
										</xsl:call-template>
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Line 36 - Other Adjustments Total Amount</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$FormData/OtherAdjustmentsTotalAmt"/>
										</xsl:call-template>
									</span>
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">............</span>
								</div>
								<div class="styLNRightNumBox" style="padding-top:1mm;">36</div>
								<div class="styLNAmountBox" style="padding-top:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TotalAdjustmentsAmt"/>
										<xsl:with-param name="BackupName">IRS1040TotalAdjustmentsAmt</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
							<!--End Line 36 -->
							<!-- Line 37 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;">37</div>
								<div style="width:115.3mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
                           Subtract line 36 from line 22. This is your <b>adjusted gross income</b>
									</span>
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">......</span>
								</div>
								<span style="float:left;clear:none;">
									<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
								</span>
								<div class="styLNRightNumBox" style="border-bottom-width:0px;">37</div>
								<div class="styLNAmountBox" style="border-bottom-width:0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AdjustedGrossIncomeAmt"/>
										<xsl:with-param name="BackupName">IRS1040AdjustedGrossIncomeAmt</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
							<!--End Line 37 -->
						</div>
					</div>
					<!-- end AGI -->
					<!-- page 1 footer -->
					<div class="pageEnd" style="width:187mm;">
						<span class="styBoldText" style="width:120mm;padding-top:.5mm;float:left;clear:none;">For Disclosure, Privacy Act, and Paperwork Reduction Act Notice, see page 97.</span>
						<span class="styNormalText" style="padding-top:.5mm;float:left;clear:none;">Cat. No. 11320B</span>
						<span style="float:right;clear:none;">
               Form <span class="styBoldText" style="font-size:10pt;">1040</span> (2010)
               </span>
					</div>
					<!-- end page 1 footer -->
					<!-- page 2 -->
					<div class="styTBB" style="width:187mm;padding-top:.5mm;">
						<span class="" style="float:left;clear:none;">Form 1040 (2010)</span>
						<span style="float:right;clear:none;">Page <span class="styBoldText" style="font-size:8pt;">2</span>
						</span>
					</div>
					<!-- tax and credits -->
					<div class="styBB" style="width:187mm;padding-top:0mm;padding-bottom:0mm;">
						<div style="width:24.5mm;float:left;clear:none;">
							<div style="padding-top:2mm;padding-bottom:3mm;">
								<div class="styMainTitle" style="font-size:11pt;">
                     Tax and<br/>
                     Credits
                     </div>
							</div>
						</div>
						<div style="height:8mm;width:162.5mm;float:left;clear:none;">
							<!-- Line 38 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;">38</div>
								<div style="width:117.8mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
									<span style="padding-right:1mm;float:left;clear:none;">
                           Amount from line 37 (adjusted gross income)
                           </span>
									<div class="styFixedUnderline" style="height:4mm;width:53mm;text-align:left;float:left;clear:none;padding-top:0mm;padding-left:.5mm;border-style:dotted;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/ExcldSect933PuertoRicoIncmAmt/@excldSect933PuertoRicoIncmCd"/>
											<xsl:with-param name="BackupName">IRS1040ExcldSect933PuertoRicoIncmAmt@excldSect933PuertoRicoIncmCd</xsl:with-param>
										</xsl:call-template>,
										 <span style="width:2px;"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/ExcldSect933PuertoRicoIncmAmt"/>
											<xsl:with-param name="BackupName">IRS1040ExcldSect933PuertoRicoIncmAmt</xsl:with-param>
										</xsl:call-template>
									</div>
								</div>
								<div class="styLNRightNumBox" style="">38</div>
								<div class="styLNAmountBox" style="">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AdjustedGrossIncomeAmt"/>
										<xsl:with-param name="BackupName">IRS1040AdjustedGrossIncomeAmt</xsl:with-param>
									</xsl:call-template>
								</div>
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
												<b>You </b> were born before January 2, 1946,
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
												<b>Spouse </b> was born before January 2, 1946,
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
								<div class="styShadingCell" style="height:11.3mm;width:8.3mm;padding-top:2mm;border-right-width:1px;"/>
							</div>
							<!--End Line 39a -->
							<!-- Line 39b -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;padding-left:4.25mm;">b</div>
								<div style="width:116.2mm;padding-top:.5mm;padding-left:1.5mm;float:left;clear:none;">
									<div style="float:left;clear:none;font-size:6pt">
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$FormData/MustItemizeInd"/>
												<xsl:with-param name="BackupName">IRS1040MustItemizeInd</xsl:with-param>
											</xsl:call-template>
											<span style="float:left;clear:none;">
                               If your spouse itemizes on a separate return or you were a dual-status alien, 
                                see page 35 and check here</span>
											<br/>
										</label>
										<span class="styDotLn" style="float:left;clear:none;padding-right:1mm;">..........................</span>
										<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
										<span style="width:1mm;"/>
										<span style="font-size:6.5pt">
											<b>39b</b>
										</span>
										<span style="width:1mm;"/>
										<!-- Checkbox -->
										<input type="Checkbox" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/MustItemizeInd"/>
												<xsl:with-param name="BackupName">IRS1040MustItemizeInd</xsl:with-param>
											</xsl:call-template>
										</input>
									</div>
								</div>
								<div class="styShadingCell" style="height:6.5mm;width:8.3mm;border-right-width:1px;"/>
							</div>
							<!--End Line 39b -->
							<!-- Line 40 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;">40</div>
								<div style="width:117.8mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
										<b>Itemized deductions</b> (from Schedule A) <b>or</b> your <b>standard deduction</b> (see page 35)
                           </span>
									<div style="float:left;clear:none;">
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Line 40 - Modified Standard Deduction Ind</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$FormData/TotalItemizedOrStandardDedAmt/@modifiedStandardDeductionInd"/>
										</xsl:call-template>
									</div>
								</div>
								<div class="styLNRightNumBox" style="">40</div>
								<div class="styLNAmountBox" style="">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TotalItemizedOrStandardDedAmt"/>
										<xsl:with-param name="BackupName">IRS1040TotalItemizedOrStandardDedAmt</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
							<!--End Line 40 -->
							<!-- Line 41 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;">41</div>
								<div style="width:117.8mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
                           Subtract line 40 from line 38
                           </span>
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">...................</span>
								</div>
								<div class="styLNRightNumBox" style="">41</div>
								<div class="styLNAmountBox" style="">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AGILessDeductionsAmt"/>
										<xsl:with-param name="BackupName">IRS1040AGILessDeductionsAmt</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
							<!--End Line 41 -->
							<!-- Line 42 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;">42</div>
								<div style="width:117.8mm;float:left;clear:none;padding-top:.5mm;padding-left:3mm;">
									<div style="padding-left:0mm;float:left;clear:none;">
										<span style="float:left;clear:none;">
											<b>Exemptions.</b> Multiply $3,650 by the number on line 6d
                           </span>
										<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">..........</span>
									</div>
								</div>
								<div class="styLNRightNumBox" style="">42</div>
								<div class="styLNAmountBox" style="">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/ExemptionAmt"/>
										<xsl:with-param name="BackupName">IRS1040ExemptionAmt</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
							<!--End Line 42 -->
							<!--James-border-style:solid;border-color:black;border-width:1px 1px 1px 1px;-->
							<!-- Line 43 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;padding-top:.5">43</div>
								<div style="width:117.8mm;padding-top:1mm;padding-left:3mm;float:left;clear:none;font-size:6pt">
									<span style="float:left;clear:none;font-size:6pt;">
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
									</div>
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">...</span>
								</div>
								<div class="styLNRightNumBox" style="">43</div>
								<div class="styLNAmountBox" style="">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxableIncomeAmt"/>
										<xsl:with-param name="BackupName">IRS1040TaxableIncomeAmt</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
							<!--End Line 43 -->
							<!-- Line 44 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;padding-top:.8mm;">44</div>
								<div style="width:117.8mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
									<b>Tax</b>
									<span style="width:4px;"/>
									<span class="styNormal">(see page 37).</span>
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/TaxAmt"/>
									</xsl:call-template>
									<span style="width:4px;"/>
									<span class="styNormal">Check if any tax is from:</span>
									<span style="width:8px;"/>
									<span class="styBoldText">a</span>
									<span style="width:4px;"/>
									<!-- Checkbox -->
									<input type="Checkbox" class="styCkbox" disabled="disabled">
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
										<span style="width:4px;"/>
										<span class="styAgency" style="font-size:8pt;">Form(s) 8814</span>
									</label>
									<span style="width:8px;"/>
									<span class="styBoldText">b</span>
									<span style="width:4px;"/>
									<!-- Checkbox -->
									<input type="Checkbox" class="styCkbox" disabled="disabled">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/Form4972Ind"/>
											<xsl:with-param name="BackupName">IRS1040Form4972Ind</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:4px;"/>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/Form4972Ind"/>
											<xsl:with-param name="BackupName">IRS1040Form4972Ind</xsl:with-param>
										</xsl:call-template>
										<span class="styAgency" style="font-size:8pt;clear:none;float:none;">Form 4972</span>
									</label>
									<!-- Form to Form Link -->
									<span class="styDotLn" style="float:none;clear:none;padding-left:3.75mm;">..</span>
								</div>
								<div class="styLNRightNumBox" style="">44</div>
								<div class="styLNAmountBox" style="">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxAmt"/>
										<xsl:with-param name="BackupName">IRS1040TaxAmt</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
							<!--End Line 44 -->
							<!-- Line 45 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;">45</div>
								<div style="width:117.8mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
										<span class="styBoldText">Alternative minimum tax</span> (see page 40). Attach Form 6251
                           </span>
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.........</span>
								</div>
								<div class="styLNRightNumBox" style="">45</div>
								<div class="styLNAmountBox" style=""/>
							</div>
							<!--End Line 45 -->
							<!-- Line 46 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;">46</div>
								<div style="width:117.8mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
                           Add lines 44 and 45
                           </span>
									<span class="styDotLn" style="clear:none;padding-right:2mm;">.....................</span>
									<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
								</div>
								<div class="styLNRightNumBox" style="">46</div>
								<div class="styLNAmountBox" style="">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TotalTxBeforeCrAndOtherTxsAmt"/>
										<xsl:with-param name="BackupName">IRS1040TotalTxBeforeCrAndOtherTxsAmt</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
							<!--End Line 46 -->
							<!-- Line 47 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;padding-top:.5mm;padding-left:1mm;">47</div>
								<div class="styLNDesc" style="width:77.8mm;padding-top:.5mm;padding-left:3mm;">
									<span style="float:left;">
                           Foreign tax credit. Attach Form 1116 if required
                           </span>
									<span class="styDotLn" style="float:right;padding-right:2mm;">..</span>
								</div>
								<div class="styLNRightNumBox" style="padding-top:1mm;">47</div>
								<div class="styLNAmountBox" style="padding-top:1mm;"/>
								<div class="styShadingCell" style="height:4mm;width:8.3mm;padding-top:1.8mm;border-right-width:1px;"/>
							</div>
							<!--End Line 47 -->
							<!-- Line 48 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;padding-left:1mm;">48</div>
								<div style="width:77.8mm;padding-top:1mm;padding-left:3mm;float:left;clear:none;">
									<span style="float:left;clear:none;font-size:6pt">
                           Credit for child and dependent care expenses. Attach Form 2441
                           </span>
									<div style="float:left;clear:none;padding-left:1mm">
										<!-- Form to Form Link -->
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/CrForChildAndDEPDCareAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<div class="styLNRightNumBox" style="padding-top:1mm;">48</div>
								<div class="styLNAmountBox" style="padding-top:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CrForChildAndDEPDCareAmt"/>
										<xsl:with-param name="BackupName">IRS1040CrForChildAndDEPDCareAmt</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styShadingCell" style="height:4mm;width:8.3mm;padding-top:1.8mm;border-right-width:1px;"/>
							</div>
							<!--End Line 48 -->
							<!-- Line 49 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;padding-left:1mm;">49</div>
								<div style="width:77.8mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
                           Education credits from Form 8863, line 23
                           </span>
									<div style="float:left;clear:none;padding-left:1mm">
										<!-- Form to Form Link -->
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/EducationCreditAmt"/>
										</xsl:call-template>
									</div>
									<span class="styDotLn" style="float:right;padding-right:2mm;clear:none;">...</span>
								</div>
								<div class="styLNRightNumBox" style="padding-top:1mm;">49</div>
								<div class="styLNAmountBox" style="padding-top:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/EducationCreditAmt"/>
										<xsl:with-param name="BackupName">IRS1040EducationCreditAmt</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styShadingCell" style="height:4mm;width:8.3mm;padding-top:1.8mm;border-right-width:1px;"/>
							</div>
							<!--End Line 49 -->
							<!-- Line 50 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;padding-left:1mm;">50</div>
								<div style="width:77.8mm;padding-top:1mm;padding-left:3mm;float:left;clear:none;">
									<span style="float:left;clear:none;font-size:6pt">
                           Retirement savings contributions credit.                     
                           
                            Attach Form 8880</span>
									<div style="float:left;clear:none;padding-left:1mm">
										<!-- Form to Form Link -->
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/RtrSavingsContributionsCrAmt"/>
										</xsl:call-template>
									</div>
									<span class="styDotLn" style="padding-left:2mm;float:left;clear:none;">..</span>
								</div>
								<div class="styLNRightNumBox" style="padding-top:1mm;">50</div>
								<div class="styLNAmountBox" style="padding-top:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/RtrSavingsContributionsCrAmt"/>
										<xsl:with-param name="BackupName">IRS1040RtrSavingsContributionsCrAmt</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styShadingCell" style="height:4mm;width:8.3mm;padding-top:1.8mm;border-right-width:1px;"/>
							</div>
							<!--End Line 50 -->
							<!-- Line 51 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;padding-left:1mm;padding-top:1mm;">51</div>
								<div style="width:77.8mm;padding-top:1mm;padding-left:3mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
                           Child tax credit (see page 42). 
                           </span>
									<span class="styDotLn" style="float:right;padding-right:2mm;clear:none;">........</span>
								</div>
								<div class="styLNRightNumBox" style="padding-top:1mm;">51</div>
								<div class="styLNAmountBox" style="padding-top:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/ChildTaxCreditAmt"/>
										<xsl:with-param name="BackupName">IRS1040ChildTaxCreditAmt</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styShadingCell" style="height:4mm;width:8.3mm;padding-top:1.8mm;border-right-width:1px;"/>
							</div>
							<!--End Line 51 -->
							<!-- Line 52 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;padding-left:1mm;padding-top:1mm;">52</div>
								<div style="width:77.8mm;padding-top:1mm;padding-left:3mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
							Residential energy credits. Attach Form 5695
                           </span>
									<span class="styDotLn" style="float:right;padding-right:2mm;clear:none;">...</span>
								</div>
								<div class="styLNRightNumBox" style="padding-top:1mm;">52</div>
								<div class="styLNAmountBox" style="padding-top:1mm;">
									<!--No Entry Available in Phase III
								<xsl:call-template name="PopulateAmount">
								   <xsl:with-param name="TargetNode" select="$FormData/ResidentialEnergyCreditsAmt" />
								 <xsl:with-param name="BackupName">IRS1040ResidentialEnergyCreditsAmt</xsl:with-param>
                           </xsl:call-template>-->
								</div>
								<div class="styShadingCell" style="height:4mm;width:8.3mm;padding-top:1.8mm;border-right-width:1px;"/>
							</div>
							<!--End Line 52 -->
							<!-- Line 53 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;padding-left:1mm;padding-top:1mm;">53</div>
								<div style="width:77.8mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
										<span class="styAgency" style="font-size:8pt">Other credits from Form:</span>
										<span style="width:6px;"/>
										<span class="styBoldText">a</span>
										<span style="width:2px;"/>
										<!-- Checkbox -->
										<input type="Checkbox" class="styCkbox" disabled="disabled">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/Form3800Ind"/>
												<xsl:with-param name="BackupName">IRS1040Form3800Ind</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:2px;"/>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$FormData/Form3800Ind"/>
												<xsl:with-param name="BackupName">IRS1040Form3800Ind</xsl:with-param>
											</xsl:call-template>
											<span class="styAgency" style="font-size:8pt;">3800</span>
										</label>
										<span style="width:9px;"/>
										<span class="styBoldText">b</span>
										<span style="width:2px;"/>
										<!-- Checkbox -->
										<input type="Checkbox" class="styCkbox" disabled="disabled">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/Form8801Ind"/>
												<xsl:with-param name="BackupName">IRS1040TaxAndCredits8801Ind</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:2px;"/>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$FormData/Form8801Ind"/>
												<xsl:with-param name="BackupName">IRS1040TaxAndCredits8801Ind</xsl:with-param>
											</xsl:call-template>
											<span class="styAgency" style="font-size:8pt;">8801</span>
										</label>
										<span style="width:20px;"/>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$FormData/SpecificOtherCreditsInd"/>
												<xsl:with-param name="BackupName">IRS1040SpecificOtherCreditsInd</xsl:with-param>
											</xsl:call-template>
											<b>c</b>
										</label>
										<span style="width:2px;"/>
										<!-- Checkbox -->
										<input type="Checkbox" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/SpecificOtherCreditsInd"/>
												<xsl:with-param name="BackupName">IRS1040SpecificOtherCreditsInd</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:2px;"/>
										<span class="styFixedUnderline" style="padding-top:0mm;padding-bottom:0mm;float:none;width:10mm;">
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/SpecificOtherCreditsInd"/>
											</xsl:call-template>
											<xsl:call-template name="LinkToLeftoverDataTableInline">
												<xsl:with-param name="Desc">Line 53c -  Credit Forms Statement</xsl:with-param>
												<xsl:with-param name="TargetNode" select="$FormData/SpecificOtherCreditsInd/@creditFormsStatement"/>
											</xsl:call-template>
											<xsl:call-template name="LinkToLeftoverDataTableInline">
												<xsl:with-param name="Desc">Line 53c -  Credit For Elderly Literal Code</xsl:with-param>
												<xsl:with-param name="TargetNode" select="$FormData/SpecificOtherCreditsInd/@creditForElderlyLiteralCd"/>
											</xsl:call-template>
										</span>
									</span>
								</div>
								<div class="styLNRightNumBox" style="padding-top:1mm;">53</div>
								<div class="styLNAmountBox" style="padding-top:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/OtherCreditsAmt"/>
										<xsl:with-param name="BackupName">IRS1040OtherCreditsAmt</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styShadingCell" style="height:4mm;width:8.3mm;padding-top:1.8mm;border-right-width:1px;"/>
							</div>
							<!--End Line 53 -->
							<!-- Line 54 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;">54</div>
								<div style="width:117.8mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
                           Add lines 47 through 53. These are your <span class="styBoldText">total credits</span>
									</span>
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">...........</span>
								</div>
								<div class="styLNRightNumBox" style="">54</div>
								<div class="styLNAmountBox" style="">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TotalCreditsAmt"/>
										<xsl:with-param name="BackupName">IRS1040TotalCreditsAmt</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
							<!--End Line 54 -->
							<!-- Line 55 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;">55</div>
								<div style="width:117.8mm;padding-left:3mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
                           Subtract line 54 from line 46. If line 54 is more than line 46, enter -0-
                           </span>
									<span class="styDotLn" style="clear:none;padding-right:2mm;">....</span>
									<span style="width:7px;"/>
									<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
								</div>
								<div class="styLNRightNumBox" style="border-bottom-width:0px;">55</div>
								<div class="styLNAmountBox" style="border-bottom-width:0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxLessCreditsAmt"/>
										<xsl:with-param name="BackupName">IRS1040TaxLessCreditsAmt</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
							<!--End Line 55 -->
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
								<div class="styLNLeftNumBox" style="width:4mm;">56</div>
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
											<xsl:with-param name="Desc">Line 56 -  Exempt SE Tax Literal Code</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$FormData/SelfEmploymentTaxAmt/@exemptSETaxLiteralCd"/>
										</xsl:call-template>
									</div>
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.............</span>
								</div>
								<div class="styLNRightNumBox" style="">56</div>
								<div class="styLNAmountBox" style="">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/SelfEmploymentTaxAmt"/>
										<xsl:with-param name="BackupName">IRS1040SelfEmploymentTaxAmt</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
							<!--End Line 56 -->
							<!-- Line 57 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;padding-top:1mm;">57</div>
								<div style="width:117.8mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
                           Unreported social security and Medicare tax from Form:
                              <span style="width:2px;"/>
										<span class="styBoldText">a</span>
										<span style="width:4px;"/>
										<!-- Checkbox -->
										<input type="Checkbox" class="styCkbox" disabled="disabled">
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
											<span class="styAgency" style="font-size:8pt;">4137</span>
										</label>
										<span style="width:8px;"/>
										<span class="styBoldText">b</span>
										<span style="width:4px;"/>
										<!-- Checkbox -->
										<input type="Checkbox" class="styCkbox" disabled="disabled">
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
										<!--<xsl:call-template name="LinkToLeftoverDataTableInline">
                                 <xsl:with-param name="Desc">Line 57 - Railroad Retirement Code</xsl:with-param>
                                 <xsl:with-param name="TargetNode" select="$FormData/RailroadRetireCode"/>
                              </xsl:call-template>-->
									</span>
									<span class="styDotLn" style="float:right;padding-right:2mm;clear:none;">...</span>
								</div>
								<div class="styLNRightNumBox" style="padding-top:1mm;">57</div>
								<div class="styLNAmountBox" style="padding-top:1mm;">
									<!--<xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="$FormData/UnrprtdSocSecAndMedcrTaxAmt" />
                              <xsl:with-param name="BackupName">IRS1040UnrprtdSocSecAndMedcrTaxAmt</xsl:with-param>
                           </xsl:call-template>-->
								</div>
							</div>
							<!--End Line 57 -->
							<!-- Line 58 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;padding-top:1mm;">58</div>
								<div style="width:117.8mm;adding-top:.5mm;padding-left:3mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
                           Additional tax on IRAs, other qualified retirement plans, etc. 
                              <span class="styAgency" style="font-size:8pt;">Attach Form 5329 if required</span>
									</span>
									<div style="float:left;clear:none;">
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Line 58 - Retirement Tax Plan Literal Code</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$FormData/TaxOnIRAsAmt/@retirementTaxPlanLiteralCd"/>
										</xsl:call-template>
									</div>
								</div>
								<div class="styLNRightNumBox" style="padding-top:1mm;">58</div>
								<div class="styLNAmountBox" style="padding-top:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxOnIRAsAmt"/>
										<xsl:with-param name="BackupName">IRS1040TaxOnIRAsAmt</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
							<!--End Line 58 -->
							<!-- Line 59 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;">59</div>
								<div style="width:117.8mm;padding-left:3mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
										<span class="styBoldText">a</span>
										<span style="width:4px;"/>
										<!-- Checkbox -->
										<input type="Checkbox" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/AdvanceEICPaymentInd"/>
												<xsl:with-param name="BackupName">IRS1040AdvanceEICPaymentInd</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:4px;"/>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$FormData/AdvanceEICPaymentInd"/>
												<xsl:with-param name="BackupName">IRS1040AdvanceEICPaymentInd</xsl:with-param>
											</xsl:call-template>
											<span class="styAgency" style="font-size:8pt;">Form(s) W-2, box 9</span>
										</label>
										<span style="width:8mm;"/>
										<span class="styBoldText">b</span>
										<span style="width:4px;"/>
										<!-- Checkbox -->
										<input type="Checkbox" class="styCkbox" disabled="disabled">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/HouseholdEmploymentTaxInd"/>
												<xsl:with-param name="BackupName">IRS1040HouseholdEmploymentTaxInd</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:4px;"/>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$FormData/HouseholdEmploymentTaxInd"/>
												<xsl:with-param name="BackupName">IRS1040HouseholdEmploymentTaxInd</xsl:with-param>
											</xsl:call-template>
											<span class="styAgency" style="font-size:8pt;">Schedule H</span>
										</label>
										<span style="width:8mm;"/>
										<span class="styBoldText">c</span>
										<span style="width:4px;"/>
										<!-- Checkbox -->
										<input type="Checkbox" class="styCkbox" disabled="disabled">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/ChangeInUseOfHomeOrCrClaimInd"/>
												<xsl:with-param name="BackupName">IRS1040ChangeInUseOfHomeOrCrClaimInd</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:4px;"/>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$FormData/ChangeInUseOfHomeOrCrClaimInd"/>
												<xsl:with-param name="BackupName">IRS1040ChangeInUseOfHomeOrCrClaimInd</xsl:with-param>
											</xsl:call-template>
											<span class="styAgency" style="font-size:8pt;">Form 5405, line 16</span>
										</label>
									</span>
									<span class="styDotLn" style="float:right;padding-right:2mm;clear:none;">......</span>
								</div>
								<div class="styLNRightNumBox" style="">59</div>
								<div class="styLNAmountBox" style="">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TotAEICHmbyrCrAndHshdTxAmt"/>
										<xsl:with-param name="BackupName">IRS1040TotAEICHmbyrCrAndHshdTxAmt</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
							<!--End Line 59 -->
							<!-- Line 60 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;">60</div>
								<div style="height:4mm;float:left;clear:none;padding-left:3mm;">
									<div style="width:68.5mm;padding-left:0mm;float:left;clear:none;">
										<span style="float:left;clear:none;">
                           Add lines 55 through 59. This is your<b> total tax</b>
											<span style="padding-right:1mm;"/>
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/TotalOtherTaxAmt"/>
											</xsl:call-template>
										</span>
									</div>
									<div class="styFixedUnderline" style="text-align:left;float:left;clear:none;height:2mm;width:43mm;padding-top:0mm;padding-bottom:0mm;padding-left:.5mm;border-style:dotted;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalOtherTaxAmt"/>
											<xsl:with-param name="BackupName">IRS1040TotalOtherTaxAmt</xsl:with-param>
										</xsl:call-template>
									</div>
									<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
								</div>
								<div class="styLNRightNumBox" style="border-bottom-width:0px;">60</div>
								<div class="styLNAmountBox" style="border-bottom-width:0px;">
									<!-- Form to Form Link -->
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TotalTaxAmt"/>
										<xsl:with-param name="BackupName">IRS1040TotalTaxAmt</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
							<!--End Line 60 -->
						</div>
					</div>
					<!--End Other taxes -->
					<!-- Payments -->
					<div class="styBB" style="width:187mm;">
						<div style="width:24.5mm;height:50mm;float:left;clear:none;">
							<div style="padding-top:2mm;padding-bottom:5.3mm;">
								<span class="styMainTitle" style="font-size:11pt;">
                     Payments
                     </span>
							</div>
							<div style="height:.2mm;border-style: solid; border-color: black;
			border-top-width: 1px; border-bottom-width: 0px; border-left-width: 1px; border-right-width: 1px;"/>
							<div style="border-style:solid; border-color:black;border-width: 0px 0px 0px 1px;">
                     If you have a</div>
							<div style="padding-bottom:4mm;border-style:solid;border-color:black;border-width: 0px 1px 1px 1px;">
                     qualifying<br/>
                     child, attach<br/>
                     Schedule EIC.
                     </div>
						</div>
						<div style="float:left;clear:none;height:8mm;width:162.5mm;">
							<!-- Line 61 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;padding-left:1mm;">61</div>
								<div style="float:left;clear:none;padding-top:.5mm;padding-left:3mm;">
									<div style="width:75mm;padding-left:0mm;">
										<span class="styAgency" style="font-size:8pt;float:left;">
                           Federal income tax withheld from Forms W-2 and 1099
                           
                               <!-- Form to Form Link -->
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/WithholdingTaxAmt"/>
											</xsl:call-template>
										</span>
										<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">..</span>
									</div>
								</div>
								<div class="styLNRightNumBox" style="height:4mm;padding-top:1mm;">61</div>
								<div class="styLNAmountBox" style="padding-top:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/WithholdingTaxAmt"/>
										<xsl:with-param name="BackupName">IRS1040WithholdingTaxAmt</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styShadingCell" style="height:4mm;width:8.3mm;padding-top:1.8mm;border-right-width:1px;"/>
							</div>
							<!--End Line 61 -->
							<!-- Line 62 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;padding-left:1mm;padding-top:1mm;">62</div>
								<div style="width:77.8mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
										<span class="styAgency" style="font-size:7.5pt;">2010 estimated tax payments and amount applied from 2009 return</span>
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Line 62 - Divorced Spouse SSN</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$FormData/EstimatedTaxPaymentsAmt/@divorcedSpouseSSN"/>
										</xsl:call-template>
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Line 62 - Divorced Literal Code</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$FormData/EstimatedTaxPaymentsAmt/@divorcedLiteralCd"/>
										</xsl:call-template>
									</span>
								</div>
								<div class="styLNRightNumBox" style="padding-top:1mm;">62</div>
								<div class="styLNAmountBox" style="padding-top:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/EstimatedTaxPaymentsAmt"/>
										<xsl:with-param name="BackupName">IRS1040EstimatedTaxPaymentsAmt</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styShadingCell" style="height:4mm;width:8.3mm;padding-top:1.8mm;border-right-width:1px;"/>
							</div>
							<!--End Line 62 -->
							<!-- Line 63 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;padding-left:1mm;">63</div>
								<div style="float:left;clear:none;padding-top:.5mm;padding-left:3mm;">
									<div style="width:75mm;padding-left:0mm;">
										<span class="styAgency" style="font-size:8pt;float:left;">
                           Making work pay credit. Attach Schedule M
                           
                              <!--Form to Form Link-->
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/MakingWorkPayCrAmt"/>
											</xsl:call-template>
										</span>
										<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.....</span>
									</div>
								</div>
								<div class="styLNRightNumBox" style="height:4mm;padding-top:1mm;">63</div>
								<div class="styLNAmountBox" style="padding-top:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/MakingWorkPayCrAmt"/>
										<xsl:with-param name="BackupName">IRS1040MakingWorkPayCrAmt</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styShadingCell" style="height:4mm;width:8.3mm;padding-top:1.8mm;border-right-width:1px;"/>
							</div>
							<!--End Line 63 -->
							<!-- Line 64a -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;padding-left:1mm;">64a</div>
								<div style="width:76.3mm;padding-top:.5mm;padding-left:1mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
										<span class="styBoldText" style="float:left;clear:none;">Earned income credit (EIC)</span>
										<div style="float:left;clear:none;padding-left:1mm">
											<!-- Form to Form Link -->
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/EarnedIncomeCreditAmt"/>
											</xsl:call-template>
											<xsl:call-template name="LinkToLeftoverDataTableInline">
												<xsl:with-param name="TargetNode" select="$FormData/EICEligibilityLiteralCd"/>
												<xsl:with-param name="Desc">Line 64a - EIC Eligibility Literal Code</xsl:with-param>
											</xsl:call-template>
										</div>
									</span>
									<span class="styDotLn" style="float:right;padding-right:2mm;clear:none;">.......</span>
								</div>
								<div class="styLNRightNumBox" style="padding-top:1mm;">64a</div>
								<div class="styLNAmountBox" style="padding-top:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/EarnedIncomeCreditAmt"/>
										<xsl:with-param name="BackupName">IRS1040EarnedIncomeCreditAmt</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styShadingCell" style="height:4mm;width:8.3mm;padding-top:1.8mm;border-right-width:1px;"/>
							</div>
							<!--End Line 64a -->
							<!-- Line 64b -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;padding-left:4.5mm;padding-top:1mm;">b</div>
								<div style="width:36mm;padding-top:1mm;padding-left:1mm;float:left;clear:none;">
									<span class="styAgency" style="font-size:7.5pt;">Nontaxable combat pay election</span>
								</div>
								<div class="styLNRightNumBox" style="">64b</div>
								<div class="styLNAmountBox" style="border-right:0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/NontxCombatPayElectionAmt"/>
										<xsl:with-param name="BackupName">IRS1040NontxCombatPayElectionAmt</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styShadingCell" style="height:4mm;width:8mm;padding-top:1.5mm;"/>
								<div class="styLNAmountBox" style="height:4.8mm;border-bottom-width:0px;"/>
								<div class="styShadingCell" style="height:4mm;width:8.3mm;padding-top:1.5mm;border-right-width:1px;"/>
							</div>
							<!--End Line 64b -->
							<!-- Line 65 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;padding-left:1mm;padding-top:1mm;">65</div>
								<div style="width:77.8mm;padding-top:.8mm;padding-left:3mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
                            Additional child tax credit. Attach Form 8812 
                               <!-- Form to Form Link -->
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/AdditionalChildTaxCreditAmt"/>
										</xsl:call-template>
									</span>
									<span class="styDotLn" style="float:right;padding-right:2mm;clear:none;">..</span>
								</div>
								<div class="styLNRightNumBox" style="padding-top:1mm;">65</div>
								<div class="styLNAmountBox" style="padding-top:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AdditionalChildTaxCreditAmt"/>
										<xsl:with-param name="BackupName">IRS1040AdditionalChildTaxCreditAmt</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styShadingCell" style="height:4mm;width:8.3mm;padding-top:1.8mm;border-right-width:1px;"/>
							</div>
							<!--End Line 65 -->
							<!-- Line 66 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;padding-top:1mm;padding-left:1mm;">66</div>
								<div style="width:77.8mm;font-size:6.5pt;padding-top:.8mm;padding-left:3mm;float:left;clear:none;">
							   American opportunity credit from Form 8863, line 14
                               <!-- Form to Form Link -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/RefundableAmerOppCreditAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNRightNumBox" style="padding-top:1mm;">66</div>
								<div class="styLNAmountBox" style="padding-top:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/RefundableAmerOppCreditAmt"/>
										<xsl:with-param name="BackupName">IRS1040RefundableAmerOppCreditAmt</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styShadingCell" style="height:4mm;width:8.3mm;padding-top:1.8mm;border-right-width:1px;"/>
							</div>
							<!--End Line 66 -->
							<!-- Line 67 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;padding-left:1mm;">67</div>
								<div style="width:77.8mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
                               First-time homebuyer credit from Form 5405, line 10
                        </div>
								<div class="styLNRightNumBox" style="padding-top:1mm;">67</div>
								<div class="styLNAmountBox" style="padding-top:1mm;"/>
								<div class="styShadingCell" style="height:4mm;width:8.3mm;padding-top:1.8mm;border-right-width:1px;"/>
							</div>
							<!--End Line 67 -->
							<!-- Line 68 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;padding-left:1mm;">68</div>
								<div style="width:77.8mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
                            Amount paid with request for extension to file 
                              <span style="width:4px;"/>
									<span class="styAgency" style="">(see page 72)</span>
								</div>
								<div class="styLNRightNumBox" style="padding-top:1mm;">68</div>
								<div class="styLNAmountBox" style="padding-top:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/RequestForExtensionAmt"/>
										<xsl:with-param name="BackupName">IRS1040RequestForExtensionAmt</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styShadingCell" style="height:4mm;width:8.3mm;padding-top:1.8mm;border-right-width:1px;"/>
							</div>
							<!--End Line 68 -->
							<!-- Line 69 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;padding-top:1mm;padding-left:1mm;">69</div>
								<div style="width:77.8mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
										<span class="styAgency" style="font-size:8pt;">Excess social security and tier 1 RRTA tax withheld (see page 72)</span>
									</span>
								</div>
								<div class="styLNRightNumBox" style="padding-top:1mm;">69</div>
								<div class="styLNAmountBox" style="padding-top:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/ExcessSocSecAndTier1RRTATaxAmt"/>
										<xsl:with-param name="BackupName">IRS1040ExcessSocSecAndTier1RRTATaxAmt</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styShadingCell" style="height:4mm;width:8.3mm;padding-top:1.8mm;border-right-width:1px;"/>
							</div>
							<!--End Line 69 -->
							<!-- Line 70 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;padding-left:1mm;">70</div>
								<div style="width:77.8mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
                               Credit for federal tax on fuels. Attach Form 4136
                         </span>
									<span class="styDotLn" style="float:right;padding-left:2mm;float:none;clear:none;">..</span>
								</div>
								<div class="styLNRightNumBox" style="padding-top:1mm;">70</div>
								<div class="styLNAmountBox" style="padding-top:1mm;">
									<!--No Entry Available in Phase III
							<xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="$FormData/TotalIncomeTaxCredit" />
                              <xsl:with-param name="BackupName">IRS1040TotalIncomeTaxCredit</xsl:with-param>
                           </xsl:call-template>-->
								</div>
								<div class="styShadingCell" style="height:4mm;width:8.3mm;padding-top:1.8mm;border-right-width:1px;"/>
							</div>
							<!--End Line 70 -->
							<!-- Line 71 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;padding-top:1mm;padding-left:1mm;">71</div>
								<div style="width:77.8mm;padding-top:.8mm;padding-left:3mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
										<span class="styAgency">Credits from Form:</span>
										<span style="width:4px;"/>
										<span class="styBoldText">a</span>
										<span style="width:4px;"/>
										<!-- Checkbox -->
										<input type="Checkbox" class="styCkbox" disabled="disabled">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/Form2439Ind"/>
												<xsl:with-param name="BackupName">IRS1040Form2439Ind</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:4px;"/>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$FormData/Form2439Ind"/>
												<xsl:with-param name="BackupName">IRS1040Form2439Ind</xsl:with-param>
											</xsl:call-template>
											<span class="styAgency" style="font-size:8pt;">2439</span>
										</label>
										<span style="width:12px;"/>
										<span class="styBoldText">b</span>
										<span style="width:4px;"/>
										<!-- Checkbox -->
										<input type="Checkbox" class="styCkbox" disabled="disabled">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/Form8839Ind"/>
												<xsl:with-param name="BackupName">IRS1040Form8839Ind</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:4px;"/>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$FormData/Form8839Ind"/>
												<xsl:with-param name="BackupName">IRS1040Form8839Ind</xsl:with-param>
											</xsl:call-template>
											<span class="styAgency" style="font-size:8pt;">8839</span>
										</label>
										<span style="width:12px;"/>
										<span class="styBoldText">c</span>
										<span style="width:4px;"/>
										<!-- Checkbox -->
										<input type="Checkbox" class="styCkbox" disabled="disabled">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/Form8801Ind"/>
												<xsl:with-param name="BackupName">IRS1040Payments8801Ind</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:4px;"/>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$FormData/Form8801Ind"/>
												<xsl:with-param name="BackupName">IRS1040Payments8801Ind</xsl:with-param>
											</xsl:call-template>
											<span class="styAgency" style="font-size:8pt;">8801</span>
										</label>
										<span style="width:12px;"/>
										<span class="styBoldText">d</span>
										<span style="width:4px;"/>
										<!-- Checkbox -->
										<input type="Checkbox" class="styCkbox" disabled="disabled">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/Form8885Ind"/>
												<xsl:with-param name="BackupName">IRS1040Form8885Ind</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:4px;"/>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$FormData/Form8885Ind"/>
												<xsl:with-param name="BackupName">IRS1040Form8885Ind</xsl:with-param>
											</xsl:call-template>
											<span class="styAgency" style="font-size:8pt;">8885</span>
										</label>
									</span>
								</div>
								<div style="float:left;">
									<div class="styLNRightNumBox" style="padding-top:1mm;">71</div>
									<div class="styLNAmountBox" style="padding-top:1mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/OtherPaymentsAmt"/>
											<xsl:with-param name="BackupName">IRS1040OtherPaymentsAmt</xsl:with-param>
										</xsl:call-template>
									</div>
								</div>
								<div class="styShadingCell" style="height:4mm;width:8.3mm;padding-top:1.8mm;border-right-width:1px;"/>
							</div>
							<!--End Line 71 -->
							<!-- Line 72 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;">72</div>
								<div style="width:117.8mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
                           Add lines 61, 62, 63, 64a, and 65 through 71.  These are your<b> total payments</b>
									</span>
									<span class="styDotLn" style="clear:none;padding-left:3.5mm;">..</span>
									<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
								</div>
								<div class="styLNRightNumBox" style="border-bottom-width:0px;">72</div>
								<div class="styLNAmountBox" style="border-bottom-width:0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TotalPaymentsAmt"/>
										<xsl:with-param name="BackupName">IRS1040TotalPaymentsAmt</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
							<!--End Line 72 -->
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
							<!-- Line 73 -->
							<div style="width:165.5mm;">
								<div class="styLNLeftNumBox" style="padding-left:4.3mm;padding-top:0mm;">73</div>
								<div style="width:117.3mm;padding-left:2.5mm;float:left;float:left;clear:none;">
                            If line 72 is more than line 60, 
                              <span class="styAgency" style="font-size:7.5pt;">subtract line 60 from line 72.</span> 
                              This is the amount you <b>overpaid</b>
								</div>
								<div class="styLNRightNumBox" style="">73</div>
								<div class="styLNAmountBox" style="">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/OverpaidAmt"/>
										<xsl:with-param name="BackupName">IRS1040OverpaidAmt</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
							<!--End Line 73 -->
							<!-- Line 74a -->
							<div style="width:165.5mm;">
								<div class="styLNLeftNumBox" style="padding-left:4mm;">74a</div>
								<div style="width:116.3mm;padding-top:.5mm;padding-left:1.5mm;float:left;clear:none;">
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/Form8888Ind"/>
											<xsl:with-param name="BackupName">IRS1040Form8888Ind</xsl:with-param>
										</xsl:call-template>
										<span class="styAgency" style="font-size:8pt;">
								   Amount of line 73 you want <b>refunded to you. </b> If Form 8888 is attached, check here</span>
									</label>
									<span class="styDotLn" style="padding-left:0.75mm;float:none;clear:none;">...</span>
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
								<div class="styLNRightNumBox" style="padding-top:1mm;float:left;clear:none;">74a</div>
								<div class="styLNAmountBox" style="padding-top:1mm;float:left;clear:none;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/RefundAmt"/>
										<xsl:with-param name="BackupName">IRS1040RefundAmt</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
							<!--End Line 74a -->
							<!-- Line 74b -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:9.3mm;padding-left:1.5mm;">
									<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
									<span style="width:3.5mm;"/>b
					</div>
								<div style="width:116mm;padding-top:.5mm;padding-left:1mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
                           Routing number
                           </span>
									<span style="width:3mm;float:left;clear:none;"/>
									<span class="styLNCtrNumBox" style="width:34mm;border-top-width:1px;padding-top:0mm;padding-bottom:0mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/RoutingTransitNumber"/>
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
											<xsl:with-param name="TargetNode" select="$FormData/BankAccountInd"/>
											<xsl:with-param name="DisplayedCheckboxValue" select="'1'"/>
											<xsl:with-param name="BackupName">IRS1040BankAccountInd[1]</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/BankAccountInd"/>
											<xsl:with-param name="DisplayedCheckboxValue" select="1"/>
											<xsl:with-param name="BackupName">IRS1040BankAccountInd[1]</xsl:with-param>
										</xsl:call-template>
								Checking
							</label>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateEnumeratedCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/BankAccountInd"/>
											<xsl:with-param name="DisplayedCheckboxValue" select="'2'"/>
											<xsl:with-param name="BackupName">IRS1040BankAccountInd[2]</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/BankAccountInd"/>
											<xsl:with-param name="DisplayedCheckboxValue" select="'2'"/>
											<xsl:with-param name="BackupName">IRS1040BankAccountInd[2]</xsl:with-param>
										</xsl:call-template>
								Savings
							</label>
								</div>
								<div class="styShadingCell" style="height:4mm;width:8.3mm;padding-top:1.8mm;border-right-width:1px;"/>
							</div>
							<!--End Line 74b -->
							<!-- Line 74d -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:9.3mm;padding-left:1.5mm;">
									<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
									<span style="width:3.5mm;"/>d
					</div>
								<div style="width:116mm;padding-top:.5mm;padding-left:1mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
                           Account number
                           </span>
									<span style="width:7px;float:left;clear:none;"/>
									<span class="styLNCtrNumBox" style="width:84mm;border-top-width:1px;padding-top:0mm;padding-bottom:0mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/DepositorAccountNumber"/>
											<xsl:with-param name="BackupName">IRS1040DepositorAccountNumber</xsl:with-param>
										</xsl:call-template>
									</span>
								</div>
								<div class="styShadingCell" style="height:4mm;width:8.3mm;padding-top:1.8mm;border-right-width:1px;"/>
							</div>
							<!--End Line 74d -->
							<!-- Line 75 -->
							<div style="width:165mm;">
								<div class="styLNLeftNumBox" style="padding-left:4.3mm;border-bottom-width:0mm;">75</div>
								<div style="height:4mm;width:77.3mm;padding-left:2.5mm;border-bottom-width:0mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
										<span class="styAgency" style="font-size:8pt;">Amount of line 73 you want<b> applied to your 2011 estimated tax</b>
										</span>
										<span style="width:1px;"/>
										<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
									</span>
								</div>
								<div class="styLNRightNumBox" style="border-bottom-width:0mm;">75</div>
								<div class="styLNAmountBox" style="border-bottom-width:0mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AppliedToEsTaxAmt"/>
										<xsl:with-param name="BackupName">IRS1040AppliedToEsTaxAmt</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styShadingCell" style="height:4mm;width:8.3mm;padding-top:1.2mm;border-right-width:1px;"/>
							</div>
							<!--End Line 75 -->
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
							<!-- Line 76 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;border-style:solid;border-color:black;border-width:1px 0px 0px 0px;">76</div>
								<div style="width:117.8mm;padding-top:.5mm;padding-left:3mm;border-style:solid;border-color:black;border-width:1px 0px 0px 0px;float:left;clear:none;">
									<b>Amount you owe.</b> Subtract line 72 from line 60. 
                              <span class="styAgency" style="font-size:7.5pt;">For details on how to pay, </span>
                              see instructions
                              
                           <img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
								</div>
								<div class="styLNRightNumBox" style="padding-top:1mm;bording-width-top:0mm;float:left;clear:none;">76</div>
								<div class="styLNAmountBox" style="padding-top:1mm;bording-width-top:0mm;float:left;clear:none;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AmountOwedAmt"/>
										<xsl:with-param name="BackupName">IRS1040AmountOwedAmt</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
							<!--End Line 76 -->
							<!-- Line 77 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;padding-left:1mm;">77</div>
								<div style="width:77.8mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
                            Estimated tax penalty (see page 74)
                           <span class="styDotLn" style="padding-left:4mm;float:none;clear:none;">......</span>
								</div>
								<div class="styLNRightNumBox" style="border-bottom-width:0px;">77</div>
								<div class="styLNAmountBox" style="border-bottom-width:0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/EsPenaltyAmt"/>
										<xsl:with-param name="BackupName">IRS1040EsPenaltyAmt</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styShadingCell" style="height:4mm;width:40mm;padding-top:1mm;float:left;clear:none;"/>
							</div>
							<!--End Line 77 -->
						</div>
					</div>
					<!-- 3rd party -->
					<div class="pageEnd" style="width:187mm;padding-top:.5mm;border-style:solid;border-color:black;border-width:0px 0px 1px 0px;">
						<div style="width:22mm;float:left;clear:none;">
							<div style="padding-top:1mm;padding-bottom:0mm;">
								<span class="styMainTitle" style="font-size:11pt;">
                     Third Party
                     Designee                
                     </span>
							</div>
						</div>
						<div style="float:left;clear:none;width:165mm;">
							<div style="float:left;clear:none;padding-left:2mm;">Do you want to allow another person to discuss this return with the IRS
                     <span class="styAgency">(see page 75)</span>
                     ?</div>
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
							 Complete the following.
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
								<xsl:if test="$FormData/ThirdPartyDesigneeName">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/ThirdPartyDesigneeName"/>
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
									<xsl:with-param name="TargetNode" select="$FormData/ThirdPartyDesigneePhone"/>
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
					<div class="styBB" style="width:187mm;padding-top:0mm;">
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
                        See page 15.<br/>
                        Keep a copy<br/>
                        for your<br/>
                        records.                
                     </div>
							</div>
							<div style="padding-top:12mm;float:left;clear:none;width:4mm;">
								<img src="{$ImagePath}/1040_Bullet_SuperLg.gif" alt="Right pointing arrowhead image"/>
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
							<div class="styBB" style="width:164mm;float:left;clear:none;">
								<div style="width:71mm;float:left;clear:none;">
									<div class="styFNBox" style="width:71mm;float:left;clear:none;">
                        Your signature
                        </div>
									<div class="styFNBox" style="height:8mm;width:71mm;padding-top:1.5mm;float:left;clear:none;">
										<xsl:call-template name="PopulatePin">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/PrimarySignature"/>
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
											<xsl:with-param name="TargetNode" select="$RtnHdrData/PrimarySignatureDate"/>
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
											<xsl:with-param name="TargetNode" select="$FormData/PrimaryOccupation"/>
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
											<xsl:with-param name="TargetNode" select="$FormData/DaytimePhoneNumber"/>
											<xsl:with-param name="BackupName">IRS1040DaytimePhoneNumber</xsl:with-param>
										</xsl:call-template>
										<!-- Optional Foreign Telephone Number -->
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/OptionalForeignTelephoneNumber"/>
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
									<div class="styFNBox" style="height:8mm;width:71mm;padding-top:1.5mm;float:left;clear:none;">
										<xsl:call-template name="PopulatePin">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/SpouseSignature"/>
											<xsl:with-param name="BackupName">$RtnHdrDataSpouseSignature</xsl:with-param>
										</xsl:call-template>
									</div>
								</div>
								<div class="styFNBox" style="width:18mm;float:left;clear:none;">
									<div style="width:16mm;padding-left:2mm;float:left;clear:none;">
                        Date
                        </div>
									<div style="height:8mm;width:18mm;padding-top:1.5mm;text-align:center;float:left;clear:none;">
										<xsl:call-template name="PopulateMonthDayYear">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/SpouseSignatureDate"/>
											<xsl:with-param name="BackupName">$RtnHdrDataSpouseSignatureDate</xsl:with-param>
										</xsl:call-template>
									</div>
								</div>
								<div class="styFNBox" style="width:36mm;float:left;clear:none;">
									<div style="width:36.8mm;padding-left:2mm;float:left;clear:none;">
                        Spouse's occupation
                        </div>
									<div style="height:8mm;width:36mm;padding-top:1.5mm;padding-left:2mm;float:left;clear:none;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/SpouseOccupation"/>
											<xsl:with-param name="BackupName">IRS1040SpouseOccupation</xsl:with-param>
										</xsl:call-template>
									</div>
								</div>
								<div class="styShadingCell" style="height:11mm;width:37mm;border-left-width:0px;"/>
							</div>
						</div>
					</div>
					<!-- paid preparer -->
					<div class="styBB" style="width:187mm;font-size:6pt;">
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
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformation/PreparerPersonName"/>
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
									<label>Check 
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformation/SelfEmployed"/>
											<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationSelfEmployed</xsl:with-param>
										</xsl:call-template>
										<input class="styCkbox" type="checkbox" style="width:4mm;">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformation/SelfEmployed"/>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationSelfEmployed</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:4px;"/>if<br/>self-employed
									</label>
								</div>
								<div class="styLNDesc" style="height:6mm;width:16mm;padding-top:0mm;padding-left:1mm;">PTIN
                             <br/>
									<xsl:if test="$RtnHdrData/PaidPreparerInformation/PreparerSSN">
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">PreparerSSN</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPreparerSSN</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$RtnHdrData/PaidPreparerInformation/PTIN">
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">PTIN</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPTIN</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$RtnHdrData/PaidPreparerInformation/STIN">
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
											<xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPreparerBusinessName1</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPreparerBusinessName2</xsl:with-param>
										</xsl:call-template>
									</div>
								</div>
								<div class="styLNDesc" style="height:6mm;width:32mm;padding-left:1mm;">Firm's EIN
								<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
									<span style="width:4px;"/>
									<xsl:if test="$RtnHdrData/PaidPreparerInformation/PreparerFirmIDNumber">
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">PreparerFirmIDNumber</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPreparerFirmIDNumber</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$RtnHdrData/PaidPreparerInformation/MissingEINReason">
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
											<xsl:with-param name="TargetNode">AddressLine1</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationAddressLine1</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">AddressLine2</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationAddressLine2</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:if test="$RtnHdrData/PaidPreparerInformation/PreparerUSAddress">
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">City</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationUSAddressCity</xsl:with-param>
											</xsl:call-template>,
											<span style="width:2px;"/>
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">State</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationUSAddressState</xsl:with-param>
											</xsl:call-template>,
											<span style="width:2px;"/>
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">ZIPCode</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationUSAddressZip</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="$RtnHdrData/PaidPreparerInformation/PreparerForeignAddress">
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">City</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationForeignAddressCity</xsl:with-param>
											</xsl:call-template>,
											<span style="width:2px;"/>
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">ProvinceOrState</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationForeignProvinceOrState</xsl:with-param>
											</xsl:call-template>,
											<span style="width:2px;"/>
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">PostalCode</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationForeignPostalCode</xsl:with-param>
											</xsl:call-template>,
											<span style="width:2px;"/>
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">Country</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationForeignCountry</xsl:with-param>
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
               Form <span class="styBoldText" style="font-size:10pt;">1040</span> (2010)
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
				<xsl:call-template name="PopulateLeftoverRow">
				   <xsl:with-param name="Desc">Line 6b - Exempt Spouse Name Control</xsl:with-param>
				   <xsl:with-param name="TargetNode" select="$FormData/ExemptSpouseNameControl" />
				   <xsl:with-param name="DescWidth" select="100"/>
				</xsl:call-template>
            </xsl:if>-->
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 7 - Wages Not Shown Lit Only Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/WagesSalariesAndTipsAmt/@wagesNotShownLitOnlyCd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<!--<xsl:call-template name="PopulateLeftoverRow">
               <xsl:with-param name="Desc">Line 9a - Ordinary Form 8814 Code</xsl:with-param>
               <xsl:with-param name="TargetNode" select="$FormData/OrdinaryF8814Cd" />
               <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
            <xsl:call-template name="PopulateLeftoverRowAmount">
               <xsl:with-param name="Desc">Line 9a - Ordinary Form 8814 Amt</xsl:with-param>
               <xsl:with-param name="TargetNode" select="$FormData/OrdinaryF8814Amt" />
               <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>-->
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
							<xsl:with-param name="TargetNode" select="$FormData/FormF8814Cd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Line 13 - Form F8814 Amt</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/FormF8814Amt"/>
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
							<xsl:with-param name="TargetNode" select="$FormData/pensionsAnnuitiesLiteralCd"/>
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
						<!--<xsl:call-template name="PopulateLeftoverRow">
               <xsl:with-param name="Desc">Line 32 - IRA Deduction Code</xsl:with-param>
               <xsl:with-param name="TargetNode" select="$FormData/IRADeductionCd" />
               <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>-->
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Line 36 - Other Adjustments Total Amt</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/OtherAdjustmentsTotalAmt"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<!--<xsl:call-template name="PopulateLeftoverRow">
               <xsl:with-param name="Desc">Line 38 - Sect 933 Puerto Rico Income Code</xsl:with-param>
               <xsl:with-param name="TargetNode" select="$FormData/ExcldSect933PuertoRicoIncmAmt/@excldSect933PuertoRicoIncmCd" />
               <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
            <xsl:call-template name="PopulateLeftoverRowAmount">
               <xsl:with-param name="Desc">Line 38 - Excluded Sect 933 Puerto Rico Income Amt</xsl:with-param>
               <xsl:with-param name="TargetNode" select="$FormData/ExcldSect933PuertoRicoIncmAmt" />
               <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>-->
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
							<xsl:with-param name="Desc">Line 49 - Credit For Elderly Literal Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/CrForElderlyOrDisabledAmt/@creditForElderlyLiteralCd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 53c -  Credit Forms Statement</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/SpecificOtherCreditsInd/@creditFormsStatement"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 53c -  Credit For Elderly Literal Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/SpecificOtherCreditsInd/@creditForElderlyLiteralCd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 56 - Exempt SE Tax Literal Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/SelfEmploymentTaxAmt/@exemptSETaxLiteralCd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<!--<xsl:call-template name="PopulateLeftoverRow">
               <xsl:with-param name="Desc">Line 57 - Railroad Retirement Code</xsl:with-param>
               <xsl:with-param name="TargetNode" select="$FormData/RailroadRetireCode"/>
               <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>-->
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 58 - Retirement Tax Plan Literal Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/TaxOnIRAsAmt/@retirementTaxPlanLiteralCd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<!--<xsl:call-template name="PopulateLeftoverRowAmount">
               <xsl:with-param name="Desc">Line 60 - Total Other Tax Amount</xsl:with-param>
               <xsl:with-param name="TargetNode" select="$FormData/TotalOtherTaxAmt"/>
               <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>-->
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 62 - Divorced Spouse SSN</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/EstimatedTaxPaymentsAmt/@divorcedSpouseSSN"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 62 - Divorced Literal Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/EstimatedTaxPaymentsAmt/@divorcedLiteralCd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 64a - EIC Eligibility Literal Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/EICEligibilityLiteralCd"/>
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
										Community Property Return Indicator:
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
						<xsl:if test="$FormData/PowerOfAttorneySignedBy">
							<tr>
								<td class="styLeftOverTableRowDesc" style="width:100mm;" scope="row">
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/PowerOfAttorneySignedBy"/>
											<xsl:with-param name="BackupName">IRS1040PowerOfAttorneySignedBy</xsl:with-param>
										</xsl:call-template>
										Signed by Power Of Attorney Checkbox:
                        </label>
								</td>
								<td class="PopulateLeftoverRow" style="width:87mm;">
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/PowerOfAttorneySignedBy"/>
											<xsl:with-param name="BackupName">IRS1040PowerOfAttorneySignedBy</xsl:with-param>
										</xsl:call-template>
									</input>
								</td>
							</tr>
						</xsl:if>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Power Of Attorney Name</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/PowerOfAttorneyName"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Primary Date of Death</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/PrimaryDateOfDeath"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Spouse Date Of Death</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/SpouseDateOfDeath"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<!-- Special Processing Literal -->
						<xsl:if test="$FormData/SpecialProcessingLiteralCd">
							<xsl:call-template name="PopulateLeftoverRow">
								<xsl:with-param name="Desc">Special Processing Literal Code</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/SpecialProcessingLiteralCd"/>
								<xsl:with-param name="DescWidth" select="100"/>
							</xsl:call-template>
						</xsl:if>
						<xsl:if test="$FormData/SpecialProcessingLiteralCd2">
							<xsl:call-template name="PopulateLeftoverRow">
								<xsl:with-param name="Desc">Special Processing Literal Code 2</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/SpecialProcessingLiteralCd2"/>
								<xsl:with-param name="DescWidth" select="100"/>
							</xsl:call-template>
							<xsl:call-template name="PopulateLeftoverRow">
								<xsl:with-param name="Desc">Combat Zone Date</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/SpecialProcessingLiteralCd2/@combatZoneDate"/>
								<xsl:with-param name="DescWidth" select="100"/>
							</xsl:call-template>
						</xsl:if>
						<!-- Special Processing Code Text -->
						<xsl:if test="$FormData/SpecialProcessingCodeTxt">
							<xsl:call-template name="PopulateLeftoverRow">
								<xsl:with-param name="Desc">Special Processing Code Text</xsl:with-param>
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
										Surviving Spouse Ind:
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
										Personal Representative Ind:
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
							<xsl:with-param name="Desc">Non Paid Preparer Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/NonPaidPreparerCd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<!-- Refund Anticipation Loan Code -->
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Refund Anticipation Loan Code</xsl:with-param>
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
					<xsl:if test="$FormData/SpecialConditionDescription">
						<span class="styRepeatingDataTitle">Special Condition Description</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" rowspan="1" style="width:91.5mm;">
                           Special Condition Description
                        </th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/SpecialConditionDescription">
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
													<xsl:with-param name="TargetNode" select="$FormData/SpecialConditionDescription[$pos]"/>
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
					<xsl:if test="($Print = $Separated) and (count($FormData/DependentInformations) &gt; 4)">
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
                           if qualifying
                           child for child tax
                           credit (see page 17)
                           </span>
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/DependentInformations">
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
														<xsl:with-param name="TargetNode" select="DependentFirstName"/>
														<xsl:with-param name="BackupName">IRS1040DependentInformationsDependentFirstName</xsl:with-param>
													</xsl:call-template>
												</span>
												<span style="width:5px;"/>
												<span style="width:25mm;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="DependentLastName"/>
														<xsl:with-param name="BackupName">IRS1040DependentInformationsDependentLastName</xsl:with-param>
													</xsl:call-template>
												</span>
												<span style="width:5px;"/>
												<span style="width:5mm;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="DependentNameControl"/>
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
											<xsl:call-template name="PopulateSSN">
												<xsl:with-param name="TargetNode" select="DependentSSN"/>
												<xsl:with-param name="BackupName">IRS1040DependentInformationsDependentSSN</xsl:with-param>
											</xsl:call-template>
										</td>
										<td class="styTableCellText" style="width:20.6mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="DependentRelationship"/>
												<xsl:with-param name="BackupName">IRS1040DependentInformationsDependentRelationship</xsl:with-param>
											</xsl:call-template>
										</td>
										<td class="styTableCellText" style="text-align:center;width:18.6mm;">
											<!-- Checkbox -->
											<input type="Checkbox" class="styCkbox">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="EligibleForChildTaxCreditInd"/>
													<xsl:with-param name="BackupName">IRS1040DependentInformationsEligibleForChildTaxCreditInd</xsl:with-param>
												</xsl:call-template>
											</input>
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
													<xsl:with-param name="TargetNode" select="$FormData/IRADistributionsLiteralCd[$pos]"/>
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
					<xsl:if test="(count($FormData/AlimonyAmountGrp/AlimonyPaidAmt) &gt; 1)">
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
											<div style="width:80mm;float:none;clear:none;">
												<xsl:call-template name="PopulateSSN">
													<xsl:with-param name="TargetNode" select="RecipientsSSN"/>
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
